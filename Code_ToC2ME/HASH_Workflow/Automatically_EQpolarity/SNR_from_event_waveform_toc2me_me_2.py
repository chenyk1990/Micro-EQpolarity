#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 21:34:59 2024

@author: jiachenhu
"""

import os
import numpy as np
import pandas as pd
from obspy import read
from tqdm import tqdm  # 导入进度条库
import time  # 用于计算估计运行时间

# 定义根目录和输出文件路径
base_dir = "../all_data_demo"
output_csv_file = "SNR_event_waveform_toc2me_me_2.csv"

# 定义P波信号和噪声窗口的开始和结束时间（单位为秒）
begin_P, end_P = 4.5, 5.5    # P波信号窗口
begin_Noise, end_Noise = 0, 4.5  # 噪声窗口

# 初始化一个空列表来存储数据
data = []

# 获取事件文件夹列表
event_folders = [f for f in os.listdir(base_dir) if os.path.isdir(os.path.join(base_dir, f))]

# 初始化计时器
start_time = time.time()

# 遍历所有的事件文件夹
for target_evid in tqdm(event_folders, desc="Processing Events", unit="event"):
    event_dir = os.path.join(base_dir, target_evid)
    if not os.path.isdir(event_dir):
        continue  # 跳过非文件夹的内容
    
    # 获取事件文件夹中的所有台站ID
    station_ids = set()
    for filename in os.listdir(event_dir):
        if filename.endswith(".SAC"):
            parts = filename.split('.')
            station_id = parts[1]
            station_ids.add(station_id)
    
    # 遍历每个台站，计算 SNR
    for station_id in station_ids:
        try:
            # 构建三分量文件路径
            file_Pn = os.path.join(event_dir, f"5B.{station_id}.DH1.SAC")
            file_Pe = os.path.join(event_dir, f"5B.{station_id}.DH2.SAC")
            file_Pz = os.path.join(event_dir, f"5B.{station_id}.DHZ.SAC")
            
            # 读取 SAC 文件
            st_Pn = read(file_Pn)
            st_Pe = read(file_Pe)
            st_Pz = read(file_Pz)
            
            # 提取信号和噪声窗口的数据
            Pn_data = st_Pn[0].slice(starttime=st_Pn[0].stats.starttime + begin_P,
                                     endtime=st_Pn[0].stats.starttime + end_P).data
            Pe_data = st_Pe[0].slice(starttime=st_Pe[0].stats.starttime + begin_P,
                                     endtime=st_Pe[0].stats.starttime + end_P).data
            Pz_data = st_Pz[0].slice(starttime=st_Pz[0].stats.starttime + begin_P,
                                     endtime=st_Pz[0].stats.starttime + end_P).data

            Nn_data = st_Pn[0].slice(starttime=st_Pn[0].stats.starttime + begin_Noise,
                                     endtime=st_Pn[0].stats.starttime + end_Noise).data
            Ne_data = st_Pe[0].slice(starttime=st_Pe[0].stats.starttime + begin_Noise,
                                     endtime=st_Pe[0].stats.starttime + end_Noise).data
            Nz_data = st_Pz[0].slice(starttime=st_Pz[0].stats.starttime + begin_Noise,
                                     endtime=st_Pz[0].stats.starttime + end_Noise).data
            
            # 检查DHZ数据是否为空
            if np.max(Pz_data) == 0 or np.max(Nz_data) == 0:
                snr = 0  # 如果没有数据，将SNR设置为0
            else:
                # 计算信号和噪声的方差
                var_Pn, var_Pe, var_Pz = np.var(Pn_data), np.var(Pe_data), np.var(Pz_data)
                var_Nn, var_Ne, var_Nz = np.var(Nn_data), np.var(Ne_data), np.var(Nz_data)
                
                # 计算 SNR
                snr = np.sqrt(var_Pz) / np.sqrt(var_Nz)
            
            # 添加记录到数据列表
            data.append({
                "Event_ID": target_evid,
                "Station_ID": station_id,
                "SNR": snr
            })
        
        except Exception as e:
            print(f"Error processing station {station_id} in event {target_evid}: {e}")

# 将数据转换为DataFrame并保存为Excel文件
df = pd.DataFrame(data)
df["Event_ID"] = df["Event_ID"].astype(str)
df["Station_ID"] = df["Station_ID"].astype(str)
df.to_csv(output_csv_file, index=False)

print(f"\nSNR计算完成，结果已保存至 {output_csv_file}")

# 计算总运行时间并显示
end_time = time.time()
total_time = end_time - start_time
average_time_per_event = total_time / len(event_folders) if event_folders else 0

print(f"总运行时间：{total_time:.2f} 秒")
print(f"每个事件平均处理时间：{average_time_per_event:.2f} 秒")
