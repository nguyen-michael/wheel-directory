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
  CONSTRAINT unique_wheel UNIQUE (rim_id, hub_id, cross_pattern_nds, cross_pattern_ds)
);
-- Rim
-- Can add features like Weights later
CREATE TABLE IF NOT EXISTS rim (
  id SERIAL PRIMARY KEY,
  manufacturer VARCHAR NOT NULL,
  model_name VARCHAR NOT NULL,
  iso_diameter SMALLINT NOT NULL,
  erd REAL NOT NULL,
  hole_count SMALLINT NOT NULL,
  offset_spoke_bed REAL NOT NULL DEFAULT 0,
  tire_type VARCHAR NOT NULL,
  rim_brake BOOLEAN NOT NULL,
  inner_width REAL,
  outer_width REAL,
  depth REAL,
  material VARCHAR,
  max_tension REAL,
  max_psi REAL,
  weight REAL,
  rider_weight_limit REAL,
  eyelet VARCHAR,
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_rim UNIQUE (manufacturer, model_name, iso_diameter, erd, hole_count, offset_spoke_bed, tire_type, rim_brake),
  CONSTRAINT possible_iso_diameters CHECK(iso_diameter IN(137, 152, 203, 254, 288, 305, 317, 337, 340, 349, 355, 369, 390, 406, 419, 428, 438, 440, 451, 457, 484, 489, 490, 501, 507, 520, 540, 541, 547, 559, 571, 583, 584, 590, 597, 599, 609, 622, 630, 635, 686, 787)),
  CONSTRAINT possible_hole_counts CHECK(hole_count IN (8, 12, 16, 18, 20, 24, 28, 32, 36, 40, 48, 72, 144)),
  CONSTRAINT non_negative_offset CHECK(offset_spoke_bed >= 0),
  CONSTRAINT positive_erd_less_than_iso_diameter CHECK(erd > 0 AND erd <= iso_diameter),
  CONSTRAINT tire_types CHECK(tire_type IN ('Tubeless', 'Clincher', 'Tubular'))
);
-- Hub
CREATE TABLE IF NOT EXISTS hub (
  id SERIAL PRIMARY KEY,
  manufacturer VARCHAR NOT NULL,
  model_name VARCHAR NOT NULL,
  side VARCHAR NOT NULL,
  flange_pcd_nds REAL NOT NULL,
  flange_pcd_ds REAL NOT NULL,
  center_to_left REAL NOT NULL,
  center_to_right REAL NOT NULL,
  spacing REAL NOT NULL,
  hole_count SMALLINT NOT NULL,
  spoke_hole_diameter REAL NOT NULL DEFAULT 2.6,
  spoke_interface VARCHAR NOT NULL DEFAULT 'J-Bend',
  driver VARCHAR NOT NULL,
  brake VARCHAR NOT NULL,
  boost VARCHAR NOT NULL,
  convertible BOOLEAN,
  dynamo BOOLEAN,
  weight REAL,
  web_url VARCHAR,
  notes VARCHAR,
  date_created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT positive_dimensions CHECK(spacing > 0 AND flange_pcd_nds > 0 AND flange_pcd_ds > 0 AND center_to_left > 0 AND center_to_right > 0 AND spoke_hole_diameter > 0),
  CONSTRAINT no_front_driver CHECK((side = 'front' AND driver = 'No Driver (front)') OR (side = 'rear' AND driver != 'No Driver (front)')),
  CONSTRAINT unique_hub UNIQUE (manufacturer, model_name, side, spacing, hole_count, spoke_interface, driver, brake, boost),
  CONSTRAINT front_or_rear CHECK(side IN ('front', 'rear')),
  CONSTRAINT possible_hole_counts CHECK(hole_count IN (8, 12, 16, 18, 20, 24, 28, 32, 36, 40, 48, 72, 144)),
  CONSTRAINT driver_type CHECK(driver IN ('No Driver (front)', 'XD', 'Hyperglide 10speed', 'Hyperglide 11speed', 'Hyperglide 7speed', 'Hyperglide SS', 'XDR', 'Microspline', 'Uniglide', 'Helicomatic', 'Freewheel ISO', 'Freewheel M30', 'Fixed', 'Flipflop FW/FX', 'Flipflop FW/FW', 'Flipflop FX/FX', 'Proprietary/Other', 'Campagnolo 8speed', 'Campagnolo 9speed')),
  CONSTRAINT brake_type CHECK(brake IN ('Rim', '6-Bolt', 'Centerlock', 'Drum', 'Roller', 'Coaster', 'Rohloff', '3-Bolt')),
  CONSTRAINT boost_type CHECK(boost IN ('Non-boost', 'Boost', 'Superboost')),
  CONSTRAINT possible_spoke_interfaces CHECK(spoke_interface IN ('J-Bend', 'Straight Pull', 'Proprietary/Other'))
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