-- Specifies the database to be used
USE hr_attrition;

DROP VIEW IF EXISTS v_year_below60_kpi;

CREATE VIEW v_year_below60_kpi
AS
-- selects the fields to be retrieved
SELECT 
  e.staff_id, 
  e.age, 
  e.gender, 
  e.department, 
  e.jobrole, 
  k.total_kpi_scores 
  
/* Specifies the join between the employee_attrition and kpi_scores table from which ->
fields are being retrieved */
FROM 
  employee_attrition e 
  JOIN kpi_scores k ON e.staff_id = k.staff_id 
 
/* uses a subquery to specify the condition of retrieval such that only the staff_id of staff whose 
total_kpi_scores are from 60 to 69 are retrieved */
WHERE 
  k.staff_id IN (
    SELECT 
      staff_id 
    FROM 
      kpi_scores
	WHERE
	total_kpi_scores < 60
  )
