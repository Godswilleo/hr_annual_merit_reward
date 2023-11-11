-- Specifies the table to be used
USE hr_attrition;

/* Deletes the table if a table already exists which have same name as
specified for the new table to be created */
DROP 
  VIEW IF EXISTS v_december_salary_schedule;

CREATE VIEW v_december_salary_schedule
AS
/* Creates a new Table using the fields and records retrieved from a CTE as 
the field and records of the new table */

  WITH CTE_december_salary AS(
    SELECT 
      e.staff_id, 
      e.age, 
      e.gender, 
      e.department, 
      e.jobrole, 
      k.quarter2_kpi_score, 
      k.total_kpi_scores, 
      e.monthlysalary as currentmonthlysalary, 
      
      /* creates a field named annual_increment whose value is dependent on the value of the total_kpi_scores in the 
                  respective record. If total_kpi_scores is greater than or equal to 70, annual_increment is 10% of current salary.
                  If total_kpi_scores from 60 to 69, annual_increment is 5% of current salary. If total_kpi_scores is less than 60, is 1% of current salary
                  */
      CASE WHEN k.total_kpi_scores >= 70 THEN monthlysalary * 1.1 WHEN k.total_kpi_scores BETWEEN 60 
      AND 69 THEN monthlysalary * 0.05 ELSE monthlysalary * 0.01 END AS annual_increment, 
      
      /* creates a field named kpi_firstprize_bonus whose value is dependent on the value of the total_kpi_scores in the 
                  respective query. If total_kpi_scores is the heighest amongst others in the kpi_scores table kpi_firstprize_bonus is 30% of current salary.
                  else kpi_firstprize_bonus is 0
                  */
      CASE WHEN k.total_kpi_scores = (
        SELECT 
          MAX(total_kpi_scores) 
        FROM 
          kpi_scores
      ) THEN monthlysalary * 0.3 ELSE 0 END AS kpi_firstprize_bonus, 
      
      /* creates a field named quarter2_kpi_bonus whose value is dependent on the value of the quarter2_kpi_score in the 
                  respective query. If quarter2_kpi_score  is greater than or equal to 50, quarter2_kpi_bonus is 10% of current salary.
                  else quarter2_kpi_bonus is 0.
                  */
      CASE 
		WHEN k.quarter2_kpi_score >= 50 THEN e.monthlysalary * 0.1 
        ELSE 0 
	  END AS quarter2_kpi_bonus
      
	-- Defines the join between employee_attrition and kpi_scores tables from which the fields were retrieved from
    FROM 
      employee_attrition e 
      JOIN kpi_scores k ON e.staff_id = k.staff_id
  ) 
  
  -- Retrieve the fields in the CTE and also generates calculated fields from some of the fields
  SELECT 
    *, 
    (
      annual_increment + currentmonthlysalary
    ) AS newmonthlysalary, 
    (
      annual_increment + currentmonthlysalary + kpi_firstprize_bonus + quarter2_kpi_bonus
    ) AS decembersalary 
  FROM 
    CTE_december_salary

