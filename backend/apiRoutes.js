var express = require('express')
var router = express.Router()
const { pool } = require("../dbConfig");


// Get all wheels, rims and hubs.
router.get("/wheels", async (req, res) => {
    try {
        const results = await pool.query("SELECT rim.manufacturer, rim.model_name, hub.manufacturer, hub.model_name, hub.side, wheel.cross_pattern_nds, wheel.cross_pattern_nds FROM wheel INNER JOIN rim ON wheel.rim_id = rim.id INNER JOIN hub ON wheel.hub_id = hub.id");
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

