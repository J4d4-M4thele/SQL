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

--Question 3