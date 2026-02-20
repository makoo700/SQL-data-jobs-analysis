/*
 Question: What skills are required for the top paying data analyst jobs?
 -Use the top ten highest paying data analyst jobs from first query
 -Why?It provides a detailed look at which high paying jobs demand certain skills ,
 helping job seekers understand which skills to develop that align with top salaries
 */
WITH top_paying_jobs AS(
    SELECT job_id,
        job_title,
        salary_year_avg,
        company_dim.name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
    /*The most frequently requested skills across these high-paying roles are:
     Top technical skills
     SQL – highest demand (appears in most roles)
     Python – nearly as common as SQL
     Tableau – leading visualization tool
     R – still relevant, especially in senior roles
     Snowflake / Databricks / Pandas – modern data stack tools
     */