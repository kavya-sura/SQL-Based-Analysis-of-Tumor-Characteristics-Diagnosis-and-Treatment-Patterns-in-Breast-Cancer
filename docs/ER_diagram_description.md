## ER Diagram 

### ★ Table Summary 
- ***Patient Table:*** 
Stores basic patient information such as first and last name, date of birth, and contact info. Each patient has a unique PatientKey.

- ***Physician Table:***
Stores physician details, including license number, first and last name. Each physician has a unique PhysicianKey.

- ***Visit Table:***
Records patient visits, linked to both the patient (PatientFK) and the physician (PhysicianFK). Each visit has a unique VisitKey.

- ***Diagnosis Table:***
Stores diagnosis outcomes linked to a visit (VisitFK). Each diagnosis has a unique DiagnosisKey.

- ***Tumor_Characteristic Table:***
Stores tumor characteristics related to a diagnosis, linked to the Diagnosis table via DiagnosisFK. Each record has a unique Tumor_Character_Key.

- ***Biomarker Table:***
Stores biomarker data related to a diagnosis, linked to the Diagnosis table via DiagnosisFK. Each biomarker record has a unique BiomarkerKey.

- ***Treatment_Plan Table:***
Stores treatment plans related to a diagnosis, linked to the Diagnosis table via DiagnosisFK. Each treatment plan has a unique TreatmentKey.

- ***Outpatient Table:***
Records outpatient details, linked to both the patient (PatientFK) and the referring physician (Referral_Physician). Each record has a unique OutpatientKey.

- ***Inpatient Table:***
Records inpatient details, linked to the patient (PatientFK), including admission and discharge dates, room, and bed numbers.

### ★ Relationships Overview ###
- One-to-Many Relationship
  - Patient → Outpatient
  - Patient → Inpatient
  - Patient → Visit
  - Physician → Visit
  - Visit → Diagnosis
  - Diagnosis → Biomarker
  - Diagnosis → Treatment_Plan
  - Physician → Outpatient (Foreign Key: Referral_Physician in Outpatient table refers to PhysicianKey in the Physician table)
- One-to-One Relationship
  - Diagnosis → Tumor_Characteristic

### ★ Specialization ###
Patient is the ***supertype*** that contains common information for both Outpatient and Inpatient, which are the ***subtypes***.
Outpatient and Inpatient are specific types of care associated with the Patient entity.
- Outpatient: Contains attributes such as Outpatient_Followup_Required, Outpatient_Referral, and Referral_Physician.
- Inpatient: Contains attributes such as Inpatient_Admission_Date, Inpatient_Discharge_Time, Inpatient_Room_Number, and Inpatient_Bed_Number.
