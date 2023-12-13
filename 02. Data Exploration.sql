-- Data Exploration

-- Checking the data types of all columns

SELECT column_name, data_type
FROM `mainproject-393509.bike_dataset`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'tripdata-combined-data';

-- checking for number of null values in all columns

SELECT
  COUNTIF(ride_id IS NULL) AS ride_id_null_count,
  COUNTIF(rideable_type IS NULL) AS rideable_type_null_count,
  COUNTIF(started_at IS NULL) AS started_at_null_count,
  COUNTIF(ended_at IS NULL) AS ended_at_null_count,
  COUNTIF(start_station_name IS NULL) AS start_station_name_null_count,
  COUNTIF(start_station_id IS NULL) AS start_station_id_null_count,
  COUNTIF(end_station_name IS NULL) AS end_station_name_null_count,
  COUNTIF(end_station_id IS NULL) AS end_station_id_null_count,
  COUNTIF(start_lat IS NULL) AS start_lat_null_count,
  COUNTIF(start_lng IS NULL) AS start_lng_null_count,
  COUNTIF(end_lat IS NULL) AS end_lat_null_count,
  COUNTIF(end_lng IS NULL) AS end_lng_null_count,
  COUNTIF(member_casual IS NULL) AS member_casual_null_count
FROM
  `mainproject-393509.bike_dataset.tripdata-combined-data`;

-- checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`;

-- ride_id - length of 16, only one have a ride length of 14

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_ride_id
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
GROUP BY length_ride_id;

-- *rideable_type* - They all have 3 unique types of bikes

SELECT DISTINCT rideable_type, count(rideable_type) AS No_of_trips
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
GROUP BY rideable_type;

-- started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss (To find the Number of trips that are more than a day and less than a minute)

SELECT 
  started_at,
  ended_at,
  TIMESTAMP_DIFF(ended_at, started_at, day) AS duration_day
FROM
  `mainproject-393509.bike_dataset.tripdata-combined-data`
ORDER BY
duration_day desc;

SELECT COUNT(*) AS more_than_a_day
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60
) >= 1440;              -- longer than a day = 5087

-- less than a minute

SELECT COUNT(*) AS less_than_a_minute
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) < 1;  --less_than_a_minute = 149,372

-- There are 1,821 unique end stations and 1 null
SELECT DISTINCT end_station_name
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
ORDER BY end_station_name; 

-- end_station_name, end_station_id - total 915,796 rows with both end station name and id missing

SELECT COUNT(ride_id) AS rows_with_missing_values          
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

--start_lat, start_lng - No Null values

SELECT COUNT(ride_id) AS rows_with_missing_values
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
WHERE start_lat IS NULL OR start_lng IS NULL;

--end_lat, end_lng - total 5795 rows with both end_lat and end_lng missing

SELECT COUNT(ride_id) AS rows_with_missing_values
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
WHERE end_lat IS NULL OR end_lng IS NULL;

-- *member_casual* - There are 2 unique values - member and casual riders

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
GROUP BY member_casual;
-- member: 3535191 Number of trips
-- casual: 2244242 Number of trips
