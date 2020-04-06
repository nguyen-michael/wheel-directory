-- Get all wheels and join all hub and rim data
SELECT * FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;

-- Get relevant wheel building data for all wheels
SELECT rim.erd, rim.offset_spoke_bed, rim.hole_count, hub.center_to_left, hub.center_to_right, hub.flange_pcd_nds, hub.flange_pcd_ds, hub.hole_count, hub.spoke_hole_diameter, wheel.cross_pattern_nds, wheel.cross_pattern_ds
FROM wheel
INNER JOIN rim ON wheel.rim_id = rim.id
INNER JOIN hub ON wheel.hub_id = hub.id;