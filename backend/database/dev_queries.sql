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

-- Getting discrete search facets from Wheel.
-- Use a view to facilitate this

-- View for complete rim and hub data on wheel. (all Rim and hub data, joined per wheel)
CREATE VIEW wheel_complete AS
SELECT wheel.id, wheel.rim_id, wheel.hub_id , CONCAT(rim.manufacturer, ' ', rim.model_name) AS rim, CONCAT(hub.manufacturer, ' ', hub.model_name) AS hub, wheel.cross_pattern_nds, wheel.cross_pattern_ds, wheel.spoke_length_nds, wheel.spoke_length_ds, wheel.stock_id, wheel.web_url, wheel.notes, rim.iso_diameter, rim.erd, rim.hole_count, rim.offset_spoke_bed, rim.tire_type, rim.rim_brake, rim.inner_width, rim.outer_width, rim.depth, rim.material, rim.weight AS rim_weight, rim.eyelet, hub.side, hub.flange_pcd_nds, hub.flange_pcd_ds, hub.center_to_left, hub.center_to_right, hub.over_locknut_distance, hub.spoke_hole_diameter, hub.spoke_interface, hub.driver, hub.brake, hub.boost, hub.axle_type, hub.convertible, hub.points_of_engagement, hub.dynamo, hub.weight AS hub_weight
FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;

-- Wheel facets
SELECT
ARRAY(SELECT DISTINCT(rim) FROM wheel_complete) AS rim,
ARRAY(SELECT DISTINCT(hub) FROM wheel_complete) AS hub,
ARRAY(SELECT DISTINCT(side) FROM wheel_complete) AS side,
ARRAY(SELECT DISTINCT(over_locknut_distance) FROM wheel_complete) AS over_locknut_distance,
ARRAY(SELECT DISTINCT(hole_count) FROM wheel_complete) AS hole_count,
ARRAY(SELECT DISTINCT(spoke_interface) FROM wheel_complete) AS spoke_interface,
ARRAY(SELECT DISTINCT(driver) FROM wheel_complete) AS driver,
ARRAY(SELECT DISTINCT(brake) FROM wheel_complete) AS brake,
ARRAY(SELECT DISTINCT(boost) FROM wheel_complete) AS boost,
ARRAY(SELECT DISTINCT(axle_type) FROM wheel_complete) AS axle_type,
ARRAY(SELECT DISTINCT(convertible) FROM wheel_complete) AS convertible,
ARRAY(SELECT DISTINCT(points_of_engagement) FROM wheel_complete) AS points_of_engagement,
ARRAY(SELECT DISTINCT(dynamo) FROM wheel_complete) AS dynamo,
ARRAY(SELECT DISTINCT(iso_diameter) FROM wheel_complete) AS iso_diameter,
ARRAY(SELECT DISTINCT(tire_type) FROM wheel_complete) AS tire_type,
ARRAY(SELECT DISTINCT(rim_brake) FROM wheel_complete) AS rim_brake,
ARRAY(SELECT DISTINCT(material) FROM wheel_complete) AS material,
ARRAY(SELECT DISTINCT(eyelet) FROM wheel_complete) AS eyelet
FROM wheel_complete LIMIT 1;
