USE hr_attrition;
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
