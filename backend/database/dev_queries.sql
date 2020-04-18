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
SELECT rim.erd, rim.offset_spoke_bed, rim.hole_count, hub.center_to_left, hub.center_to_right, hub.flange_pcd_nds, hub.flange_pcd_ds, hub.hole_count, hub.spoke_hole_diameter, wheel.cross_pattern_nds, wheel.cross_pattern_ds, wheel.spoke_length_nds, wheel.spoke_length_ds, CONCAT(rim.manufacturer, ' ', rim.model_name) AS rim, CONCAT(hub.manufacturer, ' ', hub.model_name) AS hub, hub.side
FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;

-- Getting search facets
SELECT ARRAY(SELECT DISTINCT(manufacturer) FROM rim) AS manufacturer_values, ARRAY(SELECT DISTINCT(model_name) FROM rim) AS model_name_values FROM rim LIMIT 1;
