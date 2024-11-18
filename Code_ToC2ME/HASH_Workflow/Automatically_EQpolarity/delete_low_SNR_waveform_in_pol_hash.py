#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 21:51:44 2024

@author: jiachenhu
"""

import os
import pandas as pd

# 第一步：读取SNR文件
snr_file = "SNR_event_waveform_toc2me_me_2.csv"
snr_df = pd.read_csv(snr_file, dtype={'Event_ID': str, 'Station_ID': str})

# 第二步：记录SNR小于等于2的Event_ID和Station_ID
low_snr_records = snr_df[snr_df['SNR'] <= 2][['Event_ID', 'Station_ID']]

for _, row in low_snr_records.iterrows():
    print(f"Event_ID: {row['Event_ID']}, Station_ID: {row['Station_ID']}")
    
# 遍历低SNR记录的每一行，处理相应的pol.hash文件
for _, row in low_snr_records.iterrows():
    event_id = row['Event_ID']
    station_id = str(row['Station_ID'])
    
    # pol.hash文件路径
    pol_hash_file = f"./result_ToC2ME_pol_hash_auto/{event_id}.pol.hash"
    
    # 检查pol.hash文件是否存在
    if os.path.exists(pol_hash_file):
        # 读取pol.hash文件的内容
        with open(pol_hash_file, 'r') as file:
            lines = file.readlines()
        
        # 查找并删除对应的station_id记录
        with open(pol_hash_file, 'w') as file:
            for line in lines:
                # 如果该行包含目标station_id则跳过写入
                if line.startswith(station_id + " "):
                    continue
                file.write(line)
        
        print(f"Deleted Station_ID {station_id} in Event_ID {event_id}")
    else:
        print(f"File not found: {pol_hash_file}")

print("处理完成。")
