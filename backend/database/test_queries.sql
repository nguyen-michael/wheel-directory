-- Base data for database testing
-- No double quotes in postgres!
-- ALL fields
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NoTubes', 'Crest MK3', 559, 542, 28, 0, 'Tubeless', FALSE, 23.0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3'),
('Dirt Components', 'XC 29er Alloy', 622, 606, 28, 3,'Tubeless', FALSE, 24.1, 28.1, 16.4, 'Aluminium', 1200, 80, 379, 240, NULL, 'https://www.dirtcomponents.com/product-p/dbc1-011.htm', NULL),
('Dirt Components', 'Rough Country 27.5+', 584, 550, 32, 0, 'Tubeless', FALSE, 36, 42, 26.5, 'Carbon', 1200, 35, 516, 280, NULL, 'https://www.dirtcomponents.com/product-p/dbc1-009.htm', NULL),
('Dirt Components', 'Rough Country 29er Alloy', 622, 598, 28, 0, 'Tubeless', FALSE, 30.1, 34.8, 21.7, 'Aluminium',1200, 45, 496, 260, NULL, 'https://www.dirtcomponents.com/product-p/dbc1-012.htm', NULL)
;

INSERT INTO hub
(manufacturer, model_name, side, flange_pcd_nds, flange_pcd_ds, center_to_left, center_to_right, over_locknut_distance, hole_count, spoke_hole_diameter, spoke_interface, driver, brake, boost, axle_type, convertible, points_of_engagement, dynamo, weight, web_url, notes)
VALUES
('Industry Nine', 'Hydra Classic', 'Front', 47, 42, 29, 42, 110, 32, 2.6, 'J-Bend', 'No Driver (Front)', 'Centerlock', 'Boost', 'Thru-Axle 15mm', TRUE, NULL, FALSE, 137, 'https://industrynine.com/hubs/mountain/hydra-classic-boost-cl-front/', NULL),
('Dirt Components', 'MTB V2.1', 'Front', 58, 58, 21, 35, 100, 28, 2.6, 'J-Bend', 'No Driver (Front)', '6-Bolt', 'Non-Boost', 'Quick Release', TRUE, NULL, FALSE, NULL, 'https://www.dirtcomponents.com/product-p/dbc5-mtb-standard-front.htm', NULL),
('Dirt Components', 'MTB V2.1', 'Rear', 58, 58, 34, 18, 135, 28, 2.6, 'J-Bend', 'Hyperglide 11 Speed', '6-Bolt', 'Non-Boost', 'Quick Release', TRUE, 36, FALSE, 453, 'https://www.dirtcomponents.com/product-p/dbc4-mtb-standard-rear.htm', NULL),
('Onyx Racing Products', 'Vesper MTB', 'Rear', 42, 50, 36.9, 22.47, 148, 32, 2.6, 'J-Bend', 'Microspline', '6-Bolt', 'Boost', 'Thru-Axle 12mm', TRUE, 'Infinity', FALSE, 413.90, 'https://onyxrp.com/store/mtb-hubs/onyx-vesper-mtb-boost-iso-ms-148-12-thru-bolt-rear-hub/', NULL)
;

INSERT INTO wheel
(rim_id, hub_id, cross_pattern_nds, cross_pattern_ds, spoke_length_nds, spoke_length_ds, stock_id, web_url, notes)
VALUES
(3, 9, 3, 3, NULL, NULL, NULL, NULL, NULL),
(3, 6, 3, 3, NULL, NULL, NULL, NULL, NULL),
(2, 8, 3, 3, NULL, NULL, NULL, NULL, NULL)
;

-- Create some failing queries to test.

-- Wheel
-- Nulls
INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds) VALUES
(null, 8, 3, 3); 
INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds) VALUES
(1, 8, 3, NULL);

-- Unique Wheel
INSERT INTO wheel
(rim_id, hub_id, cross_pattern_nds, cross_pattern_ds, spoke_length_nds, spoke_length_ds, stock_id, web_url, notes)
VALUES
(3, 9, 3, 3, NULL, NULL, NULL, NULL, NULL);

-- Wheel Crossing
INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds) VALUES
(1, 8, 7, 3); 

