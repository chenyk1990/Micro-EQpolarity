import os

def swap_signs_in_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    # Swap the '+' and '-' signs starting from the second line
    swapped_lines = [lines[0]]  # Keep the first line unchanged
    for line in lines[1:]:  # Start from the second line
        swapped_line = line.replace('+', 'TEMP').replace('-', '+').replace('TEMP', '-')
        swapped_lines.append(swapped_line)
    
    # Write the modified content back to the file
    with open(file_path, 'w') as file:
        file.writelines(swapped_lines)

def process_all_pol_hash_files(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".pol.hash"):
            file_path = os.path.join(directory, filename)
            swap_signs_in_file(file_path)
            print(f"Processed file: {file_path}")

# Define the directory path
directory = "./result_ToC2ME_pol_hash_auto"

# Process all files in the directory
process_all_pol_hash_files(directory)
