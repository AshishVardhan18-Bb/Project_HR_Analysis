/*
what are the most in demand skills fpor data analyst
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
*/


select
   skills,
   count(skills_job_dim.job_id) AS Demand_count

from job_postings_fact

INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
WHERE
job_title_short = 'Data Analyst'
AND
job_work_from_home = TRUE

group by skills

order by Demand_count DESC

limit 5;