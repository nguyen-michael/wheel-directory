CREATE DATABASE wheel_directory;
-- Wheel, a Rim and Hub Combination
-- We can add more features later, like spokes, weight, nipples.
CREATE TABLE IF NOT EXISTS wheel (
  id SERIAL PRIMARY KEY,
  rim_id INT REFERENCES rim(id),
  hub_id INT REFERENCES hub(id),
  cross_pattern_nds SMALLINT NOT NULL,
  cross_pattern_ds SMALLINT NOT NULL,
  spoke_length_nds REAL,
  spoke_length_ds REAL,
  stock_id VARCHAR,
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT cross_between_0_and_5 CHECK(cross_pattern_nds BETWEEN 0 AND 5 AND cross_pattern_ds BETWEEN 0 AND 5),
  CONSTRAINT positive_lengths CHECK(spoke_length_nds > 0 AND spoke_length_ds > 0)
);
-- Rim
-- Can add features like Weights later
CREATE TABLE IF NOT EXISTS rim (
  id SERIAL PRIMARY KEY,
  manufacturer VARCHAR NOT NULL,
  model_name VARCHAR NOT NULL,
  iso_diameter SMALLINT NOT NULL CONSTRAINT positive_iso_diameter_max_1000 CHECK(iso_diameter BETWEEN 0 AND 1000),
  erd REAL NOT NULL CONSTRAINT positive_erd CHECK(erd > 0),
  hole_count SMALLINT NOT NULL CONSTRAINT positive_hole_count_max_200 CHECK(hole_count BETWEEN 0 AND 200),
  offset_spoke_bed REAL DEFAULT 0,
  inner_width REAL,
  outer_width REAL,
  material VARCHAR,
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
-- Hub
CREATE TABLE IF NOT EXISTS hub (
  id SERIAL PRIMARY KEY,
  manufacturer VARCHAR NOT NULL,
  model_name VARCHAR NOT NULL,
  side VARCHAR NOT NULL CONSTRAINT front_or_rear CHECK(side IN ('front', 'rear')),
  left_flange_pcd REAL NOT NULL,
  right_flange_pcd REAL NOT NULL,
  center_to_left REAL NOT NULL,
  center_to_right REAL NOT NULL,
  spacing REAL NOT NULL,
  spoke_hole_diameter REAL NOT NULL,
  convertible BOOLEAN,
  driver VARCHAR,
  brake VARCHAR,
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT positive_dimensions CHECK(spacing > 0 AND left_flange_pcd > 0 AND right_flange_pcd > 0 AND center_to_left > 0 AND center_to_right > 0 AND spoke_hole_diameter > 0)
);