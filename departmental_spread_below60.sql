-- Specifies the database to be used
USE hr_attrition;

DROP VIEW IF EXISTS v_deparmental_spread_below60;

CREATE VIEW v_deparmental_spread_below60
AS
WITH cte_dept_spread AS(
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
  )
  SELECT department, count(total_kpi_scores < 60) AS 'number of staff' FROM cte_dept_spread GROUP BY department
