# **Sunshine List:**  Can it be used to evaluate fairness in the Ontario workforce?
University of Toronto Data Analytics Bootcamp Final Project

## [Link to final project webpage](https://shaza-safi.github.io/Final-Project-Website/)
![SunshineList1280x720___Gallery](https://user-images.githubusercontent.com/89538802/148806480-0441cc3f-635b-4d6e-95f3-7d15c40b278a.jpg)


## This is the GitHub repository for our Boot Camp group's final project.
## Responsibilities Matrix:

| Member|Role |Responsibilities |
|----|---|---|
| Danielle Spring | Circle Role | Database Lead,	Project Manager, Manage the Database and ETL Process, Communication   |
| Ben Mogil | Triangle Role | Machine Learning Lead, Technology,	Manage the Machine Learning Model and Design   |
| Shaza Safi | Square Role | Dashboard Lead,	Manage the GitHub Repository, Manage the Project Presentation, and Presentation Dashboard    |

NOTE: While members are assigned specific roles, we all work together on each part of the project.

## Communication Protocol:

<img width="600" alt="TeamCharter" src="https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Images/TeamCharter_v1.PNG">

## **Selected Topic : Can it be used to evaluate fairness in the Ontario workforce?**

### Overview:
The Sunshine list is annual list includes public sector employees in Ontario who earned over $100,000 last year. The list is mandated by the Public Sector Salary Disclosure Act enacted by the Ontario government under Premier Mike Harris, with the first list released in 1996.

### Objective:
By analyzing public sector incomes for those employees who earned over $100,000 annually, we seek to determine if the yearly publication can be used to evaluate fairness in the Ontario workforce. In our analysis we will be using the data to determine trends based on salaries, gender and potentially regions (urban vs rural). The sunshine list does not denote gender or location therefore we will use machine learning tools to predict gender and data cleansing teachniques to identify location.


### Why did we choose this topic?:
We chose this topic for the following reasons:
- team concenses (voted on 6 different suggest topics researched by team)
- data provided a good opportunity to present multiple languages and technologies taught in bootcamp
- very rich dataset for data cleansing opportunities

## **Questions We Would Like to Answer:**
Given the data available, can we use 25 years of data to determine whether the Ontario Sunshine list is still relevant? 

- Can we identify gender using first name? 
- Can we identify a person’s age based on first name or postition?
- How do civil servant salaries trend against Ontario private sector?
- Is there Gender Inequality in Ontario’s Sunshine list?  
- Does gender or age play a factor? Is region a factor?
- Are civil servant salaries keeping up with inflation?
- How do civil servant salaries trend against Ontario private sector?
- Can raises, salary increases be track? Are they in proportion with inflation? who is getting raises? 
- When creating ranges for salaries which sectors are highest in pay and which are lowest?
- Which job titles are paid higher salary/lowest? 
- When comparing job titles in certain sectors to others are they fairly equivalent or are certain sectors more generous?
- Which top-earning positions or person’s have continued to receive generous raises while lower seniority roles may have endured wages freezes and cutbacks?
- How many of the top earners are women?


## **Data Pipeline:**

![flow_chart](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Images/Revised_ArchitectureDiagram.png)

##  Pipeline Assembly Instructions

![pipeline](https://user-images.githubusercontent.com/88908758/151651947-762797e8-a307-44ad-8c89-71f59d6578e8.png)

## 

### Locations of Project Deliverables:

| Objective|Location |
|----|----|
| Presentation | [Link to Google Slides](https://docs.google.com/presentation/d/12sRunD2lhAb3iMmoYrPP1e33THfheji_Kfs108casYw/edit?usp=sharing) |
| Database Integration-step 1 | [Link to Sunshine SQL file](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/SunshineList.sql)|
| Database Integration-step 2  | [Link to Stats Canada ipynb file](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/StatsCan_Ontario_cleansing.ipynb)|
| Database Integration-step 3  | [Link to Sunshine ipynb file](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/SunshineList_DataCleansing.ipynb) |
| Data Analysis | [Link to Data Analysis ipynb](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Data_Analysis.ipynb) |
| Machine Learning code and output | [Link to ML model](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Machine_Learning_Model_Gender_Prediction.ipynb) |

### Changes from Seg1 submission to Seg2 submission
The following aspects of the original project scope have been placed in our parking lot due to insufficient resources for time allotted.
- twitter sentiment analysis
- age prediction based on first name
- hosting has been switched from Heroku to AWS
- initial intention was to scrape the Sunshine list from the Ontario government website to create a consolidated listing.  A kaggle dataset + an addition 2020 CSV file were used as an alternative due to time constrainsts.
      

## **Technologies & Tools Used:**

### Tools:
* PostgreSQL used to house the Sunshine list and Statistics Canada data
* Tableau used to display Dashboard
* Jupyter Notebook used for data extraction/transformation, data analysis and machine learning model
* GitHub 
* AWS used for hosting 
* Quick Database Diagram used for ERD https://app.quickdatabasediagrams.com/#/

### Languages:
* Python
* SQL
* JavaScript, HTML 

### Libraries:
* pandas
* Regular Expression RegEx
* Matplotlib 
* random 
* nltk
* sklearn
* Css 
* Bootstrap


### Algorithms:
* to be updated in next segment


##
## **Data Exploration Phase:**
### ETL Process 

![screenshot](https://user-images.githubusercontent.com/89538802/149189544-4139a881-7988-4348-9137-2d6807f23403.png)


#### 1) Extract
CSV files from various sources were used create our database. Sources and links to raw data CSV files are noted below.

##### **Sunshine List**

| Data | Data Sources |raw data CSV |
|----|----|----|
| Kaggle consoidated 1996-2019 |https://www.kaggle.com/sahidvelji/the-ontario-sunshine-list|  [Sunshine 1996-2019 raw data](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/SunShine.csv) |
| Ontario Sunshine List 2020 |https://www.ontario.ca/page/public-sector-salary-disclosure|  [Sunshine List 2020 raw data](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/Sunshine-2020-en-utf-8-2022-01-10.csv) |

 
##### **Ontario Wages - Stats Canada**

| Data | Data Sources |Raw Data CSV |
|----|----|----|
| Statistics Canada Male 25-54 |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Male 25-54](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/StatsCan_Male_25to54.csv) |
| Statistics Canada Male 55 or older |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Male 55 or older](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/StatsCan_Male_55Older.csv) |
| Statistics Canada Female 25-54 |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Female 25-54](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/StatsCan_Wage_Female_25to54.csv)|
| Statistics Canada Female 55 or older |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Female 55 or older](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/StatsCan_Wage_Female_55Older.csv)|

 
##### **CPI - Stats Canada**
| Data | Data Sources |Raw Data CSV |
|----|----|----|
| Statistics Canada Inflation |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810025601|  [Stats Can CPI](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Raw%20Data%20CSV%20files/OntarioCPI_databaseLoadingData.csv) |


