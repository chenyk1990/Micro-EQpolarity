% Main function: Extract sp_ratio from SAC files and generate .pol.hash files
generate_pol_hash();

function generate_pol_hash()
    % Add the directory containing fget_sac.m to the MATLAB path
    addpath('./MatSAC');
    
    % Define paths
    sac_dir = '../all_data_demo'; % Directory containing SAC files
    polarity_dir = './results_ToC2ME_eqpolarity_filtered_pol_average'; % Directory containing polarity files
    output_dir = './result_ToC2ME_pol_hash_auto'; % Output directory for .pol.hash files

    % Get all event folders
    event_folders = dir(sac_dir);
    event_folders = event_folders([event_folders.isdir] & ~startsWith({event_folders.name}, '.'));

    for i = 1:length(event_folders)
        event_folder = event_folders(i).name;
        sacfiles = dir(fullfile(sac_dir, event_folder, '*.SAC'));
        st = [];
        count = 0;

        for n = 1:length(sacfiles)
            try
                % Display progress of current file being processed
                fprintf('Processing file %d/%d in event %s: %s\n', n, length(sacfiles), event_folder, sacfiles(n).name);

                % Read the Z component
                [~, dataZ, SAChdr] = fget_sac(fullfile(sacfiles(n).folder, sacfiles(n).name));
                if ~any(dataZ)
                    continue
                end
                count = count + 1;

                tr = struct();
                tr.trace_number = count;
                tr.Z = dataZ;

                % Assuming SAC files have the same base name but different components
                tmpstr = strsplit(sacfiles(n).name, '.');
                comp = tmpstr{3};
                comp_new = [comp(1:2), '1'];

                filepath = fullfile(sacfiles(n).folder, strrep(sacfiles(n).name, comp, comp_new));
                if ~exist(filepath, 'file')
                    warning('File not found: %s', filepath);
                    continue;
                end
                [~, data1, ~] = fget_sac(filepath);
                tr.comp1 = data1;

                comp_new = [comp(1:2), '2'];
                filepath = fullfile(sacfiles(n).folder, strrep(sacfiles(n).name, comp, comp_new));
                if ~exist(filepath, 'file')
                    warning('File not found: %s', filepath);
                    continue;
                end
                [t, data2, ~] = fget_sac(filepath);
                tr.comp2 = data2;
                tr.t = t;

                % Fill in event and station information
                tr.dt = SAChdr.times.delta;
                tr.b = SAChdr.times.b;
                tr.e = SAChdr.times.e;
                tr.evla = SAChdr.event.evla;
                tr.evlo = SAChdr.event.evlo;
                tr.evdp = SAChdr.event.evdp;
                tr.mag = SAChdr.event.mag;
                tr.year = SAChdr.event.nzyear;
                tr.jday = SAChdr.event.nzjday;
                [day, month] = jday_to_day(tr.year, tr.jday);
                tr.month = month;
                tr.day = day;
                tr.hour = SAChdr.event.nzhour;
                tr.minute = SAChdr.event.nzmin;
                tr.second = SAChdr.event.nzsec;
                tr.msecond = SAChdr.event.nzmsec;
                tr.evid = [num2str(tr.year), '-', num2str(tr.month, '%02d'), '-', num2str(tr.day, '%02d'), ' ',...
                           num2str(tr.hour, '%02d'), ':', num2str(tr.minute, '%02d'), ':', num2str(tr.second, '%02d'), '.',...
                           num2str(tr.msecond, '%03d')];

                tr.station = strtrim(SAChdr.station.kstnm);
                tr.network = strtrim(SAChdr.stations.knetwk);
                tr.comp = strtrim(SAChdr.stations.kcmpnm);
                tr.stla = SAChdr.station.stla;
                tr.stlo = SAChdr.station.stlo;
                if SAChdr.station.stel == -12345
                    tr.stel = 0;
                else
                    tr.stel = SAChdr.station.stel;
                end
                if SAChdr.evsta.dist == -12345 || SAChdr.evsta.baz == -12345
                    [dist, baz] = distance(tr.evla, tr.evlo, tr.stla, tr.stla);
                    tr.dist = dist;
                    tr.baz = baz;
                else
                    tr.dist = SAChdr.evsta.dist;
                    tr.baz = SAChdr.evsta.baz;
                end
                if SAChdr.times.t1 ~= -12345
                    tr.p_time = SAChdr.times.t1;
                else
                    tr.p_time = SAChdr.times.t3;
                end
                tr.p_prob = SAChdr.user.data(1);
                if SAChdr.times.t2 ~= -12345
                    tr.s_time = SAChdr.times.t2;
                else
                    tr.s_time = SAChdr.times.t4;
                end
                tr.s_prob = SAChdr.user.data(2);
                tr.polarity = [];
                if SAChdr.user.data(4) ~= -12345
                    tr.sp_ratio = SAChdr.user.data(4);
                end

                % Calculate sp_ratio
                wmax = 9;
                [p_ener, s_ener, p_noise, s_noise, sp_ratio] = calc_sp_ratio(tr.Z, tr.comp1, tr.comp2, tr.p_time, tr.s_time, tr.dt, tr.b, wmax);
                tr.p_ener = p_ener;
                tr.s_ener = s_ener;
                tr.p_noise = p_noise;
                tr.s_noise = s_noise;
                tr.sp_ratio = sp_ratio;

                % Save result
                st = [st tr];
            catch ME
                warning('Error processing file: %s\n%s', fullfile(sacfiles(n).folder, sacfiles(n).name), ME.message);
                fclose('all');
                continue;
            end
        end

        % Read the corresponding polarity file
        polarity_file = fullfile(polarity_dir, [event_folder, '.polarity']);
        if exist(polarity_file, 'file')
            % Display progress for current polarity file
            fprintf('Processing polarity file for event %s: %s\n', event_folder, polarity_file);

            % Extract event information from file name
            fname = [event_folder, '.polarity'];
            year = str2double(fname(1:4));
            month = str2double(fname(5:6));
            day = str2double(fname(7:8));
            hour = str2double(fname(9:10));
            minute = str2double(fname(11:12));
            second = str2double(fname(13:14));
            msecond = str2double(fname(16:18)) / 1000;

            % Load polarity file data
            polarity_data = load(polarity_file);

            evla = polarity_data(1, 2);
            evlo = polarity_data(1, 3);
            evdp = polarity_data(1, 4);

            % Generate .pol.hash file
            output_file = fullfile(output_dir, [event_folder, '.pol.hash']); % Use the specified output path
            fid = fopen(output_file, 'w');
            fprintf(fid, '%4d %02d %02d %02d %02d %05.2f %010.6f %09.6f %09.6f 00.00 00.00 %s\n', ...
                year, month, day, hour, minute, second + msecond, evla, evlo, evdp, event_folder);

            for j = 1:size(polarity_data, 1)
                station = sprintf('%04d', polarity_data(j, 1));
                polarity_raw = polarity_data(j, end);
                if polarity_raw > 0.5
                    polarity = '-';
                else
                    polarity = '+';
                end

                % Find the corresponding sp_ratio for the station
                sp_ratio = NaN;
                for k = 1:length(st)
                    if strcmp(st(k).station, station)
                        sp_ratio = st(k).sp_ratio;
                        break;
                    end
                end

                fprintf(fid, '%-5s %1s %1d %08.3f\n', station, polarity, 1, sp_ratio);
            end

            fclose(fid);
        else
            warning('Polarity file not found for event %s', event_folder);
        end
    end
