/*
8. Treatment Comparison Report:Retrieve patients’ information, including the first letter of their last name, 
for patients who have undergone multiple types of treatments (RT, CT, HT, S, IT) for the same diagnosis outcome (benign or malignant). 
Include their treatment dates and descriptions.
*/

CREATE View Patient_Diagnosis_Treatment AS
	SELECT
		PT.*, Dx.DiagnosisKey, Dx.Diagnosis_Outcome, 
        TP.TreatmentKey, TP.Treatment_Description
	FROM Patient AS PT
    JOIN Visit AS VT ON VT.PatientFK = PT.PatientKey
    JOIN Diagnosis AS Dx ON Dx.VisitFK = VT.VisitKey
    JOIN Treatment_Plan AS TP ON TP.DiagnosisFK = Dx.DiagnosisKey;

SELECT DISTINCT 
    PDT.PatientKey,
    PDT.Patient_First_Name,
    CONCAT(SUBSTRING(PDT.Patient_Last_Name,1,1),'.') AS Patient_Last_Initial,
    REPLACE(REPLACE(PDT.Diagnosis_Outcome, 'B', 'Benign'), 'M', 'Malignant') AS Diagnosis_Outcome_Formatted,
    PDT.Treatment_Description AS Treatment_Type_1
FROM patient_diagnosis_treatment AS PDT
JOIN patient_diagnosis_treatment AS PDT2 
	ON PDT.PatientKey = PDT2.PatientKey AND
		PDT.Diagnosis_Outcome = PDT2.Diagnosis_Outcome AND
        PDT.Treatment_Description != PDT2.Treatment_Description;