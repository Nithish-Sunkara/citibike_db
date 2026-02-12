-- Data Cleaning

USE citibikes_db;

DESCRIBE citibike_staging;

-- To check the duplicates
WITH DUPLICATE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Trip_duration, start_station_id, end_station_id, bike_id, usertype, birthyear, gender, start_time, stop_time) AS row_num
FROM citibike_staging
)
SELECT *
FROM DUPLICATE_CTE
WHERE row_num > 1;


-- creating the second stsging table as we cannot delete the duplicates from the CTE
CREATE TABLE IF NOT EXISTS citibike_staging2 
( Trip_duration INT, start_station_id INT, end_station_id INT, bike_id INT, usertype VARCHAR(255), birthyear YEAR, gender INT, start_time TIME, stop_time TIME, row_num INT); 

INSERT INTO citibikes_db.citibike_staging2 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Trip_duration, start_station_id, end_station_id, bike_id, usertype, birthyear, gender, start_time, stop_time) AS row_num
FROM citibike_staging;

-- CHECK THE NUMBER OF ROWS 
select count(*) AS total_rows
from citibike_staging2;

-- To check the citibike staging 2 table
SELECT * FROM citibike_staging2;

-- DISPLAYS ALL THE DUPLICATES
SELECT *
FROM citibike_staging2
WHERE row_num >1;

-- delete DUPLICATES
delete 
from citibike_staging2
where row_num > 1;

DESCRIBE end_stations_staging;

-- To check the duplicates
WITH DUPLICATE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY End_station_id, end_station_name, end_station_Latitude, end_station_Longitude) AS row_num
FROM end_stations_staging
)
SELECT *
FROM DUPLICATE_CTE
WHERE row_num > 1;

DESCRIBE end_stations_staging;

-- creating the second stsging table as we cannot delete the duplicates from the CTE
CREATE TABLE IF NOT EXISTS end_stations_staging2 
(End_station_id INT, end_station_name VARCHAR(255), end_station_Latitude DECIMAL(9,6), end_station_Longitude DECIMAL(9,6), row_num INT); 

INSERT INTO citibikes_db.end_stations_staging2 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY End_station_id, end_station_name, end_station_Latitude, end_station_Longitude) AS row_num
FROM end_stations_staging;

-- CHECK THE NUMBER OF ROWS 
select count(*) AS total_rows
from end_stations_staging2;

-- To check the citibike staging 2 table
SELECT * FROM end_stations_staging2;

-- DISPLAYS ALL THE DUPLICATES
SELECT *
FROM end_stations_staging2
WHERE row_num >1;

-- delete DUPLICATES
delete 
from end_stations_staging2
where row_num > 1;

DESCRIBE gender_staging;

-- writing the cte by assigning the row number to the table to identify the duplicates
WITH DUPLICATE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Gender_id, Gender_Name) AS row_num
FROM gender_staging
)
SELECT *
FROM DUPLICATE_CTE
WHERE row_num > 1;

DESCRIBE gender_staging;

-- creating the second stsging table as we cannot delete the duplicates from the CTE
CREATE TABLE IF NOT EXISTS gender_staging2 
(Gender_id INT, Gender_name VARCHAR(255), row_num INT); 

INSERT INTO citibikes_db.gender_staging2 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Gender_id, Gender_name) AS row_num
FROM gender_staging;

-- CHECK THE NUMBER OF ROWS 
select count(*) AS total_rows
from gender_staging2;

-- To check the citibike staging 2 table
SELECT * FROM gender_staging2;

-- DISPLAYS ALL THE DUPLICATES
SELECT *
FROM gender_staging2
WHERE row_num >1;

-- delete DUPLICATES
delete 
from gender_staging2
where row_num > 1;

DESCRIBE startstations_staging;

-- To check the duplicates
WITH DUPLICATE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Start_station_id, Start_station_name, Start_station_Latitude, Start_station_Longitude) AS row_num
FROM start_stations_staging
)
SELECT *
FROM DUPLICATE_CTE
WHERE row_num > 1;

DESCRIBE start_stations_staging;

-- creating the second stsging table as we cannot delete the duplicates from the CTE
CREATE TABLE IF NOT EXISTS start_stations_staging2 
(Start_station_id INT, Start_station_name VARCHAR(255), Start_station_Latitude DECIMAL(9,6), Start_station_Longitude DECIMAL(9,6), row_num INT); 

INSERT INTO citibikes_db.start_stations_staging2 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Start_station_id, Start_station_name, Start_station_Latitude, Start_station_Longitude) AS row_num
FROM start_stations_staging;

-- CHECK THE NUMBER OF ROWS 
select count(*) AS total_rows
from start_stations_staging2;

-- To check the citibike staging 2 table
SELECT * FROM start_stations_staging2;

-- DISPLAYS ALL THE DUPLICATES
SELECT *
FROM start_stations_staging2
WHERE row_num >1;

-- delete DUPLICATES
delete 
from start_stations_staging2
where row_num > 1;

DESCRIBE usertype_staging;

-- To check the duplicates
WITH DUPLICATE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY User_type, User_details) AS row_num
FROM usertype_staging
)
SELECT *
FROM DUPLICATE_CTE
WHERE row_num > 1;

DESCRIBE usertype_staging;

-- creating the second stsging table as we cannot delete the duplicates from the CTE
CREATE TABLE IF NOT EXISTS usertype_staging2 
(User_Type VARCHAR(255), User_Details VARCHAR(255), row_num INT); 

INSERT INTO citibikes_db.usertype_staging2 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY User_Type, User_Details) AS row_num
FROM usertype_staging;

-- CHECK THE NUMBER OF ROWS 
select count(*) AS total_rows
from usertype_staging2;

-- To check the citibike staging 2 table
SELECT * FROM usertype_staging2;

-- DISPLAYS ALL THE DUPLICATES
SELECT *
FROM usertype_staging2
WHERE row_num >1;

-- delete DUPLICATES
delete 
from usertype_staging2
where row_num > 1;

DESCRIBE weather_staging;

-- To check the duplicates
WITH DUPLICATE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY `DATE`, Average_wind_speed, Precipitation, Snow, Snow_depth, Average_Temperature, Max_temperature, Min_temperature) AS row_num
FROM weather_staging
)
SELECT *
FROM DUPLICATE_CTE
WHERE row_num > 1;

DESCRIBE weather_staging;

-- creating the second stsging table as we cannot delete the duplicates from the CTE
CREATE TABLE IF NOT EXISTS weather_staging2 
( `DATE` DATE, Average_wind_speed DECIMAL(7,2), Precipitation DECIMAL(7,2), Snow DECIMAL(7,2), Snow_depth DECIMAL(7,2), Average_Temperature DECIMAL(7,2), Max_temperature DECIMAL(7,2), Min_temperature DECIMAL(7,2), row_num INT); 

INSERT INTO weather_staging2 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY `DATE`, Average_wind_speed, Precipitation, Snow, Snow_depth, Average_Temperature, Max_temperature, Min_temperature) AS row_num
FROM weather_staging;

-- CHECK THE NUMBER OF ROWS 
select count(*) AS total_rows
from weather_staging2;

-- To check the citibike staging 2 table
SELECT * FROM weather_staging2;

-- DISPLAYS ALL THE DUPLICATES
SELECT *
FROM weather_staging2
WHERE row_num >1;

-- delete DUPLICATES
delete 
from weather_staging2
where row_num > 1;