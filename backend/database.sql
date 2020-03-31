CREATE DATABASE wheel_directory;
-- Wheel, a Rim and Hub Combination
-- We can add more features later, like spokes, weight, nipples.
CREATE TABLE IF NOT EXISTS wheel (
  id SERIAL PRIMARY KEY,
  rim_id INT REFERENCES rim(id),
  hub_id INT REFERENCES hub(id),
  stock_id VARCHAR,
  spoke_length_nds REAL,
  spoke_length_ds REAL,
  cross_pattern_nds REAL,
  cross_pattern_ds REAL,
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ
);
-- Rim
-- Can add features like Weights later
CREATE TABLE IF NOT EXISTS rim (
  id SERIAL PRIMARY KEY,
  erd REAL,
  offset REAL,
  inner_width REAL,
  outer_width REAL,
  material VARCHAR,
  manufacturer VARCHAR,
  model_name VARCHAR,
  hole_count REAL,
  notes VARCHAR,
  web_url VARCHAR,
  iso_diameter REAL,
  date_created TIMESTAMPTZ
);
-- Hub
CREATE TABLE IF NOT EXISTS hub (
  id SERIAL PRIMARY KEY,
  spacing REAL,
  convertible BOOLEAN,
  driver VARCHAR,
  brake VARCHAR,
  left_flange_pcd REAL,
  right_flange_pcd REAL,
  center_to_left REAL,
  center_to_right REAL,
  web_url VARCHAR,
  notes VARCHAR,
  manufacturer VARCHAR,
  model_name VARCHAR,
  spoke_hole_diameter REAL,
  date_created TIMESTAMPTZ
);