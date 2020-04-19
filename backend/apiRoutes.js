var express = require('express')
var router = express.Router()
const { pool } = require("../dbConfig");

// Initial Data from wheels, rims hubs
router.get("/wheels", async (req, res) => {
    try {
        const results = await pool.query("SELECT * FROM wheel_complete");
        // const results = await pool.query("SELECT *, pg_sleep(10) from wheel where id = 23234342");
        res.json(results);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

router.get("/rims", async (req, res) => {
    try {
        const results = await pool.query("SELECT * FROM rim");
        res.json(results);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

router.get("/hubs", async (req, res) => {
    try {
        const results = await pool.query("SELECT * FROM hub");
        res.json(results);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

router.get("/rim-facets", async (req, res) => {
    try {
        const results = await pool.query("SELECT ARRAY(SELECT DISTINCT(manufacturer) FROM rim) AS manufacturer_values, ARRAY(SELECT DISTINCT(model_name) FROM rim) AS model_name_values FROM rim LIMIT 1");
        res.json(results);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

module.exports = router;

