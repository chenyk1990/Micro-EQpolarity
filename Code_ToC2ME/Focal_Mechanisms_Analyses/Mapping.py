import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from obspy.imaging.beachball import beach
from matplotlib.ticker import FuncFormatter

# Read the station list file
station_filename = './stationlist_ToC2ME.txt'
station_data = pd.read_csv(station_filename, delim_whitespace=True, header=None, names=['StationID', 'Network', 'Longitude', 'Latitude'])

# Extract station longitude and latitude
station_longitude = station_data['Longitude']
station_latitude = station_data['Latitude']

# Adjust negative longitudes by adding 360 degrees
station_longitude = station_longitude.apply(lambda x: x + 360 if x < 0 else x)

# Read the focal mechanism file
mt_filename = 'mt_solution_20241114_SKHASH_quality_A.txt'
mt_data = pd.read_csv(mt_filename, delim_whitespace=True, header=None, usecols=[1, 2, 4, 5, 6], names=['Latitude', 'Longitude', 'Strike', 'Dip', 'Rake'])

# Adjust negative longitudes by adding 360 degrees
mt_data['Longitude'] = mt_data['Longitude'].apply(lambda x: x + 360 if x < 0 else x)

# Read the earthquake catalog data
catalog_filename = './ToC2ME_catalog.xlsx'
catalog_data = pd.read_excel(catalog_filename, usecols=[1, 2, 10, 4, 5, 6, 7, 8, 9], skiprows=1, names=['Latitude', 'Longitude', 'Magnitude', 'Year', 'Month', 'Day', 'Hour', 'Minute', 'Second'])

# Adjust negative longitudes by adding 360 degrees
catalog_data['Longitude'] = catalog_data['Longitude'].apply(lambda x: x + 360 if x < 0 else x)

# Generate a weighted value based on time components
time_weights = (
    catalog_data['Year'] * 365 * 24 * 3600 +
    catalog_data['Month'] * 30 * 24 * 3600 +
    catalog_data['Day'] * 24 * 3600 +
    catalog_data['Hour'] * 3600 +
    catalog_data['Minute'] * 60 +
    catalog_data['Second']
)

# Normalize time weights between 0 and 1
time_order = (time_weights - time_weights.min()) / (time_weights.max() - time_weights.min())

# Create a figure window
plt.figure(figsize=(10, 6))

# Plot station locations, using black solid triangles
plt.scatter(station_longitude, station_latitude, c='k', marker='v', s=17)

# Plot earthquake locations, with colors varying by time progression (red gradient)
scatter = plt.scatter(catalog_data['Longitude'], catalog_data['Latitude'], 
                      c=time_order, cmap='Reds', s=3, alpha=0.3)

# Add beachball plot at specified locations and adjust the size
for index, row in mt_data.iterrows():
    b = beach([row['Strike'], row['Dip'], row['Rake']], 
              xy=(row['Longitude'], row['Latitude']),
              width=0.001, linewidth=1, facecolor=(0.306, 0.357, 0.843), alpha=0.95, zorder=10)  
    plt.gca().add_collection(b)

# Function to read and directly connect latitude and longitude points
def plot_direct_curve(filepath):
    # Read file data
    data = pd.read_csv(filepath, delim_whitespace=True, header=None, names=['Latitude', 'Longitude'])
    
    # Adjust negative longitudes by adding 360 degrees
    data['Longitude'] = data['Longitude'].apply(lambda x: x + 360 if x < 0 else x)

    # Directly connect all points
    plt.plot(data['Longitude'], data['Latitude'], linewidth=1, color='grey')

# Plot four curves
plot_direct_curve('./well-location-four.txt')
plot_direct_curve('./well-location-one.txt')
plot_direct_curve('./well-location-three.txt')
plot_direct_curve('./well-location-two.txt')

# Label the "Well numbers"
plt.text(-117.244249 + 360, 54.356307, 'D', fontsize=20, ha='right', color='grey', fontstyle='italic')
plt.text(-117.231989 + 360, 54.356307, 'A', fontsize=20, ha='right', color='grey', fontstyle='italic')
plt.text(-117.235955 + 360, 54.356307, 'B', fontsize=20, ha='right', color='grey', fontstyle='italic')
plt.text(-117.240282 + 360, 54.356307, 'C', fontsize=20, ha='right', color='grey', fontstyle='italic')
plt.text(-117.248216 + 360, 54.356307, 'Well', fontsize=20, ha='right', color='grey', fontstyle='italic')

# Set equal axis ratio to ensure Beachballs are circular
plt.axis('equal')

# Compute the central region's range (e.g., zoom in to 50% of the original range)
center_lon = (station_longitude.min() + station_longitude.max()) / 2
center_lat = (station_latitude.min() + station_latitude.max()) / 2
zoom_factor = 0.38  # Zoom to 50% range

plt.xlim([center_lon - (center_lon - station_longitude.min()) * zoom_factor, 
          center_lon + (station_longitude.max() - center_lon) * zoom_factor])
plt.ylim([center_lat - (center_lat - station_latitude.min()) * zoom_factor, 
          center_lat + (station_latitude.max() - center_lat) * zoom_factor])

# Set axis to display with two decimal places
plt.gca().xaxis.set_major_formatter(FuncFormatter(lambda x, _: f'{x:.2f}'))
plt.gca().yaxis.set_major_formatter(FuncFormatter(lambda y, _: f'{y:.2f}'))

# Add colorbar to represent time progression
plt.colorbar(scatter, label='Time Progression')

# Set figure attributes
plt.title('Station Locations with Focal Mechanisms')
plt.xlabel('Longitude')
plt.ylabel('Latitude')

# Ensure all borders are visible
plt.gca().spines['top'].set_visible(True)
plt.gca().spines['right'].set_visible(True)
plt.gca().spines['bottom'].set_visible(True)
plt.gca().spines['left'].set_visible(True)

# Save the figure
figname = './Station_Locations_with_Focal_Mechanisms_Independent_testing_ToC2ME.png'
plt.savefig(figname, bbox_inches='tight', dpi=300)

# Display the figure
plt.show()
