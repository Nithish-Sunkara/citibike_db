-- Creatinng a datatbase
CREATE DATABASE IF NOT EXISTS citibikes_db;

-- Using the database citibikes_db;
USE citibikes_db;

-- Creating a table for bikes
CREATE TABLE IF NOT EXISTS Bikes (
Bike_id INT PRIMARY KEY
);

-- loading the file into the bikes table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bikes.csv'
INTO TABLE Bikes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) AS Total_rows
FROM bikes;

-- creating a table for citibikes
CREATE TABLE IF NOT EXISTS citibike (
Trip_duration INT, 
Start_time TEXT,
Stop_time TEXT,
start_station_id INT, 
end_station_id INT,
bike_id INT, 
usertype TEXT,
birthyear TEXT,
gender INT
);

-- loading the file into the citibike table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/citibike.csv'
INTO TABLE citibike
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) As total_rows
FROM citibike;

-- creating a table for Endstations
CREATE TABLE IF NOT EXISTS end_stations (
End_station_id INT,
End_station_name TEXT,
End_station_Latitude DOUBLE,
End_station_Longitude DOUBLE
);

-- loading the file into the endstation table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EndStations.csv'
INTO TABLE end_stations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) AS Total_rows
FROM end_stations;

-- creating a table for Gender
CREATE TABLE IF NOT EXISTS gender (
Gender_id INT PRIMARY KEY,
Gender_name TEXT
);

-- loading the file into the gender table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Gender.csv'
INTO TABLE gender
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) AS Total_rows
FROM gender;

-- creating a table for weather
CREATE TABLE IF NOT EXISTS Weather (
`Date` TEXT, 
Average_wind_speed DOUBLE,
Precipitation DOUBLE,
Snow INT,
Snow_depth INT,
Average_Temperature INT,
Max_temperature INT,
Min_temperature INT
);

-- loading the file into the weather table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCWeatherComplete.csv'
INTO TABLE weather
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) As Total_rows
FROM weather;

-- creating a table for Startstations
CREATE TABLE IF NOT EXISTS Startstations (
Start_station_id INT,
Start_station_name TEXT,
Start_station_Latitude DOUBLE,
Start_station_Longitude DOUBLE
);

-- loading the file into the Startstations table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/StartStations.csv'
INTO TABLE Startstations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) AS Total_rows
FROM Startstations;

-- creating a table for UserType
CREATE TABLE IF NOT EXISTS Usertype (
User_type TEXT,
User_details TEXT
);

-- loading the file into the USerType table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UserType.csv'
INTO TABLE Usertype
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Checking whether all the rows have been loaded into the table or not
SELECT COUNT(*) AS Total_rows
FROM Usertype;