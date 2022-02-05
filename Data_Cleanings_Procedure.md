# **DRAFT/WIP : Data Cleansing Procedure**

*insert link to StasCan_Ontario_cleasning.ipynb*

## **Statistics Canada CPI**
The data from Statics Canada is clean. For the purpose of analysis, only the Product Group 'All-items' was kept.  All other groups were removed from the dataframe prior to import into the SQL table.

What is the Canadian CPI [Refer to: An Overview of Canada's Consumer Price Index (CPI)](https://www150.statcan.gc.ca/eng/sc/video/cpi)

<img width="800" alt="CPI" src="https://user-images.githubusercontent.com/89538802/151232562-968cbbde-1405-4053-bf81-d446a140fdb7.PNG">


## **Statistics Canada Ontario Wage Data**
The data from  Statics Canada for wages in Ontario by National Occupational Classification (NOC) allowed the user to add additional filters for gender and age categories.  4 files were extracted via CSV and required consolidation into 1 DataFrame

Datasets in the forms of CSV were pulled from Statistics Canada using the following filters:

- Geography: Ontario
- Wages: Average Weekly Wage
- Reference Period: 1997 to 2021
- Type of Work: Full Time*
- Sexes:  Male and Female
- Age Group:  25 to 54 years and >55 years old
    
Definitions:
- Full-time employees are those who usually work 30 hours or more per week at their main or only job. Estimates in thousands, rounded to the nearest hundred.
- NOC stands for National Occupational Classification

NOTE: CSV for Database Loading were used for downloads.

The dataset contained several columns not required for the purpose of our analysis.  Unnecessary columns were removed

![Wage_OriginalColumns](https://user-images.githubusercontent.com/89538802/151234245-27567e41-43a5-48b9-a0e1-610e7753f5a7.png)

The dataset was reviewed for null values, which showed 96 records for the column VALUE, which is the average weekly wage as null. These records were removed.

![Wage_NullValues](https://user-images.githubusercontent.com/89538802/151234942-5fe4e7f3-ba2c-4aef-97cf-89f0177d4438.png)

The dataset was reviewed for datatypes.  For the purpose of our analysis, percision on the VALUE column is not required; therefore the datatype was changed from a FLOAT to an integer for ease of data review.

![Wage_DataType](https://user-images.githubusercontent.com/89538802/151235284-8d614597-7c8e-4261-9ab8-4ca64a647c70.png)


A calculated column was created for an annualized wage for ease of data analysis when comparing to the sunshine list.

![Wage_AnnualWage](https://user-images.githubusercontent.com/89538802/151235722-416ee8c2-b092-4db9-8220-65fb5fd4067a.png)

Lastly, the NOC column was reviewed and all categories removed with the exception of NOC 'Total employees, all occupations'

![Wage_NOC](https://user-images.githubusercontent.com/89538802/151236055-855d9117-32e9-49ba-9642-78e4aa25a005.png)


## **Sunshine List**
The Sunshhine list is an annualizd publication of all Ontario public employees with salaraies >= $100,000. This list is a amalgamation of several sectors over a multitude of employers. Given the 25 year span of data and inconsistent approach to data entry of fields being reported on, the consolidated Sunshine List for years 1996 to 2020 requires significant cleansing on various fields for the benefit of clean dashboard visualizations.  Below details steps taken for the purpose of analysis.


### Step 1 Consolidation of 1996 to 2020 dataset
For the purpose of this project, as consolidated dataset (1996 to 2019) of the Sunshine found in kaggle.com was used as the foundation of our dataset. This dataset was further supplemented by adding the 2020 dataset extracted from Government of Ontario website.



![SunshineOrginal](https://user-images.githubusercontent.com/89538802/151239497-64d415a3-071a-42df-8994-a282cc511568.png)


#### First Name
When the ‘First Name’ column is reviewed for unique first names,  the same name with inconsistent data entry will be recognized as several unique names.  Below shows that in the top 5 names form the sunshine list both the names David and John are listed twice due to case sensitivity.

 ![First_Name_Unique](https://user-images.githubusercontent.com/89538802/150036527-399dd2d5-fdc0-4380-b6e0-b7f3afb2a511.png)


Filtering on the name ‘David’, you will see that the ‘First Name’ columns has a multitude of combinations entered.    There are a total of 37,964 ‘first names’ listed with some form of “David”.

![david](https://user-images.githubusercontent.com/89538802/150036580-4553b014-e288-4489-9838-cd2e9d064bd3.png)


  
Filtering on the name ‘Michael’, you will see that the ‘First Name’ columns has a multitude of combinations entered.    There are a total of 36,131 ‘first names’ listed with some form of “Michael”.
 
 ![michael](https://user-images.githubusercontent.com/89538802/150036615-438eafce-e754-4979-a7f8-e9a7d658dacc.png)


The ‘First Name’ column will need to be cleansed to ensure each record has one ‘clean’ name listed for the purpose of gender and age identification. To do these the following data entry inconsistencies will need to scrubbed.

# Steps to data cleansing:

All names will need to have case sensitivity corrected to first letter Capitalized, all subsequent letters to remain lower case. To do so, the following cleansing activities need to take place.  A copy of the ‘First Name’ column will be used to cleanse, called ‘clean_first_name’.


1.	Start by converting the ‘clean_first_name’ column to all lower case.  By doing so, you can see the names David and Michael counts increasing.  We are now captured 30,512 of the 37,964 ‘first names’ listed with some form of “david”.

![image](https://user-images.githubusercontent.com/89538802/150037498-d1ca6403-7e68-4609-8b1c-a45bd0aa876c.png)


2.	Using the character count column created, review the data by 1, 2, 3, 4 character length names.  Several combinations of data entry inconsistencies on the ‘First Name’ will come to view.
- There are 1935 records with a ‘first name’ only denoted as an initial.  These will need to be reviewed and matched against all historical records to determine the full ‘first name’ if possible. This will be required for the machine learning model for gender and age identification.
- There are significantly more records with a ‘first name’ with 2 characters. There are a combination of full ‘first name’, initial followed by a ‘.’ and 2 initial ‘first names’.  The ‘.’ Characters will need to removed from the ‘cleansed_first_name’.  As with the 1 character list, these records will need to be reviewed and matched against all historical records to determine if a full ‘first name’ can be populated

![Two_Char](https://user-images.githubusercontent.com/89538802/150037171-8dd4ee21-2949-48a2-822e-9135b72a4b91.png)

- As the character count increases, there are more full ‘first names’ being displayed, but still various combinations of initials


	![Three_Four_Char](https://user-images.githubusercontent.com/89538802/150037235-34a2c042-544a-4481-8350-47fae3b933c8.png)

 -	Review ‘first names’ for any prefixes such as dr , mr, mrs, miss and remove from the ‘first name’
 -	Review ‘first names’ for punctuation such as comma


![word_count](https://user-images.githubusercontent.com/89538802/150037083-5142cd04-f31f-4afb-9f60-020e3de02e55.png)



![agostino](https://user-images.githubusercontent.com/89538802/150037410-7353ec19-d438-4096-94c5-3ed05c72dd01.png)



