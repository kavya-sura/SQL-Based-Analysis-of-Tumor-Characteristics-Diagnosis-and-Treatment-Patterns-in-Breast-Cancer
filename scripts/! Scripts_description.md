## Scripts Summary ##

- **1. Tumor Characteristic Average Report:**
  - Calculate the average of Tumor Radius Mean, Tumor Texture Mean, and Tumor Perimeter Mean for benign and malignant tumor diagnoses.
  - Key Insights: Malignant tumors generally exhibit larger and more complex characteristics compared to benign tumors.
  - ![outcome](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Tumor_Characteristic_Average_Report.png)

- **2. Tumor Marker Average Report:**
  - Calculate the average values of the tumor markers (CEA, CA153, CA27-29) for patients classified as benign and malignant.
  - Key Insights: All 3 biomarkers show higher average values in malignant (M) patients. Support the potential role in distinguishing between benign and malignant tumors.
  - ![outcome](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Tumor_Marker_Average_Report%20with%20Rounded%20Values.png)
 
- **3. Patients with Tumors Above Average Size Report:**
  - Identify patients who have tumors with size characteristics (Tumor_Radius_Mean) above the average size for all patients.
  - Key Insights: 14 records, and 11 patients have tumor radius greater than the average which indicates that some patients have multiple and larger tumor records. We need to track these patients closely.
  - ![outcome](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Patients_with_Tumors_Above_Average_Size_Report.png)
 
- **4. Physician-Patient Analysis:**
  - Determine the number of patients treated by each physician, categorized by benign and malignant tumor diagnoses, and identify physicians with patients who have had both benign and malignant tumor diagnoses.
  - We can know the number of patients treated by each physician, and identify those physicians whose patients have had both benign and malignant tumor diagnoses
  - ![outcome](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Physician-Patient_Analysis.png)
 
- **5. Treatment Type Summary Report:**
  - Calculate the total count of each treatment type (RT, CT, HT, S, IT, TT) administered to patients, categorized by visit type (inpatient vs. outpatient).
  - Based on the outcome, inpatient visits have more patients receiving RT and S treatments, indicating a need for intensive monitoring. Outpatient visits have more patients receiving CT, suggesting these treatments require fewer hospital resources. This helps hospitals allocate treatment resources more effectively.
  - ![outcome](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Treatment_Type_Summary_Report.png)
 
- **6. Biomarker Evaluation:**
  - Find the highest biomarker value for each biomarker type for the patient Jackson Brooks in the date range 2014-12-01 to 2024-12-01. Include the biomarker type, highest value, and corresponding test date.
  - We can know the highest biomarker values for the patient over the past 10 years, allowing us to compare the highest recorded values and assess any changes over time.
  - ![Biomarker Evaluation](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Biomarker_Evaluation.png)
 
- **7. Treatment Comparison Report:**
  - Retrieve patient’s information, including the first letter of their last name, for patients who have undergone multiple types of treatments (RT, CT, HT, S, IT) for the same diagnosis outcome (benign or malignant). Include their treatment descriptions.
  - Identify patients who received different treatments for the same diagnosis outcome to analyze treatment patterns, evaluate effectiveness.
  - ![outcome](https://github.com/Ellen0120/sql-breast-cancer-analysis/blob/8696be93bd47d019140543c8ea6aeeda0a024e08/reports/png/Treatment_Comparison_Report.png)

