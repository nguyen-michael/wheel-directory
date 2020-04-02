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
  offset_spoke_bed REAL DEFAULT 0 CONSTRAINT positive_offset CHECK(offset_spoke_bed > 0),
  inner_width REAL,
  outer_width REAL,
  depth REAL,
  tubeless_compatible BOOLEAN,
  rim_brake BOOLEAN,
  material VARCHAR,
  max_tension REAL,
  max_psi REAL,
  weight REAL,
  rider_weight_limit REAL,
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
  flange_pcd_nds REAL NOT NULL,
  flange_pcd_ds REAL NOT NULL,
  center_to_left REAL NOT NULL,
  center_to_right REAL NOT NULL,
  spacing REAL NOT NULL,
  hole_count SMALLINT NOT NULL CONSTRAINT positive_hole_count_max_200 CHECK(hole_count BETWEEN 0 AND 200),
  spoke_hole_diameter REAL NOT NULL,
  convertible BOOLEAN,
  driver VARCHAR CONSTRAINT driver_type CHECK(driver IN (NULL, 'XD', 'Hyperglide 10speed', 'Hyperglide 11speed', 'Hyperglide 7speed','XDR', 'Microspline', 'Uniglide', 'Helicomatic', 'Freewheel ISO', 'Freewheel M30', 'Fixed', 'Flipflop FW/FX', 'Flipflop FW/FW', 'Flipflop FX/FX', 'Proprietary/Other', 'Campagnolo 8speed', 'Campagnolo 9speed')),
  brake VARCHAR CONSTRAINT brake_type CHECK(brake IN (NULL, '6-Bolt', 'Centerlock', 'Drum', 'Roller', 'Coaster', 'Rohloff', '3-Bolt')),
  boost BOOLEAN CONSTRAINT boost_type CHECK(boost IN (NULL, 'Boost', 'Superboost')),
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT positive_dimensions CHECK(spacing > 0 AND flange_pcd_nds > 0 AND flange_pcd_ds > 0 AND center_to_left > 0 AND center_to_right > 0 AND spoke_hole_diameter > 0),
  CONSTRAINT no_front_driver CHECK((side = 'front' AND driver IS NULL) OR (side = 'rear'))
);