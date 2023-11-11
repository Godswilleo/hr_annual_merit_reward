-- Selects the database being used
USE hr_attrition;

DROP VIEW IF EXISTS v_year_highest_kpi;

CREATE VIEW v_year_highest_kpi
AS
-- Selects the required fields from each table
SELECT 
  e.staff_id, 
  e.age, 
  e.gender, 
  e.department, 
  e.jobrole,
  e.yearsatcompany,
  e.yearsincurrentrole,
  k.Quarter1_KPI_Score,
  k.Quarter2_KPI_Score,
  k.Quarter3_KPI_Score,
  k.Quarter4_KPI_Score,
  k.total_kpi_scores 
  
  -- Specifies the join between the employee_attrition and kpi_scores tables using staff_id field
FROM 
  employee_attrition e 
  JOIN kpi_scores k ON e.staff_id = k.staff_id 
  
  
/* uses a subquery to specify the condition for record retrieval. In this case
  only the record which contains the heighest total_kpi_score is retrieved */
WHERE 
  k.total_kpi_scores IN (
    SELECT 
      MAX(total_kpi_scores) 
    FROM 
      kpi_scores
  )
