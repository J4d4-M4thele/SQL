--Question 1
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN meat_processing boolean;
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN poultry_processing boolean;

--Question 2
UPDATE meat_poultry_egg_inspect inspect
SET meat_processing = TRUE
--SELECT * FROM meat_poultry_egg_inspect inspect
WHERE activities LIKE '%Meat Processing%';

UPDATE meat_poultry_egg_inspect inspect
SET meat_processing = TRUE
--SELECT * FROM meat_poultry_egg_inspect inspect
WHERE activities LIKE '%Poultry Processing%';

--Question 3
--no. of co.s that process meat
SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = true
AND poultry_processing IS NULL;

--no. of co.s that process poultry
SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE poultry_processing = true
AND meat_processing IS NULL;

--no. of co.s that process poultry
SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = true
AND poultry_processing = true;