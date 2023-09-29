-- Selects the database to use
USE hr_attrition;

/* Deletes the table if a table already exists which have same name as
specified for the new table to be created */
DROP 
  TABLE IF EXISTS kpi_scores;

/* Creates a new Table using the fields and records retrieved from a CTE as 
the field and records of the new table */
CREATE TABLE kpi_scores AS(
  WITH CTE_kpi_score AS(
    SELECT 
      staff_id, 
      Quarter1_KPI_Score, 
      Quarter2_KPI_Score, 
      Quarter3_KPI_Score, 
      Quarter4_KPI_Score, 
      ROUND(
        (30 / 100)* quarter1_kpi_score, 
        0
      ) as computed_quarter1_score, 
      ROUND(
        (40 / 100)* quarter2_kpi_score, 
        0
      ) as computed_quarter2_score, 
      ROUND(
        (15 / 100)* quarter3_kpi_score, 
        0
      ) AS computed_quarter3_score, 
      ROUND(
        (15 / 100)* quarter4_kpi_score, 
        0
      ) AS computed_quarter4_score 
    FROM 
      employee_attrition 
    WHERE 
      attrition = 'No'
  ) 
  
  -- Retrieves fields from the CTE and generates a calculated field from the retrieved field
  SELECT 
    *, 
    (
      computed_quarter1_score + computed_quarter2_score + computed_quarter3_score + computed_quarter4_score
    ) AS total_kpi_scores 
  FROM 
    CTE_kpi_score
);
