--Question 1
SELECT *
FROM us_counties_2000 JOIN us_counties_2010
ON us_counties_2000.geo_name = us_counties_2010.geo_name
WHERE us_counties_2000.geo_name IS NULL;

--Question 2
SELECT c2010.geo_name,
c2010.state_us_abbreviation AS state,
c2010.p0010001 AS pop_2010,--uses total values
c2000.p0010001 AS pop_2000,
c2010.p0010001 - c2000.p0010001 AS raw_change,
round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)--percentage change
/ c2000.p0010001 * 100, 1 ) AS pct_change,
(
percentile_cont(.5)
WITHIN GROUP (ORDER BY p0010001)
) AS "median"
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON us_counties_2000.geo_name = us_counties_2010.geo_name;

--Question 3
