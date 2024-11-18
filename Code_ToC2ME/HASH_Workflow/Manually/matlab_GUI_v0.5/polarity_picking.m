function varargout = polarity_picking(varargin)
% POLARITY_PICKING MATLAB code for polarity_picking.fig
%      POLARITY_PICKING, by itself, creates a new POLARITY_PICKING or raises the existing
%      singleton*.
%
%      H = POLARITY_PICKING returns the handle to a new POLARITY_PICKING or the handle to
%      the existing singleton*.
%
%      POLARITY_PICKING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLARITY_PICKING.M with the given input arguments.
%
%      POLARITY_PICKING('Property','Value',...) creates a new POLARITY_PICKING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before polarity_picking_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to polarity_picking_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help polarity_picking

% Last Modified by GUIDE v2.5 28-May-2023 17:19:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @polarity_picking_OpeningFcn, ...
                   'gui_OutputFcn',  @polarity_picking_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before polarity_picking is made visible.
function polarity_picking_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to polarity_picking (see VARARGIN)
% load the data
% Choose default command line output for polarity_picking
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes polarity_picking wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = polarity_picking_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot the previous trace
% get the three components seismograms
n = handles.trace_number;

if n >= 2
    n = n - 1;
    handles.trace_number = n;
    tr = handles.data(n);
    plot_traces(tr,handles);
    plot_sta_evt(handles);
    % update the table
    %     data = create_table(st,n);
    %     set(handles.uitable1,'Data',data);
    guidata(hObject, handles);
else
    warning('This is the first trace!')
end


% --- Executes on button press in pushbutton3.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear polarity pick
n = handles.trace_number;
handles.data(n).polarity = [];

data1 = create_station_table(handles.data);
set(handles.uitable1,'Data',data1);

plot_sta_evt(handles);
guidata(hObject, handles);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Mark the P arrival time on seismogram

handles.mark_ptime = true;
n=handles.trace_number;
plot_traces(handles.data(n),handles)
% p_time = handles.data(n).p_time;
% % Set the current data value
% axes(handles.axes1); hold on;
% % plot(handles.axes1,handles.t,handles.R);hold on;
% x = [p_time p_time];
% y = get(handles.axes1,'YLim')*0.6;
% line(x,y,'Color',[1 0 0]);hold off;
% axes(handles.axes2); hold on;
% x = [p_time p_time];
% y = get(handles.axes2,'YLim')*0.6;
% line(x,y,'Color',[1 0 0]);hold off;
% axes(handles.axes3); hold on;
% x = [p_time p_time];
% y = get(handles.axes3,'YLim')*0.6;
% line(x,y,'Color',[1 0 0]);hold off;

guidata(hObject, handles);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Mark the S arrival time on seismogram

handles.mark_stime = true;
n=handles.trace_number;
plot_traces(handles.data(n),handles)
% s_time = handles.data(n).s_time;
% % Set the current data value
% axes(handles.axes1); hold on;
% % plot(handles.axes1,handles.t,handles.R);hold on;
% x = [s_time s_time];
% y = get(handles.axes1,'YLim')*0.6;
% line(x,y,'Color','b');hold off;
% axes(handles.axes2); hold on;
% x = [s_time s_time];
% y = get(handles.axes2,'YLim')*0.6;
% line(x,y,'Color','b');hold off;
% axes(handles.axes3); hold on;
% x = [s_time s_time];
% y = get(handles.axes3,'YLim')*0.6;
% line(x,y,'Color','b');hold off;

guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% filter the seismogram
data = handles.data;
n = handles.trace_number;
% check if freq_low and freq_high have been defined
if any(handles.freq_low) && any(handles.freq_high)
    flow = handles.freq_low;
    fhigh = handles.freq_high;
    dt = data(n).t(2)-data(n).t(1);
    w = tukeywin(length(data(n).t),0.25);
    seis = [data(n).Z .* w, data(n).N .* w, data(n).E .* w];
    seis = bandpassSeis(seis, dt, flow, fhigh ,3);
    
    data(n).Z = seis(:,1);
    data(n).N = seis(:,2);
    data(n).E = seis(:,3);
    tr = data(n);
    plot_traces(tr,handles)
else
    disp('Please define the corner frequencies!')
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
% set the low corner frequency
handles.freq_low = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
% set the low corner frequency
handles.freq_high = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uitable1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% check to see if the variable exists in the base workspace
% if evalin('base','exist(''Table'',''var'')')
data = randn(14,1)*100;
% get the variable from the base workspace and save it to the table
set(hObject,'Data',data);
% end
    
% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
idx=eventdata.Indices;
if ~isempty(idx)
    n=idx(1);
    handles.trace_number=n;
    tr=handles.data(n);
    plot_traces(tr,handles)
    plot_sta_evt(handles)
    guidata(hObject, handles);
end

% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

function data = create_station_table(st)
for n = 1:length(st)
    data{n,1} = st(n).station;
    data{n,2} = st(n).stla;
    data{n,3} = st(n).stlo;
    data{n,4} = st(n).dist;
    data{n,5} = st(n).baz;
    data{n,6} = st(n).p_time;
    data{n,7} = st(n).p_prob;
    data{n,8} = st(n).s_time;
    data{n,9} = st(n).s_prob;
    data{n,10} = st(n).polarity;
    data{n,11} = st(n).sp_ratio;
end

