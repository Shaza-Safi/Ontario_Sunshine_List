# **Sunshine List:**  Is the Sunshine list still revelant for the Ontario taxpayers?
University of Toronto Data Analytics Bootcamp Final Project

## [Link to final project webpage](https://shaza-safi.github.io/Final-Project-Website/)
![SunshineList1280x720___Gallery](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/SunshineList1280x720___Gallery.jpg)


## This is the GitHub repository for our Boot Camp group's final project.
## Responsibilities Matrix:

| Member|Role |Responsibilities |
|----|---|---|
| Danielle Spring | Circle Role | Database Lead,	Project Manager, Manage the Database and ETL Process, Communication   |
| Ben Mogil | Triangle Role | Machine Learning Lead, Technology,	Manage the Machine Learning Model and Design   |
| Shaza Safi | Square Role | Dashboard Lead,	Manage the GitHub Repository, Manage the Project Presentation, and Presentation Dashboard    |

NOTE: While members are assigned specific roles, we all work together on each part of the project.

## **Selected Topic : Is the Sunshine list still revelant for the Ontario taxpayers?**

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
- Is there Gender Inequality in Ontario’s Sunshine list?  
- Does gender play a factor? Is region a factor?
- Are civil servant salaries keeping up with inflation?
- How do civil servant salaries trend against Ontario wages?
- Can raises, salary increases be track? Are they in proportion with inflation? who is getting raises? 
- When creating ranges for salaries which sectors are highest in pay and which are lowest?
- Which job titles are paid higher salary/lowest? 
- When comparing job titles in certain sectors to others are they fairly equivalent or are certain sectors more generous?
- Which top-earning positions or person’s have continued to receive generous raises while lower seniority roles may have endured wages freezes and cutbacks?
- How many of the top earners are women?


## **Data Pipeline:**

![flow_chart](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Revised_ArchitectureDiagram.png)

##  Pipeline Assembly Instructions

[Link to Pipeline Instructions](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Pipeline_Instructions.md)

### Locations of Project Deliverables:

| Objective|Location |
|----|----|
| Presentation | [Link to Google Slides](https://docs.google.com/presentation/d/1YnezG2o4Sw96HEiBtiFBQW5cmL6X4uf0_NrUNO7HAF0/edit?usp=sharing) |
| Presentation Script | [Link to script google doc](https://docs.google.com/document/d/1Z5RuBL-9s_-bPlnp2IepbVt2FUjhK4Qm/edit?usp=sharing&ouid=104333799721409125308&rtpof=true&sd=true) |
| Database Integration-step 1 | [Link to Sunshine SQL file](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/SunshineList.sql)|
| Database Integration-step 2  | [Link to Stats Canada ipynb file](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/StatsCan_Ontario_cleansing.ipynb)|
| Database Integration-step 3  | [Link to Sunshine ipynb file](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/SunshineList_DataCleansing.ipynb) |
| Data Analysis | [Link to Data Analysis ipynb](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Data_Analysis.ipynb) |
| Machine Learning code and output | [Link to ML model](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Machine_Learning_Model_Gender_Prediction.ipynb) |
| Dashboard | [Link to dashboard](https://public.tableau.com/views/Sunshine_Dashboard_Workbook/TheThreshold?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link) |

     
## **Technologies & Tools Used:**

### Tools:
* pgAdmin 4 used to house the Sunshine list and Statistics Canada data
* Tableau Desktop and TableauPublic used to display Dashboard
* Jupyter Notebook used for data extraction/transformation, data analysis and machine learning model
* GitHub.io
* Visual Studio Code Version: 1.60.0
* Quick Database Diagram used for ERD https://app.quickdatabasediagrams.com/#/

### Languages:
* Python 3.7.10, 
* Conda *4.10.3*
* PostgreSQL
* JavaScript, HTML 

### Libraries:
* pandas
* Matplotlib 
* Random 
* NLTK
* sklearn
* Style.css 
* Bootstrap
* SqlAlchemy
* functools


### Resources:
[Link to Resource Files](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/tree/main/Resources)

[Link to Raw Data CSV Files](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/tree/main/Raw%20Data%20CSV%20files)


## **Data Exploration Phase:**
### ETL Process 

![screenshot](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/ETL.PNG)


#### 1) Extract
CSV files from various sources were used create our database. Sources and links to raw data CSV files are noted below.

##### **Sunshine List**

| Data | Data Sources |raw data CSV |
|----|----|----|
| Kaggle consoidated 1996-2019 |https://www.kaggle.com/sahidvelji/the-ontario-sunshine-list|  [Sunshine 1996-2019 raw data](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/SunShine.csv) |
| Ontario Sunshine List 2020 |https://www.ontario.ca/page/public-sector-salary-disclosure|  [Sunshine List 2020 raw data](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/Sunshine-2020-en-utf-8-2022-01-10.csv) |

 
##### **Ontario Wages - Stats Canada**

| Data | Data Sources |Raw Data CSV |
|----|----|----|
| Statistics Canada Male 25-54 |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Male 25-54](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/StatsCan_Male_25to54.csv) |
| Statistics Canada Male 55 or older |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Male 55 or older](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/StatsCan_Male_55Older.csv) |
| Statistics Canada Female 25-54 |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Female 25-54](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/StatsCan_Wage_Female_25to54.csv)|
| Statistics Canada Female 55 or older |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034001|  [Stats Can Female 55 or older](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/StatsCan_Wage_Female_55Older.csv)|

 
##### **CPI - Stats Canada**
| Data | Data Sources |Raw Data CSV |
|----|----|----|
| Statistics Canada Inflation |https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810025601|  [Stats Can CPI](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Raw%20Data%20CSV%20files/OntarioCPI_databaseLoadingData.csv) |


