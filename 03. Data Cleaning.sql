-- Data Cleaning
DROP TABLE IF EXISTS `mainproject-393509.bike_dataset.tripdata-cleaned-combined-data`;

CREATE TABLE IF NOT EXISTS `mainproject-393509.bike_dataset.tripdata-cleaned-combined-data`  --creating a new table
AS (
  SELECT   
    a.ride_id,  --a is an alias for the table. The ride_length column is selected from the derived table b, which is a result of a subquery.
    rideable_type, 
    started_at, 
    ended_at, 
    ride_length,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_min,
    EXTRACT(HOUR FROM started_at) AS ride_hours,
    CASE EXTRACT(DAYOFWEEK FROM started_at) -- CASE statement is used to create a new column named day_of_week
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at) --CASE statement is also used to create a new column named month
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,  --It extracts the month from the 'started_at' and assigns a corresponding label (e.g.'JAN', 'FEB', etc.) based on the month number.
    member_casual
  FROM `mainproject-393509.bike_dataset.tripdata-combined-data` a
  JOIN (
    SELECT
      ride_id,
      FORMAT('%02d:%02d:%02d', 
      EXTRACT(HOUR FROM (ended_at - started_at)),
      EXTRACT(MINUTE FROM (ended_at - started_at)),
      EXTRACT(SECOND FROM (ended_at - started_at))
    ) AS ride_length
    FROM `mainproject-393509.bike_dataset.tripdata-combined-data`
  ) b  -- This part of the query joins the original tripdata-combined-data table (a) with a subquery (b) using the ride_id column. The subquery exclude the ride_length that is < 0 minutes, which is then used to join the tables.
  ON a.ride_id = b.ride_id
  WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
);

-- Set ride_id as primary key

ALTER TABLE `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;

SELECT COUNT(ride_id) AS no_of_rows       -- returned 1,820,719 rows, so 569,740 rows removed.
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`;