end

function [p_ener, s_ener, p_noise, s_noise, sp_ratio] = calc_sp_ratio(dataZ, data1, data2, tp, ts, delta, b, wmax)
    if ts - tp < 1
        p_ener = NaN;
        s_ener = NaN;
        p_noise = NaN;
        s_noise = NaN;
        sp_ratio = NaN;
        return
    end
    if (ts - tp)/2 > wmax
        w = wmax;
    else
        w = (ts - tp)/2;
    end
    bp = floor(round((tp - 0.05*w)/delta) + round(abs(b/delta)));
    ep = floor(round((tp + w)/delta) + round(abs(b/delta)));
    bs = floor(round((ts - 0.05*w)/delta) + round(abs(b/delta)));
    es = floor(round((ts + w)/delta) + round(abs(b/delta)));
    bn = floor(round((tp - 2)/delta) + round(abs(b/delta)))-(ep-bp);
    en = floor(round((tp - 2)/delta) + round(abs(b/delta)));

    if bp == ep || bs == es || bn == en
        p_ener = NaN;
        s_ener = NaN;
        p_noise = NaN;
        s_noise = NaN;
        sp_ratio = NaN;
        return
    end

    P1 = data1(bp:ep);
    S1 = data1(bs:es);
    N1 = data1(bn:en);

    P2 = data2(bp:ep);
    S2 = data2(bs:es);
    N2 = data2(bn:en);

    Pz = dataZ(bp:ep);
    Sz = dataZ(bs:es);
    Nz = dataZ(bn:en);

    p_noise = sqrt(var(N1) + var(N2) + var(Nz));
    p_ener = sqrt(var(P1) + var(P2) + var(Pz) - var(N1) - var(N2) - var(Nz));
    s_noise = sqrt(var(N1) + var(N2) + var(Nz));
    s_ener = sqrt(var(S1) + var(S2) + var(Sz) - var(N1) - var(N2) - var(Nz));

    sp_ratio = s_ener / p_ener;
end

% Julian day to day converter
function [day, month] = jday_to_day(year, jday)
if mod(year, 4) == 0
    date = [31 29 31 30 31 30 31 31 30 31 30 31];
else
    date = [31 28 31 30 31 30 31 31 30 31 30 31];
end
for n = 1:length(date)
    if jday <= sum(date(1:n))
        month = n;
        day = date(n) - (sum(date(1:n)) - jday);
        break;
    end
end
end
