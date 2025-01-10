/*
2.Patients with Tumors Above Average Size Report: 
Identify patients who have tumors with size characteristics (Tumor_Radius_Mean) 
above the average size for all patients.
*/
SELECT 
	PT.PatientKey, 
    PT.Patient_First_Name, 
    Patient_Last_Name, 
    TD.Tumor_Radius_Mean,
	Avg_Radius.Avg_All_Pt_Radius 
    FROM  Patient AS PT
    JOIN Tumor_Diagnosis_Overview AS TD ON TD.PatientFK = PT.PatientKey
    JOIN(
		SELECT AVG(Tumor_Radius_Mean) AS Avg_All_Pt_Radius 
        -- Subquery to calculate the average tumor radius for all patients
		FROM Tumor_Diagnosis_Overview
        ) AS Avg_Radius
		-- Alias the subquery result as Avg_Radius so it can be used in the outer query
		-- need to use subquery to get the avg radius data first, otherwise we only get 1 row returns
    WHERE TD.Tumor_Radius_Mean > Avg_Radius.Avg_All_Pt_Radius -- filter the p't tumor radius mean greater than the overalll average
    ORDER BY PT.PatientKey ASC;
-- returns 14 rows