function data = create_event_table(st)
data{1} = st(1).evid;
data{2} = st(1).evla;
data{3} = st(1).evlo;
data{4} = st(1).evdp;
data{5} = st(1).mag;
data{6} = st(1).year;
data{7} = st(1).jday;
data{8} = st(1).hour;
data{9} = st(1).minute;
data{10} = st(1).second;
data{11} = st(1).msecond;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% load the data
addpath(fullfile(pwd,'MatSAC'));
parfile = par;
PathName = uigetdir(parfile.datadir);
tmpstr = strsplit(PathName,'/');
evid = tmpstr{end};
% read all sac files
sacfiles=dir(fullfile(PathName,'*Z.SAC'));
st=[];
count = 0;
for n=1:length(sacfiles)
    [~,data,SAChdr] = fget_sac(fullfile(sacfiles(n).folder,sacfiles(n).name));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % May 24, 2024, skip the trace if it is all 0
    if ~any(data)
        continue
    end
    count = count+1;
    tr.trace_number = count;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tr.Z = data;
    tmpstr = strsplit(sacfiles(n).name,'.');
    comp = tmpstr{3};
    comp_new = [comp(1:2),'1'];
    filepath=fullfile(sacfiles(n).folder,strrep(sacfiles(n).name,comp,comp_new));
    if ~exist(filepath)
        comp_new = [comp(1:2),'N'];
        filepath=fullfile(sacfiles(n).folder,strrep(sacfiles(n).name,comp,comp_new));
    end
    [~,data,~] = fget_sac(filepath);
    tr.N = data;
    comp_new = [comp(1:2),'2'];
    filepath=fullfile(sacfiles(n).folder,strrep(sacfiles(n).name,comp,comp_new));
    if ~exist(filepath)
        comp_new = [comp(1:2),'E'];
        filepath=fullfile(sacfiles(n).folder,strrep(sacfiles(n).name,comp,comp_new));
    end
    [t,data,~] = fget_sac(filepath);
    tr.E = data;
    tr.t=t;
    tr.dt=SAChdr.times.delta;
    tr.b=SAChdr.times.b;
    tr.e=SAChdr.times.e;

    tr.evla=SAChdr.event.evla;
    tr.evlo=SAChdr.event.evlo;
    tr.evdp=SAChdr.event.evdp;
    tr.mag = SAChdr.event.mag;
    tr.year=SAChdr.event.nzyear;
    tr.jday=SAChdr.event.nzjday;
    [day,month] = jday_to_day(tr.year,tr.jday);
    tr.month=month;
    tr.day=day;
    tr.hour=SAChdr.event.nzhour;
    tr.minute=SAChdr.event.nzmin;
    tr.second=SAChdr.event.nzsec;
    tr.msecond=SAChdr.event.nzmsec;
    tr.evid=[num2str(tr.year),'-',num2str(tr.month,'%02d'),'-',num2str(tr.day,'%02d'),' ',...
        num2str(tr.hour,'%02d'),':',num2str(tr.minute,'%02d'),':',num2str(tr.second,'%02d'),'.',...
        num2str(tr.msecond,'%03d')];
    
    tr.station=strtrim(SAChdr.station.kstnm);
    tr.network=strtrim(SAChdr.stations.knetwk);
    tr.comp=strtrim(SAChdr.stations.kcmpnm);
    tr.stla=SAChdr.station.stla;
    tr.stlo=SAChdr.station.stlo;
    if SAChdr.station.stel==-12345 
        tr.stel = 0;
    else
        tr.stel=SAChdr.station.stlo;
    end
    if SAChdr.evsta.dist==-12345 || SAChdr.evsta.baz==-12345
        [dist,baz] = distance(tr.evla,tr.evlo,tr.stla,tr.stla);
        tr.dist = dist;
        tr.baz = baz;
    else
        tr.dist=SAChdr.evsta.dist;
        tr.baz=SAChdr.evsta.baz;
    end
    if SAChdr.times.t1 ~=-12345
        tr.p_time=SAChdr.times.t1;
    else
        tr.p_time=SAChdr.times.t3;
    end
    tr.p_prob=SAChdr.user.data(1);
    if SAChdr.times.t2 ~=-12345
        tr.s_time=SAChdr.times.t2;
    else
        tr.s_time=SAChdr.times.t4;
    end
    tr.s_prob=SAChdr.user.data(2);
    tr.polarity=[];
    if SAChdr.user.data(4) ~=-12345
        tr.sp_ratio=SAChdr.user.data(4);
    end
    wmax=9;
    [p_ener,s_ener,p_noise,s_noise,sp_ratio]=calc_sp_ratio(tr.Z,tr.N,tr.E,tr.p_time,tr.s_time,tr.dt,tr.b,wmax);

    tr.p_ener=p_ener;
    tr.s_ener=s_ener;
    tr.p_noise=p_noise;
    tr.s_noise=s_noise;
    tr.sp_ratio = sp_ratio;
    st=[st tr]; 
end

handles.data = st;
handles.evid = evid;
handles.freq_low = 0;
handles.freq_high = 0;
handles.t0 = tr.t(1);
handles.t1 = tr.t(end);
handles.set_xlim = false;
handles.set_ylim = false;
handles.mark_ptime = false;
handles.mark_stime = false;
% get the three components seismograms
n = 1;
handles.trace_number = n;
plot_traces(tr,handles)
plot_sta_evt(handles)
% update the table
data1 = create_station_table(st);
set(handles.uitable1,'Data',data1);

data2 = create_event_table(st);
set(handles.uitable2,'Data',data2);
guidata(hObject, handles);

