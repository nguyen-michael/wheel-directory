-- Base data for database testing
-- No double quotes in postgres!
INSERT INTO rim (manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, inner_width, outer_width, material, web_url) VALUES
('Dirt Components', 'XC 29er', 622, 606, 28, 3, 24.1, 28.1, 'Aluminium', 'https://www.dirtcomponents.com/product-p/dbc1-011.htm'),
('Dirt Components', 'RC 29er', 622, 598, 28, 0, 30.1, 34.8, 'Aluminium', 'https://www.dirtcomponents.com/product-p/dbc1-012.htm'),
('Dirt Components', 'Rough Country 27.5+', 584, 550, 32, 0, 36, 42, 'Carbon', 'https://www.dirtcomponents.com/product-p/dbc1-009.htm')
;


INSERT INTO hub (manufacturer, model_name, side, left_flange_pcd, right_flange_pcd, center_to_left, center_to_right, spacing, spoke_hole_diameter, convertible, driver, brake, web_url) VALUES
('Dirt Components', 'MTB V2.1', 'front', 58, 58, 21, 35, 100, 2.6, TRUE, DEFAULT, '6-Bolt', 'https://www.dirtcomponents.com/product-p/dbc5-mtb-standard-front.htm'),
('Dirt Components', 'MTB V2.1', 'rear', 58, 58, 34, 18, 135, 2.6, TRUE, 'HG', '6-Bolt', 'https://www.dirtcomponents.com/product-p/dbc4-mtb-standard-rear.htm'),
('Onyx Racing Products', 'Vesper MTB', 'rear', 42, 50, 36.9, 22.47, 148, 2.6, TRUE, 'MS', '6-Bolt', 'https://www.dirtcomponents.com/product-p/dbc5-mtb-standard-front.htm');

INSERT INTO wheel (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds) VALUES
(1, 1, 3, 3),
(2, 3, 3, 3),
(3, 2, 3, 3);