#### 2) Transfrom

The Sunshhine list is an annualizd publication of all Ontario public employees with salaraies >= $100,000. This list is a amalgamation of several sectors over a multitude of employers. Given the 25 year span of data and inconsistent approach to data entry of fields being reported on, the consolidated Sunshine List for years 1996 to 2020 requires significant cleansing on various fields for the benefit of clean dashboard visualizations. Detailed steps on data preprocessing for the purpose of analysis can be found in the Data Cleansing Procedure documentation.  

[Link to Data Cleansing Procedure](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Data_Cleanings_Procedure.md)

#### 3) Load
##### **Database:**
For our database, we will be using both PostgreSQL. 

###### PostgreSQL Database
The image below represents the tables of data that are uploaded onto the database in Postgres. The entity relational diagram allowed for easier joining of tables with SQL and was a helpful reference while importing data into the database.

![ERD](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/ERD_Final.png)


## **Machine Learning: Gender Identification**
### Overall ML module Objective:
Machine learning tools will be used to predict gender for the list of names in the sunshine list. This process is essential for the analysis and outputs/recommendations.

### Machine Learning Hybrid Model Process Flow Diagram

![MachineLearningModel](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/ML%20images/ML_Model.png)

Please refer to the Machine Learning Process document for details on the gender prediction model.

[Link to Machine Learning Process](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/ML_Process.md)

#### Model Evaluation Process

[Link to ML_Model_Evaluation](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/ML_Model_Evaluation.ipynb)

## **Dashboard:**
We will use Tableau Public to create our Dashboard. We will have our Dashboard data model built using CSV file exports from our SQL database as the free public tableau can only connect to local data sources and has restricted  connectivity to AWS.

Below is a prilimanary blueprint of our dashboard will look like.

