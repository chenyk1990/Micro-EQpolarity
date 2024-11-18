import os

# Define the directory and output file paths
# Here we give a simple example.
input_directory = '../all_data_demo'
output_file = '../all_data_demo/catalog_sorted_ToC2ME.txt'

# Get a sorted list of all folder names in the directory
folder_names = sorted(os.listdir(input_directory))

# Write the folder names to the output file
with open(output_file, 'w') as file:
    for folder_name in folder_names:
        file.write(f'{folder_name}\n')

print(f"Catalog written to {output_file}")
