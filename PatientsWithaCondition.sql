select
  patient_id,
  patient_name,
  conditions
from
  Patients
WHERE
  REGEXP_LIKE (conditions, '(^|[^A-Za-z=+])DIAB1([^A-Za-z]|$)');