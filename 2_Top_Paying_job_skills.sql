/*
2) what skills are required for the top_paying data analysts jobs?
- Use the top 10 from the 1st query 
- Add specific skills required for these roles
*/


with top_paying_jobs as (

SELECT
job_id,
job_title,
salary_year_avg,
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

limit 10)


select
top_paying_jobs.*,
skills

FROM top_paying_jobs

INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id

order BY
salary_year_avg;




