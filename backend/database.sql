CREATE DATABASE wheel_directory;
-- Wheel, a Rim and Hub Combination
-- We can add more features later, like spokes, weight, nipples.
CREATE TABLE IF NOT EXISTS wheel (
  id SERIAL PRIMARY KEY,
  rim_id INT FOREIGN KEY,
  hub_id INT FOREIGN KEY,
  stock_id VARCHAR,
  spoke_length_nds SMALLINT,
  spoke_length_ds SMALLINT,
  cross_pattern_nds SMALLINT,
  cross_pattern_ds SMALLINT web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ
);
-- Rim
-- Can add features like Weights later
CREATE TABLE IF NOT EXISTS rim (
  id SERIAL PRIMARY KEY,
  erd SMALLINT,
  offset SMALLINT,
  inner_width SMALLINT,
  outer_width SMALLINT,
  material VARCHAR,
  manufacturer VARCHAR,
  model_name VARCHAR,
  hole_count SMALLINT,
  notes VARCHAR,
  web_url VARCHAR,
  iso_diameter SMALLINT,
  date_created TIMESTAMPTZ
);
-- Hub
CREATE TABLE IF NOT EXISTS hub (
  id SERIAL PRIMARY KEY,
  spacing SMALLINT,
  convertible BOOLEAN,
  driver VARCHAR,
  brake VARCHAR,
  left_flange_pcd SMALLINT,
  right_flange_pcd SMALLINT,
  center_to_left SMALLINT,
  center_to_right SMALLINT,
  web_url VARCHAR,
  notes VARCHAR,
  manufacturer VARCHAR,
  model_name VARCHAR,
  date_created TIMESTAMPTZ
)