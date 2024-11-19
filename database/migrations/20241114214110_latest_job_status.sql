-- migrate:up
CREATE VIEW latest_job_status AS
SELECT jobs.id,
       jobs.correlation_id,
       job_logs.status,
       job_logs.remarks,
       jobs.created_at     AS job_created_at,
       job_logs.created_at AS log_created_at
FROM job_logs
         INNER JOIN (SELECT jl1._id, MAX(jl1.created_at)
                     FROM job_logs jl1
                     GROUP BY job_id) latest ON job_logs.job_id = latest._id
         INNER JOIN jobs on jobs.id = job_logs.job_id;
-- migrate:down

DROP VIEW latest_job_status;