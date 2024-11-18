#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 16:43:07 2024
@author: jiachenhu
"""
import os
import pandas as pd
from datetime import datetime

# Input and output folder paths
input_dir = "./result_ToC2ME_pol_hash_auto"
output_file = "./SKHASH/SKHASH/ToC2ME_demo/IN/SKHASH.eq_catalog.csv"

# Initialize an empty list to store data
data = []
event_id = 1  # Initialize event ID counter

# Loop through each .pol.hash file in the directory
for filename in os.listdir(input_dir):
    if filename.endswith(".pol.hash"):
        file_path = os.path.join(input_dir, filename)
        
        with open(file_path, 'r') as file:
            lines = file.readlines()
            
            # Parse event information from the first line
            year, month, day = lines[0].split()[0:3]
            hour, minute, second = lines[0].split()[3:6]
            evla = float(lines[0].split()[6])
            evlo = float(lines[0].split()[7])
            depth = float(lines[0].split()[8])
            
            # Combine date and time into ISO format
            time_str = f"{year}-{month}-{day} {hour}:{minute}:{second}"
            time = datetime.strptime(time_str, "%Y-%m-%d %H:%M:%S.%f")
            
            # Create output dictionary
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
            event_id += 1  # Increment event ID for each event

# Create DataFrame and save to CSV file
df = pd.DataFrame(data)
df.to_csv(output_file, index=False)
print("Data has been successfully written to CSV file.")
