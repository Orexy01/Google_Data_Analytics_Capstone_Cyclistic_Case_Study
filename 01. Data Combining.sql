
-- Data Combining

-- combining all 12 months' data tables into a single table containing data from Jul 2022 to Jun 2023.

CREATE TABLE IF NOT EXISTS `mainproject-393509.bike_dataset.tripdata-combined-data` AS (
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202207-01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202207-02`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202207-03`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202208-01`
UNION ALL 
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202208-02`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202209-01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202209-02`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202210-01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202210-02`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202211`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202212`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202301`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202302`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202303`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202304`
UNION ALL 
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202305-01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202305-02`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202306-01`
UNION ALL
SELECT * FROM `mainproject-393509.bike_dataset.tripdata-202306-02`);


-- checking the number of rows, which is 5,779,433

SELECT count(*)
FROM `mainproject-393509.bike_dataset.tripdata-combined-data`;

