-- migrate:up
CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- migrate:down
DROP TABLE users;