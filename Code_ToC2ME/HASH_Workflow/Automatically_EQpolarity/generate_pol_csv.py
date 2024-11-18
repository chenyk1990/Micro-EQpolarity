#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 16:51:38 2024

@author: jiachenhu
"""

import os
import pandas as pd

# 输入和输出文件夹路径
input_dir = "./result_ToC2ME_pol_hash_auto"
output_file = "./SKHASH/SKHASH/ToC2ME_demo/IN/SKHASH.pol.csv"

# 初始化一个空列表来存储数据
data = []
event_id = 1  # 初始事件ID

# 遍历目录中的每个 .pol.hash 文件
for filename in os.listdir(input_dir):
    if filename.endswith(".pol.hash"):
        file_path = os.path.join(input_dir, filename)
        
        with open(file_path, 'r') as file:
            lines = file.readlines()
            
            # 解析第一行的事件信息
            evid = filename.split('.')[0]  # 获取文件名中的事件ID
            
            # 从第二行开始获取台站信息
            for line in lines[1:]:
                parts = line.split()
                station_id = parts[0]  # 台站ID
                polarity = parts[1]    # 极性（+ 或 -）
                
                # 设置p_polarity值
                p_polarity = 1 if polarity == '+' else -1
                
                # 创建输出的字典
                event_data = {
                    "event_id": event_id,
                    "station": station_id,
                    "network": "5B",
                    "location": "--",
                    "channel": "DHZ",
                    "p_polarity": p_polarity
                }
                
                data.append(event_data)  # 添加事件数据
            event_id += 1  # 每个事件递增ID

# 创建DataFrame并保存为CSV文件
df = pd.DataFrame(data)
df.to_csv(output_file, index=False)

print("数据已成功写入CSV文件。")