function [p_ener,s_ener,p_noise,s_noise,sp_ratio]=calc_sp_ratio(dataZ,dataN,dataE,tp,ts,delta,b,wmax)
if ts - tp < 1
    p_ener = NaN;
    s_ener = NaN;
    p_noise= NaN;
    s_noise= NaN;
    sp_ratio = NaN;
    return
end
if (ts - tp)/2 > wmax
    w = wmax;
else
    w = (ts - tp)/2;
end
% begin and end count of each window
bp = floor(round((tp - 0.05*w)/delta) + round(abs(b/delta)));
ep = floor(round((tp + w)/delta) + round(abs(b/delta)));
bs = floor(round((ts - 0.05*w)/delta) + round(abs(b/delta)));
es = floor(round((ts + w)/delta) + round(abs(b/delta)));
bn = floor(round((tp - 2)/delta) + round(abs(b/delta)))-(ep-bp);
en = floor(round((tp - 2)/delta) + round(abs(b/delta)));

if bp==ep || bs==es || bn==en
    p_ener = NaN;
    s_ener = NaN;
    p_noise= NaN;
    s_noise= NaN;
    sp_ratio = NaN;
    return
end

Pn = dataN(bp:ep);
Sn = dataN(bs:es);
Nn = dataN(bn:en);

Pe = dataE(bp:ep);
Se = dataE(bs:es);
Ne = dataE(bn:en);

Pz = dataZ(bp:ep);
Sz = dataZ(bs:es);
Nz = dataZ(bn:en);
% calc SNR and PS ratio
snr = sqrt((var(Pn)+var(Pe)+var(Pz)))/sqrt(var(Nn)+var(Ne)+var(Nz));

p_noise=sqrt(var(Nn)+var(Ne)+var(Nz));
p_ener=sqrt(var(Pn)+var(Pe)+var(Pz)-var(Nn)-var(Ne)-var(Nz));
s_noise=sqrt(var(Nn)+var(Ne)+var(Nz));
s_ener=sqrt(var(Sn)+var(Se)+var(Sz)-var(Nn)-var(Ne)-var(Nz));

sp_ratio = s_ener/p_ener;

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton6.
function pushbutton6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% plot three components seismograms
function plot_traces(tr,handles)
t = tr.t;
Z = tr.Z;
N = tr.N;
E = tr.E;
angle = tr.baz;
n=handles.trace_number;
% rotation
R = N.*cosd( angle ) + E.*sind(angle);
T = E.*cosd( angle ) - N.*sind(angle);

if handles.set_xlim
    xmin=tr.p_time+handles.t0;
    xmax=tr.p_time+handles.t1;
else
    xmin=handles.t0;
    xmax=handles.t1;
end

if handles.set_ylim
    ymin=handles.ymin;
    ymax=handles.ymax;
else
    ymin=-max(abs(Z(t>xmin & t<xmax)))/2;
    ymax= max(abs(Z(t>xmin & t<xmax)))/2;
end

p_time = tr.p_time;
s_time = tr.s_time;
% Set the current data value
axes(handles.axes1);
plot(handles.axes1,t,Z); hold on
if handles.mark_ptime
    x = [p_time p_time];
    y = get(handles.axes1,'YLim')*0.6;
    line(x,y,'Color',[1 0 0]);
end
if handles.mark_stime
    x = [s_time s_time];
    y = get(handles.axes1,'YLim')*0.6;
    line(x,y,'Color','b');
end
hold off;
title(['Station ',handles.data(n).station])
set(handles.axes1,'Xlim',[xmin xmax])
set(handles.axes1,'Ylim',[ymin ymax])

% set(gca,'Visible','off')
axes(handles.axes2);
plot(handles.axes2,t,R); hold on;
if handles.mark_ptime
    x = [p_time p_time];
    y = get(handles.axes2,'YLim')*0.6;
    line(x,y,'Color',[1 0 0]);
end
if handles.mark_stime
    x = [s_time s_time];
    y = get(handles.axes2,'YLim')*0.6;
    line(x,y,'Color','b');
end
hold off;
set(handles.axes2,'Xlim',[xmin xmax])
set(handles.axes2,'Ylim',[ymin ymax])

axes(handles.axes3);
plot(handles.axes3,t,T); hold on;
if handles.mark_ptime
    x = [p_time p_time];
    y = get(handles.axes3,'YLim')*0.6;
    line(x,y,'Color',[1 0 0]);
end
if handles.mark_stime
    x = [s_time s_time];
    y = get(handles.axes3,'YLim')*0.6;
    line(x,y,'Color','b');
end
hold off;
set(handles.axes3,'Xlim',[xmin xmax])
set(handles.axes3,'Ylim',[ymin ymax])

% thre = 0.01;
% upper = x; upper(upper<=thre) = 0;
% upper(1) = 0; upper(end) = 0;
% lower = zeros(length(x),1);
% plot(t,x);hold on;
% jbfill(t,upper,lower,'r','k',1,1.0);hold off;
% xlim([t(1) t(1) + 120])
% ylim([-0.5 1])
xlabel('Time (sec)')