[The link to Tableau Dashboard](https://public.tableau.com/views/Sunshine_Dashboard_Workbook/Gender_Dashboard?:language=en-US&:display_count=n&:origin=viz_share_link)

Interactive elements which will be incorporated into the Dashboard are:
- interactive filters
- highlighting

### **Data Analysis Phase:**
Data analysis is being done by all team members separately to uncover trends and insights.  The team will regroup to review insights gathered, determine and develop storyboard for presentation.  As the data is being explored, additional data cleansing may be required for the purpose of visualizations.


## **Analysis Results:**
The Ontario government publishes a listing of public sector employees who earn $100,000 or more annually.  The list was established in 1996 and has been published annually on March 31st. The purpose of the list is to provide accountability and transparency, requiring organizations that receive public funds to disclose the names, positions, salaries and total taxable benefits of each sunshine list employee for the given calendar year.  In our analysis we will also attempt to predict a gender for each employee and identify the employee city location.

The main audience of the sunshine list are Ontario taxpayers.  This year will mark 25 years of the sunshine list publication. The question to answer is can Ontario taxpayers use the sunshine list in a meaningful way to seek insights as to how their tax dollars are being spent.  By analyzing the sunshine list, we seek to answer several questions.

At a top line, you can quickly see that the sunshine list has growth exponentially since its initial publication.  In 1996 the list published 3,582 employee names with salary details. In 2020 the list contained 205,078 employees. This represents 5625% increase, yet the average salary paid to a public employee remains steady at approximately $127,000.  
 
![EmployeeCount](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/EmployeeCount.PNG)
 
This raises the question as to why the list is growing.  The $100,000 threshold has remained unchanged since 1996.  Is the threshold still a valid metric for Ontarians? To answer this, we look to the Consumer Price Index (CPI) which measures the average change in prices over time that consumers pay for a basket of goods and services. Below depicts The CPI for Ontario since 1996 as compared to the average salary paid on the Sunshine List.  The graph clearly depicts that the CPI has grown year over year for the last 24 years.  In 1996 our basket cost $88. This same basket has now risen to $138 equating to a 57% increase. 

![CPI](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/CPI.png)
 
Should Ontarians be concerned about the exponential growth of the employee count, as the threshold metric hsa not changed in 24 years? To answer this question, we look to the list which contains the salary paid and taxable benefits for each employee. For the purpose of our analysis, we will focus on the salaries.  In order to visual salary bands, the salary paid has been grouped into 6 bin sizes.    In the below chart, the bubble size represents the employee count for the 6 salary bins for the last 24 years.  It is very apparent that the bulk of all salaries paid are $200,000 or less, with the biggest grouping residing in the $110 to $129 bin size. What the eye is not drawn to are the smaller bubbles. In fact, the largest of the bin sizes (navy blue) representing those salaries $1 million or greater, is barely distinguishable on the chart. Should these salaries be seen as outliers?  Or should these salaries be highlighted to ensure transparency and accountability of tax payer dollars.  The drastic growth of the list now allows for the highest earners on the list to hide amongst the masses.

![SalaryBins](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/SalaryBins.PNG)
 
However, were we to increase the threshold to match the growth of the Ontario CPI during the last 24 years, we could assume a revised threshold of $157,000.  Below graphs clearly shows a drastic reduction fo the list from 205K to a little over 24K (-834%).  

![NewThreshold](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/Threshold157K.PNG)
 
This leads us to ask who is on the list? We now look to the job titles.  What jobs are making the list grow.  A count on job titles reveals that there are 179,380 unique job titles in the dataset. In order to drive any quantifiable insight, the job title column requires data cleansing. For the purpose of our analysis, we were able to standardized job titles and reduce the number of unique jobs to 5,097.  Further cleansing would be needed to have an accurate picture of the top roles. Despite the dirtiness of the data, when we focus on just the year 2020, the data shows that it is educators, managers, nurses and police topping off the list.

![JobTitle](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/Job_Titles.PNG)
 
As opposed to the highest earners in the same year, being CEO/CFO, Physicians and Department Heads.

![JobTitleBig](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/JobsGreaterThan500K.png)
 
A cleaner field to review is the sector data. We managed to cleanse this field to only 8 categories. Reviewing the data for highest earners, we can now see that the Hydro/OPG sector leads in terms of highest salary paid.  It is actually $846,430 more than that of the highest earner in the school’s sector.   What is also interesting to note is that Hydro/OPG has not only the lowest employee count, but also the lowest percentage of women represented on the list. Women represent 22% of the Hydro/OPG employees on sunshine list.  

![MaxSalaryTreeMap](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/MaxSalarySector.png)
 
This leads into our original questions of: 

-Who are the top earners on the sunshine list?  
-How many of these top roles belong to women?  
-Are certain sectors more generous than others? 

To answer these questions, we look to the top 5 individuals of each sector.

![Top5](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/Top5PerSector2020.PNG)
 
6 of the 10 highest earners from the sunshine list are employed by Hydro/OPG.  In addition, the bar graph clearly shows a trend that the highest earning positions in Ontario’s public sector are held by men with blue dominating the top of the graph and pink heavy on the bottom.  The second ranked salary is currently identified as female. This is actually an incorrect gender identification of Dominque.  Dominique Miniere is a man as confirmed by LinkedIn, which means that the top 14 highest salary positions are all held men.
 
 ![LinkedIn](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/Dominque_Min_hydro.PNG)
 
*NOTE:  Dominique Miniere is a man. Privacy laws in Canada required us to rely on US Census Bureau data to train our gender identification model. We surmise that using Canadian centric which would incorporate French names and would likely not result in a wrong gender identification.  For more information on how we performed gender identification, please refer to the machine learning documentation.*

[Link to Machine Learning Model Process](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/ML_Process.md)

From the top earning position, it would appear we do have a **gender wage gap** in Ontario’s public sector.  When we look at our salary bins by gender, we can see a pyramid with the highest paid at the top and the $110K to $129K bin at the base.  Men dominate the higher paying salary bins, whereas the count of women in the lower salary bins is growing.
 
![GenderSalaryBins](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/SalaryBin_Gender.PNG)

While a wage gap is evident, it does appear that there is now after 24 years an overall **equal number of women represented** on the sunshine list as there are men.  

![Donuts](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/DonutCharts.PNG)
![AvgSalaryOverTime](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Images/Summary%20Analysis/AvgSalary_OverTime.PNG)

What is difficult to tease out of the sunshine list is the ability to track top-earning positions.  Without further extensive data cleansing, we were not able to answer if generous raises been enjoyed by some, while potentially less seniority roles endured wages freezes and/or cutbacks.  The reason for this is the lack of unique employee identifier provided, which is only ampliphed by the shear magnitude of the dirty data. 

The Sunshine list is an amalgamation of various agencies public salary reporting.  There does not appear to be a standard for such reporting criteria.  No standardization for data in columns such as job titles/roles, names, employers or datatypes.  List column headers name tend to change from year to year.  In addition, there does not appear to be any validation of the data being published as seen in 2006 with 2 employees having salaries noted as exceeding $12 million.  Additional effort would still be required to cleanse the job title, employer and last name columns.  This would allow for traceability of these individuals over the 24 years of data.  More details can be found in our data cleansing procedure.  

[Link to Data Cleansing Procedure](https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/blob/main/Data_Cleanings_Procedure.md)

In conclusion, our analysis does demonstrate that the Ontario taxpayers can use the sunshine list in a meaningful way to seek insights in terms of the gender gap.  The data shows that the average salary of those on the list has remained constant and the bulk of these individuals reside in the lower salary bins.  Given the excessive growth of the list, the threshold metric is clearly out of date.  We see nurses, police officers, bus drivers all on the list. This is not due to generous bonus, but likely significant hours of overtime or tenture in roles.  The underlying purpose of the published list is to provide transparency to public spend. It is our opinion that it is not the masses of front line workers or educators that should be monitored,but rather the upper percentile of higher earners and/or sectors that can provide the greatest insight into spending accountability.   The employee growth to the list acts to mask high earners, as these datapoints tend to hide amongst weeds so to say.  

It would be our recommendation that the threshold metric be re-examined. At minimum it should reflect today’s cost of living. $100,000 in 1996 does not have the same value in 2020.  

We would also propose that the Ontario Government review the following:
- threshold metric
- incorporate a unique employee identifier
- mandate minimum standards of disclosure submissions (consistent data entry standards)
- a quality check of the data being submitted

## **Recommendations for Future Analysis/ Parking Lot items due to time and resource constraints:**
- Predict age for everyone on the sunshine list using machine learning techniques.
- Conduct a sentimental analysis on twitter feeds using machine learning to identify relavence of the sunshine list and having a positive or negative impact.
- Webscrapping the sunshine list website in order to have the updated list every year.
- Consolidate the First Names, Gender tables into 1 and have the Machine Learning Model update the table, rather than reading one Names Table to create a secondary Names Table with gender, that is then used to update the Sunshine Table records.
- Host via AWS.  We have made inital attempts to integrate into our pipeline;however, simply did not have enough time to complete for submission deadline. Provided link show cases our progress to date.  [Link to AWS folder]( https://github.com/Shaza-Safi/Final-Project-Sunshine-Segment3/tree/main/AWS) 
- Adding additional features to our Machine Learning Model for gender prediction such as job title, sector and employer


## **Issues Encountered:**
- GitHub large files size constrainsts.
- We chose to only use relationships between the Statistics Canada and Sunshine datasets, as unions would have cause record duplications, limiting us on how we could display some of the data on the dashboard.
- Sunshine dataset very messy and requires exhaustive cleansing:
      - on job titles require more standardization
      - employer names require more standardization/clean up
      - only records were employer name or title contain a city could be identified. Assumptions were made for large employer such as Hydro, OPP and headquarter locations used
      - no unique employee number is contained in the dataset, so it is difficult to distinguish unique individuals from year to year on the sunshine list


# Thank You 

## **References: Related Projects/Resources Used**

### Gender Prediction using First Name

Geeks for Geeks article ["Python Gender Identification by Name using NLTK"](https://www.geeksforgeeks.org/python-gender-identification-by-name-using-nltk/)

Andrew DAngelo's thesis paper ["Analyzing the Gender Wage-gap in Ontario’s Public Sector"](https://atrium.lib.uoguelph.ca/xmlui/handle/10214/9653?show=full)

Towards Data Science [Naive-bayes-explained](https://towardsdatascience.com/naive-bayes-explained-9d2b96f4a9c0)

 Christophm Github [Github](https://christophm.github.io/interpretable-ml-book/interaction.html)
 
 StackOverflow [StackOverflow](https://stackoverflow.com/questions/43288550/iopub-data-rate-exceeded-in-jupyter-notebook-when-viewing-image)
 
 US Social Security Website [US_SS](http://www.ssa.gov/oact/babynames/limits.html)
 

### Consolidated SunShine List (raw data)

Sahid Veliji for creating consolidated historical sunshine list (1996-2019)  and posting to kaggle.com [The Ontario Sunshine List](https://www.kaggle.com/sahidvelji/the-ontario-sunshine-list)


