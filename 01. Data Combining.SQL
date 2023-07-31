/* I had to work with 6 previous months containing data from Jan 2023 to Jun 2023 */

-- Data Combining

-- combining all the 6 months data tables into a single table containing data from Jan 2023 to Jun 2023.

CREATE TABLE IF NOT EXISTS `mainproject-393509.bike_dataset.tripdata_combined_data` AS (
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202301`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202302`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202303`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202304`
UNION ALL 
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202305_01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202305_02`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202306_01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata_202306_02`);

-- checking no of rows which are 2,390,459

SELECT count(*)
FROM `mainproject-393509.bike_dataset.tripdata_combined_data`;
