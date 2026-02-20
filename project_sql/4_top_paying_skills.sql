/*
 Question: What are the top paying skills based on salary?
 -Look at the average salry associated with eaach skill for the data analyst skill for data analyst position
 -Focus on roles with specified salaries regardless of location 
 -Why?It reveals how different skills impact salary levels of data analysts and
 helps identify the most financially rewarding skills to acquire and improve
 */
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
/*
 Here are 3 quick, high-level trend insights from the top-paying data analyst skills 
 Pay is driven by specialization, not core analytics
 The highest salaries are tied to niche or advanced skills (e.g., blockchain, MLOps, infrastructure tools), not traditional analyst staples like SQL or Excel—showing that rare expertise commands a premium.
 Strong convergence between data analysis and engineering/ML
 Many top-paying skills sit at the intersection of analytics, machine learning, and data engineering (modeling frameworks, orchestration tools, scalable systems), indicating analysts are increasingly expected to work closer to production systems.
 Enterprise & automation tools signal seniority
 Skills related to infrastructure, automation, and collaboration platforms correlate with higher pay, reflecting that top-earning analysts often operate in senior, platform-level, or decision-critical roles, not purely reporting roles.
 */