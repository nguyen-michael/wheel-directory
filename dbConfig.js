require('dotenv').config();
const { Pool } = require('pg');

// Heroku production variable
const isProduction = process.env.NODE_ENV === 'production';

// pg connection
const connectionString = `postgresql://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_DATABASE}`;

// Connect with given string if not production, otherwise take Heroku's
// Also use ssl in production.
const pool = new Pool({
    connectionString: isProduction ? process.env.DATABASE_URL : connectionString,
    ssl: isProduction
});

module.exports = { pool };