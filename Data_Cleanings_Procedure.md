# **Data Cleansing Procedure**

**NOTE:** For all statistics Canada data, the 'CSV for Database Loading' were used for to extact the CSV files used for our datasets.

[Link to StatCan_Ontario_Cleansing file](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/StatsCan_Ontario_cleansing.ipynb)

## **Statistics Canada CPI**
The data from Statics Canada is clean. For the purpose of analysis, only the Product Group 'All-items' was kept.  All other groups were removed from the dataframe prior to import into the SQL table.

### Step 1 - Keep only Product Group 'All-items'

<img width="800" alt="CPI" src="https://user-images.githubusercontent.com/89538802/151232562-968cbbde-1405-4053-bf81-d446a140fdb7.PNG">

*Definitions of Note:*

**The Consumer Price Index (CPI)**  represents changes in prices as experienced by Canadian consumers. It measures price change by comparing, through time, the cost of a fixed basket of goods and services.

What is the Canadian CPI? [Refer to: An Overview of Canada's Consumer Price Index (CPI)](https://www150.statcan.gc.ca/eng/sc/video/cpi)

## **Statistics Canada Ontario Wage Data**
The data from  Statics Canada for wages in Ontario by National Occupational Classification (NOC) allowed the user to add additional filters for gender and age categories.  4 files were extracted via CSV and required consolidation into 1 DataFrame

### Step 1 - Filter requirement for data extract from Statistics Canada website

Datasets in the forms of CSV were pulled from Statistics Canada using the following filters:

- Geography: Ontario
- Wages: Average Weekly Wage
- Reference Period: 1997 to 2021
- Type of Work: Full Time*
- Sexes:  Male and Female
- Age Group:  25 to 54 years and >55 years old
    
*Definitions of Note:*

**Full-time employees** are those who usually work 30 hours or more per week at their main or only job. Estimates in thousands, rounded to the nearest hundred.

**NOC** stands for National Occupational Classification

### Step 2 - Remove Columns

The dataset contained several columns not required for the purpose of our analysis.  Unnecessary columns were removed

![Wage_OriginalColumns](https://user-images.githubusercontent.com/89538802/151234245-27567e41-43a5-48b9-a0e1-610e7753f5a7.png)

### Step 3 - Remove Null Values

The dataset was reviewed for null values, which showed 96 records for the column VALUE, which is the average weekly wage as null. These records were removed.

![Wage_NullValues](https://user-images.githubusercontent.com/89538802/151234942-5fe4e7f3-ba2c-4aef-97cf-89f0177d4438.png)

### Step 4 - Change Datatypes

The dataset was reviewed for datatypes.  For the purpose of our analysis, percision on the VALUE column is not required; therefore the datatype was changed from a FLOAT to an integer for ease of data review.

![Wage_DataType](https://user-images.githubusercontent.com/89538802/151235284-8d614597-7c8e-4261-9ab8-4ca64a647c70.png)

### Step 5 - Create Annualized Wage Column

A calculated column was created for an annualized wage for ease of data analysis when comparing to the sunshine list.

![Wage_AnnualWage](https://user-images.githubusercontent.com/89538802/151235722-416ee8c2-b092-4db9-8220-65fb5fd4067a.png)

### Step 6 - Remove Rows

The NOC column was reviewed and all categories removed with the exception of NOC 'Total employees, all occupations'

![Wage_NOC](https://user-images.githubusercontent.com/89538802/151236055-855d9117-32e9-49ba-9642-78e4aa25a005.png)


## **Sunshine List**
The Sunshine list is an annualizd publication of all Ontario public employees with salaraies >= $100,000. This list is a amalgamation of several sectors over a multitude of employers. Given the 25 year span of data and inconsistent approach to data entry of fields being reported on, the consolidated Sunshine List for years 1996 to 2020 requires significant cleansing on various fields for the benefit of clean dashboard visualizations.  Below details steps taken for the purpose of analysis.

[Link to Sunshine Cleansing file](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/SunshineList_DataCleansing.ipynb)


### Step 1 Consolidation of 1996 to 2020 dataset
For the purpose of this project, as consolidated dataset (1996 to 2019) of the Sunshine found in kaggle.com was used as the foundation of our dataset. This dataset was further supplemented by adding the 2020 dataset extracted from Government of Ontario website.

![SunshineOrginal](https://user-images.githubusercontent.com/89538802/151239497-64d415a3-071a-42df-8994-a282cc511568.png)


Initial review of the dataset requires the following corrections:
1) For the purpose of our analysis we chose to change the kaggle 'Salary Paid' and 'Taxable Benefits' columns from float to integer.
2) Column comparisons between the kaggle and the 2020 annualized list show that the Salary and Benefits columns did have the same naming convention, nor share the same data types
3) Correct 2020 'Salary' and 'Benefits' columns by removing the '$' and ',' 
4) Correct 2020 'Salary' and 'Benefits' columns from a string to numeric
5) Change 2020 'Salary' and 'Benefits' columns from a float to integer, in keeping with the kaggle dataset.

The two datasets are then appended to create a consolidated 1996 to 2020 DataFrame called the 'sunshine_data_df'  This DataFrame consists of 1,676,561 records (rows) with 8 columns of data.

A review for missing information in the sunshine_data_df revealled that there 3 null records.  These records pretained to the First Name column, which is crutial to our gender prediction model.  These rows must be removed from our DataFrame, resulting in 1,676,558 records with 8 columns.


### Step 2  Adding of Additional Columns
For the purpose of analysis and/or datacleansing of the 25 year Sunshine List, certain additional columns prove helpful.  The following columns are added to the the DataFrame.

- **Total Compensation** ('Salary Paid' + 'Taxable Benefits')
- **Clean Employer** (a duplicate of the Employer column to be used for cleansing/standardization of the employer name)
- **Clean Job Title** (a duplicate of the Job Title column to be used for cleansing/standardization of the job title)
- **Clean First Name** (a duplicate of the First Name column to be used for cleansing and identification of a First Name)
- **Final First Name** (column to be used to determine the First Name for our Machine Learning Model)
- **Gender** (assigned gender 'M' or 'F' to be predicted by the Machine Learning Model and populated in our SQL database via an update query)
- **Age** (Placed in our parking lot.  This was part of our initial Machine Learning Model to predict an age based on a person's first name)
- **City** (a column created in an effort to identify the 
- **First Character Count** (a character count calculated based on the original First Name columns from the DataFrame. To be used as an assist in the data review and datacleansing processes)
- **Word Count** (a word count calculated based on the original First Name columns from the DataFrame. To be used as an assist in the data review and datacleansing processes)
- **Salary Bin** (a text field grouping salaries into a salary bin/lot size)

### Step 3 Review of Individual Columns
A closer look at the data highlights the following about the sunshine list:

1) Data entry and collection is inconsistent across sectors, employers, names and can vary from year to year publications.
2) Columns are each reviewed individually. Some are cleansed more than others, for example, greater care in cleansing and identifying a first name to be used in our machine learning model, than that of the last name.  Other columns focus on attempting to standardize sectors or employer names, so that aggregation of unique values can be displayed correctly.

The following subsections will walk through the thought process on cleansing the individual columns.


#### Sectors Column
A value counts query shows that there are 81 unique sectors in the current DataFrame.  Cleansing actions performed are as follows by using the str.contains function to replace specific text with our standardized sector categories:

1) For analysis purposes the seconded sectors will be consolidated and grouped under the 'Public Sector'.
2) 'Other Public' grouped under 'Public Sector'
3) All 'Government of Ontario' sectors grouped and rename to 'Government of Ontario'
4) Universities and Colleges grouped and renamed to 'Post Secondary'
5) Grade school, High school boards grouped and renamed to 'Schools'
6) Any sectors with municipal have been grouped and renamed to ' Municipalities'
7) Hydro One and Ontario Power Generation are now one entity, so all historical Hydro or OPG have been consolidated and renamed to 'Hydro/OPG'
8) All crown agencies have been grouped and renamed under 'Crown Agencies'
9) All Hospitals have been grouped and renamed under 'Hospitals'

