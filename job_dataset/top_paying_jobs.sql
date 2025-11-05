-- What are the top 10 highest paying data analyst jobs
SELECT job_id ,
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
;





