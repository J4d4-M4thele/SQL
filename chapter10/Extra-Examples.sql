--Question 1
SELECT corr(median_hh_income, pct_bachelors_higher)
    AS bachelors_income_r
FROM acs_2011_2015_stats;
'r=0.68'

SELECT corr(median_hh_income, pct_masters_higher)
    AS masters_income_r
FROM acs_2011_2015_stats;
'r=0.57'
'
The masters correlation is 0.57 showing a fairly weak
correlation between the median income and the masters
degree holders.
'
--Question 2
--violent crime
SELECT
    city,
    st,
    population,
    violent_crime,
    --rate = (crime/population) * 1000
    round(
        (violent_crime::numeric / population) * 1000, 1
        ) AS vc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (violent_crime::numeric / population) DESC;

--motor vehicle theft
SELECT
    city,
    st,
    population,
    motor_vehicle_theft,
    round(
        (motor_vehicle_theft::numeric / population) * 1000, 1
        ) AS mvt_per_1000    
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (motor_vehicle_theft::numeric / population) DESC;

--Question 3
SELECT pls14.stabr,
city,
libname,
visits,
sum(pls14.visits) AS visits_2014,
round(
    (visits::numeric/ sum(visits)) * 1000, 1
) AS visits_per_1000
FROM pls_fy2014_pupld14a
WHERE visits >= 250000
GROUP BY pls14.stabr
ORDER BY (visits::numeric/ sum(visits)) DESC;

