-- A sample of rims and hubs to get the Database started
-- Formed into wheels

INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Alex', 'Adventurer 2', 622, 606, 32, 0, 'Tubeless', TRUE, 21.0, 26.0, 17.8, 'Aluminium', NULL, NULL, 556, NULL, 'Single', 'https://www.notubes.com/crest-mk3-rims', NULL);



INSERT INTO hub
(manufacturer, model_name, side, flange_pcd_nds, flange_pcd_ds, center_to_left, center_to_right, over_locknut_distance, hole_count, spoke_hole_diameter, spoke_interface, driver, brake, boost, axle_type, convertible, points_of_engagement, dynamo, weight, web_url, notes)
VALUES
('Industry Nine', 'Hydra Classic', 'Rear', 58, 60, 38, 39, 148, 28, 2.6, 'J-Bend', 'Hyperglide Singlespeed', '6-Bolt', 'Boost', 'Thru-Axle 12mm', FALSE, 690, FALSE, 275, 'https://industrynine.com/hubs/mountain/hydra-classic-single-speed-boost-6b-rear/', NULL);

INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds)
VALUES (13, 6, 3, 3);