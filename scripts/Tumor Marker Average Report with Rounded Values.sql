/*
6. Tumor Marker Average Report with Rounded Values: Calculate the average values of tumor markers (CEA, CA153, and CA27-29) 
for patients classified as benign and malignant, rounding the results to two decimal places for clarity and precision.
*/
SELECT
    PPD.Diagnosis_Outcome,
    ROUND(AVG(CASE WHEN TRIM(REPLACE(BMK.Biomarker_Name,' ','')) = 'CEA' THEN BMK.Biomarker_Result END),2) AS Avg_CEA,
	ROUND(AVG(CASE WHEN TRIM(REPLACE(BMK.Biomarker_Name,' ','')) = 'CA15-3' THEN BMK.Biomarker_Result END),2) AS Avg_CA15_3,
	ROUND(AVG(CASE WHEN TRIM(REPLACE(BMK.Biomarker_Name,' ','')) = 'CA27-29' THEN BMK.Biomarker_Result END),2) AS AVG_CA27_29
FROM patient_physician_diagnosis_overview AS PPD
JOIN Biomarker AS BMK ON BMK.DiagnosisFK = PPD.DiagnosisKey
GROUP BY PPD.Diagnosis_Outcome
ORDER BY PPD.Diagnosis_Outcome;
