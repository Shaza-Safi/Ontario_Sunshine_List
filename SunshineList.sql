--Delete tables if duplicate/for testing purposes
-- DELETE FROM sunshine_unique_first_name;
-- DELETE FROM sunshine_table;
-- DELETE FROM ontario_wage_table;
-- DELETE FROM cpi_table;

-- *************Create Sunshine Unique First Name table created via sqlalchemy from the Machine Learning Model*****************

-- **************Sunshine table created via sqlalchemy********************************

-- ******** Ontario Wage table for FT employees first data set created via sqlalchemy*******

-- *********Create CPI table for All product categories for Ontario created via sqlalchemy


--Review that tables were created and data appended
SELECT * FROM sunshine_unique_first_name;
SELECT * FROM ml_first_names;
SELECT * FROM sunshine_table;
SELECT * FROM ontario_wage_table;
SELECT * FROM cpi_table;
SELECT * FROM city_table;


--Check data imported on stats canada
SELECT year
FROM ontario_wage_table
GROUP BY year
ORDER BY year ASC

SELECT year
FROM cpi_table
GROUP BY year
ORDER BY year ASC

-- **************************************************************************************************************************
--Update queries must be run to populate all records in the sunshine table with the gender.  Age ML is currently on hold.
--****************************************************************************************************************************


--Update Sunshine table with age
-- UPDATE sunshine_table * AS s
-- SET age=f.age
-- FROM sunshine_unique_first_name as f
-- WHERE f.first_name=s.first_name

--STEP1
--Update Sunshine table with gender
UPDATE sunshine_table * AS s
SET gender=f.gender
FROM sunshine_unique_first_name as f
WHERE f.first_name=s.first_name



--*****************************************************************************************
--REVIEW AND ADDITIONAL DATA CLEANSING IN SQL BASED ON FURTHER ANALYSIS
--*****************************************************************************************
--count total records imported into sunshine_table
SELECT COUNT (*)
FROM sunshine_table

-- Review funnies in first name column of sunshine list
SELECT * 
FROM sunshine_table
WHERE first_name LIKE '%"%';

--View dataset for the non-gender records
--How many records are affected by no gender match?
SELECT *
FROM sunshine_table
WHERE gender is null


--STEP 2
--Delete 40 no gender match records; ML 
DELETE FROM sunshine_table
WHERE gender is null

--Rerun to verify delete
--How many records are affected by no gender match?
SELECT COUNT(*)
FROM sunshine_table
WHERE gender is null


--Count how many genders were matched with first names
SELECT COUNT (first_name)
FROM sunshine_table as s
WHERE s.gender='M' or s.gender='F'

--Review that all genders where labels are NOT M or F
SELECT * FROM sunshine_table as s
EXCEPT
SELECT * FROM sunshine_table as s
WHERE s.gender='M'	OR s.gender='F'
	 

--Total records with city identified
SELECT COUNT(city)
FROM sunshine_table
WHERE city NOT LIKE '%Not Identified%'

-- Review city column where city has not been identified
SELECT city,  COUNT(city)
FROM sunshine_table
WHERE city LIKE '%Not Identified%'
GROUP BY city ORDER BY COUNT(*) DESC

--Review city column by employer where city blank
SELECT employer, COUNT(employer)
FROM sunshine_table
WHERE city LIKE '%Not Identified%'
GROUP BY employer ORDER BY COUNT(*) DESC;

-- STEP 3
--Update Hydro One to head office of Toronto
UPDATE sunshine_table 
SET city='Toronto'
WHERE city LIKE '%Not Identified%' AND employer LIKE '%Hydro One%'


--STEP 4
--Update Ontario Power Generation to head office of Clarington
UPDATE sunshine_table 
SET city='Clarington'
WHERE city LIKE '%Not Identified%' AND employer LIKE '%Ontario Power Generation%'

-- STEP 5
--Update Ontario Provincial Police to head office of Orillia
UPDATE sunshine_table 
SET city='Orillia'
WHERE city LIKE '%Not Identified%' AND employer LIKE '%Ontario Provincial Police%'

--Review job title columns to cleanse and standardize job title column
SELECT job_title, COUNT(city)
FROM sunshine_table
GROUP BY job_title ORDER BY COUNT(*) DESC



--Data overview for MIN, MAX, AVG and proposed binwidth using 2020 as a proxy
SELECT  MIN(salary_paid) AS minS,
MAX(salary_paid) AS maxS,
MAX(salary_paid) - MIN(salary_paid) AS rngS,
AVG(salary_paid) AS avgS,
1.0* (MAX(salary_paid)-min(salary_paid))/5 AS binwidth
FROM sunshine_table
WHERE year=2020;





SELECT *
FROM sunshine_table
WHERE salary_paid IS NULL

-- --Show the salary_paid in 5 equal width bins...need to download pgcharts project
-- SELECT COUNT(salary_bin)
-- FROM sunshine_table
-- pd.crosstab(sunshine_table.salary_bin, 
--             columns = 'Count').plot(kind = 'bar', 
--                                      legend = False,
--                                      title = 'Salary Paid')

-- plt.show()


--Review Salaries in sunshine table ALL YEARS
SELECT *
FROM sunshine_table
ORDER BY salary_paid DESC
LIMIT 10 


--  2006 anomaly of $12 salary for Yelle-Weatherall_Joanne, Director Operations, Elisabeth-Bruyère Research Institute working for SCO Health Service
SELECT *
FROM sunshine_table
WHERE last_first_name LIKE '%Yelle-Weatherall_Joanne%' 
ORDER BY year ASC


