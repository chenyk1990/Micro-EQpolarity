#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 30 11:13:33 2024

@author: jiachenhu
"""

import os
import pandas as pd

# 设置文件夹路径
input_folder = './result_ToC2ME_eqpolarity'
output_folder = './results_ToC2ME_eqpolarity_filtered_pol_average'
polarity_thre = 0.45  # 设置阈值

# 创建输出文件夹（如果不存在）
os.makedirs(output_folder, exist_ok=True)

# 读取每个 .polarity 文件
for filename in os.listdir(input_folder):
    if filename.endswith('.polarity'):
        input_file_path = os.path.join(input_folder, filename)
        
        # 读取文件数据
        data = pd.read_csv(input_file_path, sep=' ', header=None,
                           names=['station_id', 'evla', 'evlo', 'depth', 'stla', 'stlo', 'polarity_raw'])
        
        # 过滤数据：仅保留满足阈值条件的记录
        data_filtered = data[abs(data['polarity_raw'] - 0.5) >= polarity_thre]
        
        # 设置输出文件路径
        output_file_path = os.path.join(output_folder, filename)
        
        # 将过滤后的数据保存到新的文件中
        data_filtered.to_csv(output_file_path, sep=' ', index=False, header=False)

print("处理完成，所有符合条件的文件已保存至:", output_folder)
