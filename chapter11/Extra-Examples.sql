--Question 1
SELECT vendor_id,
    tpep_pickup_datetime, 
    tpep_dropoff_datetime,
    tpep_pickup_datetime - tpep_dropoff_datetime AS segment_time
FROM nyc_yellow_taxi_trips_2016_06_01
ORDER BY (segment_time) DESC;

'
There are negative intervals where the dropoff time
is before the pickup time. Meaning the trip ended
before it began.
'
--Question 2
INSERT INTO time_zone_test VALUES ('2100-01-01 00:00-04:00:00');

SELECT test_date AT TIME ZONE 'Europe/London' AS London,
test_date AT TIME ZONE 'Africa/Johannesburg' AS Johannesburg,
test_date AT TIME ZONE 'Europe/Moscow' AS Moscow,
test_date AT TIME ZONE 'Australia/Melbourne' AS Melbourne
FROM time_zone_test
WHERE test_date = '2100-01-01 00:00 EDT';

--Question 3
CREATE TABLE nyc_yellow_taxi_trips_2016_06_01_temp AS SELECT * FROM nyc_yellow_taxi_trips_2016_06_01;

ALTER TABLE nyc_yellow_taxi_trips_2016_06_01_temp ADD COLUMN segment_time timestamp with time zone NOT NULL;

UPDATE nyc_yellow_taxi_trips_2016_06_01_temp temp
SET segment_time =  tpep_dropoff_datetime - tpep_pickup_datetime;

SELECT 
round(
        regr_r2(segment_time, total_amount)::numeric, 2
        ) AS r_squared,
round(
    regr_slope(segment_time, total_amount)::numeric, 2
    ) AS slope
FROM nyc_yellow_taxi_trips_2016_06_01_temp
WHERE segment_time <= '3 hours'
AND segment_time > '0 minutes';

SELECT 
round(
        regr_r2(trip_distance, total_amount)::numeric, 2
        ) AS r_squared,
round(
    regr_slope(trip_distance, total_amount)::numeric, 2
    ) AS slope
FROM nyc_yellow_taxi_trips_2016_06_01_temp;