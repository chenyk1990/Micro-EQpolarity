#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb  1 14:13:15 2023

@author: yunfeng
"""
import os
from obspy import read, read_events
from obspy.taup import TauPyModel
from obspy.taup.taup_create import build_taup_model
from obspy.geodetics import locations2degrees, degrees2kilometers
import numpy as np
import glob

ddirwaveform='/Users/zhangfangxue/Desktop/texnet/TexNet_2017/new-553-events-and-waveforms/data/texnet2021ynzp'
if not os.path.exists(ddirwaveform):
    os.makedirs(ddirwaveform)
    
model_path = '/Users/zhangfangxue/Desktop/texnet/TexNet_2017/mymodel.nd'
build_taup_model(model_path) 
model = TauPyModel(model="mymodel") # velocity model

#%%
class Station(object):
    def __init__(self,stla=None,stlo=None,name=None):
        # subclass for stations and virtual source stations
        self.stla=stla
        self.stlo=stlo
        self.name=name
        
stationdir = '/Users/zhangfangxue/Desktop/texnet/TexNet_2017/station.txt'
           
with open(stationdir,'r') as f:
    sta_info=f.readlines() 
stations=dict() # create a dictionar to save all station information
for sinfo in sta_info:
    #sinfo = sinfo[1:]#Network Code	Station Code	Longitude (WGS84)	Latitude (WGS84)
    stinfo=sinfo.strip()
    stname=stinfo.split('\t')[1]
    stlo=stinfo.split('\t')[2]
    stla=stinfo.split('\t')[3]
       
    station=Station(stla=stla,stlo=stlo,name=stname)
    stations[stname]=station

#%%
st = read('/Users/zhangfangxue/Desktop/texnet/TexNet_2017/new-553-events-and-waveforms/waveforms/texnet2021ynzp.mseed')
cat = read_events('/Users/zhangfangxue/Desktop/texnet/TexNet_2017/new-553-events-and-waveforms/qmls/texnet2021ynzp.qml')
ev=cat[0]

for tr in st:
    print(tr)
    if len(tr) == 0: #skip the empty waveform
        continue
    else:
        net = tr.stats.network
        sta = tr.stats.station
        cha = tr.stats.channel
        picks = [p for p in ev.picks if p.waveform_id.network_code == net 
                and p.waveform_id.station_code ==  sta]
        evdp = ev.origins[0].depth/1000.
        evla = ev.origins[0].latitude
        evlo = ev.origins[0].longitude
        evmag = ev.magnitudes[0].mag
        
        # You need to replace the fake station location with the real one from station.txt file your prepared
        for key in stations:                
            if str(sta) == key:                    
                stla=stations[key].stla
                stlo=stations[key].stlo
        
        otime=ev.origins[0].time
        tr.stats.sac=dict()
        tr.stats.sac.o=0.
        tr.stats.sac.evla=evla
        tr.stats.sac.evlo=evlo
        tr.stats.sac.evdp=evdp
        tr.stats.sac.stla=stla
        tr.stats.sac.stlo=stlo
        tr.stats.sac.mag=evmag
        tr.stats.sac.b=tr.stats.starttime-otime
        
        if picks:
            for pick in picks:
                pha_time = pick.time
                pha_name = pick.phase_hint
                pha_pola = pick.polarity
                if pha_name == 'P':
                    tr.stats.sac.t1=pha_time-otime
                    tr.stats.sac.kt1=pha_name
                elif pha_name == 'S':
                    tr.stats.sac.t2=pha_time-otime
                    tr.stats.sac.kt2=pha_name
                if pha_pola == 'positive':
                    tr.stats.sac.user1=1
                elif pha_pola == 'negative':
                    tr.stats.sac.user1=-1
                else:
                    tr.stats.sac.user1=0
                    
        # calculate the thoretical travel time if not given
        deg_distance = locations2degrees(float(stla), float(stlo), float(evla), float(evlo))
        p_arrival = model.get_travel_times(source_depth_in_km = float(evdp),
                                distance_in_degree = deg_distance,
                                phase_list = ['p', 'P'])
        tr.stats.sac.t3=p_arrival[0].time
        tr.stats.sac.kt3='p_taup'
        
        deg_distance = locations2degrees(float(stla), float(stlo), float(evla), float(evlo))
        s_arrival = model.get_travel_times(source_depth_in_km = float(evdp),
                                distance_in_degree = deg_distance,
                                phase_list = ['s', 'S'])
        tr.stats.sac.t4=s_arrival[0].time
        tr.stats.sac.kt4='s_taup'
            
        sacname='{}.{}.{}.SAC'.format(net,sta,cha)
        tr.write(os.path.join(ddirwaveform,sacname),format='SAC')        
#%% Compute the P/S amplitude ratio
wmax = 9
SNR = []
Ps = []
path=glob.glob(ddirwaveform)
file_name=path[0].split('/')[-1]
output_file = file_name+'_amp'+'.txt'
f = open(output_file,'w')
sacfiles = glob.glob(os.path.join(ddirwaveform,'*SAC'))
# find three component data
stainfo=[".".join(sacfile.split('/')[-1].split('.')[0:2]) for sacfile in sacfiles]
all_sta=set(stainfo)
for k,sta in enumerate(all_sta):
    if stainfo.count(sta)==3:#筛选出三分量
        
        st = read(ddirwaveform+'/'+sta+'*SAC')
        # Count the number of stations and write them on the first line of the file
        if k == 0:
            output_str = "{}        {:02d}\n".format(1,len(all_sta))
            print(output_str)
            f.write(output_str) 
        
        for tr in st:
            tr.lcalda=True
            tr.lovrok=True
            tr.detrend('demean')
            tr.taper(max_percentage=0.05)
        

        dataE = st[0].data
        dataN = st[1].data
        dataZ = st[2].data#顺序不一定正确，保证st[2]对应Z即可

        if 't1' in tr.stats.sac:
            tp = tr.stats.sac.t1
        else:
            tp = tr.stats.sac.t3
            
        if 't2' in tr.stats.sac:
            ts = tr.stats.sac.t2
        else:
            ts = tr.stats.sac.t4
        
        if ts -tp < 1:
            continue
        if (ts - tp)/2 > wmax:
            w = wmax
        else:
            w = (ts - tp)/2

    # begin and end count of each window
    delta=tr.stats.sac.delta
    b=tr.stats.sac.b
    bp = int(round((tp - 0.05*w)/delta) + round(abs(b/delta)))
    ep = int(round((tp + w)/delta) + round(abs(b/delta)))
    bs = int(round((ts - 0.05*w)/delta) + round(abs(b/delta)))
    es = int(round((ts + w)/delta) + round(abs(b/delta)))
    bn = int(round((tp - 2)/delta) + round(abs(b/delta)))-(ep-bp)
    en = int(round((tp - 2)/delta) + round(abs(b/delta)))
        
    if bp==ep or bs==es or bn==en:
        continue

    Pn = dataN[bp:ep]
    Sn = dataN[bs:es]
    Nn = dataN[bn:en]

    Pe = dataE[bp:ep]
    Se = dataE[bs:es]
    Ne = dataE[bn:en]

    Pz = dataZ[bp:ep]
    Sz = dataZ[bs:es]
    Nz = dataZ[bn:en]
    # calc SNR and PS ratio
    snr = np.sqrt((np.var(Pn)+np.var(Pe)+np.var(Pz)))/np.sqrt(np.var(Nn)+np.var(Ne)+np.var(Nz))
    SNR.append(snr)
        
    p_noise=np.sqrt(np.var(Nn)+np.var(Ne)+np.var(Nz))
    p_ener=np.sqrt(np.var(Pn)+np.var(Pe)+np.var(Pz)-np.var(Nn)-np.var(Ne)-np.var(Nz))
    s_noise=np.sqrt(np.var(Nn)+np.var(Ne)+np.var(Nz))
    s_ener=np.sqrt(np.var(Sn)+np.var(Se)+np.var(Sz)-np.var(Nn)-np.var(Ne)-np.var(Nz))
        
    ps = p_ener/s_ener
    
    if not np.isnan(ps):
        Ps.append(ps)
    t = np.linspace(tr.stats.sac.b,tr.stats.sac.e,tr.stats.sac.npts)
    
    for tr in st:
        tr.stats.sac.user2=p_ener
        tr.stats.sac.user3=s_ener
        tr.stats.sac.user4=snr
        tr.stats.sac.user6=ps
        

        sacname='{}.{}.{}.SAC'.format(tr.stats.network,tr.stats.station,tr.stats.channel)
        tr.write(os.path.join(ddirwaveform,sacname),format='SAC')
    
        f.write('{0:} {1:} {2:} {3:12.5f} {4:12.5f} {5:12.3f} {6:12.5f}\n'.\
                format(tr.stats.station,tr.stats.channel,tr.stats.network,p_noise,s_noise,p_ener,s_ener))  
f.close()

#%%
#Sort the stations alphabetically
outfile='/Users/zhangfangxue/Desktop/HASH_v1.2/texnet/'+file_name+'_amp'+'.txt'
import re
class Station(object):
    def __init__(self,name=None,net=None,chan=None,p_noise=None,s_noise=None,p_energy=None,s_energy=None):
        # subclass for stations and virtual source stations
        self.name=name
        self.net=net
        self.chan=chan
        self.p_noise=p_noise
        self.s_noise=s_noise
        self.s_energy=s_energy
        self.p_energy=p_energy
    
    def __repr__(self):
        return repr((self.name, self.net, self.chan, self.p_noise,self.s_noise,self.p_energy, 
                     self.s_energy))
           
with open(output_file,'r') as f:
    lines = f.readlines()
    first_row = lines[0]
    sta_info = lines[1:] 
    print(sta_info)

stations=dict() # create a dictionar to save all station information
for sinfo in sta_info:
    #sinfo = sinfo[1:]#Network Code	Station Code	Longitude (WGS84)	Latitude (WGS84)
    stinfo=sinfo.strip('\n')
    staname=stinfo.split()[0]
    chan=stinfo.split()[1]
    net=stinfo.split()[2]
    p_noise=re.split(r"[ ]+",stinfo)[3]
    s_noise=re.split(r"[ ]+",stinfo)[4]
    p_energy=re.split(r"[ ]+",stinfo)[5]
    s_energy=re.split(r"[ ]+",stinfo)[6]
    
      
    station=Station(name=staname,net=net,chan=chan,p_noise=p_noise,s_noise=s_noise,
                    p_energy=p_energy,s_energy=s_energy)
    stations[staname]=station           
    
x=sorted(stations.items(),key=lambda x:x[0], reverse=False)   #key sort

with open(outfile,'w') as f:
    f.write('{}'.format(first_row))
    for i in x:
        staname =  i[0]
        value = i[1]
        net = value.net
        chan = value.chan
        p_noise = float(value.p_noise)
        s_noise = float(value.s_noise)
        p_energy = float(value.p_energy)
        s_energy = float(value.s_energy)
        
        f.write('{0:4} {1:} {2:} {3:26.2f} {4:10.2f} {5:10.3f} {6:10.3f}\n'.\
                    format(staname[:4],chan,net,p_noise,s_noise,p_energy,s_energy))
f.close()


