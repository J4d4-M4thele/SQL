--Question 1
SELECT vendor_id,
    tpep_pickup_datetime, 
    tpep_dropoff_datetime
   arrival - departure AS segment_time 
  FROM nyc_yellow_taxi_trips_2016_06_01
  ORDER BY segment_time
--Question 2

--Question 3