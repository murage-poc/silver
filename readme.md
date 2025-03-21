# Kysley + dbmate + NodeJs Demo

A demo project showcasing the use of
 -  [dbmate](https://github.com/amacneil/dbmate) to manage database migrations
 - [Kysley](https://github.com/kysely-org/kysely) to run database queries type safe way 
 - [kysely-codegen](https://github.com/RobinBlomberg/kysely-codegen) to generates Kysely type definitions from database.


## Prerequisites
- NodeJs v22.x or greater
- PNPM or NPM or any other NodeJs package manager
- Postgres database

### How to run the demo
1) Clone or download the repo specifically [feat/with-kysley branch](https://github.com/murage-poc/silver/tree/feat/with-kysley)

2) Install the project dependencies
  ```shell
  pnpm install
  ```
3) Copy `.env.example` to `.env`
  ```shell
  cp .env.example .env
  ```
4) Update the `.env` file with correct database credentials
5) Run database migrations
```shell
pnpm db:migrate
```
6) Run the app (the output will be shown right on terminal)
```shell
pnpm dev
```

## Troubleshooting

- **Missing environment variables**: Ensure that the appropriate environment variables are set for your database connection and migration settings.
- **Permission errors**: Check that the database credentials have the appropriate permissions to perform migrations.
- **Database connection issues**: Make sure the database connection settings in .env file are correct and that the database is running.

---

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/mit).

---