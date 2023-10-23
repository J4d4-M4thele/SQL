--Question 1
WITH temps_collapsed (station_name, max_temperature_group) AS
    (SELECT station_name,
           CASE WHEN max_temp >= 90 THEN '90 or more'
                WHEN max_temp BETWEEN 88 AND 89 THEN '88-89'
                WHEN max_temp BETWEEN 86 AND 87 THEN '86-87'
                WHEN max_temp BETWEEN 84 AND 85 THEN '84-85'
                WHEN max_temp BETWEEN 82 AND 83 THEN '82-83'
                WHEN max_temp BETWEEN 80 AND 81 THEN '80-81'
                ELSE '79 or less'
            END
    FROM temperature_readings)

SELECT station_name, max_temperature_group, count(*)
FROM temps_collapsed
WHERE station_name LIKE 'WAIKIKI%'
GROUP BY station_name, max_temperature_group
ORDER BY max_temperature_group DESC;

'
The temperature falls between 86 and 87 most often.
'

--Question 2
SELECT *
FROM crosstab(
               'SELECT office,
                      flavor,
                      count(*)
               FROM ice_cream_survey
               GROUP BY office, flavor
               ORDER BY office',
)

AS (office varchar(20),
    chocolate bigint,
    strawberry bigint,
    vanilla bigint
);

SELECT *
FROM ice_cream_survey
LIMIT 5;