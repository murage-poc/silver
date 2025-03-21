import { db } from "./db/db"

console.log("hello")

async function fetchJobs(){

  return  db.selectFrom()
}

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div>

    <h1>Vite + TypeScript</h1>
    <div class="card">
      <button id="counter" type="button"></button>
    </div>
    <p class="read-the-docs">
      Click on the Vite and TypeScript logos to learn more
    </p>
  </div>
`
