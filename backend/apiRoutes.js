var express = require('express')
var router = express.Router()
const { pool } = require("../dbConfig");

// Get all wheels, rims and hubs.
router.get("/wheels", async (req, res) => {
    try {
        const results = await pool.query("SELECT wheel.id, rim.erd, rim.offset_spoke_bed, rim.hole_count, hub.center_to_left, hub.center_to_right, hub.flange_pcd_nds, hub.flange_pcd_ds, hub.hole_count, hub.spoke_hole_diameter, wheel.cross_pattern_nds, wheel.cross_pattern_ds, wheel.spoke_length_nds, wheel.spoke_length_ds, CONCAT(rim.manufacturer, ' ', rim.model_name) AS rim, CONCAT(hub.manufacturer, ' ', hub.model_name) AS hub, hub.side FROM wheel INNER JOIN rim ON wheel.rim_id = rim.id INNER JOIN hub ON wheel.hub_id = hub.id");
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

