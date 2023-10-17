--Question 1
SELECT pls14.stabr, 
sum(pls14.gpterms) AS num_comps_2014,
sum(pls09.gpterms) AS num_comps_2009,
round( sum(pls14.gpterms) - sum(pls09.gpterms) /
sum(pls09.gpterms) * 100, 2 ) AS pct_change_comp,
sum(pls14.pitusr) AS use_per_year_2014,
sum(pls09.pitusr) AS use_per_year_2009,
sum(pls14.pitusr) - sum(pls09.pitusr)  AS raw_change_usage
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.gpterms >= 0 AND pls09.gpterms >= 0
GROUP BY pls14.stabr
ORDER BY pct_change_comp DESC;
'
Use of computers in libraries have increased per state over the last 5 years, however
the amount of people using the computers has decreased.
'

--Question 2
CREATE TABLE region (
  stabr varchar(2) NOT NULL,
  obereg integer CONSTRAINT code_key PRIMARY KEY
);

COPY (
  SELECT pls14.stabr
  FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
  ON pls14.obereg = pls09.obereg
  GROUP BY pls14.stabr, pls14.obereg
  ORDER BY pls14.stabr ASC, pls14.obereg ASC
)
TO 'C:\YourDirectory\region_2014.txt'
WITH (FORMAT CSV, HEADER);

--Question 3
'
A cross join as it shows every possible combination
of rows, matching or not
'
SELECT * 
FROM pls_fy2014_pupld14a pls14 CROSS JOIN pls_fy2009_pupld09a pls09
WHERE pls14.fscskey IS NULL
 OR pls09.fscskey IS NULL;