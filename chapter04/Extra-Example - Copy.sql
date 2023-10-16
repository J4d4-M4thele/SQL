--Question 1(importing)
COPY movie_info (id, movie, actor)
    FROM 'C:\YourDirectory\movie_info.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ':#')
    LIMIT 1;

--Question 2(exporting a query)
COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010
    ORDER BY housing_unit_count_100_percent DESC
    LIMIT 20
     )
TO 'C:\YourDirectory\housing_units.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

--Question 3
'
No, because numerical(3,8) allows for only 3 numbers before
the decimal point and 8 after it when it should be
numeric(5,3).
'