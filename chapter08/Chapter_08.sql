--listing 8.1(creating and filling 2014 table)
CREATE TABLE pls_fy2014_pupld14a (
stabr varchar(2) NOT NULL,
fscskey varchar(6) CONSTRAINT fscskey2014_key PRIMARY KEY,
libid varchar(20) NOT NULL,
libname varchar(100) NOT NULL,
obereg varchar(2) NOT NULL,
rstatus integer NOT NULL,
statstru varchar(2) NOT NULL,
statname varchar(2) NOT NULL,
stataddr varchar(2) NOT NULL,
--snip--
wifisess integer NOT NULL,
yr_sub integer NOT NULL
);

CREATE INDEX libname2014_idx ON pls_fy2014_pupld14a (libname);
CREATE INDEX stabr2014_idx ON pls_fy2014_pupld14a (stabr);
CREATE INDEX city2014_idx ON pls_fy2014_pupld14a (city);
CREATE INDEX visits2014_idx ON pls_fy2014_pupld14a (visits);

COPY pls_fy2014_pupld14a
FROM 'C:\YourDirectory\pls_fy2014_pupld14a.csv'
WITH (FORMAT CSV, HEADER);

--listing 8.2(creating and filling 2009 table)
CREATE TABLE pls_fy2009_pupld09a (
stabr varchar(2) NOT NULL,
fscskey varchar(6) CONSTRAINT fscskey2009_key PRIMARY KEY,
libid varchar(20) NOT NULL,
libname varchar(100) NOT NULL,
address varchar(35) NOT NULL,
city varchar(20) NOT NULL,
zip varchar(5) NOT NULL,
zip4 varchar(4) NOT NULL,
cnty varchar(20) NOT NULL,
--snip--
fipsst varchar(2) NOT NULL,
fipsco varchar(3) NOT NULL
);

CREATE INDEX libname2009_idx ON pls_fy2009_pupld09a (libname);
CREATE INDEX stabr2009_idx ON pls_fy2009_pupld09a (stabr);
CREATE INDEX city2009_idx ON pls_fy2009_pupld09a (city);
CREATE INDEX visits2009_idx ON pls_fy2009_pupld09a (visits);

COPY pls_fy2009_pupld09a
FROM 'C:\YourDirectory\pls_fy2009_pupld09a.csv'
WITH (FORMAT CSV, HEADER);

--listing 8.3(using count() function to count rows)
SELECT count(*)
FROM pls_fy2014_pupld14a;

SELECT count(*)
FROM pls_fy2009_pupld09a;

--listing 8.4(Using count() for the number of values in a column)
SELECT count(salaries)
FROM pls_fy2014_pupld14a;

--listing 8.5