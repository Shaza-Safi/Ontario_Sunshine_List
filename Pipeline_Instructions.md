# **Pipeline Instructions**

The below steps will allow you to construct the pipeline to analyze the data from the published Sunshine list.

![PipelineImage](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/PipelineInstructions.PNG)

## Step 1 - Tools installations

- Ensure you have Jupyter Notebook installed
- Ensure that you pgAdmin 4 installed

## Step 2 - Database Creation

1) Create a database called "Final_Project_SunshineList" 

2) Download the raw CSV files for Statistics Canada.
 The files are: 
- OntarioCPI_databaseLoadingData.csv 
- StatsCan_Male_25to54.csv 
- StatsCan_Male_55Older.csv 
- StatsCan_Female_25to54.csv 
- StatsCan_Female_55Older.csv 


3) Create a folder called "Raw Data CSV files" to house all the raw data CSV files 

4) Run the Jupyter Notebook file called "StatsCan_Ontario_cleansing". This will create two tables "cpi_table" and "ontario_wage_table". 

5) Download the raw CSV files for the Sunshine list. 
The files are:
- Sunshine-2020-en-utf-8-2022-01-10.csv 
- SunShine.csv 

6) Run the Jupyter Notebook file called "SunshineList_DataCleansing". This will create two tables "sunshine_table" and "ml_first_names".