#### 2) Transfrom

The Sunshhine list is an annualizd publication of all Ontario public employees with salaraies >= $100,000. This list is a amalgamation of several sectors over a multitude of employers. Given the 25 year span of data and inconsistent approach to data entry of fields being reported on, the consolidated Sunshine List for years 1996 to 2020 requires significant cleansing on various fields for the benefit of clean dashboard visualizations. Detailed steps on data preprocessing for the purpose of analysis can be found in the Data Cleansing Procedure documentation.  

[Link to Data Cleansing Procedure](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Data_Cleanings_Procedure.md)

#### 3) Load
##### **Database:**
For our database, we will be using both PostgreSQL, which will be hosted on AWS. This enables anyone with the access codes to work the project data. 

NOTE: for the purpose of segment 2 submission, the tableau dashboard will be linked to CSV files to create the data model.  The database will be migrated to AWS in segment 3.

###### PostgreSQL Database
The image below represents the tables of data that are uploaded onto the database in Postgres. The entity relational diagram allowed for easier joining of tables with SQL and was a helpful reference while importing data into the database.

![ERD](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Images/Revised_ERD_v3.png)


## **Machine Learning: Gender Identification**
### Overall ML module Objective:
Machine learning tools will be used to predict gender for the list of names in the sunshine list. This process is essential for the analysis and outputs/recommendations.

### Preliminary Data Processing:
Initial classification using Natural Language Toolkit (NLTK), a Python library that used supervised classification, is done to determine a gender class (output) for each input (given name).

For this segment we have used a library installed that will automatically import two text files, ‘male.txt’ and ‘female.txt’ which contain a large list of male and female names respectively. 


