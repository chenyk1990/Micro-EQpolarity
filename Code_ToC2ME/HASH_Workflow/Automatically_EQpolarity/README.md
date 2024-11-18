# SKHASH Workflow

## Description

This repository provides a workflow based on EQpolarity for solving focal mechanisms using SKHASH.

## How to Run

Here's a simple example of how to run the workflow:

### Step 1

Run `generate_catalog.py` to generate the `catalog_sorted.txt` file and place it in the `all_data_demo` folder.

### Step 2

Run the `run_eqpolarity_ToC2ME.ipynb` notebook to obtain the `.polarity` file.

### Step 3

Run `filter_polarity_average_pol.py` to filter the `result_ToC2ME_eqpolarity` folder based on `pol_average` values between 0.45 and 0.5.

### Step 4

Run `generate_pol_hash_for_independent_test.m` to generate the `.pol.hash` file.

### Step 5

If for ToC2ME dataset, run `Reverse_pol_hash_polarity.py` to reverse the polarity due to the instrument settings.

### Step 6

Run `SNR_from_event_waveform_toc2me_me_2.py` to calculate the signal-to-noise ratio (SNR) for all waveform files in the `all_data_demo` folder and save the results in the `SNR_event_waveform_toc2me_me_2.xlsx` file.

### Step 7

Run `delete_low_SNR_waveform_in_pol_hash.py` to remove station records with an SNR less than 2 from the `.pol.hash` files.

### Step 8

Follow the instructions in the `README.md` file in the SKHASH folder to solve focal mechanisms using SKHASH. You may need the following scripts to transform `.pol.hash` files into `eq_catalog.csv` and `.pol.csv` files:

- `generate_eq_catalog.py`: Generates the `eq_catalog.csv` file for the control file using the `.pol.hash` files.
- `generate_pol_csv.py`: Generates the `.pol.csv` file for the control file using the `.pol.hash` files.

Run the following command in the terminal: python3 SKHASH.py ToC2ME_demo/control_file_skhash.txt

