USE hr_attrition;

SELECT 
  e.staff_id, 
  e.age, 
  e.gender, 
  e.department, 
  e.jobrole, 
  k.total_kpi_scores 
FROM 
  employee_attrition e 
  JOIN kpi_scores k ON e.staff_id = k.staff_id 
WHERE 
  k.staff_id IN (
    SELECT 
      staff_id 
    FROM 
      kpi_scores
	WHERE
	total_kpi_scores >= 70
  )
