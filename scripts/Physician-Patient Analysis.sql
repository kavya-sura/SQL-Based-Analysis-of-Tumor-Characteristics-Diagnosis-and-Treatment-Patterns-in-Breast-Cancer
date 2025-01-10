/*
3.Physician-Patient Analysis: 
Determine the number of patients treated by each physician and 
identify physicians with patients who have had both benign and malignant tumor diagnoses.
*/
SELECT * FROM Visit;
-- Create a view table of patient and physician (link through visit)
CREATE VIEW Patient_Physician_Diagnosis_Overview AS
	SELECT 
		PT.*,
        PH.*,
        Dx.*
	FROM Patient AS PT
	JOIN Visit AS V ON V.PatientFK = PT.PatientKey
	JOIN Physician AS PH ON PH.PhysicianKey = V.PhysicianFK
    JOIN Diagnosis AS Dx ON Dx.VisitFK = V.VisitKey;
-- 
SELECT 
    PPD1.PhysicianKey,
    PPD1.Physician_Last_Name,
    PPD1.Physician_First_Name,
    COUNT(DISTINCT PPD1.PatientKey) AS PatientCount,
    -- count all patient numbers
    COUNT(DISTINCT CASE WHEN PPD1.Diagnosis_Outcome = 'B' THEN PPD1.PatientKey END) AS Benign_PatientCount, 
    -- count benign patient numbers
    COUNT(DISTINCT CASE WHEN PPD1.Diagnosis_Outcome = 'M' THEN PPD1.PatientKey END) AS Malignant_PatientCount,
    -- count malignant patient numbers
    COUNT(DISTINCT CASE WHEN PPD1.Diagnosis_Outcome = 'B' AND PPD2.Diagnosis_Outcome = 'M' THEN PPD1.PatientKey END) AS Both_Diagnosis_PatientCount
    -- count both benign and malignant patient numbers
FROM Patient_Physician_Diagnosis_Overview AS PPD1
JOIN Patient_Physician_Diagnosis_Overview AS PPD2 -- self-joint with Physician_Diagnosis_Overview
    ON PPD1.PatientKey = PPD2.PatientKey -- same patient
    AND PPD1.PhysicianKey = PPD2.PhysicianKey -- same doctor
GROUP BY PPD1.PhysicianKey
ORDER BY PPD1.PhysicianKey ASC;
-- returns 5 rows