The result of the cleansing provides a reduction of sectors from 81 to  8 unique sector categories.

![Sector](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Data%20Cleansing/Sectors.png)


#### Last Name Column
Minimal cleasning is done to the Last Name, as it will only be used for the purpose of concatenation to identify individuals.  Cleansing actions performed are as follows:

1) Make all Last Names to lower case
2) Make all Last Names to Capitalize the first letter of the Last Name


#### Employer Column
A value counts query shows that there are 8,666 unique sectors in the current DataFrame.  Cleansing actions performed are as follows by using the str.contains function to replace specific text with cleansed Employer Names:

The result of the cleansing provides a reduction of employers from 8,666 to  7,966 unique employer names.

![BigBrother](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Data%20Cleansing/BigBrother.png)

#### City Column
For the purpose of reviewing the Sunshine list and providing a visual on where in Ontario those positions making over $100,000 are situated, an attempt has been made to identify the city by using the Employer and Job Title information.  Cleansing actions performed are 100% manual and use the str.contains function to replace specific text with city names.

1)  A copy of the original Employer column was used and the city name teased out.  This is a manual process of reviewing the data results and continuing to refine
2) Employer Names without city information and having a high employee count where researched for headquarter locations. Examples of this would be hospitals, school boards and universities.
3) Where no name could be identified using the Employer name, as review of the Job Title was used to tease out a potential city.    Examples of this can be found in certain hydro/OPG job titles where plant locations such as Pickering, Darlington, Bruce and Lambton could be identified
4) a unique Ontario city list was created and used to cleanse the remaining records where no city could be identified. These records had the city data (old Employer data) removed and replaced with "Not Identified"