function plot_sta_evt(handles)
data = handles.data;
idx_u=find(strcmp({data.polarity},'I+'));
idx_d=find(strcmp({data.polarity},'I-'));
n=handles.trace_number;
axes(handles.axes6);
scatter(handles.axes6,[data.stlo],[data.stla],50,'^k'); hold on;
scatter(handles.axes6,[data(n).stlo],[data(n).stla],100,'^r'); hold on;
scatter(handles.axes6,[data(idx_u).stlo],[data(idx_u).stla],50,'^','MarkerEdgeColor','k','MarkerFaceColor',[17 17 17]/255); hold on;
scatter(handles.axes6,[data(idx_d).stlo],[data(idx_d).stla],50,'^','MarkerEdgeColor','k','MarkerFaceColor',[0.5843 0.8157 0.9882]); hold on;
scatter(handles.axes6,data(1).evlo,data(1).evla,100,'r','pentagram','filled'); hold off;
axis auto
xmin=min([data.stlo])-0.025;
xmax=max([data.stlo])+0.025;
ymin=min([data.stla])-0.025;
ymax=max([data.stla])+0.025;
dx=(xmax-xmin)/5;
dy=(ymax-ymin)/5;
xlim([xmin-dx xmax+dx]);
ylim([ymin-dy ymax+dy]);

% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6
% plot the earthquake and station distribution


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% finish the measurement
parfile = par;
outdir = parfile.outdir;
data = handles.data;
save(fullfile(outdir,[handles.evid,'_polarity.mat']),'data','-mat');
% save the information as required by HASH input
% event line
fid=fopen(fullfile(outdir,[handles.evid,'.phase']),'w');
iyr=handles.data(1).year;
imon=handles.data(1).month;
idy=handles.data(1).day;
ihr=handles.data(1).hour;
imin=handles.data(1).minute;
qsec=handles.data(1).second+handles.data(1).msecond/1000.;
ilatd=floor(abs(handles.data(1).evla));
if handles.data(1).evla<0
    cns='S';
else
    cns='N';
end
qlatm=(abs(handles.data(1).evla)-ilatd)*60;
ilond=floor(abs(handles.data(1).evlo));
if handles.data(1).evlo>0
    cew='E';
else
    cew='W';
end
qlonm=(abs(handles.data(1).evlo)-ilond)*60;
qdep=handles.data(1).evdp;
seh=0.1; % horizontal location error
sez=0.1; % vertical location error
qmag=handles.data(1).mag;
if qmag == -12345
    qmag=1;
end
icusp=1;   % event id
% format (i4,4i2,f5.2,i2,a1,f5.2,i3,a1,f5.2,f5.2,3x,46x,f5.2,1x,f5.2,39x,f5.2,6x,i16)
fprintf(fid,['%4d%2d%2d%2d%2d%5.2f%2d%1s%5.2f%3d%1s%5.2f%5.2f' ...
    '                                                 %5.2f %5.2f' ...
    '                                       %5.2f      %16d\n'],...
    iyr,imon,idy,ihr,imin,qsec,ilatd,cns,qlatm,ilond,cew,qlonm,qdep,seh,sez,qmag,icusp);
% write station and polarity information
% staname=cellfun(@strtrim,{handles.data.station},'UniformOutput',false);
staname={handles.data.station};
[~,idx]=sort(staname);
data = handles.data(idx);
for n=1:length(data)
    if ~isempty(data(n).polarity) && ~strcmp(data(n).polarity,'x')
        sname=data(n).station;
        snet=data(n).network;
        scomp=data(n).comp;
        pickonset=data(n).polarity(1);
        pickpol=data(n).polarity(2);
        if strcmp(pickpol,'+')
            pickpol='U';
        else
            pickpol='D';
        end
        % Add one more character to station code, YC
        % format (a5,1x,a2,2x,a3,1x,a1,1x,a1)
        fprintf(fid,'%-5s %2s  %3s %1s %1s\n',sname,snet,scomp,pickonset,pickpol);
    end
end
fprintf(fid,'               1\n');
fclose(fid);
% output SP ratio file
fid=fopen(fullfile(outdir,[handles.evid,'.amp']),'w');
evid=1;
sp_ratio=[data.sp_ratio];
fprintf(fid,'%d %d\n',evid,sum(~isnan(sp_ratio)));
for n=1:length(data)
    if ~isempty(data(n).sp_ratio) && ~isnan(data(n).sp_ratio)
        sname=data(n).station;
        snet=data(n).network;
        scomp=data(n).comp;
        p_noise=data(n).p_noise(1);
        p_ener=data(n).p_ener;
        s_noise=data(n).s_noise;
        s_ener=data(n).s_ener;
        % format (a5,1x,a3,1x,a2,17x,f10.3,1x,f10.3,1x,f10.3,1x,f10.3)
        fprintf(fid,'%-5s %3s %2s                 %10.3f %10.3f %10.3f %10.3f\n',sname,scomp,snet,p_noise,s_noise,p_ener,s_ener);
    end
end

fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aug. 21, 2024, Yunfeng Chen, output station file in scsn format
% Old SCEDC format (examples 1-3, 5; station_subs.f; scsn.stations)
% ------------------------------------------------------------------------------------
% columns format value
% ------------------------------------------------------------------------------------
% 1-4 a4 station name
% 6-8 a3 station component
% 42-50 f9.5 station latitude (degrees, signed)
% 52-61 f10.5 station longitude (degrees, signed)
% 63-67 i5 station elevation (meters)
% 91-92 a2 network code
% ------------------------------------------------------------------------------------
% ABL  EHZ MOUNT ABEL                       34.84845 -119.22497  1975 1976/07/31 3000/01/01 CI
% ABL  EHZ MOUNT ABEL                       34.84845 -119.22497  1975 1976/07/31 3000/01/01 CI
% ABL  VHZ SCSN STATION  100                34.84845 -119.22497  1975 1900/01/01 3000/01/01 CI
snet=data(1).network;
fid=fopen(fullfile(outdir,[handles.evid,'.',snet,'.stations']),'w');
for n=1:length(data)
    if ~isempty(data(n).sp_ratio)
        sname=data(n).station;
        snet=data(n).network;
        scomp=data(n).comp;
        stla=data(n).stla;
        stlo=data(n).stlo;
        if isfield(data,'stel')
            stel=data(n).stel;
        else
            stel=0;
        end
        fprintf(fid,['%-4s %3s                                 ',...
            '%9.5f %10.5f %5d                       %2s\n'], ...
            sname,scomp,stla,stlo,stel,snet);
    end
