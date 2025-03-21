import { db } from "./db/db"
import process from 'node:process';

(async function() {
    console.log("Let use begin by trying to insert some users to the table");

    //insert some users
    const [insertResult]= await db.insertInto('users').values([
        {
            email: 'jennifer@gmail.com',
            username: 'jennifer',
            password: 'some password hash here',
        },
        {
            email: 'Arnold@gmail.com',
            username: 'arnold',
            password: 'some password hash here',
        }
    ]).execute()

    console.log(`Inserted ${insertResult.numInsertedOrUpdatedRows} users successfully`)

    //select all users
    const users = await db.selectFrom('users').selectAll().execute();

    console.log('Fetched users successfully')
    console.log(users)
    console.log('Demo done! Exiting ...')

    process.exit(0);

})();
