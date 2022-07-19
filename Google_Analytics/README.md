# CapStone Project for the [**Google Data Analystics**](https://www.coursera.org/professional-certificates/google-data-analytics) course teachings.

* This is an evolving document of my personal analysis. For learning actives only, and will continue to change in the next several weeks.

## Goal: Use Smart device data to help the wellness companies (BellaBeat) make better marketing strategies. 

### ASK:
* **What topic are you exploring?** - BellaBeat Data set (fitness tracker using smart device data)

* **What is the problem you are trying to solve?** - Analyzing smart device data to gain insight into how consumers are using their smart devices for future marketing strategies.
> 1. What are some trends in smart device usage?
> 2. How could these trends apply to Bellabeat customers?
> 3. How could these trends help influence Bellabeat marketing strategy?

* **What metrics will you use to measure your data to achieve your objective? Who are the stakeholders?** - Consumer data, and our shareholder will be wellness companies (like Bellabeat) in the wellness industry. 


* **Who is your audience for this analysis and how does this affect your analysis process and presentation?** - 
#### Stakeholders
> ○ **Urška Sršen**: Bellabeat’s cofounder and Chief Creative Officer
> ○ **Sando Mur**: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team
> ○ **Bellabeat marketing analytics team**: A team of data analysts responsible for collecting, analyzing, and
Reporting data that helps guide Bellabeat’s marketing strategy.

* **How will this data help your stakeholders make decisions?** - 
> * By understanding how our customer go through their day, their exercise, sleeping, eating habits. We can then set up marketing campaigns around the current trends, or over trend in our consumer habits to further increase our market share.

### Prepare:

* **Where is our data located?** - Source:https://www.kaggle.com/datasets/arashnic/fitbit
* > I will use the  **dailyActivity_merged** excel document only. It has all the individual data to gather for us.
* > If this was not done for us I would bring in several data sets to look at first, and merge together as needed. They are as follows because I will being my analysis on the day and not by minute or hour:
> > 1. dailyCalories_merged
> > 2. dailyIntensities_merged
> > 3. dailySteps_merged
> > 4. sleepDay_merged
> > 5. weightLogInfo_merged

> > * Edit: After further review the **dailyActivity_merged** file is missing data from **sleepDay_merged** we will merge this before we start our analysis as well. 

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
> > * Acknowledgement
> > Furberg, Robert; Brinton, Julia; Keating, Michael ; Ortiz, Alexa
> > https://zenodo.org/record/53894#.YMoUpnVKiP9

* **How are you addressing licensing, privacy, security, and accessibility?** - I will give all sources to each data aspect I need, like above, Kaggle has dealt with majority of this in this data set.

* **How did you verify the data’s integrity?** -
> According to the Data set the data is updated annually. We will need to look at our data types, and see if any cells need to be processed before we start analyzing. Yet, for the kaggle version we will use, it is only from 2016.


* **How does it help you answer your question?** -
> By seeing how our consumers are using their smart devices we may be able to see some patterns/potential problems our consumers are having and try to solve them by providing a product or service. 

* **Are there any problems with the data?** - 
> Yes. There seems to be missing days or values. Missing days may just be a rest day, but days that have actives and data is missing, we need to be looked into.


### Process
* **What tools are you choosing and why?**
> 1. Excel/Google Sheets - This is very small data so excel can help us out. Can get a quick overview of the data, and make small changes
> 2. Python - For now help clean the data, but will want to use this to mine the data using an API if there is one available. Also to show other that if we had a BIG data, I can use python to work through the road blocks.
> 3. SQL - To practice and show additional techniques. 
>  
* **Have you ensured your data’s integrity?** -
> * By looking at each data set in excel I noticed that some data had information for days but in some areas there was none. 
> * Excel is a slow way of looking at data, so I also looked at the data in python. We will need to merge all the files, I noticed that the date columns has a data type of an object and change this so a date/time data type.
> > * I am choosing date/time over just data because this data was pulled to the minute from user's smart devices. 
* **What steps have you taken to ensure that your data is clean?** - 
> * View data in python and run the .info(), and .describe() function in python. This will help us get a quick over view of what we have.

* **How can you verify that your data is clean and ready to analyze?** - 
> * We have done this in early steps by looking at the data types, and see what data we have. We can also look at the number of participates by using the nunique() method in pandas for our ID column. By doing so we can see that not ever data set has enough data to get a good analysis for. Which brings us back to the 4 data sets I chose. I did this manually in excel by removing duplicates, but may add the python step by step way to this file later.
> * Cannot find out if the distance is in mile or kilometers.

