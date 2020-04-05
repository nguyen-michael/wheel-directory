var express = require('express')
var router = express.Router()
const { pool } = require("../dbConfig");


// Get all wheels, rims and hubs.
router.get("/wheels", async (req, res) => {
    try {
        const results = await pool.query("SELECT * FROM wheel");
        res.json(results.rows);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

router.get("/rims", async (req, res) => {
    try {
        const results = await pool.query("SELECT * FROM rim");
        res.json(results.rows);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

router.get("/hubs", async (req, res) => {
    try {
        const results = await pool.query("SELECT * FROM hub");
        res.json(results.rows);
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

module.exports = router;