The following is a link to the city.csv file used to cleanse in step 4.
*insert link to city.csv*

[City List Link](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Resources/city.csv)


#### Cleansed Job Title Column
For the purpose of reviewing the Sunshine list to compare similiar jobs titles a cleansed job title column has been created to present standard titles.  Cleansing actions performed are 100% manual and use the str.contains function to replace specific text with job titles with standard titles.  A value counts query shows that there are 179,380 unique job titles in the current DataFrame.

1)  A copy of the original Job Title column was used to group and standardize titles.  This is a manual process of reviewing the data results and continuing to refine

The result of the cleansing provides a reduction of job titles from 179,380 to  5,097 unique job titles.


#### First Name Column
When the ‘First Name’ column is reviewed for unique first names there are 91,269 unique first names list. Upon closer inspection, one notices that the same name appears; however, in various formats.  To perform aggregations and identify unique individuals the first name will need to cleansed of the inconsistent data entry. This will ensure each record has one ‘clean’ name listed for the purpose of gender identification.

Examples of data entry inconsistencies are noted below:


Below shows that in the top 5 names form the sunshine list both the names David and John are listed twice due to case sensitivity.

 ![First_Name_Unique](https://user-images.githubusercontent.com/89538802/150036527-399dd2d5-fdc0-4380-b6e0-b7f3afb2a511.png)


Filtering on the name ‘David’, you will see that the ‘First Name’ columns has a multitude of combinations entered.    There are a total of 37,964 ‘first names’ listed with some form of “David”.

![david](https://user-images.githubusercontent.com/89538802/150036580-4553b014-e288-4489-9838-cd2e9d064bd3.png)


  
Filtering on the name ‘Michael’, you will see that the ‘First Name’ columns has a multitude of combinations entered.    There are a total of 36,131 ‘first names’ listed with some form of “Michael”.
 
 ![michael](https://user-images.githubusercontent.com/89538802/150036615-438eafce-e754-4979-a7f8-e9a7d658dacc.png)


##### Steps to cleaning the 'first name' :

All names will need to have case sensitivity corrected to first letter Capitalized, all subsequent letters to remain lower case. To do so, the following cleansing activities need to take place.  A copy of the ‘First Name’ column will be used to cleanse, called ‘clean_first_name’.


1)	Start by converting the ‘clean_first_name’ column to all lower case.  By doing so, you can see the names David and Michael counts increasing.  We are now captured 30,512 of the 37,964 ‘first names’ listed with some form of “david”.

![image](https://user-images.githubusercontent.com/89538802/150037498-d1ca6403-7e68-4609-8b1c-a45bd0aa876c.png)


2)	Using the character count column created, review the data by 1, 2, 3, 4 character length names.  Several combinations of data entry inconsistencies on the ‘First Name’ will come to view.
- There are 1935 records with a ‘first name’ only denoted as an initial.  These will need to be reviewed and matched against all historical records to determine the full ‘first name’ if possible. This will be required for the machine learning model for gender and age identification.
- There are significantly more records with a ‘first name’ with 2 characters. There are a combination of full ‘first name’, initial followed by a ‘.’ and 2 initial ‘first names’.  The ‘.’ Characters will need to removed from the ‘cleansed_first_name’.  As with the 1 character list, these records will need to be reviewed and matched against all historical records to determine if a full ‘first name’ can be populated

![Two_Char](https://user-images.githubusercontent.com/89538802/150037171-8dd4ee21-2949-48a2-822e-9135b72a4b91.png)

- As the character count increases, there are more full ‘first names’ being displayed, but still various combinations of initials


	![Three_Four_Char](https://user-images.githubusercontent.com/89538802/150037235-34a2c042-544a-4481-8350-47fae3b933c8.png)

 -	Review ‘first names’ for any prefixes such as dr , mr, mrs, miss and remove from the ‘first name’
 -	Review ‘first names’ for punctuation such as comma and replace with ""
  -	Review ‘first names’ for punctuation such as period and replace with " "
 


![word_count](https://user-images.githubusercontent.com/89538802/150037083-5142cd04-f31f-4afb-9f60-020e3de02e55.png)



![agostino](https://user-images.githubusercontent.com/89538802/150037410-7353ec19-d438-4096-94c5-3ed05c72dd01.png)


3) Using the str.split function
    a) Clean_first_name column - remove all the text after the first white space
    b) Clean_alt_first_name column - extract all the text after the first white space
    
4) Convert all Clean_alt_first_name to lower case

5) Create a new column called clean_char_count (calculated a character count on the clean_first_name column)

6) Using conditions based on the clean_char_count and final_first_name columns update the final_first_name column

