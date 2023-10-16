--Question 1
create or replace function calc_circle_area(radius int)
   returns numeric
   language plpgsql
  as
$circle_area$
declare 
  pi numeric := 3.14159;
begin
  return round((radius * radius * pi), 2);
end;
$circle_area$

SELECT calc_circle_area(100);
'
Parentheses are required to pass values into the function
'
--Question 2
SELECT geo_name,
state_us_abbreviation AS "st",
(CAST (p0020007 AS numeric(8,1)) / p0010001) * 100 AS "pct_indian_alaska_native"
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY' --only New York counties
ORDER BY "pct_indian_alaska_native" DESC;
'
What we learn is that...
'

--Question 3
SELECT geo_name,
state_us_abbreviation AS "st",
sum(p0010001) AS "County Sum",
percentile_cont(.5) --50th percentile
WITHIN GROUP (ORDER BY p0010001) AS "County Median"
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
 AND state_us_abbreviation = 'CA';

'
The highest median county population is in...
'