--STEP 6
--Correct 2006 salary for Yelle-Weatherall_Joanne, Director Operations, Elisabeth-Bruyère Research Institute working for SCO Health Service
--UPDATE salary_paid
UPDATE sunshine_table 
SET salary_paid='127455'
WHERE last_first_name LIKE '%Yelle-Weatherall_Joanne%' AND year=2006


-- STEP 7
--UPDATE total compensation
UPDATE sunshine_table 
SET total_compensation= salary_paid + taxable_benefits
WHERE last_first_name LIKE '%Yelle-Weatherall_Joanne%' AND year=2006

--Verify correction
SELECT *
FROM sunshine_table
WHERE last_first_name LIKE '%Yelle-Weatherall_Joanne%' 
ORDER BY year ASC


--  2006 anomaly of $12 salary for Harris_Stephen, Staff Inspector, for City of Toronto
SELECT *
FROM sunshine_table
WHERE last_first_name LIKE '%Harris_Stephen%' 
ORDER BY year ASC


-- STEP 8
--Correct 2006 salary for Harris_Stephen, Staff Inspector, for City of Toronto
--UPDATE salary_paid
UPDATE sunshine_table 
SET salary_paid='128059'
WHERE last_first_name LIKE '%Harris_Stephen%' AND year=2006


-- STEP 9
--UPDATE total compensation
UPDATE sunshine_table 
SET total_compensation= salary_paid + taxable_benefits
WHERE last_first_name LIKE '%Harris_Stephen%' AND year=2006


--Review that update worked
SELECT *
FROM sunshine_table
WHERE last_first_name LIKE '%Harris_Stephen%' AND employer='City'
ORDER BY year ASC

-- STEP 10
--Update Column for Salary Bins based on salary_paid using python Analysis file for bin sizes
--Bins <105K, 105K-110K, 110K-130K, 130K-200K, 200K-500K, 500K-1M, >1M
UPDATE sunshine_table
SET salary_bin ='$110,000 to $129,999'
WHERE salary_paid<130000

UPDATE sunshine_table 
SET salary_bin='$105,000 to $109,999'
WHERE salary_paid<110000

UPDATE sunshine_table 
SET salary_bin='$100,000 to $104,999'
WHERE salary_paid<105000

UPDATE sunshine_table 
SET salary_bin='$130,000 to $199,999'
WHERE salary_paid >= 130000

UPDATE sunshine_table 
SET salary_bin='$200,000 to $499,999'
WHERE salary_paid >=200000

UPDATE sunshine_table 
SET salary_bin='$500,000 to $999,999'
WHERE salary_paid >=500000

UPDATE sunshine_table 
SET salary_bin='>$1Million'
WHERE salary_paid >=1000000

--review single year for breakdown
SELECT salary_bin, COUNT(INDEX)
FROM sunshine_table
-- WHERE year='2020'
GROUP BY salary_bin
ORDER BY salary_bin

--total for single year for comparison
SELECT COUNT(INDEX)
FROM sunshine_table
-- WHERE year='2020'


--*****************************
--Create Male & Female counter column
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


SELECT * FROM sunshine_table

--reivew salary bins
SELECT salary_bin, COUNT(salary_bin)
FROM sunshine_table
-- WHERE year=2020
GROUP BY salary_bin

--************************************************************************************************************
--ANALYSIS
--************************************************************************************************************

--TOP 5 overall highest paid salaries in last 25 years
SELECT *
FROM sunshine_table
WHERE 
(
  salary_paid IN 
  (
    SELECT salary_paid
    FROM sunshine_table as table1
    GROUP BY year, salary_paid
    ORDER BY salary_paid DESC
	LIMIT 5
	  
  )
)

--TOP 5 overall highest paid salaries in 2020
SELECT *
FROM sunshine_table
WHERE 
(
  salary_paid IN 
  (
    SELECT salary_paid
    FROM sunshine_table as table1
	WHERE year = 2020
    GROUP BY year, salary_paid
    ORDER BY salary_paid DESC
	LIMIT 5
	  
  )
)

--List of individuals over 25 that have earned over $1 million annually with count
SELECT last_first_name, COUNT(*) AS "Number of Highest Earners", MAX(salary_paid) AS "Max Salary"
FROM sunshine_table
WHERE salary_paid>=1000000
GROUP BY last_first_name
ORDER BY(COUNT(*)) DESC;


--COUNT OF EMPlOYEES in 2020 if threshold was 157000
SELECT sector,COUNT(*) 
FROM sunshine_table
WHERE year = 2020 AND salary_paid >= 157000
GROUP BY sector;

--Job Titles  in 2020 if threshold was 157000
SELECT job_title,COUNT(*) 
FROM sunshine_table
WHERE year = 2020 AND salary_paid >= 157000
GROUP BY job_title
ORDER BY COUNT(*)DESC LIMIT(10);

--Job Titles  in 2020
SELECT job_title,COUNT(*) 
FROM sunshine_table
WHERE year = 2020
GROUP BY job_title
ORDER BY COUNT(*)DESC LIMIT(10);

--Display Job_title with count and salary greater than 500,000
SELECT job_title,COUNT(*) 
FROM sunshine_table
WHERE year = 2020 and salary_paid >=500000
GROUP BY job_title
ORDER BY COUNT(*)DESC;
