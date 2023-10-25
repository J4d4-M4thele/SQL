--Question 1
SELECT name10,
       statefp10 AS st,
       round(
             ( ST_Area(geom::geography) / 2589988.110336 )::numeric, 2
            )  AS square_miles
FROM us_counties_2010_shp
GROUP BY statefp10
ORDER BY square_miles DESC;

--Yukon-Koyukuk area is 147 805.08 m^2
'
3 states have an area larger than Yukon-Koyukuk.
'

--Question 2
--subquery doesn't work together, only as separate queries
SELECT  market_name, longitude, latitude
        FROM farmers_markets
        WHERE street ILIKE '9700 Argyle Forest%'
FROM farmers_markets
WHERE (
    SELECT market_name, longitude, latitude 
FROM farmers_markets
WHERE street ILIKE '1701 West Ash%'
);

--Oakleaf Greenmarket POINT(-81.8335000 30.1942000)
--Columbia Farmers Market POINT(-92.3636690 38.9586090)

SELECT ST_Distance(
                   ST_GeogFromText('POINT(-81.8335000 30.1942000)'),
                   ST_GeogFromText('POINT(-92.3636690 38.9586090)')
                   ) / 1609.344 AS oak_to_col;

'
850.5270330308126 miles between Columbia Farmers Market and Oakleaf Greenmarket
'                   

--Question 3
SELECT * FROM farmers_markets
WHERE county IS NULL;
--523 rows

CREATE TABLE no_county AS 
SELECT * FROM farmers_markets 
WHERE county IS NULL;

SELECT nc.market_name,
       usc.namelsad10 AS county
       ST_AsText(ST_Intersection(ST_SetSRID(usc.geom::geography, 4326), nc.geo_point))
FROM us_counties_2010_shp usc JOIN no_county nc
    ON ST_Intersects(ST_SetSRID(usc.geom::geography, 4326), nc.geog_point)
ORDER BY usc.namelsad10;