* **Have you documented your cleaning process so you can review and share those results?** -
> This is actively being done for every step I take.

### Analyze
* **How should you organize your data to perform analysis on it?**
> * Using seaborn I would use the pairplot() function to see if any columns have a relationship as an overview. From there I can see how I would like to proceed next.

* **Has your data been properly formatted?**
> * Yes the preprocessing of the kaggle has been formatted correctly. We did drop one column due to lack of data. 

* **What surprises did you discover in the data?**
> * jointplot
> > * The More steps we take the more calories we burn. There are a few outliers, this I would assume to be because the intensity rates.
> * lineplot
> > * This comparison shows me if we can keep a light intensity we can have a steady burn of calories. Also, this also show me some habits of consumers who may have start low intensity and finish high intensity and vice versa.
> * Box Plot
> > * This shows us that this data set has majority of the consumer likely a light intensity through much of the week. 
> > * High intensity is the next highest and stays pretty consistence except on Thursday, Friday, and Saturday goes back up
> *Barplot(Sedentary Total sleep time vs Day of Week)
> > * Sunday surprisingly is the day people get the least amount of sleep in this data set
> > * You can see a trend on Wed. Thurs.,Fri. that less sleep occurs, then Saturday is the caught up day. This happened again in the same way for Sun. and Mon. 
> *Joint Plot(# sleep time vs SedentaryMinutes)
> > *There is a trend of the more Sedentary minuet occurring, less sleep occurs
> > *Looks like a few outliers, which could be days that people forgot to wear/charge their device. 
> * Joint Plot(# sleep time vs SedentaryMinutes separated by intensity type)
> > * Adding in the intensity type from one of our above charts we cannot make out which intensity is better for sleep
> > * More data is needed

* **What trends or relationships have you found in the data?**
> > * Steps taken and calories burned
> > * Intensity by Distance vs Calories Burned
> > * Intensity by distance vs by day
> > * Sedentary Activity based on minutes vs day of week

* **How do these insights answer your question or solve the problem?**
> * What are some trends in smart device usage?
> > * This was answered above.

How could these trends apply to Bellabeat customers?
> * We know the more active our customer are the more calories they burn. The most active days of the week seem to be Sunday followed but Friday and Tuesdays
> * Light actively is the most used type of activity. There are low and high calories burn rates and we possible dive deeper into the data and see how we highlight this aspect. What excesses burn the most calories, what burns the least with that type of activity.

> * How could these trends help influence Bellabeat marketing strategy?
> > * We could use the trend to help improve sleep, workouts, calorie burn rates etc...

### Share:
> * This will be mostly apart of the Jupyter notebook.
> * What story does your data tell?
> > * We have trends for steps taken, calories burned, intensity rates, and sleep/resting times

> * How do your findings relate to your original question?
> > * By seeing the daily trends of our customer we can not only help improve their daily live but also help in acquiring new customers by word of mouth from happy customers. As well use those same improves in our marketing campaign. 

> * Who is your audience? What is the best way to communicate with them?
> > * 1. Individuals who current work out, play sports, have regular out door actives would be our biggest market.
> > * 2. Those who want to get back into shape.
> > * 3. Those who work at a desk all day, and may need reminders every hour or set to move around/light work outs.
> > * Best way to communicate is through the BellaBeat app.

> * Can data visualization help you share your findings?
> > * Absolutely. Looking at raw number can take a long for us to mentally process. 

> * Is your presentation accessible to your audience?
> > * Yes. It will be available on [Kaggle]() and [GitHub]()

### Act:
> * What is your final conclusion based on your analysis?
> > * I would personally like more data, but from what we have there are quite a few trend to build off of. Based on those trends we can market our app in ways that the current trend can be enhance or provide additional benefits

> * How can you apply your insights?
> > * I used multiple graphs and charts to get a better understand of each trend. 

> * Are there any next steps you or your stakeholders can take based on your findings?
> > * Yes. App add on/improvements.
> > * allow more data to be collected or mined from similar sources.

> * Is there additional data you could use to expand on your findings?
> > *  Yes, such as occupation, age, gender, events/activities that we are a part of.

* How can you feature your case study in your portfolio?
> > * I will use a few ways. Jupyter notebook, kaggle, and GitHub
