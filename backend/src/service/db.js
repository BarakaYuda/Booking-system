require("dotenv").config();
const mysql = require("mysql");

//CREATING a class for database for connecting to mysql database
class DB {
  static getInstance() {
    //checking if this db class is not initialized
    if (!DB.instance) {
      // if not initialized then initialize it
      DB.instance = new DB();
    }
    return DB.instance;
  }
  //entry point of the class, configuring with the database
  constructor() {
    this.getConnection = () => {
      return new Promise((resolve, reject) => {
        this.conn.getConnection((error, connection) => {
          if (error) {
            reject(error);
            return;
          }
          resolve(connection);
        });
      });
    };
    this.query = (conn, options, values) => {
      return new Promise((resolve, reject) => {
        const q = conn.query(options, values, (error, results, fields) => {
          if (error) {
            reject(error);
            return;
          }
          resolve(results);
        });
      });
    };
    this.releaseConnection = (pool) => {
      if (pool) {
        pool.release();
      }
    };
    this.conn = mysql.createPool({
      connectionLimit: 50,
      host: process.env.MYSQL_DB_HOST,
      user: process.env.MYSQL_DB_USER,
      password: "",
      database: process.env.MYSQL_DB_NAME,
      charset: "utf8mb4",
    });
  }
}
//exporting the class
module.exports = DB;
