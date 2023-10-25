--Question 1
CREATE OR REPLACE VIEW taxi_per_hour AS
SELECT
    date_part('hour', tpep_pickup_datetime) AS trip_hour,
    count(*) --representative function
FROM nyc_yellow_taxi_trips_2016_06_01
GROUP BY trip_hour 
ORDER BY trip_hour;

--Question 2
CREATE OR REPLACE FUNCTION
rates_per_thousand(part numeric,
               total numeric,
               decimal_places integer DEFAULT 1)
RETURNS numeric AS
'SELECT round(
        (part/total) * 100, decimal_places
);'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

--Question 3
CREATE TABLE inspections AS
SELECT * FROM meat_poultry_egg_inspect

CREATE OR REPLACE FUNCTION add_inspection_date()
    RETURNS trigger AS
$$
BEGIN
    IF OLD.inspection_date IS NULL THEN
    INSERT INTO inspections (
        OLD.inspection_date
        NEW.inspection_date
        )
    VALUES
        (   inspection_date
            now() + '6 months'::interval
            );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inspection_update
  AFTER UPDATE
  ON inspections
  FOR NEW ROW
  EXECUTE PROCEDURE add_inspection_date();