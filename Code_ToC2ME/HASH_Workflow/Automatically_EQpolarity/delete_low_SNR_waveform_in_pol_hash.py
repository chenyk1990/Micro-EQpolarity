#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 21:51:44 2024
@author: jiachenhu
"""
import os
import pandas as pd

# Step 1: Read the SNR file
snr_file = "SNR_event_waveform_toc2me_me_2.csv"
snr_df = pd.read_csv(snr_file, dtype={'Event_ID': str, 'Station_ID': str})

# Step 2: Record Event_ID and Station_ID where SNR is less than or equal to 2
low_snr_records = snr_df[snr_df['SNR'] <= 2][['Event_ID', 'Station_ID']]
for _, row in low_snr_records.iterrows():
    print(f"Event_ID: {row['Event_ID']}, Station_ID: {row['Station_ID']}")
    
# Loop through each low SNR record and process corresponding pol.hash files
for _, row in low_snr_records.iterrows():
    event_id = row['Event_ID']
    station_id = str(row['Station_ID'])
    
    # Path to pol.hash file
    pol_hash_file = f"./result_ToC2ME_pol_hash_auto/{event_id}.pol.hash"
    
    # Check if pol.hash file exists
    if os.path.exists(pol_hash_file):
        # Read contents of pol.hash file
        with open(pol_hash_file, 'r') as file:
            lines = file.readlines()
        
        # Find and delete records for corresponding station_id
        with open(pol_hash_file, 'w') as file:
            for line in lines:
                # Skip writing if line starts with target station_id
                if line.startswith(station_id + " "):
                    continue
                file.write(line)
        
        print(f"Deleted Station_ID {station_id} in Event_ID {event_id}")
    else:
        print(f"File not found: {pol_hash_file}")

print("Processing completed.")
