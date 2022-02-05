-- This is a Shortcut file to update and cleanse based on additional analysis done in the SunshineList.sql file

--Update Sunshine table with gender
UPDATE sunshine_table * AS s
SET gender=f.gender
FROM sunshine_unique_first_name as f
WHERE f.first_name=s.first_name;

--Create Male & Female counter column -- to assist in chart/parameter creation in tableau
ALTER TABLE sunshine_table
ADD Male_Count INT,
ADD Female_Count INT;

--Update Male_Count
UPDATE sunshine_table
SET
Male_Count = CASE WHEN gender='M' THEN 1 ELSE 0 END;

--Update Female_Count
UPDATE sunshine_table
SET
Female_Count = CASE WHEN gender='F' THEN 1 ELSE 0 END;

--Analysis uncovered additional records requiring cleansing

--Delete all records where no gender was identified; ML
DELETE FROM sunshine_table
WHERE gender is null;


--Where no city , update Hydro One with a city location to head office of Toronto
UPDATE sunshine_table
SET city='Toronto'
WHERE city LIKE '%Not Identified%' AND employer LIKE '%Hydro One%';


--Where no city, update Ontario Power Generation to head office of Clarington
UPDATE sunshine_table
SET city='Clarington'
WHERE city LIKE '%Not Identified%' AND employer LIKE '%Ontario Power Generation%';


--Where no city, update Ontario Provincial Police to head office of Orillia
UPDATE sunshine_table
SET city='Orillia'
WHERE city LIKE '%Not Identified%' AND employer LIKE '%Ontario Provincial Police%';



--Correct 2006 salary for Yelle-Weatherall_Joanne, Director Operations, Elisabeth-Bruyère Research Institute working for SCO Health Service
--UPDATE salary_paid
UPDATE sunshine_table
SET salary_paid='127455'
WHERE last_first_name LIKE '%Yelle-Weatherall_Joanne%' AND year=2006;

--UPDATE total compensation
UPDATE sunshine_table
SET total_compensation= salary_paid + taxable_benefits
WHERE last_first_name LIKE '%Yelle-Weatherall_Joanne%' AND year=2006;

--Correct 2006 salary for Harris_Stephen, Staff Inspector, for City of Toronto
--UPDATE salary_paid
UPDATE sunshine_table
SET salary_paid='128059'
WHERE last_first_name LIKE '%Harris_Stephen%' AND year=2006;

--UPDATE total compensation
UPDATE sunshine_table
SET total_compensation= salary_paid + taxable_benefits
WHERE last_first_name LIKE '%Harris_Stephen%' AND year=2006;



--Update Column for Salary Bins based on salary_paid using python Analysis file for bin sizes
--Bins <105K, 105K-110K, 110K-130K, 130K-200K, 200K-500K, 500K-1M, >1M
UPDATE sunshine_table
SET salary_bin ='$110,000 to $129,999'
WHERE salary_paid<130000;
UPDATE sunshine_table
SET salary_bin='$105,000 to $109,999'
WHERE salary_paid<110000;
UPDATE sunshine_table
SET salary_bin='$100,000 to $104,999'
WHERE salary_paid<105000;
UPDATE sunshine_table
SET salary_bin='$130,000 to $199,999'
WHERE salary_paid >= 130000;
UPDATE sunshine_table
SET salary_bin='$200,000 to $499,999'
WHERE salary_paid >=200000;
UPDATE sunshine_table
SET salary_bin='$500,000 to $999,999'
WHERE salary_paid >=500000;
UPDATE sunshine_table
SET salary_bin='>$1Million'
WHERE salary_paid >=1000000;