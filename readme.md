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
For example, if using SQLite, only the connection type and database name are required:

```shell
DB_CONNECTION=sqlite3
DB_NAME=somefilename.sqlite3  # The filename of the SQLite database

DATABASE_URL="${DB_CONNECTION}:${DB_NAME}"
```

---

### 3. Scripts Overview

This project includes the following npm scripts:

- `db:migrate`: Runs `dbmate up` to apply pending database migrations.
- `db:rollback`: Runs `dbmate rollback` to revert the last applied migration.
- `db:cm`: Creates a new migration file using `dbmate new`. You need to provide the migration file name, for example:  
  ```bash
  pnpm db:cm <name_of_the_migration_here>
  ```

---

## Production Setup

In production, **it is recommended not to use the `.env` file** for managing environment variables. Instead, you should manage your environment configurations securely through environment variables provided by your deployment platform or orchestration system (e.g., Docker, Kubernetes, cloud providers like AWS, GCP, Azure, etc.).

You can set environment variables directly on your server or through your CI/CD pipeline configuration. Here's a general guide:

### 1. Set Environment Variables for Production

Instead of relying on `.env` files in production, configure your environment variables directly in your deployment system if available.  
You can also use secrets management solutions like AWS Secrets Manager, Google Cloud Secret Manager, or Kubernetes secrets for better security and management of sensitive data.

### 2. Run Migrations in Production

Once the environment variables are set, you can run migrations as usual. In production, this can be automated through your CI/CD pipeline or triggered manually from the server:

#### Apply migrations:

```bash
pnpm db:migrate
```

---

## Troubleshooting

- **Missing environment variables**: Ensure that the appropriate environment variables are set for your database connection and migration settings.
- **Permission errors**: Check that the database credentials have the appropriate permissions to perform migrations and rollbacks.
- **Database connection issues**: Make sure the database connection details are correct and that the database is running (for non-SQLite databases).

---

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/mit).

---