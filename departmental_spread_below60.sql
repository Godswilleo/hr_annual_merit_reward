-- Specifies the database to be used
USE hr_attrition;

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
  
-- retrieves only the records of staff whose kpi is 70% and above as specified by a subquery
WHERE 
  k.staff_id IN (
    SELECT 
      staff_id 
    FROM 
      kpi_scores
	WHERE
	total_kpi_scores < 60
  )
