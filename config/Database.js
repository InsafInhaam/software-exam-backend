import { Sequelize } from "sequelize";

const db = new Sequelize("freedb_software_db", "freedb_insafinhaam", "G5bET$nr9kqGbG9", {
  host: "sql.freedb.tech",
  dialect: "mysql",
})

if(db){
    console.log("Database connection started");
}

export default db;