end
fclose(fid);

% Polarity reversal file (same format as FPFIT)
% ------------------------------------------------------------------------------------
% columns format value
% ------------------------------------------------------------------------------------
% 1-4(5) a4(5) station name
% 6-9 i4 beginning of reversal: year
% 10-11 i2 month
% 12-13 i2 day
% 15-18 i4 end of reversal: year
% 19-20 i2 month
% 21-22 i2 day
% ------------------------------------------------------------------------------------
% AQUA 19920101 19921231
% BAC  19950624 19960124
% BAHA 19940101 0

% Note that you need to know if stations are reversed or not before using this file 
% fid=fopen([snet,'.stations.reverse'],'w');
% for n=1:length(data)
%     if ~isempty(data(n).sp_ratio)
%         sname=data(n).station;
%         fprintf(fid,'%-4s  0        0      \n',sname);
%     end
% end
% fclose(fid);

% north3.statcor - station S/P ratio correction, for example 3
% BRCY  EHZ ZY -0.0550
% BRCY  ELZ ZY -0.3102
% CALB  BHZ CI  0.1338
% CALB  HHZ CI  0.2692
% CALB  HLZ CI  0.3478
% CPCP  EHZ ZY -0.2575
% CPCP  ELZ ZY -0.1798

fid=fopen(fullfile(outdir,[handles.evid,'.',snet,'.statcor']),'w');
for n=1:length(data)
    if ~isempty(data(n).sp_ratio)
        sname=data(n).station;
        snet=data(n).network;
        scomp=data(n).comp;
        fprintf(fid,'%-5s %-4s %2s 0\n',sname,scomp,snet);
    end
end
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% May 24, 2024, Yunfeng Chen, save the picking results as NonLinLoc file
% format as below
%2021 02 01 11 43 15.83 028.055687 105.369156 01.399000 00.00 00.00 20210201114315.830
%Y01   x 1 0000.146
%Y02   + 1 0000.069
%Y03   x 1 0000.579
%Y04   x 1 0000.083
iyr=handles.data(1).year;
imon=handles.data(1).month;
idy=handles.data(1).day;
ihr=handles.data(1).hour;
imin=handles.data(1).minute;
qsec=handles.data(1).second+handles.data(1).msecond/1000.;
evla=handles.data(1).evla;
evlo=handles.data(1).evlo;
evdp=handles.data(1).evdp;
qmag=handles.data(1).mag;

fid=fopen(fullfile(outdir,[handles.evid,'.pol.hash']),'w');
evid = handles.evid;
fprintf(fid,'%4d %02d %02d %02d %02d %05.2f %010.6f %09.6f %09.6f 00.00 00.00 %s\n',...
    iyr,imon,idy,ihr,imin,qsec,evla,evlo,evdp,evid);

staname={handles.data.station};
[~,idx]=sort(staname);
data = handles.data(idx);
for n=1:length(data)
    if ~isempty(data(n).polarity) && ~strcmp(data(n).polarity,'x')
        sname=data(n).station;
        snet=data(n).network;
        scomp=data(n).comp;
        pickonset=data(n).polarity(1);
        pickpol=data(n).polarity(2);
        qp=1;
        sp=data(n).sp_ratio;
        fprintf(fid,'%-5s %1s %1d %08.3f\n',sname,pickpol,qp,sp);
    end
end
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aug. 19, 2024, Yunfeng Chen, save the picking results as SKHASH
% format as below. Three files are required.

% file: eq_catalog.csv
% time, latitude, longitude, depth, horz_uncert_km, vert_uncert_km, mag, event_id
% 2000-01-01 00:00:00.000, 37.412116, -122.059357, 12.345, 0.2, 0.4, 2.3, 123456
% 2001-01-01 00:00:00.000, 37.412116, -122.059357, 12.345, 0.2, 0.4, 2.3, 654321

% file: pol.csv
% event_id, station, network, location, channel, p_polarity, takeoff, takeoff_uncertainty, azimuth, azimuth_uncertainty
% 123456,   ST000,   XX,      --,       EHZ,     -1.0,       53.5,   0.1,                 75.0,   0.1 
% 123456,   ST001,   XX,      --,       EHZ,     -1.0,       53.5,   0.1,                 69.7,   0.1 
% 123456,   ST002,   XX,      --,       EHZ,     -1.0,       53.5,   0.1,                 64.4,   0.1 
% 123456,   ST003,   XX,      --,       EHZ,     -1.0,       53.5,   0.1,                 59.1,   0.1 

% file: amp.csv
% event_id, station, network, location, channel, sp_ratio, takeoff, takeoff_uncertainty, azimuth, azimuth_uncertainty
% 123456,   ST000,   XX,      --,       EHZ,     11.3,     53.5,   0.0,                  75.0,   0.0 
% 123456,   ST001,   XX,      --,       EHZ,      9.0,     53.5,   0.0,                  69.7,   0.0 
% 123456,   ST002,   XX,      --,       EHZ,      7.4,     53.5,   0.0,                  64.4,   0.0 
% 123456,   ST003,   XX,      --,       EHZ,      6.5,     53.5,   0.0,                  59.1,   0.0 

