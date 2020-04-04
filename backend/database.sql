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
  date_updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT cross_between_0_and_5 CHECK(cross_pattern_nds BETWEEN 0 AND 5 AND cross_pattern_ds BETWEEN 0 AND 5),
  CONSTRAINT positive_lengths CHECK(spoke_length_nds > 0 AND spoke_length_ds > 0),
  CONSTRAINT unique_wheel UNIQUE (rim_id, hub_id, cross_pattern_ds, cross_pattern_nds)
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
  offset_spoke_bed REAL DEFAULT 0 CONSTRAINT non_negative_offset CHECK(offset_spoke_bed >= 0),
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
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_rim UNIQUE (manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tubeless_compatible, rim_brake, material)
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
  boost VARCHAR CONSTRAINT boost_type CHECK(boost IN (NULL, 'Boost', 'Superboost')),
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT positive_dimensions CHECK(spacing > 0 AND flange_pcd_nds > 0 AND flange_pcd_ds > 0 AND center_to_left > 0 AND center_to_right > 0 AND spoke_hole_diameter > 0),
  CONSTRAINT no_front_driver CHECK((side = 'front' AND driver IS NULL) OR (side = 'rear')),
  CONSTRAINT unique_hub UNIQUE (manufacturer, model_name, side, spacing, hole_count, driver, brake, boost)
);

-- Function to prevent wheels from being made with hole mismatched rim and hubs
CREATE FUNCTION check_wheel_holes()
  RETURNS trigger AS $check_wheel_holes$
    DECLARE
      hub_holes SMALLINT;
      rim_holes SMALLINT;
    BEGIN
      SELECT hub.hole_count 
        INTO hub_holes 
        FROM hub
        WHERE NEW.hub_id = hub.id;

      SELECT rim.hole_count 
        INTO rim_holes 
        FROM rim
        WHERE NEW.rim_id = rim.id;
      
      IF hub_holes != rim_holes THEN
        RAISE EXCEPTION 'rim and hub must have equal hole counts. % and % respectively', rim_holes, hub_holes;
      END IF;

      RETURN NEW;
    END; 
$check_wheel_holes$ LANGUAGE plpgsql;

-- Function to add updated timestamp on operation.
CREATE FUNCTION update_date_updated()
  RETURNS trigger AS $update_date_updated$
    BEGIN 
      NEW.date_updated = NOW();
      RETURN NEW;
    END;
$update_date_updated$ LANGUAGE plpgsql;

-- Functions to check if rim or hub is referenced in a wheel row. Prevent update of hole_count if so.
-- if Hole count is being changed AND it's referenced in a wheel, raise exception otherwise carry on.
CREATE FUNCTION prevent_hole_count_update_rim_if_referenced()
  RETURNS trigger AS $prevent_hole_count_update_rim_if_referenced$
    BEGIN
     
      IF EXISTS (SELECT wheel.id FROM wheel WHERE OLD.id = wheel.rim_id) AND NEW.hole_count != OLD.hole_count THEN
        RAISE EXCEPTION 'rim currently used in wheel, cannot change hole count.';
      END IF;

      RETURN NEW;
    END;
$prevent_hole_count_update_rim_if_referenced$ LANGUAGE plpgsql;

CREATE FUNCTION prevent_hole_count_update_hub_if_referenced()
  RETURNS trigger AS $prevent_hole_count_update_hub_if_referenced$
    BEGIN
      IF (EXISTS (SELECT wheel.id FROM wheel WHERE OLD.id = wheel.hub_id) AND NEW.hole_count != OLD.hole_count) THEN
        RAISE EXCEPTION 'hub currently used in wheel, cannot change hole count.';
      END IF;

      RETURN NEW;
    END;
$prevent_hole_count_update_hub_if_referenced$ LANGUAGE plpgsql;

-- Bind trigger to table
CREATE TRIGGER wheel_holes_must_match
BEFORE INSERT OR UPDATE ON wheel
  FOR EACH ROW EXECUTE PROCEDURE check_wheel_holes();

CREATE TRIGGER rim_hole_count_cannot_update_if_in_wheel
BEFORE UPDATE ON rim
  FOR EACH ROW EXECUTE PROCEDURE prevent_hole_count_update_rim_if_referenced();

CREATE TRIGGER hub_hole_count_cannot_update_if_in_wheel
BEFORE UPDATE ON hub
  FOR EACH ROW EXECUTE PROCEDURE prevent_hole_count_update_hub_if_referenced();

CREATE TRIGGER update_date_updated
BEFORE INSERT OR UPDATE ON wheel
  FOR EACH ROW EXECUTE PROCEDURE update_date_updated();

CREATE TRIGGER update_date_updated
BEFORE INSERT OR UPDATE ON rim
  FOR EACH ROW EXECUTE PROCEDURE update_date_updated();

CREATE TRIGGER update_date_updated
BEFORE INSERT OR UPDATE ON hub
  FOR EACH ROW EXECUTE PROCEDURE update_date_updated();