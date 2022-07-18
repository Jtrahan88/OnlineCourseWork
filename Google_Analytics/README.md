# CapStone Project for the [**Google Data Analystics**](https://www.coursera.org/professional-certificates/google-data-analytics) course teachings.

* This is an evolving document of my personal analysis. For learning actives only, and will continue to change in the next several weeks.

## Goal: Use Smart device data to help the wellness companies make better marketing strategies. 

### ASK:
* **What topic are you exploring?** - Bella beat Data set (fitness tracker using smart device data)

* **What is the problem you are trying to solve?** - Analyzing smart device data to gain insight into how consumers are using their smart devices for future marketing strategies.
> 1. What are some trends in smart device usage?
> 2. How could these trends apply to Bellabeat customers?
> 3. How could these trends help influence Bellabeat marketing strategy?

* **What metrics will you use to measure your data to achieve your objective? Who are the stakeholders?** - Consumer data, and our shareholder will be wellness companies (like Bellabeat) in the wellness industry. 


* **Who is your audience for this analysis and how does this affect your analysis process and presentation?** - 
○ **Urška Sršen**: Bellabeat’s cofounder and Chief Creative Officer
○ **Sando Mur**: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team
○ **Bellabeat marketing analytics team**: A team of data analysts responsible for collecting, analyzing, and
Reporting data that helps guide Bellabeat’s marketing strategy.

* **How will this data help your stakeholders make decisions?** - By understanding how our customer go through their day, their exercise, sleeping, eating habits. We can then set up marketing campaigns around the current trends, or over trend in our consumer habits to futher increase our market share.

### Prepare:

* **Where is our data located?** - Source:https://www.kaggle.com/datasets/arashnic/fitbit
* > We could use the  **dailyActivity_merged** excel document only. It has all teh indivudal data to gether for us.
* > Instead I will bring in four data sets to merge together myself for practice. They are as follows:
> > 1. dailyCalories_merged
> > 2. dailyIntensities_merged
> > 3. dailySteps_merged
> > 4. sleepDay_merged

* **How is the data organized?** - Tubular wide format. There are many files but a merged file was created. I will use this one and slice it as needed

* **Are there issues with bias or credibility in this data? Does your data ROCCC?** - Yeas and no:
> 1. **Reliable** - Yes. - Data is via Amazon Mechanical Turk between 03.12.2016-05.12.2016
> 2. **Original** - Yes. - Each Consumer has their own personal Fitbit
> 3. **Comprehensive** - Yes and No. - Data is pulled from real time events in consumer daily activities. There are some values that are marked as 0 will need to investigate more.  
> 4. **Current** - No. - Data is from 2016. This data is out dated, but for learning purposes it is a great aspect to use in future job roles. 
> 5. **Cited** - Yes:
> > * LICENSE - CC0: Public Domain.
> > * Collaborators - Möbius (Owner).
> > * SOURCES - https://zenodo.org/record/53894#.X9oeh3Uzaao
> > * COLLECTION METHODOLOGY - preprocessed.
> > * Acknowlegement
> > Furberg, Robert; Brinton, Julia; Keating, Michael ; Ortiz, Alexa
> > https://zenodo.org/record/53894#.YMoUpnVKiP9

* **How are you addressing licensing, privacy, security, and accessibility?** - I will give all sources to each data aspect I need, like above, Kaggle has dealt with majority of this in this data set.

* **How did you verify the data’s integrity?** - According to the Data set the data is updated annually. We will need to look at our data types, adn see if any cells need to processed before we start analysing.  Looking further into this it may be updated annually from the original source. Yet, for the kaggle version we will use, it is only from 2016.

* **How does it help you answer your question?** - By seeing how our consumers are using their smart devices we may be able to see some patterns/potential problems our consumers are having and try to solve them by providing a product or service. 

* **Are there any problems with the data?** - Yes. There seems to be missing days or values. Missing days may just be a rest day, but days that have actives and data is missing, we need to be looked into.


### Process
* **What tools are you choosing and why?**
> 1. Excel/Google Sheets - This is very small data so excel can help us out. Can get a quick overview of the data, and make small changes
> 2. Python - For now help clean the data, but will want to use this to mine the data using an API if there is one available. Also to show other that if we had a BIG data, I can use python to work through the road blocks.
> 3. SQL - To practice and show additional techniques. 
>  
* **Have you ensured your data’s integrity?** -
> By looking at each data set in excel I noticed that some data had information for days but in some areas there was none. 
> Excel is a slow way of looking at data, so I also looked at the data in python. We will need to merge all the files, I noticed that the date columns has a data type of an object and change this so a date/time data type.
> > I am choosing date/time over just data because this data was pulled to the minute from user's smart devices. 
* **What steps have you taken to ensure that your data is clean?** - 
> View data in python and run the .info(), and .describe() function in python. This will help us get a quick over view of what we have.

* **How can you verify that your data is clean and ready to analyze?** - 
> We have done this in early steps by looking at the data types, and see what data we have. WE can also look at the number of participates by using the nunique() method in pandas for our ID column. By doing so we can see that not ever data set has enough data to get a good analysis for. Which brings us back to the 4 data sets I chose. I did this manually in excel by removing duplicates, but may add the python step by step way to this file later.

* **Have you documented your cleaning process so you can review and share those results?** - This is actively being done for every step I take.

