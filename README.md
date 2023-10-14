![](/img/banner.jpg)<br />

# HR EMPLOYEE ANNUAL MERIT REWARD
The project is mearnt to explore employee performance records and then reward high flying employees.

### Data Set
THe data set provided is a csv file. This is the csv named **employee_attrition_train.csv**

### Set Up ###
* Install the Mysql Server
* Install Mysql WorkBench desktop app and set it up correctly
* In Mysql WorkBench, Create a database and import **employee_attrition_train.csv** as a table. And run the query **create_the_kpi_score_table.sql** and then save the table created as **kpi_scores.csv**

## Purpose Statement/Business Need
The reward is basically incentivizing staff based on staff KPI performance for the past year. All monetory rewards are expected to commence from January salary. Salaries are normally paid on the 25th day of each month.

In computing the total_kpi_scores for the year, out of total possible score of 100, the weight of each quarter are as follows
quarter1 = 30, quarter2 = 40, quarter3 = 15, quarter4 = 15. This is because due to the nature of the business, quarters 3 and 4 are considered peak periods where business is expected to boom and employees are expected to score well in their KPI, while quarters 1 and 2 are  considered off peak periods when employees are not expected to really do well with their KPI. (This is factored into the **create_the_kpi_score_table** query)

In light of this management decided to set up the following;

1. Reward those with total annual KPI of 70% and above with a 10% monthly salary increment

2. Reward those with total annual KPI of between 60% to 69% with a 5% monthly salary increment and also an award plaque

3. Give 1% salary increment to people who whose total annual KPI score is below 60%

4. Reward staff with the highest total annual KPI with a one-off bonus of 30% of their monthly salary

5. Reward staff with KPI score of 50% and above in quarter2 with a 10% one-off bonus

6. Payroll needs payment schedule for January salary payments generated with all of the above factored in.

This is to be delivered to HR to help collate deserving staff the the annual awards

### Generating the data for the rewards as required
1. Get the staff who scored annual KPI of 70% and above
2. Get the staff who got 60 to 69% annual KPI score
3. Get staff who scored below 60% annual KPI
4. Get the staff who got the highest total annual KPI 
5. Get staff who scored 50% and above KPI in quarter2
6. Get the number of people from each department who scored 70 and above annual KPI
7. Get the number of people from each department who scored 60 to 69 annual KPI
8. Get the number of people from each department who scored 50 and above in quarter 2
9. Get the staff who had the highest KPI for each department
10. Generate the January salary schedule while factoring in the rewards for each category of staff
11. Difference in total remunerations after implementing the rewards

## Technologies used and skills demonstrated
* Python    - Cleaning and Transformation using Pandas, Matplotlib, Charts, Functions, loops
* SQL       - Explorational data querying using Subquery, CTE, Calculated Fields, Table creation from CTE, Multi-Layer subquries, CASE statements
* Power BI  - Create dashboard

## Data Cleaning and Transformation
The cleaning and transformation processes were done using python on a jupyter notebook
(to be updated)

## Exploration Data Analysis
The exporation was mainly done using SQL in other to generate the data requested for. Below are the various 
queries written for the different purposes and the CSV file the tables are saved as;


|S/N    |Purpose                                              | Query Written                    | CSV file                  |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 1.    | Get the staff who scored annual KPI of 70 and above | year_70%upward_kpi.sql           | year_70andabove.csv       |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 2.    | Get the staff who got 60 to 69 annual KPI score     | year_60to69%_kpi.sql             | year_60to69.csv           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 3.    | Get staff who scored below 60% annual KPI score     | -                                |                           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 4.    | Get the staff who got the highest total annual KPI  | year_highest_kpi.sql             | year_highest_kpi.csv      |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 5.    | Get staff who scored 50% and above KPI in quarter2  | quarter2_50andabove_kpi.sql      | quarter2_50andabove.csv   |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 6.    | Get the number of people from each department who   |departmental_spread_70andabove.sql|                           |
|       | scored 70 and above annual KPI                      |                                  |                           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 7.    | Get the number of people from each department who   | departmental_spread_60to69.sql   |                           |
|       | scored 60 to 69 annual KPI                          |                                  |                           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 8.    | Get the number of people from each department who   | dept_spread_q2_50andabove.sql    |                           |
|       | scored 50 and above quarter 2 KPI                   |                                  |                           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 9.    | Get the staff who got the highest KPI scores in     | best_kpi_for_each_dept.sql       | dept_bests.csv            |
|       | each department                                     |                                  |                           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 10.   | Generate December salary payment schedule while     | december_salary_schedule.sql     | dec_salary_schedule.csv   |
|       | factoring in the reward for each category of staff  |                                  |                           |
|-------|-----------------------------------------------------|----------------------------------|---------------------------|
| 11.   | Get the difference in total remunerations and also  | best_kpi_for_each_dept.sql       | dept_bests.csv            |
|       | percentage difference in total remunerations after  |                                  |                           |
|       | implementing the rewards                            |                                  |                           |






