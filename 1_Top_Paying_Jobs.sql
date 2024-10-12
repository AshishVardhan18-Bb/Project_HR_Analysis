/* Question 1
What are the top paying data analyst jobs
- Identify the top 10 highest paying data analyst jobs
- focus on job postings of specific salaries(remove the nulls)
*/


SELECT
job_id,
company_dim.company_id,
job_title,
job_location,
job_posted_date,
salary_year_avg,
job_schedule_type,
name as company_name

FROM
job_postings_fact

LEFT JOIN 
company_dim on job_postings_fact.company_id = company_dim.company_id

WHERE
job_title = 'Data Analyst'
AND
salary_year_avg IS NOT NULL
AND
job_location = 'Anywhere'

ORDER BY
salary_year_avg DESC

limit 10;