-- Positive spoke lengths
INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds, spoke_length_nds, spoke_length_ds) VALUES
(1, 8, 3, 3, -234, 234); 

-- Rim
-- ISO Diameter
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NeoTubes', 'Crest MK3', 999, 542, 28, 0, 'Tubeless', FALSE, 23.0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3');

-- Hole Counts
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NeoTubes', 'Crest MK3', 559, 542, 68, 0, 'Tubeless', FALSE, 23.0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3');
-- Positive Offset
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NeoTubes', 'Crest MK3', 559, 542, 28, -3, 'Tubeless', FALSE, 23.0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3');

-- Impossible ERD
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NeoTubes', 'Crest MK3', 559, 2331, 28, 3, 'Tubeless', FALSE, 23.0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3');

-- Tire Type
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NeoTubes', 'Crest MK3', 559, 542, 28, 3, 'Clinher', FALSE, 23.0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3');

-- Positive Qualities
INSERT INTO rim 
(manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake, inner_width, outer_width, depth, material, max_spoke_tension, max_tire_pressure, weight, max_rider_weight, eyelet, web_url, notes)
VALUES
('Stan''s NeoTubes', 'Crest MK3', 559, 542, 28, 3, 'Tubeless', FALSE, 0, 26.3, 15.8, 'Aluminium', 930, 55, 326, NULL, NULL, 'https://www.notubes.com/crest-mk3-rims', 'Max pressure for 38c tire, 40psi for 2.0, 38psi for 2.3');


-- Hub
-- Unique Hub
INSERT INTO hub
(manufacturer, model_name, side, flange_pcd_nds, flange_pcd_ds, center_to_left, center_to_right, over_locknut_distance, hole_count, spoke_hole_diameter, spoke_interface, driver, brake, boost, axle_type, convertible, points_of_engagement, dynamo, weight, web_url, notes)
VALUES
('Industry Nine', 'Hydra Classic', 'Front', 47, 42, 29, 42, 110, 32, 2.6, 'J-Bend', 'No Driver (Front)', 'Centerlock', 'Boost', 'Thru-Axle 15mm', TRUE, NULL, FALSE, 137, 'https://industrynine.com/hubs/mountain/hydra-classic-boost-cl-front/', NULL);

-- Front Driver

INSERT INTO hub
(manufacturer, model_name, side, flange_pcd_nds, flange_pcd_ds, center_to_left, center_to_right, over_locknut_distance, hole_count, spoke_hole_diameter, spoke_interface, driver, brake, boost, axle_type, convertible, points_of_engagement, dynamo, weight, web_url, notes)
VALUES
('Industry Eight', 'Hydra Classic', 'Front', 47, 42, 29, 42, 110, 32, 2.6, 'J-Bend', 'XDR', 'Centerlock', 'Boost', 'Thru-Axle 15mm', TRUE, NULL, FALSE, 137, 'https://industrynine.com/hubs/mountain/hydra-classic-boost-cl-front/', NULL);

-- Front points_of_engagement
INSERT INTO hub
(manufacturer, model_name, side, flange_pcd_nds, flange_pcd_ds, center_to_left, center_to_right, over_locknut_distance, hole_count, spoke_hole_diameter, spoke_interface, driver, brake, boost, axle_type, convertible, points_of_engagement, dynamo, weight, web_url, notes)
VALUES
('Industry Eight', 'Hydra Classic', 'Front', 47, 42, 29, 42, 110, 32, 2.6, 'J-Bend', 'No Driver (Front)', 'Centerlock', 'Boost', 'Thru-Axle 15mm', TRUE, 10, FALSE, 137, 'https://industrynine.com/hubs/mountain/hydra-classic-boost-cl-front/', NULL);

-- Update Check Triggers
-- Hub - Rim Hole disparity
INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds)
VALUES (1, 6, 3, 3);

-- Update Rim/hub hole when already in wheel
UPDATE rim 
SET hole_count = 28
WHERE rim.id = 3;

-- Should update: Update rim / hub not in wheel
UPDATE rim
SET hole_count = 32
WHERE rim.id = 1;

