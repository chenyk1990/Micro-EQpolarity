#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov  4 20:01:16 2024

@author: jiachenhu
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Read data
file_path = "mt_solution_20241114_SKHASH_quality_A.txt"
data = pd.read_csv(file_path, sep='\s+', header=None, 
                   names=['ID', 'Latitude', 'Longitude', 'Depth', 'Strike', 'Dip', 'Rake', 'Misfit'])

# Extract strike, rake, and dip
strikes = data['Strike']
rakes = data['Rake']
dips = data['Dip']

# Adjust the range of rake values to be from 0 to 360 degrees
rakes_adjusted = np.where(rakes < 0, rakes + 360, rakes)

# Define the function to plot a rose diagram
def plot_rose(data, title, filename, bins=36, angle_range=(0, 360), is_strike=False):
    fig = plt.figure(figsize=(6,6))
    ax = plt.subplot(111, projection='polar')
    
    # If it is strike, set North (N) as 0 degrees, clockwise
    if is_strike:
        ax.set_theta_zero_location("N")  # Set N as 0 degrees
        ax.set_theta_direction(-1)  # Clockwise direction

    # Adjust the bins based on angle_range
    bin_edges = np.linspace(angle_range[0], angle_range[1], bins + 1)
    counts, _ = np.histogram(data, bins=bin_edges)
    
    # Convert to radians
    theta = np.radians(bin_edges[:-1])
    radii = counts
    
    bars = ax.bar(theta, radii, width=np.radians((angle_range[1] - angle_range[0]) / bins), bottom=0.0)
    
    # Set color
    for r, bar in zip(radii, bars):
        bar.set_facecolor(plt.cm.viridis(r / max(radii)))
        bar.set_alpha(0.8)
    
    ax.set_title(title, va='bottom')
    
    # Save as PNG format, dpi=300
    plt.savefig(filename, dpi=300, bbox_inches='tight')

# Plot and save the rose diagram for strike, with N as 0 degrees, clockwise
plot_rose(strikes, 'Rose Diagram for Strike', './rose_strike_SKHASH_2519.png', is_strike=True)

# Plot and save the rose diagram for rake
plot_rose(rakes_adjusted, 'Rose Diagram for Rake', './rose_rake_SKHASH_2519.png')

# Plot and save the rose diagram for dip, with a range of 0 to 90 degrees
plot_rose(dips, 'Rose Diagram for Dip', './rose_dip_SKHASH_2519.png', angle_range=(0, 90))

plt.show()
