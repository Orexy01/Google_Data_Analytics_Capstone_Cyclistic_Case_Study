# Google_Data_Analytics_Capstone_Cyclistic_Case_Study

Course: <a href="https://www.coursera.org/learn/google-data-analytics-capstone">Google Data Analytics Capstone: Complete a Case Study</a>
## Introduction
<p>This capstone project marks the end of all my learning throughout the courses of the <a href= "https://www.coursera.org/professional-certificates/google-data-analytics">Google Data Analytics Professional Certificate</a>.  In this case study, I will analyze a public dataset for a fictitious company, Cyclistic. I will follow the steps of the data analysis process: <a href= "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/README.md#ask">Ask</a>, <a href= "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/README.md#prepare">Prepare</a>, <a href= "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/README.md#process">Process</a>, <a href= "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/README.md#analyze">Analyze</a>, Share, and <a href= "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/README.md#act">Act</a> to answer the key business questions.</p>

Data Source: <a href ="https://divvy-tripdata.s3.amazonaws.com/index.html">divvy_tripdata </a>.

SQL Queries:
01. <a href = "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/01.%20Data%20Combining.sql"> Data Combining</a> 
02. <a href = "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/02.%20Data%20Exploration.sql"> Data Exploration</a>
03. <a href = "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/03.%20Data%20Cleaning.sql">Data Cleaning</a>
04. <a href = "https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/04.%20Data%20Analysis.sql">Data Analysis</a>

Data Visualizations: <a href = "https://public.tableau.com/app/profile/oreoluwa.folorunsho./viz/GoogleCapstoneProject-CyclisticBikeShare/Dashboard2">Tableau</a>

## Background
### Scenario
<p>I am assuming a role as a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.</p>

### Cyclistic Company
<p>Cyclistic is a fictional bike-share company based in Chicago. Cyclistic operates a fleet of 5800 bicycles which can be accessed in 600 docking stations across Chicago. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.</p>

## Data Analysis Processes

### 1. Ask

#### Business Task: 
Design marketing strategies aimed at converting casual riders into annual members.

#### Analysis question: 
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### 2. Prepare
<p>I will use Cyclistic’s historical trip data to analyze and identify trends from Jul 2022 to Jun 2023 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).</p>

#### Data Organization
<p>There are 12 files with the file name format bike_dataset, and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.</p>

### 3. Process
I will use Google Big Query to combine the various datasets into one dataset and clean it.    
__Reason:__ *The Microsoft Excel spreadsheet can only have 1,048,576 rows because of its inability to manage large amounts of data. Using BigQuery supports huge volumes of data and the Cyclistic dataset has more than 5.6 million rows.*
### Combining the Data
SQL Query: [Data Combining](https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/01.%20Data%20Combining.sql)  
12 CSV files are uploaded as tables in the dataset 'tripdata_2022'. Another table named "tripdata-combined-data" was created, containing 5,779,433 rows of data for the entire year. 
### Data Exploration
SQL Query: [Data Exploration](https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/02.%20Data%20Exploration.sql)  
Before cleaning the data, I had to familiarize myself with the data to find the inconsistencies, and what I observed are as follows:

1. The table below shows all column names and their data types. The ride_id column is our primary key.
   
 ![image](https://user-images.githubusercontent.com/125132307/226139161-c5209861-7542-4ad6-8d9a-ce0115086e4d.png)

2. When checking the dataset for __null values__, the following columns shows number of __null values__ in them:
   *start_station_name = 833064, 
    start_station_id = 833064, 
    end_station_name = 915,796, 
    end_station_id = 915,796
    end_lat = 5795, 
    end_lng = 5795.*
   
3. As ride_id has no null values, I checked for duplicates and found no duplicate rows in the data.
   *"SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
   FROM `mainproject-393509.bike_dataset.tripdata-combined-data`;"*

4. There are 3 unique types of bikes(rideable_type) in our data.
   *electric_bike = 3,032,029, 
    classic_bike = 2,457,214, 
    docked_bike = 140,474.*

5. <p>The started_at and ended_at show start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. A new column ride_length was created to find the total trip duration. 5087 trips have a duration longer than a day and 149,372 trips have less than a minute duration or have an end time earlier than the start time. Other columns day_of_week and month can also be helpful in the analysis of trips at different times in a year.</p>

6. The member_casual column has 2 unique values as a member or casual rider.
*member = 3,440,665, 
casual = 2,189,396*

7. <p>Columns that need to be removed are start_station_id and end_station_id as they do not add value to the analysis of our current problem. The longitude and latitude location columns may not be used in analysis but can be used to visualize a map.</p> 

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/03.%20Data%20Cleaning.sql)   
1. 3 more columns were added. i.e. ride_length for the duration of the trip, day_of_week, and month.  
2. Trips with a duration of less than a minute and longer than a day were excluded.
3. A total of 149,399 rows were removed in this step

