-- Get all wheels and join all hub and rim data
SELECT * FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;

-- Get relevant wheel building data for all wheels
SELECT rim.erd, rim.offset_spoke_bed, rim.hole_count, hub.center_to_left, hub.center_to_right, hub.flange_pcd_nds, hub.flange_pcd_ds, hub.hole_count, hub.spoke_hole_diameter, wheel.cross_pattern_nds, wheel.cross_pattern_ds
FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;

-- Get names of component of wheels and side: This is the readable human version
SELECT rim.manufacturer, rim.model_name, hub.manufacturer, hub.model_name, hub.side, wheel.cross_pattern_nds, wheel.cross_pattern_nds
FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;
-- If col names match, they get discarded so we have to alias.
SELECT CONCAT(rim.manufacturer, ' ', rim.model_name) AS rim, CONCAT(hub.manufacturer, ' ', hub.model_name) AS hub, hub.side, wheel.cross_pattern_nds, wheel.cross_pattern_ds FROM wheel INNER JOIN rim ON wheel.rim_id = rim.id INNER JOIN hub ON wheel.hub_id = hub.id;

-- Get names with building data
SELECT rim.iso_diameter, rim.erd, rim.offset_spoke_bed, rim.hole_count, hub.center_to_left, hub.center_to_right, hub.flange_pcd_nds, hub.flange_pcd_ds, hub.hole_count, hub.spoke_hole_diameter, wheel.cross_pattern_nds, wheel.cross_pattern_ds, wheel.spoke_length_nds, wheel.spoke_length_ds, CONCAT(rim.manufacturer, ' ', rim.model_name) AS rim, CONCAT(hub.manufacturer, ' ', hub.model_name) AS hub, hub.side
FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;

-- Getting discrete search facets
SELECT 
ARRAY(SELECT DISTINCT(manufacturer) FROM rim) AS manufacturer,
ARRAY(SELECT DISTINCT(model_name) FROM rim) AS model_name,
ARRAY(SELECT DISTINCT(iso_diameter) FROM rim) AS iso_diameter,
ARRAY(SELECT DISTINCT(hole_count) FROM rim) AS hole_count,
ARRAY(SELECT DISTINCT(tire_type) FROM rim) AS tire_type,
ARRAY(SELECT DISTINCT(rim_brake) FROM rim) AS rim_brake,
ARRAY(SELECT DISTINCT(material) FROM rim) AS material,
ARRAY(SELECT DISTINCT(eyelet) FROM rim) AS eyelet
FROM rim LIMIT 1;

SELECT
ARRAY(SELECT DISTINCT(manufacturer) FROM hub) AS manufacturer,
ARRAY(SELECT DISTINCT(model_name) FROM hub) AS model_name,
ARRAY(SELECT DISTINCT(side) FROM hub) AS side,
ARRAY(SELECT DISTINCT(over_locknut_distance) FROM hub) AS over_locknut_distance,
ARRAY(SELECT DISTINCT(hole_count) FROM hub) AS hole_count,
ARRAY(SELECT DISTINCT(spoke_interface) FROM hub) AS spoke_interface,
ARRAY(SELECT DISTINCT(driver) FROM hub) AS driver,
ARRAY(SELECT DISTINCT(brake) FROM hub) AS brake,
ARRAY(SELECT DISTINCT(boost) FROM hub) AS boost,
ARRAY(SELECT DISTINCT(axle_type) FROM hub) AS axle_type,
ARRAY(SELECT DISTINCT(convertible) FROM hub) AS convertible,
ARRAY(SELECT DISTINCT(points_of_engagement) FROM hub) AS points_of_engagement,
ARRAY(SELECT DISTINCT(dynamo) FROM hub) AS dynamo
FROM hub LIMIT 1;


