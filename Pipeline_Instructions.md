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

## Step 3 - Machine Learning Model

1) Run the Jupyter Notebook file called "Machine_Learning_Model_Gender_Prediction". This will create a table called "sunshine_unique_first_name"

## Step 4 - Update SQL Database

1) Run the SQL file called "SunshineList_UpdateCleanseShortCut.sql". This will update the sunshine table gender labels, create/update some additional columns for the tableau Dashboard and do some additional cleansing to the dataset.

  NOTE: the "SunshineList_UpdateCleanseShortCut.sql" can be used as a macro(s) in the SunshineList.sql file, which is the analysis file used to update and discover the     addtional cleansing required.
  
  [Link to SQL shortcut for updates and cleansing](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/SunshineList_UpdateCleanseShortCut.sql)
  
# Step 5 - Export Database tables for Tableau Desktop

1) Create a folder called "Resources" 

2) Create a subfolder in the "Resources" folder called "TABLEAU_csv" to house all the SQL tables that will be exported as CSV files 

3) In pgAdmin4 export the following tables into CSV 
 
 ![SQLTables](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Pipeline/tables.png)


4) Name tables as the following:

 ![CSVTables](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Pipeline/TableauCSV.png)
 
 5) Publish Dashboard to Tableau Public under Sunshine_Dashboard_Workbook.twb

# Step 6 - Open Dashboard

The database is static. So there is no need to refresh the data model in Tableau to use the Dashboard. Should additional data be added, such as a new published Sunshine list, simply amend the cleansing file to incorporate the new year and run it through the remaining steps