![FinalFirstName](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Data%20Cleansing/Final_First_Name.png)

7) Create a new column called final_char_count (calculated a character count on the final_first_name column)

8) Convert final_first_name to lower case

### Step 4 - Dropping of Records:

The DataFrame is reviewed based on various character count columns and decisions made to drop certain non-value added 'dirty' rows. Prior to any records being dropped, the Sunshine_data_df contains 1,676,558 records (rows) with 21 columns. Steps are listed below:

1) Drop all records with a first name containing a character count of less than 2.  The Sunshine_data_df reduces by 1,187 records.

2) Drop all records with null values in the final_char_count column.  The Sunshine_data_df reduces by an additional 7,256 records.

3) Drop all records where final char count is 2 AND clean_char_count is <=2. The Sunshine_data_df reduces by an additional 2,986 records.

4) Further review of the data still show some funny 'first name' records containing brackets, hidden characters not identified and apostophes.  Using str.replace these characters are replaced with either a null or  white space

5) Refresh the final_char_count by creating a secondary final_char_count2 column

6) Drop all records where final char count2 is <=2. The Sunshine_data_df reduces by an additional 2,934 records.

*NOTE: there are additional funny hidden characters in records, example index 1764: where the final first name is "skip"   This is dealt with in our SQL database process.*

![SkipExample](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Data%20Cleansing/Skip.png)

The Sunshine_data_df now contains 1,662,195 records. This represents 99.1% of the intial 1,676,558 records prior to data cleansing.

### Step 5 -  Create Column: Last, First Name 
For data analysis purposes a unique last, first name column is created in an effort to identify unique employees.



## Creating Unique First Names for Machine Learning Model
The machine learning model will use a unique list of first names from the Sunhine list to predict a gender.  A final review of the data shows some funnies due to hidden characters.  These names will be deleted using the noted index number.

![FirstNameML](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Data%20Cleansing/first_names_ML.png)

The model will be fed 28,774 unique first names.


## Export to SQL database

### Step 1
For all datasets in question (Statistics Canada and Sunshine List) Only those columns needed for analysis and fed into the SQL database will be reordered and renamed.

### Step 2
Tables will be imported into a SQL database using sqlalchemy:

- the unique_sunshine_name_sorted will be imported as the ml_first_names table
- the sunshine_data_df will be imported as sunshine_table
- the Ontario_Wages will be imported as ontario_wage_table
- cpi_df will be imported as cpi_table


## SQL Database Deeper Dive Cleansing
The data is reviewed again in SQL to ensure tables imported successfully and do deeper dive cleansing where necessary depending on preliminary data analysis performed.

The sunshine table has a total of 1,662,195 records imported for analysis. 14,405 dirty records were removed from the dataset, which is less than 1% of the total records.

Data requiring further cleansing are as follows:

### Step 1 Update Gender Column Values
The update query to populate the gender in the sunshine_table from the machine learning model resulted in 42 records with no gender. These funny data records appear to continue to have hidden characters.  For our purposes, these records are deleted.

![SQLFunnies](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SQL%20Cleansing/SQL_funnies.png)

### Step 2 Update City Column Values for Specific Employers
A review of the city column highlights that 429,019 records have no city identified.  Of the records not identified a high portion belong to Hydro One, Ontario Power Generation and OPP.  Given that analysis has shown that some of the highest earners from the sunshine list belong to the Hydro/OPG, it is best not to delete these records.  These records will be updated with the city for their perspective headquarters.

    Hydro One is assigned to Toronto
    Ontario Power Generation is assigned to Clarington
    OPP is assigned to Orillia

![NoCity](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SQL%20Cleansing/NoCity.png)
    
### Step 3 Review Salary Paid Data Funnies
A review of maximum salaries highlighted that in 2006 two individuals were paid an annual salary of > $12 million.  A closer look was taken to review the individuals in question: Joanne Yelle Weatherall and Stephen Harris. Historical salaries were reviewed for both employees. It is clear from the data that these salaries are finger fumbles where the decimal was misplaced.  An Update query is used to correct the gross inflattion of these salary records.

![12Million](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SQL%20Cleansing/TwelveMillionSalary.png)

Cleansing Joanne Yelle Weatherall
![Joanne](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SQL%20Cleansing/Joanne_YelleWeatherall.png)

Cleansing Stephen Harris
![Stephen](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SQL%20Cleansing/Stephen_Harris.png)

Both records are updated manually

![SalaryCleansing](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SQL%20Cleansing/SalaryCorrection.png)




