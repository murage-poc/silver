import { Kysely, PostgresDialect } from 'kysely';
import pg from 'pg'
import type { DB } from './schema'

const db = new Kysely<DB>({
    dialect: new PostgresDialect({
        pool: new pg.Pool({
            connectionString: process.env.DATABASE_URL,
            options: `-c search_path=${process.env.DB_SCHEMA}`,
        }),
    }),
});

export { db }