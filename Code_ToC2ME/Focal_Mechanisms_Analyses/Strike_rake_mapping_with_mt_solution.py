#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov  2 11:23:16 2024

@author: jiachenhu
"""
# Import required libraries
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import Normalize
from matplotlib.ticker import FormatStrFormatter

# Set file path and line length for strike direction
file_path = 'mt_solution_20241114_SKHASH_quality_A.txt'
line_length = 0.0005

# Read data
column_names = ['evid', 'evla', 'evlo', 'depth', 'strike', 'dip', 'rake', 'misfit']
data = pd.read_csv(file_path, sep='\t', header=None, names=column_names)

# Initialize plot
fig, ax = plt.subplots(figsize=(10, 8))
cmap = plt.get_cmap('rainbow')
norm = Normalize(vmin=data['rake'].min(), vmax=data['rake'].max())

# Plot strike directions and event locations
for _, row in data.iterrows():
    evlo, evla = row['evlo'], row['evla']
    strike = row['strike']
    rake = row['rake']
    
    # Convert strike angle from clockwise from north to counterclockwise from east
    angle_rad = np.radians((90 - strike) % 360)
    dx = line_length * np.cos(angle_rad)
    dy = line_length * np.sin(angle_rad)
    
    # Plot strike line
    ax.plot([evlo - dx/2, evlo + dx/2], [evla - dy/2, evla + dy/2], 
            color=cmap(norm(rake)), linewidth=2)
    
    # Plot event location
    ax.scatter(evlo, evla, edgecolor='black', facecolor='none', s=30)

# Add colorbar
sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
sm.set_array([])
cbar = plt.colorbar(sm, ax=ax)
cbar.set_label('Rake')

# Set axis limits and format
ax.set_xlim([-117.255, -117.22])
ax.set_ylim([54.33, 54.36])
ax.xaxis.set_major_formatter(FormatStrFormatter('%.2f'))
ax.yaxis.set_major_formatter(FormatStrFormatter('%.2f'))

# Add labels
ax.set_title('Earthquake Event Locations and Strike Directions')
ax.set_xlabel('Longitude')
ax.set_ylabel('Latitude')

# Save figure at 300 DPI and display
plt.savefig('earthquake_events.png', dpi=300, bbox_inches='tight')
plt.show()