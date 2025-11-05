WITH top_10_paying_data_analyst_roles AS(
    SELECT 
    job_id ,
    salary_year_avg ,
    job_title , 
    job_schedule_type , 
    job_posted_date,
    company_dim.name AS company
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE 
(salary_year_avg IS NOT NULL) 
AND 
(job_title_short ='Data Analyst')
AND 
(job_work_from_home = TRUE)
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT 
skills_job_dim.skill_id,
skills_dim.skills , 
top_10_paying_data_analyst_roles.job_id ,
top_10_paying_data_analyst_roles.job_title ,
top_10_paying_data_analyst_roles.salary_year_avg , 
top_10_paying_data_analyst_roles.company

FROM skills_job_dim
JOIN top_10_paying_data_analyst_roles ON skills_job_dim.job_id = top_10_paying_data_analyst_roles.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
;