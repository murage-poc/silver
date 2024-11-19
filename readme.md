# dbmate-node-demo

A demo project showcasing the use of [dbmate](https://github.com/amacneil/dbmate) for database migrations in a Node.js environment.

This project provides a simple setup to demonstrate how to integrate `dbmate` for managing database migrations via the command line.

## Project Setup

This project uses **pnpm** as the package manager, so make sure it's installed. You can install pnpm globally using the following command:


### Install Dependencies

Install the project dependencies using pnpm:

```bash
pnpm install
```

---

## Development Setup

### 1. Copy `.env.example` to `.env`

Before starting development, copy the `.env.example` file to `.env`:

```bash
cp .env.example .env
```

The `.env` file will contain environment-specific variables needed for your database configuration.

### 2. Configure Your Database Connection

Update the `.env` file with the appropriate database connection details.

- **DB_CONNECTION**: Defines the db connection protocol to use. In this case, it's set to `sqlite3`, but you can change it to other types like `postgres` or `mysql` if needed.

- **DATABASE_URL**: The final database URL used by `dbmate` during migrations.

For SQLite, the default setup uses a file-based database (`apeiron.sqlite3`). If you're using a different database system (like PostgreSQL or MySQL), make sure to adjust the `DB_CONNECTION` and `DB_DATABASE` accordingly.

---

### 3. Running Migrations in Development

Once you've configured the `.env` file, you can run migrations in your local development environment using the following commands.

#### Apply migrations:

```bash
pnpm db:migrate
```

#### Rollback migrations:

```bash
pnpm db:rollback
```

#### Create a new migration:

```bash
pnpm db:mc <name_of_the_migration_here>
```

---

## Production Setup

In production, **it is recommended not to use the `.env` file** for managing environment variables. Instead, you should manage your environment configurations securely through environment variables provided by your deployment platform or orchestration system (e.g., Docker, Kubernetes, cloud providers like AWS, GCP, Azure, etc.).

You can set environment variables directly in your server or through your CI/CD pipeline configuration. Here's a general guide:

### 1. Set Environment Variables for Production

Instead of relying on `.env` files in production, configure your environment variables directly in your deployment system. For example:

#### In Linux/Unix-based environments, you can set environment variables like this:

```bash
export DBMATE_MIGRATIONS_TABLE="migrations"
export DBMATE_MIGRATIONS_DIR="./database/migrations"
export DBMATE_NO_DUMP_SCHEMA=true

export DB_CONNECTION="postgresql"
export DB_DATABASE="prod_database"
export DB_USER="prod_user"
export DB_PASSWORD="prod_password"
export DB_HOST="prod_host"
export DB_PORT=5432

export DATABASE_URL="${DB_CONNECTION}://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"
```

#### In Docker:

For Docker deployments, set the environment variables in the `Dockerfile` or through the `docker-compose.yml` file:

```yaml
version: "3.8"
services:
  dbmate-node-demo:
    image: your-image-name
    environment:
      - DBMATE_MIGRATIONS_TABLE=migrations
      - DBMATE_MIGRATIONS_DIR=./database/migrations
      - DBMATE_NO_DUMP_SCHEMA=true
      - DB_CONNECTION=postgresql
      - DB_DATABASE=prod_database
      - DB_USER=prod_user
      - DB_PASSWORD=prod_password
      - DB_HOST=prod_host
      - DB_PORT=5432
      - DATABASE_URL=${DB_CONNECTION}://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}
```

You can also use secrets management solutions like AWS Secrets Manager, Google Cloud Secret Manager, or Kubernetes secrets for better security and management of sensitive data.

### 2. Run Migrations in Production

Once the environment variables are set, you can run migrations as usual. In production, this can be automated through your CI/CD pipeline or triggered manually from the server:

#### Apply migrations:

```bash
pnpm db:migrate
```

#### Rollback migrations:

```bash
pnpm db:rollback
```


---

## Scripts Overview

This project includes the following npm scripts:

- `db:migrate`: Runs `dbmate up` to apply pending database migrations.
- `db:rollback`: Runs `dbmate rollback` to revert the last applied migration.
- `db:mc`: Creates a new migration file using `dbmate new`.

---

## Troubleshooting

- **Missing environment variables**: Ensure that the appropriate environment variables are set for your database connection and migration settings.
- **Permission errors**: Check that the database credentials have the appropriate permissions to perform migrations and rollbacks.
- **Database connection issues**: Make sure that the database connection details are correct and that the database is running (for non-SQLite databases).

---

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/mit).
