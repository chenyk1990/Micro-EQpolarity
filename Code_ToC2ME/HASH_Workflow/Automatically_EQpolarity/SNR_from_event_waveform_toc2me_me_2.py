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
from tqdm import tqdm  # Import progress bar library
import time  # For calculating estimated runtime

# Define root directory and output file path
base_dir = "../all_data_demo"
output_csv_file = "SNR_event_waveform_toc2me_me_2.csv"

# Define start and end times for P-wave signal and noise windows (in seconds)
begin_P, end_P = 4.5, 5.5    # P-wave signal window
begin_Noise, end_Noise = 0, 4.5  # Noise window

# Initialize an empty list to store data
data = []

# Get list of event folders
event_folders = [f for f in os.listdir(base_dir) if os.path.isdir(os.path.join(base_dir, f))]

# Initialize timer
start_time = time.time()

# Loop through all event folders
for target_evid in tqdm(event_folders, desc="Processing Events", unit="event"):
    event_dir = os.path.join(base_dir, target_evid)
    if not os.path.isdir(event_dir):
        continue  # Skip non-directory content
    
    # Get all station IDs in the event folder
    station_ids = set()
    for filename in os.listdir(event_dir):
        if filename.endswith(".SAC"):
            parts = filename.split('.')
            station_id = parts[1]
            station_ids.add(station_id)
    
    # Calculate SNR for each station
    for station_id in station_ids:
        try:
            # Construct three-component file paths
            file_Pn = os.path.join(event_dir, f"5B.{station_id}.DH1.SAC")
            file_Pe = os.path.join(event_dir, f"5B.{station_id}.DH2.SAC")
            file_Pz = os.path.join(event_dir, f"5B.{station_id}.DHZ.SAC")
            
            # Read SAC files
            st_Pn = read(file_Pn)
            st_Pe = read(file_Pe)
            st_Pz = read(file_Pz)
            
            # Extract signal and noise window data
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
            
            # Check if DHZ data is empty
            if np.max(Pz_data) == 0 or np.max(Nz_data) == 0:
                snr = 0  # Set SNR to 0 if no data is present
            else:
                # Calculate variance of signal and noise
                var_Pn, var_Pe, var_Pz = np.var(Pn_data), np.var(Pe_data), np.var(Pz_data)
                var_Nn, var_Ne, var_Nz = np.var(Nn_data), np.var(Ne_data), np.var(Nz_data)
                
                # Calculate SNR
                snr = np.sqrt(var_Pz) / np.sqrt(var_Nz)
            
            # Add record to data list
            data.append({
                "Event_ID": target_evid,
                "Station_ID": station_id,
                "SNR": snr
            })
        
        except Exception as e:
            print(f"Error processing station {station_id} in event {target_evid}: {e}")

# Convert data to DataFrame and save as CSV file
df = pd.DataFrame(data)
df["Event_ID"] = df["Event_ID"].astype(str)
df["Station_ID"] = df["Station_ID"].astype(str)
df.to_csv(output_csv_file, index=False)
print(f"\nSNR calculation completed, results saved to {output_csv_file}")

# Calculate and display total runtime
end_time = time.time()
total_time = end_time - start_time
average_time_per_event = total_time / len(event_folders) if event_folders else 0
print(f"Total runtime: {total_time:.2f} seconds")
print(f"Average processing time per event: {average_time_per_event:.2f} seconds")