## Analyze and Share
SQL Query: [Data Analysis](https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/04.%20Data%20Analysis.sql)  
Data Visualization: [Tableau](https://public.tableau.com/app/profile/oreoluwa.folorunsho./viz/GoogleCapstoneProject-CyclisticBikeShare/Dashboard2)  

<p>The stored data is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.</p>
<p>Analysis question 1: How do annual members and casual riders use Cyclistic bikes differently?</p>

#### A. Member and casual riders are compared by the type of bikes they use.

The member riders make up 61% of the total rides while the remaining 39% constitutes casual riders. The chart below shows the distribution of member and casual riders based on bike types. The most used bike is the electric bike followed by the classic bike. Docked bikes are used the least by only the casual riders.

|Total|Casual|Member|
|-----|------|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/a7c216af-0519-4c55-8736-bc37b34f566d" width="320" height="254"/>|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/b7ede0fd-4adc-40c4-8baa-a2277bb6021b" width="300" height="252"/>|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/3c081ba2-0a87-4cd1-b4e2-5ded3153a140" width="300" height="252"/>|

#### B. Ride duration of the trips was compared to find the differences in the behavior of casual and member riders' average ride length.
<p>The average ride duration for members exhibits slight fluctuations throughout the day, with a consistent rise from spring to summer followed by a decline in fall. Conversely, casual riders display variations in their cycling durations. During spring and summer, casual users demonstrate an increase in average ride duration, particularly at 3pm when they cover greater distances. Between five and eight in the morning, they typically embark on shorter trips.</p>

|Casual|
|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/6780f77c-ee65-4e34-a653-d1e49dcc448f" width="850" height="250"/>|

|Member|
|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/8c00fb01-4f84-4b2e-9a1e-d1f486410066" width="850" height="250"/>|

<p>When comparing the days of the week, it's evident that casual riders tend to take more trips on weekends, particularly on Sundays. Conversely, members also exhibit an increase in journeys on weekends. These observations suggest that casual commuters travel longer distances (approximately twice as much) but less frequently compared to members. They make longer journeys on weekends and during the day outside of commuting hours and in the spring and summer seasons. </p>

|Casual|Member|
|------|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/f0f680a7-fea5-4018-9624-99985740a7c3" width="500" height="350"/>|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/cacb320b-f187-40e7-a1d7-12118c2c1d8e" width="500" height="350"/>|

#### C. The number of trips distributed by the months, days of the week, and hours of the day are examined.

__Months__: Monthly trip patterns show similar behavior for both casual riders and members, with a higher number of trips occurring during the spring and summer months and a decrease in the winter. Casual riders tend to have their highest number of rides in July, while member riders peak in August.

__Hours of the Day__: Members exhibit two peak periods in terms of the number of trips: one occurring early in the morning, typically between 7 am and 9 am, and the other in the evening, usually between 4 pm and 6 pm. In contrast, the number of trips for casual riders steadily increases throughout the day, reaching its highest peak at 5 pm before gradually decreasing thereafter.

|Casual|
|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/7b294cad-d19c-4a71-953e-e66ea7c25775" width="850" height="250"/>|

|Member|
|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/c2d300c3-c524-4cef-aa44-c13dc0e78a86" width="850" height="250"/>|

__Days of Week__: When comparing days of the week, it's observed that casual riders make the most journeys on Saturdays. In contrast, members show a decline in trips over the weekend compared to other days of the week.

|Casual|Member|
|------|------|
|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/18d09519-7a19-4d2e-868a-e393a707b3e4" width="500" height="350"/>|<img src="https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/assets/110780775/59402ea7-58fe-4310-a62e-57512c304c82" width="500" height="350"/>|

<p>Based on the above observations, it can be inferred that members likely use bikes for commuting to and from work on weekdays, explaining the peaks in trips during morning and evening rush hours. On the other hand, casual riders seem to utilize bikes throughout the day, particularly on weekends, possibly for leisure activities. Both groups are most active during the summer and spring seasons.</p>

## Act
After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.  
Recommendations: 
1. Emphasize the benefits of memberships, including discounts during busy times of the year like during Summer, or on the weekends.
2. Marketing campaigns might be conducted in spring and summer at tourist/recreational locations popular among casual riders.
3. Consider offering seasonal or weekend-only memberships to consistent casual riders with good average ride lengths, who are active during the summer and spring seasons and on weekends.
