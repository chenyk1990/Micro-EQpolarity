#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 16:51:38 2024
@author: jiachenhu
"""
import os
import pandas as pd

# Input and output folder paths
input_dir = "./result_ToC2ME_pol_hash_auto"
output_file = "./SKHASH/SKHASH/ToC2ME_demo/IN/SKHASH.pol.csv"

# Initialize an empty list to store data
data = []
event_id = 1  # Initialize event ID counter

# Loop through each .pol.hash file in the directory
for filename in os.listdir(input_dir):
    if filename.endswith(".pol.hash"):
        file_path = os.path.join(input_dir, filename)
        
        with open(file_path, 'r') as file:
            lines = file.readlines()
            
            # Parse event information from first line
            evid = filename.split('.')[0]  # Get event ID from filename
            
            # Get station information starting from second line
            for line in lines[1:]:
                parts = line.split()
                station_id = parts[0]  # Station ID
                polarity = parts[1]    # Polarity (+ or -)
                
                # Set p_polarity value
                p_polarity = 1 if polarity == '+' else -1
                
                # Create output dictionary
                event_data = {
                    "event_id": event_id,
                    "station": station_id,
                    "network": "5B",
                    "location": "--",
                    "channel": "DHZ",
                    "p_polarity": p_polarity
                }
                
                data.append(event_data)  # Add event data
            event_id += 1  # Increment event ID for each event

# Create DataFrame and save to CSV file
df = pd.DataFrame(data)
df.to_csv(output_file, index=False)
print("Data has been successfully written to CSV file.")
