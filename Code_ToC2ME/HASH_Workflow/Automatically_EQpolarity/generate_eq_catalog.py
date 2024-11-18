#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 16:43:07 2024

@author: jiachenhu
"""

import os
import pandas as pd
from datetime import datetime

# 输入和输出文件夹路径
input_dir = "./result_ToC2ME_pol_hash_auto"
output_file = "./SKHASH/SKHASH/ToC2ME_demo/IN/SKHASH.eq_catalog.csv"

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
            year, month, day = lines[0].split()[0:3]
            hour, minute, second = lines[0].split()[3:6]
            evla = float(lines[0].split()[6])
            evlo = float(lines[0].split()[7])
            depth = float(lines[0].split()[8])
            
            # 将日期时间合并为 ISO 格式
            time_str = f"{year}-{month}-{day} {hour}:{minute}:{second}"
            time = datetime.strptime(time_str, "%Y-%m-%d %H:%M:%S.%f")
            
            # 创建输出的字典
            event_data = {
                "time": time,
                "latitude": evla,
                "longitude": evlo,
                "depth": depth,
                "horz_uncert_km": 0,
                "vert_uncert_km": 0,
                "mag": "--",
                "event_id": event_id
            }
            
            data.append(event_data)
            event_id += 1  # 每个事件递增ID

# 创建DataFrame并保存为CSV文件
df = pd.DataFrame(data)
df.to_csv(output_file, index=False)

print("数据已成功写入CSV文件。")
