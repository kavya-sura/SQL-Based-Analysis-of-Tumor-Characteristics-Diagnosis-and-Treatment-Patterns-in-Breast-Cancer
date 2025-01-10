/*
5.Treatment Type Summary Report: Calculate the total count of each treatment type (RT, CT, HT, S, IT) administered to patients, 
categorized by visit type (inpatient vs. outpatient).
*/
-- Create a view table of patient, visit, and treatment
CREATE VIEW Patient_Visit_Treatment_Overview AS
	SELECT
		PT.PatientKey, PT.Patient_First_Name, Patient_Last_Name,
		V.VisitKey, V.Visit_Type, V.Visit_Reason,
		TP.TreatmentKey, TP.Treatment_Date, TP.Treatment_Description
	FROM Diagnosis AS Dx
	JOIN Treatment_Plan AS TP ON TP.DiagnosisFK = Dx.DiagnosisKey
	JOIN Visit AS V ON V.VisitKey = Dx.VisitFK
	JOIN Patient AS PT ON PT.PatientKey = V.PatientFK
    ORDER BY PT.PatientKey;
SELECT 
	PVT.Visit_Type,
    COUNT(CASE WHEN PVT.Treatment_Description = 'RT' THEN PVT.PatientKey END) AS RT_PatientCount,
    COUNT(CASE WHEN PVT.Treatment_Description = 'CT' THEN PVT.PatientKey END) AS CT_PatientCount,
    COUNT(CASE WHEN PVT.Treatment_Description = 'HT' THEN PVT.PatientKey END) AS HT_PatientCount,
    COUNT(CASE WHEN PVT.Treatment_Description = 'S' THEN PVT.PatientKey END) AS S_PatientCount,
    COUNT(CASE WHEN PVT.Treatment_Description = 'IT' THEN PVT.PatientKey END) AS IT_PatientCount,
    COUNT(CASE WHEN PVT.Treatment_Description = 'TT' THEN PVT.PatientKey END) AS TT_PatientCount
FROM patient_visit_treatment_overview AS PVT
GROUP BY PVT.Visit_Type
Order BY PVT.Visit_Type;
-- return 2 rows