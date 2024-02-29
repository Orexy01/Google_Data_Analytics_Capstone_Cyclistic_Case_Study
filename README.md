# Google_Data_Analytics_Capstone_Cyclistic_Case_Study

Course: <a href="https://www.coursera.org/learn/google-data-analytics-capstone">Google Data Analytics Capstone: Complete a Case Study</a>
## Introduction
<p>This capstone project marks the end of all my learning throughout the courses of the <a href= "https://www.coursera.org/professional-certificates/google-data-analytics">Google Data Analytics Professional Certificate</a>.  In this case study, I will analyze a public dataset for a fictitious company, Cyclistic. I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act to answer the key business questions.</p>

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
*Reason: The Microsoft Excel spreadsheet can only have 1,048,576 rows because of its inability to manage large amounts of data. Using BigQuery supports huge volumes of data and the Cyclistic dataset has more than 5.6 million rows.*
### Combining the Data
SQL Query: [Data Combining](https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/01.%20Data%20Combining.sql)  
12 CSV files are uploaded as tables in the dataset 'tripdata_2022'. Another table named "tripdata-combined-data" was created, containing 5,779,433 rows of data for the entire year. 
### Data Exploration
SQL Query: [Data Exploration](https://github.com/git-oreoluwa/Google_Data_Analytics_Capstone_Cyclistic_Case_Study/blob/main/02.%20Data%20Exploration.sql)  
Before cleaning the data, I familiarized myself with the data to find the inconsistencies.  
