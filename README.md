# Micro-EQpolarity
**Micro-EQpolarity** is Jiachen Hu's code repository for polarity picking and focal mechanism analyses in Canada.

## Overview
This repository provides a comprehensive set of tools and workflows for working with the ToC2Me dataset. The main components of this repository are:

## 1. HASH Workflow

### Description
This section includes the process for solving focal mechanisms using the SKHASH on the ToC2Me dataset. Users can choose to either manually pick polarities or utilize the EQpolarity model for automatic polarity picking.

---

## 2. Focal Mechanisms Analyses

### Description
This section includes a set of scripts that allow users to visualize the spatial distribution of the focal mechanisms as well as their strike, dip, and rake characteristics within the ToC2Me dataset.

---

## 3. Plot Waveforms on Focal Mechanisms

### Description
This component provides scripts that enable users to plot waveforms directly with focal mechanism beachball diagrams. This feature helps validate the correctness of the mechanism solutions by allowing users to check waveforms and station locations.

### Notes:
- In the ToC2ME dataset, waveform polarities are inverted.

---

## 4. EQpolarity Transfer Learning

### Description
This section demonstrates the application of transfer learning using EQpolarity models on the ToC2Me dataset.

---

## Gallery
Here are examples of the outputs:

### Accuracy on Microseismic Events（ToC2ME）
- Accuracy for each model can be obtained from [Code_ToC2ME/EQpolarity_Transfer_Learning/CCT_ToC2ME_TransferLearning_20240926_For_Test_update20241013.ipynb](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/EQpolarity_Transfer_Learning/CCT_ToC2ME_TransferLearning_20240926_For_Test_update20241013.ipynb)

#### The models are as follows
- Blue: [model/SCSN/best_weigths_Binary_SCSN_Best.h5](https://github.com/chenyk1990/jiachenToc2Me/blob/main/model/SCSN/best_weigths_Binary_SCSN_Best.h5)
- Orange: [model/Texas/best_weigths_Binary_Texas_Transfer10.h5](https://github.com/chenyk1990/jiachenToc2Me/blob/main/model/Texas/best_weigths_Binary_Texas_Transfer10.h5)
- Red: [model/Toc2me_20240819_Transfer_Learning_21916data/best_weigths_Binary_Toc2me_Transfer_SCSN_20241013_21916data_90.h5](https://github.com/chenyk1990/jiachenToc2Me/blob/main/model/Toc2me_20240819_Transfer_Learning_21916data/best_weigths_Binary_Toc2me_Transfer_SCSN_20241013_21916data_90.h5)
![Accuracy on Microseismic Events（ToC2ME）](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/EQpolarity_Transfer_Learning/Model_Comparison_on_Microseismic_Events.png)

### EQpolarity Transfer Learning Confusion Matrix, PR Curve, ROC Curve with Canada Best Model
- Generated by [Code_ToC2ME/EQpolarity_Transfer_Learning/CCT_ToC2ME_TransferLearning_20240926_For_Test_update20241013.ipynb](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/EQpolarity_Transfer_Learning/CCT_ToC2ME_TransferLearning_20240926_For_Test_update20241013.ipynb) with model [model/Toc2me_20240819_Transfer_Learning_21916data/best_weigths_Binary_Toc2me_Transfer_SCSN_20241013_21916data_90.h5](https://github.com/chenyk1990/jiachenToc2Me/blob/main/model/Toc2me_20240819_Transfer_Learning_21916data/best_weigths_Binary_Toc2me_Transfer_SCSN_20241013_21916data_90.h5)
![EQpolarity Transfer Learning Confusion Matrix](Code_ToC2ME/EQpolarity_Transfer_Learning/confusion_matrix.png)
![EQpolarity Transfer Learning PR Curve](Code_ToC2ME/EQpolarity_Transfer_Learning/precision_recall_curves_ToC2ME.png)
![EQpolarity Transfer Learning ROC Curve](Code_ToC2ME/EQpolarity_Transfer_Learning/roc_curves_ToC2ME.png)

### Top View of Focal Mechanisms
- Generated by [Code_ToC2ME/Focal_Mechanisms_Analyses/Mapping.py](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/Focal_Mechanisms_Analyses/Mapping.py)
![Canada（ToC2ME） – Focal Mechanisms](Code_ToC2ME/Focal_Mechanisms_Analyses/Station_Locations_with_Focal_Mechanisms_Independent_testing_ToC2ME.png)

- Generated by [Code_ToC2ME/Focal_Mechanisms_Analyses/Strike_rake_mapping_with_mt_solution.py](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/Focal_Mechanisms_Analyses/Strike_rake_mapping_with_mt_solution.py)
![Canada（ToC2ME） – Focal Mechanisms with strike](Code_ToC2ME/Focal_Mechanisms_Analyses/earthquake_events.png)

### Rose Diagrams in ToC2ME
- Generated by [Code_ToC2ME/Focal_Mechanisms_Analyses/rose_figure_upgrade_with_dip.py](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/Focal_Mechanisms_Analyses/rose_figure_upgrade_with_dip.py)
![Rose Diagrams - Strike](Code_ToC2ME/Focal_Mechanisms_Analyses/rose_strike_SKHASH_2519.png)
![Rose Diagrams - Rake](Code_ToC2ME/Focal_Mechanisms_Analyses/rose_rake_SKHASH_2519.png)
![Rose Diagrams - Dip](Code_ToC2ME/Focal_Mechanisms_Analyses/rose_dip_SKHASH_2519.png)

### Waveforms on Focal Mechanisms
- Generated by [Code_ToC2ME/Plot_waveform_on_mechanisms/Focal_mechanism_with_waveform_20241117_skhash.py](https://github.com/chenyk1990/jiachenToc2Me/blob/main/Code_ToC2ME/Plot_waveform_on_mechanisms/Focal_mechanism_with_waveform_20241117_skhash.py)
![Waveforms on Focal Mechanisms](Code_ToC2ME/Plot_waveform_on_mechanisms/focal_mechanism_1_Strike_Slip_Fault.png)

---

## Data
1. ToC2ME data: https://doi.org/10.5281/zenodo.14185578

2. Texas data: Google Drive link: https://drive.google.com/drive/folders/1WXVB8ytNB4bOaZ97oq6OmMRyAEg95trp?usp=sharing

3. Texas_22980 data: https://doi.org/10.5281/zenodo.13901460

4. ToC2ME_Testing_data: In the `data` folder

---

## Environment Setup

To create and set up the required environment, follow these steps:

```bash
# Step 1: Create a Conda environment with Python 3.11.7
conda create -n eqp python=3.11.7

# Step 2: Activate the Conda environment
conda activate eqp

# Step 3: Install Jupyter Notebook
conda install ipython notebook

# Step 4: Install additional dependencies
pip install matplotlib==3.8.0 tensorflow==2.14.0 scikit-learn==1.2.2 seaborn==0.13.2
```
---

## Reference
1. Chen Y, Saad OM, Savvaidis A, Zhang F, Chen Y, Huang D, Li H, Zanjani FA, 2024, Deep learning for P-wave first-motion polarity determination and its application in focal mechanism inversion. IEEE Transactions on Geoscience and Remote Sensing, 62, 5917411.
2. Skoumal, R.J., Hardebeck, J.L., Shearer, P.M. (2024). SKHASH: A Python package for computing earthquake focal mechanisms. Seismological Research Letters, 95(4), 2519-2526. https://doi.org/10.1785/0220230329