% file: stations.csv
% station,location,channel,latitude,longitude,elevation
% 1107,--,DHZ,54.3107,-117.2548,0
% 1108,--,DHZ,54.3103,-117.2415,0
% 1109,--,DHZ,54.3178,-117.2032,0
% 1111,--,DHZ,54.3149,-117.2577,0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid=fopen(fullfile(outdir,[handles.evid,'.eq_catalog.csv']),'w');
fprintf(fid,'time, latitude, longitude, depth, horz_uncert_km, vert_uncert_km, mag, event_id\n');
fprintf(fid,'%4d-%02d-%02d %02d:%02d:%05.2f,%10.6f,%12.6f,%7.2f,%4.1f,%4.1f,%4.1f,%d\n',...
    iyr,imon,idy,ihr,imin,qsec,evla,evlo,evdp,0,0,qmag,1);
fclose(fid);

fid1=fopen(fullfile(outdir,[handles.evid,'.pol.csv']),'w');
% fprintf(fid1,'event_id, station, network, location, channel, p_polarity, takeoff, takeoff_uncertainty, azimuth, azimuth_uncertainty\n');
fprintf(fid1,'event_id, station, network, location, channel, p_polarity\n');

fid2=fopen(fullfile(outdir,[handles.evid,'.amp.csv']),'w');
% fprintf(fid2,'event_id, station, network, location, channel, sp_ratio, takeoff, takeoff_uncertainty, azimuth, azimuth_uncertainty\n');
fprintf(fid2,'event_id, station, network, location, channel, sp_ratio\n');

fid3=fopen(fullfile(outdir,[handles.evid,'.',snet,'.stations.csv']),'w');
% fprintf(fid2,'event_id, station, network, location, channel, sp_ratio, takeoff, takeoff_uncertainty, azimuth, azimuth_uncertainty\n');
fprintf(fid3,'station,location,channel,latitude,longitude,elevation\n');

staname={handles.data.station};
[~,idx]=sort(staname);
data = handles.data(idx);
for n=1:length(data)
    sname=data(n).station;
    snet=data(n).network;
    scomp=data(n).comp;
    stla=data(n).stla;
    stlo=data(n).stlo;
    if isfield(data,'stel')
        stel=data(n).stel;
    else
        stel=0;
    end
    % output polarity file
    if ~isempty(data(n).polarity) && ~strcmp(data(n).polarity,'x')
        pickonset=data(n).polarity(1);
        pickpol=data(n).polarity(2);
        qp=1;
        sp=data(n).sp_ratio;
        if strcmp(pickpol,'+')
            pickpol=1.0;
        elseif strcmp(pickpol,'-')
            pickpol=-1.0;
        else
            error('Wrong polarity type!')
        end
        %         fprintf(fid1,'%6d,%8s,%5s,      --,%10s,%9.1f,%11.1f,%6.1f,%21.1f,%6.1f\n',...
        %             1,sname,snet,scomp,pickpol,nan,nan,nan,nan);
        fprintf(fid1,'%6d,%8s,%5s,      --,%10s,%9.1f\n',...
            1,sname,snet,scomp,pickpol);
    end
    % output amplitude ratio file
    if  ~isempty(data(n).sp_ratio) && ~isnan(data(n).sp_ratio)
        %         fprintf(fid2,'%6d,%8s,%5s,      --,%10s,%9.1f,%11.1f,%6.1f,%21.1f,%6.1f\n',...
        %             1,sname,snet,scomp,sp,nan,nan,nan,nan);
        fprintf(fid2,'%6d,%8s,%5s,      --,%10s,%9.1f\n',...
            1,sname,snet,scomp,sp);


        % 1107,--,DHZ,54.3107,-117.2548,0
        % 1108,--,DHZ,54.3103,-117.2415,0
    end
    % output station file
    fprintf(fid3,'%s,--,%s,%7.4f,%9.4f,%d\n',...
        sname,scomp,stla,stlo,stel);
