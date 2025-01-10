/*
1.Tumor Characteristic Average Report: 
Calculate the average of Tumor Radius Mean, Tumor Texture Mean, and Tumor Perimeter Mean 
for benign and malignant tumor diagnoses.
*/
-- radius_mean: Average radius of the tumor (from different slices).
-- texture_mean: Average surface texture (roughness/regularity).
-- perimeter_mean: Average perimeter (boundary length).

-- Create a view table of tumor and diagnosis
CREATE VIEW Tumor_Diagnosis_Overview AS
	SELECT V.PatientFK, Dx.*, TC.*
	FROM Diagnosis AS Dx
	JOIN Tumor_Characteristic AS TC ON Dx.DiagnosisKey = TC.DiagnosisFK
	JOIN Visit AS V ON Dx.VisitFK = V.VisitKey;
SELECT 
	Diagnosis_Outcome, 
    AVG(Tumor_Radius_Mean), -- Average tumor radius
    AVG(Tumor_Texture_Mean), -- Average tumor texture
    AVG(Tumor_Perimeter_Mean) -- Average tumor perimeter
    FROM Tumor_Diagnosis_Overview AS TD
GROUP BY Diagnosis_Outcome -- USE "GROUP BY" to classify beningn and malignant
ORDER BY Diagnosis_Outcome; 
-- returns 2 rows
