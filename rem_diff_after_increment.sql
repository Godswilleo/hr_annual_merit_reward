-- specifies database to use
USE hr_attrition;

/* CTE to retrieve current and new total remunerations with both formated
to add comma seperators as well as calculate the their difference */
WITH cte_total_remunerations AS(
  SELECT 
    SUM(currentmonthlysalary) AS current_remunerations, 
    SUM(newmonthlysalary) AS new_remunerations, 
    FORMAT(
      SUM(
        newmonthlysalary - currentmonthlysalary
      ), 
      'N0', 
      'en-us'
    ) AS difference 
  FROM 
    december_salary_schedule
) 

/* Retrieve the current, new remunerations and difference from the CTE
and then calculate the percentage difference */
SELECT 
  FORMAT(
    current_remunerations, 'N0', 'en-us'
  ) AS current_total_remuneration, 
  FORMAT(new_remunerations, 'N0', 'en-us') AS new_total_remunerations, 
  difference, 
  ROUND(
    (
      new_remunerations - current_remunerations
    )/ current_remunerations * 100, 
    2
  ) AS percentage_remunerations_increase 
FROM 
  cte_total_remunerations 
GROUP BY 
  current_remunerations, 
  new_remunerations
