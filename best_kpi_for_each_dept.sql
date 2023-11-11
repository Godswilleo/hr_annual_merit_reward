-- Select the database to be used
USE hr_attrition;

DROP VIEW IF EXISTS v_best_kpi_for_each_dept;

CREATE VIEW v_best_kpi_for_each_dept
AS
-- Selects the fields to be retrieved
SELECT 
e.staff_id, 
  e.age, 
  e.gender, 
  e.department, 
  e.jobrole,
  k.Quarter1_KPI_Score,
  k.Quarter2_KPI_Score,
  k.Quarter3_KPI_Score,
  k.Quarter4_KPI_Score,
  k.total_kpi_scores  
  
/* creates a join between employee_attrition and kpi_scores tables
and specifies the join as the source of the fields to be retrieved */
FROM 
  employee_attrition e 
  JOIN kpi_scores k ON e.staff_id = k.staff_id 
  
/* specifies the condition for retrieving the fields which is a match between
e.dpartment and k.total_kpi_scores and subquery which returns two-fields, the maximum kpi score
for each department grouped by department */
WHERE 
  (
    e.department, k.total_kpi_scores
  ) IN (
    SELECT 
      e.department, 
      MAX(k.total_kpi_scores) 
    FROM 
      employee_attrition e 
      JOIN kpi_scores k ON e.staff_id = k.staff_id 
    GROUP BY 
      e.department
  )
  
