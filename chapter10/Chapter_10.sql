--listing 10.1
CREATE TABLE acs_2011_2015_stats (
geoid varchar(14) CONSTRAINT geoid_key PRIMARY KEY,
county varchar(50) NOT NULL,
st varchar(20) NOT NULL,
pct_travel_60_min numeric(5,3) NOT NULL,
pct_bachelors_higher numeric(5,3) NOT NULL,
pct_masters_higher numeric(5,3) NOT NULL,
median_hh_income integer,
CHECK (pct_masters_higher <= pct_bachelors_higher)
);

COPY acs_2011_2015_stats
FROM 'C:\YourDirectory\acs_2011_2015_stats.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

SELECT * FROM acs_2011_2015_stats;