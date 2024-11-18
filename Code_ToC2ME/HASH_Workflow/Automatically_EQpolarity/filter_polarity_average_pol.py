#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 30 11:13:33 2024
@author: jiachenhu
"""
import os
import pandas as pd

# Set folder paths
input_folder = './result_ToC2ME_eqpolarity'
output_folder = './results_ToC2ME_eqpolarity_filtered_pol_average'
polarity_thre = 0.45  # Set threshold value

# Create output folder (if it doesn't exist)
os.makedirs(output_folder, exist_ok=True)

# Read each .polarity file
for filename in os.listdir(input_folder):
    if filename.endswith('.polarity'):
        input_file_path = os.path.join(input_folder, filename)
        
        # Read file data
        data = pd.read_csv(input_file_path, sep=' ', header=None,
                          names=['station_id', 'evla', 'evlo', 'depth', 'stla', 'stlo', 'polarity_raw'])
        
        # Filter data: keep only records that meet threshold condition
        data_filtered = data[abs(data['polarity_raw'] - 0.5) >= polarity_thre]
        
        # Set output file path
        output_file_path = os.path.join(output_folder, filename)
        
        # Save filtered data to new file
        data_filtered.to_csv(output_file_path, sep=' ', index=False, header=False)

print("Processing completed, all qualifying files have been saved to:", output_folder)
