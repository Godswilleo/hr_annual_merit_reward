-- Selects the database to be used
USE hr_attrition;

DROP VIEW IF EXISTS v_dept_spread_q2_50andabove;

CREATE VIEW v_dept_spread_q2_50andabove
AS
WITH cte_dept_spread AS(
-- Specifies fields to be retrieved
SELECT 
  e.staff_id, 
  e.age, 
  e.gender, 
  e.department, 
  e.jobrole, 
  k.quarter2_kpi_score

/* Specifies the join between employee_attrition and kpi_scores tables from
from which the fields are to be retrieved */
FROM 
  employee_attrition e 
  JOIN kpi_scores k ON e.staff_id = k.staff_id 
  
/* Specifies the condition of join. This makes use of a subquery to select and retrieve
the staff id of only records where quarter2_kpi_score is 50 and above */
WHERE 
  k.staff_id IN (
    SELECT 
      staff_id 
    FROM 
      kpi_scores
	WHERE
	Quarter2_KPI_Score >= 50
  )
  )
    SELECT department, count(quarter2_kpi_score >= 50) AS 'number of staff' FROM cte_dept_spread GROUP BY department

