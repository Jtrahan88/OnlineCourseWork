# CapStone Project for the [**Google Data Analystics**](https://www.coursera.org/professional-certificates/google-data-analytics) course teachings.

* This is an evolving document of my personal analysis. For learning actives only, and will continue to change in the next several weeks.

## Goal: Use Smart device data to help the wellness companies make better marketing strategies. 

### ASK:
* **What topic are you exploring?** - Bella beat Data set (fitness tracker using smart device data)

* **What is the problem you are trying to solve?** - Analyzing smart device data to gain insight into how consumers are using their smart devices for future marketing strategies.
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

* **What metrics will you use to measure your data to achieve your objective? Who are the stakeholders?** - Consumer data, and our shareholder will be wellness companies (like Bellabeat) in the wellness industry. 


* **Who is your audience for this analysis and how does this affect your analysis process and presentation?** - 
○ **Urška Sršen**: Bellabeat’s cofounder and Chief Creative Officer
○ **Sando Mur**: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team
○ **Bellabeat marketing analytics team**: A team of data analysts responsible for collecting, analyzing, and
Reporting data that helps guide Bellabeat’s marketing strategy.

* **How will this data help your stakeholders make decisions?** - By understanding how our customer go through their day, their exercise, sleeping, eating habits. We can then set up marketing campaigns around the current trends, or over trend in our consumer habits to futher increase our market share.

### Prepare:

* **Where is our data located?** - Source:https://www.kaggle.com/datasets/arashnic/fitbit

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

* **How are you addressing licensing, privacy, security, and accessibility?** - I will give all sources to each data aspect I need, like above, Kaggle has dealt with majority of this in this data set.

* **How did you verify the data’s integrity?** - According to the Data set the data is updated annually. Looking further into this it may be updated annually from the original source. Yet, for the kaggle version we will use, it is only from 2016.

* **How does it help you answer your question?** - By seeing how our consumers are using their smart devices we may be able to see some patterns/potential problems our consumers are having and try to solve them by providing a product or service. 

* **Are there any problems with the data?** - Yes. There seems to be missing days or values. Missing days may just be a rest day, but days that have actives and data is missing, we need to be looked into.
