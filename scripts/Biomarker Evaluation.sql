/*
4.Biomarker Evaluation: Find the highest biomarker value for each biomarker type for the patient Jackson Brooks 
in the date range 2014-12-01 to 2024-12-01 (recent 10 years record). Include the biomarker type, highest value, and corresponding test date.
*/
SELECT
    BMK.Biomarker_Name, 
    MAX(BMK.Biomarker_Result) AS Max_Result -- highest biomarker result
FROM patient_physician_diagnosis_overview AS PPD
JOIN Biomarker AS BMK ON BMK.DiagnosisFK = PPD.DiagnosisKey
WHERE PPD.Patient_Last_Name = 'Brooks' AND
	  PPD.Patient_First_Name LIKE 'Jack%' AND -- -- Filter for first names starting with "Jack" (e.g., "Jackson")
	  (BMK.Biomarker_Date > '2014-12-01' AND
	   BMK.Biomarker_Date < '2024-12-01')
GROUP BY BMK.Biomarker_Name
ORDER BY BMK.Biomarker_Name ASC;
-- returns 2 rows
