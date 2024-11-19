-- migrate:up
CREATE TABLE jobs
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    correlation_id TEXT NOT NULL,
    payload TEXT NOT NULL,
    created_at     DATETIME DEFAULT CURRENT_TIMESTAMP CHECK  ( created_at IS CURRENT_TIMESTAMP )
);

-- migrate:down
DROP TABLE jobs;
