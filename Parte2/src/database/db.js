const mysql = require('mysql2');
require('dotenv').config();

const db = mysql.createConnection({
  host: process.env.DB_HOST,      // localhost
  user: process.env.DB_USER,      // root
  password: process.env.DB_PASSWORD, // root
  database: process.env.DB_NAME   // clinicamedica
});

db.connect(err => {
  if (err) {
    console.error('ERRO - Base de dados', err);
  } else {
    console.log('Base de dados - ON!');
  }
});

module.exports = db;
