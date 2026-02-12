-- Assigning the keys

DESCRIBE citibike_staging;

SELECT * from citibike_staging;

ALTER TABLE citibike_staging ADD COLUMN start_time_new TIME;
ALTER TABLE citibike_staging ADD COLUMN stop_time_new TIME;

UPDATE citibike_staging
SET start_time_new = STR_TO_DATE(start_time, '%h:%i:%s %p'),
    stop_time_new = STR_TO_DATE(stop_time, '%h:%i:%s %p');

ALTER TABLE citibike_staging DROP COLUMN start_time;
ALTER TABLE citibike_staging DROP COLUMN stop_time;
ALTER TABLE citibike_staging CHANGE COLUMN start_time_new start_time TIME;
ALTER TABLE citibike_staging CHANGE COLUMN stop_time_new stop_time TIME;

ALTER TABLE citibike_staging
RENAME COLUMN start_time_new TO start_time,
RENAME COLUMN stop_time_new TO stop_time;

SELECT * FROM citibike_staging;

DESCRIBE citibike_staging;

-- This is used as the birth year generates the values out of the range
SELECT birthyear FROM citibike_staging 
WHERE birthyear NOT BETWEEN 1901 AND 2155 AND birthyear != '0000';

-- changing the out of range values to null
UPDATE citibike_staging
SET birthyear = NULL
WHERE birthyear < 1901 or birthyear > 2155;

-- Displays the values where there are nulls
SELECT birthyear
FROM citibike_staging
WHERE birthyear IS NUll;

DESCRIBE citibike_staging;

ALTER TABLE citibike_staging
MODIFY COLUMN usertype VARCHAR (255),
MODIFY COLUMN birthyear YEAR;

SELECT * FROM citibike_staging;

DESCRIBE end_stations_staging;

ALTER TABLE end_stations_staging
ADD PRIMARY KEY (End_station_id), 
MODIFY COLUMN End_station_name VARCHAR(255) NOT NULL,
MODIFY COLUMN End_station_Latitude DECIMAL (8,6) NOT NULL,
MODIFY COLUMN End_station_Longitude DECIMAL(9,6)NOT NULL;

DESCRIBE end_stations_staging;

SELECT * FROM end_stations_staging;

DESCRIBE gender_staging;

ALTER TABLE gender_staging
ADD PRIMARY KEY ( Gender_id),
MODIFY COLUMN Gender_Name VARCHAR(255) NOT NULL;

SELECT * FROM gender_staging;

DESCRIBE startstations_staging;

ALTER TABLE startstations_staging
ADD PRIMARY KEY (Start_station_id),
MODIFY COLUMN Start_station_name VARCHAR(255) NOT NULL,
MODIFY COLUMN Start_station_Latitude DECIMAL(9,6)NOT NULL,
MODIFY COLUMN Start_station_Longitude DECIMAL(9,6)NOT NULL;

DESCRIBE usertype_staging;

SELECT * FROM usertype_staging;

ALTER TABLE usertype_staging
MODIFY COLUMN User_type VARCHAR(255) NOT NULL,
MODIFY COLUMN User_details VARCHAR (255);

DESCRIBE usertype_staging;

DESCRIBE weather_staging;

SELECT * FROM weather_staging;

ALTER TABLE weather_staging
MODIFY COLUMN Average_wind_speed DECIMAL(7,2) NOT NULL,
MODIFY COLUMN Precipitation DECIMAL (7,2) NOT NULL,
MODIFY COLUMN Snow DECIMAL(7,2),
MODIFY COLUMN Snow_depth DECIMAL(7,2),
MODIFY COLUMN Average_Temperature DECIMAL(7,2),
MODIFY COLUMN Max_temperature DECIMAL(7,2),
MODIFY COLUMN Min_temperature DECIMAL(7,2);

ALTER TABLE weather_staging
MODIFY COLUMN `Date` DATE;

DESCRIBE weather_staging;

-- To verify 
SELECT `DATE`, STR_TO_DATE(`DATE`, '%m/%d/%Y')
FROM weather_staging;

UPDATE weather_staging
SET `Date` = STR_TO_DATE(`Date`, '%m/%d/%Y');

ALTER TABLE weather_staging
MODIFY COLUMN `Date` DATE;

DESCRIBE weather_staging;


-- To display all the staging tables from the database to check the datatypes of the column
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    COLUMN_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
	AND TABLE_NAME LIKE '%staging%'
ORDER BY TABLE_NAME, ORDINAL_POSITION;








