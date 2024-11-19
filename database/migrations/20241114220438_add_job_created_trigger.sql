-- migrate:up
CREATE TRIGGER after_job_creation
    AFTER INSERT
    ON jobs
    FOR EACH ROW
BEGIN
    INSERT INTO job_logs(job_id, status, remarks)
    VALUES (NEW.id, 'CREATED', 'User request submitted');
END;

-- migrate:down

DROP TRIGGER after_job_creation;
