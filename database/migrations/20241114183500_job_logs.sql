-- migrate:up
CREATE TABLE job_logs
(
    _id        INTEGER PRIMARY KEY AUTOINCREMENT,
    job_id     INTEGER  NOT NULL,
    status     TEXT     NOT NULL CHECK ( status IN ('CREATED', 'PROCESSING_PAYMENT','PAYMENT_PROCESSED' ,'AWAITING_CAPTCHA_SOLVER',
                                                    'CAPTCHA_SOLUTION', 'PROCESSING_RECHARGE', 'FAILED', 'SUCCESS') ),
    remarks    TEXT              DEFAULT '',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP CHECK  ( created_at IS CURRENT_TIMESTAMP ),

    FOREIGN KEY (job_id) REFERENCES jobs (id)
);

-- migrate:down

DROP TABLE job_logs;