### Preliminary Feature Engineering/Selection and Decision-Making Process:


### Splitting Data Into Testing & Training sets:

#### Inital Testing:
Initial testing was done using NLTK library Male and Female name list  
A labelled class list is created using the following code:

![labels](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Images/labels.png)

The above list is randomly shuffled and the resulting list is divided into a training and testing set. Note default percentage breakdown between training and testing has been used. 

From there, we instantiate a naive Bayes classification model (classifier) and train it with the training set 

Lastly, a basic accuracy score is generated for evaluating the model.

![Accuracy_InitialModel](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Images/Accuracy_InitialModel.png)

#### Improved Testing and Training:

Splitting US Social Security Name data into a training/testing set to test accuracy of model using just the training data (US Social Security Name Data) before passing Sunshine List unique first names data to model.

A hybrid model is then created which improved the accuracy.
![hybrid_accuracy](https://github.com/DanielleSpring/Final-Project-SunshineList/blob/main/Images/hybrid_accuracy.PNG)

###  Model Choice
Our model has used two types of machine learning: Relative frequency classifier and Natural Language Toolkit (NLTK), a Python library that used supervised classification to determine a gender class (output) for each input (given name)

#### Limitations
- If first name is not on the US Social Security names dataframe the Relative frequency classifier cannot give a gender prediction. 

#### Benefits
- The use of a hybrid model (Relative frequency classifier and Natural Language Toolkit (NLTK)) ensures that all first names have a gender prediction. 

#### Model Change Explainations:
- Initially only the NLTK was used to identify gender with accuracy level of 76.1% 
- As an attemp to increase the accurancy of the model we introduced a secondary model Relative Frequency Classifier which increased the accuracy to 78.7% 

## **Dashboard:**
We will use Tableau to create our Dashboard, which will be hosted on AWS. For the purpose of segment 2 submission, we will have our draft Dashboard data model built using CSV file exports from our SQL database.  Below is a preliminary blueprint of what the dashboard will look like.

![dashboard](https://user-images.githubusercontent.com/88908758/151651653-2a693df4-04d9-4787-b28e-d253c8bd6b8b.PNG)

[The link to our Preliminary tableau dashboard](https://public.tableau.com/views/Sunshine_Dashboard_Workbook/Gender_Dashboard?:language=en-US&:display_count=n&:origin=viz_share_link)

Interactive elements which will be incorporated into the Dashboard are:
- interactive filters
- highlighting


Pending data analysis, some preliminary thoughts on how our dashboard will be presented are listed below: 

- Summary Analysis - Top Earners, Top positions, 

- Salary trending (line chart $ by Years)
  - Ontario Sunshine list (public sector), with avg public/private sectors(Stats Can data)
  - filter ability based on age, gender

- Salary trending (bubble chart layered onto map of Ontario)

- Gender Gap, Roles, Trends


### **Data Analysis Phase:**
Data analysis is being done by all team members separately to uncover trends and insights.  The team will regroup to review insights gathered, determine and develop storyboard for presentation.  As the data is being explored, additional data cleansing may be required for the purpose of visualizations.


## **Analysis Results:**
To be presented in future segments.


## **Recommendations for Future Analysis/ Parking Lot items due to time and resource constraints:**
- Predict age for everyone on the sunshine list using machine learning techniques.
- Conduct a sentimental analysis on twitter feeds using machine learning to identify relavence of the sunshine list and having a positive or negative impact.
- Webscrapping to the sunshine list website in order to have the updated list every year.

# Thank You 

## **References: Related Projects/Resources Used**

### Gender Prediction using First Name

Geeks for Geeks article ["Python Gender Identification by Name using NLTK"](https://www.geeksforgeeks.org/python-gender-identification-by-name-using-nltk/)

Andrew DAngelo's thesis paper ["Analyzing the Gender Wage-gap in Ontario’s Public Sector"](https://atrium.lib.uoguelph.ca/xmlui/handle/10214/9653?show=full)

### Consolidated SunShine List (raw data)

Sahid Veliji for creating consolidated historical sunshine list (1996-2019)  and posting to kaggle.com [The Ontario Sunshine List](https://www.kaggle.com/sahidvelji/the-ontario-sunshine-list)


