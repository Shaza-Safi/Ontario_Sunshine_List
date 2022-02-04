# Machine Learning (ML) README
---
## How ML Model Ties into Project
* The Sunshine List data has never included associated gender data. Having the gender of each person/record from the Sunshine List will play a very critical role in answering our primary research question: "Can the Sunshine List be used to evaluate **fairness** in Ontario's workforce", which is exactly what our ML model sets out to do.
* The model will grant access to unprecedented insights from Ontario's public sector workforce by supplying our Postgres SQL database with a gender prediction for each Sunshine List record.
* The model exists in a Jupyter Notebook Python file to intake a unique list of first names from all of our Sunshine List records (taken directly from our database via SQLAlchemy) and output a respective gender prediction for each one.
* The model's gender predictions play a very important part in our project by supplying it with a new feature that will likely strengthen the signifcance of our insights to be uncovered through our analysis and better help us answer our primary research question. 
* To expand, the Sunshine List data comes with the following features for each person/record: year, sector, employer, job title, last name, first name, salary paid, and taxable benefits. 
* Moreover, the model adds to this by giving us gender, which can then be used to query the Sunshine List to reveal trends and create exciting graphs such as a gender-salary breakdown for certain industry(ies)/job title(s)/year(s), etc. which will likely strengthen our ability to accurately answer our primary research question. 

---
## Machine Learning Hybrid Model Process Flow Diagram
![](Images/ML_Hybrid_Model_Process_Flow_Diagram.png)

---
## 1. How does it work?
*Step 1: Preprocessing U.S. Social Security Name-Gender-Frequency Data
  * The U.S. Social Security website has made a list of file free for public access
  * There is one file per year dating back to 1880
  * Each one is a txt file that contains a list of names, that name's respective gender, and that name-     gender's frequency for that given year
  * Every name-gender combination is unique, meaning the same name can be listed twice but only if each     instance possesses a different gender (one male, one female)
  * The frequency data represents the number of people in the US that possessed this respective name-       gender combination in a given year
  * Every year a new file is released in the same format however, the data is updated based on               births/deaths of people with that specific name-gender combination
  * For a name-gender combination to be included in the file, it must have at least 5 people in the U.S.     that fall under it, the following image depicts the format of the list: 
![](Images/us_ss_ex.png)
  * After importing the necessary dependencies, the following code is used to (that have been downloaded     to my local machine) extract the data from each file and create an individual Pandas DataFrame (DF) for       each file: 
![](Images/us_ss_df_creation.png)
  * After that the reduce function from the 'functools' library is imported and used to append all of       the individual DFs into one large DF: 
![](Images/reduce.png)
![](Images/reduce_output.png)
  * As you can see above, the output is a DF with over 2,000,000 rows
  * Next, a new DF is created by executing a groupby on the first name and gender columns (and               frequencies are summed) of the large DF created above
  * The result is a DF containing only the unique name-gender combinations across 140 years of US Social     Security Data, and their respective frequencies across the 140 years as well:
![](Images/sum_frequencies.png)
## 2. Why this specific model?
*
*
*
*

## 3. What is the Model's Accuracy, Precision, and Sensitivity? Additionally, Include an Interpretation of each Metric Below
*
*
*

## 4. If there are statistics involved, what stats are being included in analysis and why?
*
*
*
*

## 5. If no statistics are involved, what would you include if you had more time?
*
*

## Question to Keep in Mind as Presentation is Being Put Together Since it Could be a Really Strong Talking Point: If you had more time, where would you like to investigate for finer tuning?
*

## Issue Documentation