end
fclose(fid1);
fclose(fid2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% mark the polarity
% get the three components seismograms
n=handles.trace_number;
handles.data(n).polarity = 'I-';
data1 = create_station_table(handles.data);
set(handles.uitable1,'Data',data1);
guidata(hObject, handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% mark up (high quality)
n=handles.trace_number;
handles.data(n).polarity = 'I+';
data1 = create_station_table(handles.data);
set(handles.uitable1,'Data',data1);
% update plot
plot_sta_evt(handles);
guidata(hObject, handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=handles.trace_number;
handles.data(n).polarity = 'E-';
data1 = create_station_table(handles.data);
set(handles.uitable1,'Data',data1);
guidata(hObject, handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=handles.trace_number;
handles.data(n).polarity = 'E+';
data1 = create_station_table(handles.data);
set(handles.uitable1,'Data',data1);
guidata(hObject, handles);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot the next trace
% get the three components seismograms
n = handles.trace_number;
if n <= length(handles.data)-1
    n = n + 1;
    handles.trace_number = n;
    tr = handles.data(n);
    plot_traces(tr,handles);
    plot_sta_evt(handles);
    % update the table
%     data = create_table(st,n);
%     set(handles.uitable1,'Data',data);
    % update the handle
    guidata(hObject, handles);
else
    warning('This is the last trace!')
end

% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
% set the xlim min
handles.t0 = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
% set the xlim max
handles.t1 = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=handles.trace_number;
handles.set_xlim=true;
plot_traces(handles.data(n),handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% determine the key that was pressed
keyPressed = eventdata.Key;
if strcmpi(keyPressed,'rightarrow')
    pushbutton12_Callback(hObject, eventdata, handles)
end
if strcmpi(keyPressed,'leftarrow')
    pushbutton2_Callback(hObject, eventdata, handles)
end
if strcmpi(keyPressed,'uparrow')
    pushbutton9_Callback(hObject, eventdata, handles)
end
if strcmpi(keyPressed,'downarrow')
    pushbutton1_Callback(hObject, eventdata, handles)
end


% --- Executes on key press with focus on pushbutton10 and none of its controls.
function pushbutton10_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on key press with focus on pushbutton10 and none of its controls.
function pushbutton12_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton2 and none of its controls.
function pushbutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Load picked polarity mat file 
[filename, pathname, ~] = uigetfile();
load(fullfile(pathname,filename))
% handle exception of different field name
% Aug. 19, 2024, YC, version 0.3 uses sp as the field name
if ~isfield(data,'sp_ratio')
    for i = 1:numel(data)
        data(i).sp_ratio = data(i).sp;
%         data(i) = rmfield(data(i), 'sp');
    end
end

handles.data = data;
tmpstr=strsplit(filename,'_');
evid = tmpstr{1};
handles.evid = evid;
% get the three components seismograms
% Aug. 24, 2024, YC, read in a non-empty trace
% n = 1;
for n = 1:length(data)
    if any(data(n).Z)
        break;
    end
end
tr=data(n);
handles.freq_low = 0;
handles.freq_high = 0;
handles.t0 = tr.t(1);
handles.t1 = tr.t(end);
handles.trace_number = n;
handles.set_xlim=false;
handles.set_ylim=false;
handles.mark_ptime=false;
handles.mark_stime=false;

plot_traces(tr,handles)
plot_sta_evt(handles)
% update the table
data1 = create_station_table(data);
set(handles.uitable1,'Data',data1);

data2 = create_event_table(data);
set(handles.uitable2,'Data',data2);
guidata(hObject, handles);


% jday to day convertor
function [day,month] = jday_to_day(year,jday)
if mod(year,4) == 0
    date = [31 29 31 30 31 30 31 31 30 31 30 31];
else
    date = [31 28 31 30 31 30 31 31 30 31 30 31];
end
for n=1:length(date)
    if jday <= sum(date(1:n))
        month = n;
        day = date(n) - (sum(date(1:n))-jday);
        break;
    end
end

function SEIS=bandpassSeis(SEIS, DT, FHP, FLP ,NORD)
% Bandpass a seismogram
%
% SEIS = bandpassSeis(SEIS, DT, FHP, FLP)
% SEIS = bandpassSeis(SEIS, DT, FHP, FLP ,NORD)
%
% Band pass all components of the seismogram using a 2nd order
% butterworth filter with 2 passes.  The cutoff frequency must be 0.0
% < Wn <= 1.0, with 1.0 corresponding to half the sample rate, or will
% return an error.
%
% IN: 
% SEIS = Seismogram array (NT x NC), 1 column for each component.  
% DT = sample interval in s
% FHP = high pass freq in Hz 
% FLP = low pass freq in Hz (FHP<FLP)
% NORD = order of filter
%
% OUT:
% SEIS = seismogram after band pass
%
%

%   bandpassSeis.m --- 
%  
%  Filename: bandpassSeis.m
%  Description: band pass 3 component seismograms
%  Author: Iain W. Bailey and A Levander
%  Maintainer: I. W. Bailey
%  Created: Thu Oct 21 10:11:37 2010 (-0700)
%  Version: 1
%  Last-Updated: Wed Nov 23 11:07:10 2011 (-0800)
%            By: Iain Bailey
%      Update #: 35
%  
%----------------------------------------------------------------------
%  
%   Change Log:
%  
%  
%----------------------------------------------------------------------
%  
%   Code:

if( nargin < 5)
  norder=2;
else
  norder=NORD;
end

% Get the number of components read in
[nt, nc] = size(SEIS);% number of samples and components

% Nyquist frequency
fny=0.5/DT;

% Passband array for butterworth filter
wn = [ FHP, FLP ]./fny;

% Error check
if( wn(2) > 1.0 ),
  error( 'Low pass is too high: Need to downsample data.' );
end

% make the butterworth filter
% [b, a] = butter( norder, wn , 'bandpass');
[z, p, k] = butter( norder, wn, 'bandpass' );
[sos,g] = zp2sos(z,p,k);% Convert to SOS form

% zero phase filter
for i=1:nc,
  % Do 2 passes with the filter
%   SEIS(:,i) = filtfilt( b, a, SEIS(:,i));
  SEIS(:,i) = filtfilt( sos, g, SEIS(:,i));
end

return;

%----------------------------------------------------------------------
%   bandpassSeis.m ends here

% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function pushbutton15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=handles.trace_number;
handles.set_ylim=true;
plot_traces(handles.data(n),handles);
guidata(hObject, handles);


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
handles.ymin = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
handles.ymax = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% load the picks from DiTing motion
addpath(fullfile(pwd,'MatSAC'));
parfile = par;
[filename, pathname, ~] = uigetfile(fullfile(parfile.pickdir,'*.pol.hash'));

fid=fopen(fullfile(pathname,filename),'r');
tline = fgetl(fid);
tmpstr=split(tline);
year=tmpstr{1};
month=tmpstr{2};
day=tmpstr{3};
hour=tmpstr{4};
minute=tmpstr{5};
second=tmpstr{6};
evla=str2double(tmpstr{7});
evlo=str2double(tmpstr{8});
evdp=str2double(tmpstr{9});
evid=tmpstr{12};
k=0;
staname={};
pol={};
qp=[];
sp=[];
while ischar(tline)
    k=k+1;
    disp(tline)
    tline = fgetl(fid);
    if ischar(tline)
        tmpstr=split(tline);
        staname{k}=tmpstr{1};
        if strcmp(tmpstr{2},'+')
            pol{k}='I+';
        elseif strcmp(tmpstr{2},'-')
            pol{k}='I-';
        else
            pol{k}=tmpstr{2};
        end
        qp(k) =str2num(tmpstr{3});
        sp(k) =str2double(tmpstr{4});
    end
end
fclose(fid);

PathName = fullfile(parfile.datadir,evid);
st=[];
count = 0;
for n=1:length(staname)
    filename = dir(fullfile(PathName,['*.',staname{n},'.*Z.SAC']));
    filepath=fullfile(PathName,filename.name);
    [~,data,SAChdr] = fget_sac(filepath);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % May 24, 2024, skip the trace if it is all 0
    if ~any(data)
        continue
    end
    count = count+1;
    tr.trace_number = count;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tr.Z = data;
    filename = dir(fullfile(PathName,['*.',staname{n},'.*N.SAC']));
    filepath=fullfile(PathName,filename.name);
    [~,data,~] = fget_sac(filepath);
    tr.N = data;
    filename = dir(fullfile(PathName,['*.',staname{n},'.*E.SAC']));
    filepath=fullfile(PathName,filename.name);
    [t,data,~] = fget_sac(filepath);
    tr.E = data;
    tr.t=t;
    tr.dt=SAChdr.times.delta;
    tr.b=SAChdr.times.b;
    tr.e=SAChdr.times.e;

    tr.evla=SAChdr.event.evla;
    tr.evlo=SAChdr.event.evlo;
    tr.evdp=SAChdr.event.evdp;
    tr.mag = SAChdr.event.mag;
    tr.year=SAChdr.event.nzyear;
    tr.jday=SAChdr.event.nzjday;
    [day,month] = jday_to_day(tr.year,tr.jday);
    tr.month=month;
    tr.day=day;
    tr.hour=SAChdr.event.nzhour;
    tr.minute=SAChdr.event.nzmin;
    tr.second=SAChdr.event.nzsec;
    tr.msecond=SAChdr.event.nzmsec;
    tr.evid=[num2str(tr.year),'-',num2str(tr.month,'%02d'),'-',num2str(tr.day,'%02d'),' ',...
        num2str(tr.hour,'%02d'),':',num2str(tr.minute,'%02d'),':',num2str(tr.second,'%02d'),'.',...
        num2str(tr.msecond,'%03d')];
    
    tr.station=strtrim(SAChdr.station.kstnm);
    tr.network=strtrim(SAChdr.stations.knetwk);
    tr.comp=strtrim(SAChdr.stations.kcmpnm);
    tr.stla=SAChdr.station.stla;
    tr.stlo=SAChdr.station.stlo;
    if SAChdr.station.stel==-12345 
        tr.stel = 0;
    else
        tr.stel=SAChdr.station.stlo;
    end
    if SAChdr.evsta.dist==-12345 || SAChdr.evsta.baz==-12345
        [dist,baz] = distance(tr.evla,tr.evlo,tr.stla,tr.stla);
        tr.dist = dist;
        tr.baz = baz;
    else
        tr.dist=SAChdr.evsta.dist;
        tr.baz=SAChdr.evsta.baz;
    end
    if SAChdr.times.t1 ~=-12345
        tr.p_time=SAChdr.times.t1;
    else
        tr.p_time=SAChdr.times.t3;
    end
    tr.p_prob=SAChdr.user.data(1);
    if SAChdr.times.t2 ~=-12345
        tr.s_time=SAChdr.times.t2;
    else
        tr.s_time=SAChdr.times.t4;
    end
    tr.s_prob=SAChdr.user.data(2);
    tr.polarity=pol{n};
    if SAChdr.user.data(4) ~=-12345
        tr.sp_ratio=SAChdr.user.data(4);
    end
    wmax=9;
    [p_ener,s_ener,p_noise,s_noise,sp_ratio]=calc_sp_ratio(tr.Z,tr.N,tr.E,tr.p_time,tr.s_time,tr.dt,tr.b,wmax);

    tr.p_ener=p_ener;
    tr.s_ener=s_ener;
    tr.p_noise=p_noise;
    tr.s_noise=s_noise;
    if ~isnan(sp_ratio)
        tr.sp_ratio = sp_ratio;
    else
        tr.sp_ratio = sp(n);
    end
    st=[st tr]; 
end

handles.data = st;
handles.evid = evid;
handles.freq_low = 0;
handles.freq_high = 0;
handles.t0 = tr.t(1);
handles.t1 = tr.t(end);
handles.set_xlim = false;
handles.set_ylim = false;
handles.mark_ptime = false;
handles.mark_stime = false;
% get the three components seismograms
n = 1;
handles.trace_number = n;
plot_traces(tr,handles)
plot_sta_evt(handles)
% update the table
data1 = create_station_table(st);
set(handles.uitable1,'Data',data1);

data2 = create_event_table(st);
set(handles.uitable2,'Data',data2);
guidata(hObject, handles);
