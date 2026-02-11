-- creating the stgaing tables as to not touch the raw data

USE citibikes_db;

--Bike staging
CREATE TABLE bikes_staging AS
SELECT * 
FROM bikes;

-- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 	
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM citibikes_db.bikes 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM citibikes_db.bikes_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'bikes' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'bikes_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;

-- citibike staging
CREATE TABLE citibike_staging AS
SELECT * 
FROM citibike;

---- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM citibikes_db.citibike 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM citibikes_db.citibike_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'citibike' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'citibike_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;
    
-- creating end stations staging table
CREATE TABLE end_stations_staging AS
SELECT * 
FROM end_stations;

-- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM citibikes_db.end_stations 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM citibikes_db.end_stations_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'end_stations' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'end_stations_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;
    
-- Creating gender table staging
CREATE TABLE IF NOT EXISTS gender_staging AS
SELECT * 
FROM citibikes_db.gender;

-- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM citibikes_db.gender 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM citibikes_db.gender_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'gender' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'gender_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;
    
-- Creating start stations staging table
CREATE TABLE IF NOT EXISTS startstations_staging AS
SELECT *
FROM citibikes_db.startstations;

-- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM citibikes_db.startstations 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM citibikes_db.startstations_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'startstations' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'startstations_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;
    
-- Creating usertype staging table
CREATE TABLE IF NOT EXISTS usertype_staging AS
SELECT *
FROM citibikes_db.usertype;

-- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM usertype 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM usertype_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'usertype' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'usertype_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;
    
-- Creating a weather staging table
CREATE TABLE IF NOT EXISTS weather_staging AS
SELECT * 
FROM weather;

-- To check whether the total number of rows and columns in the bikes table matches with the total no of rows and columns in the bikes_staging table 
WITH RawRowCount AS (
    SELECT COUNT(*) AS RawRows
    FROM weather 
),
StagingRowCount AS (
    SELECT COUNT(*) AS StagingRows
    FROM weather_staging
),
RawColCount AS (
    SELECT COUNT(*) AS RawCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'weather' AND TABLE_SCHEMA = 'citibikes_db'
),
StagingColCount AS (
    SELECT COUNT(*) AS StagingCols
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'weather_staging' AND TABLE_SCHEMA = 'citibikes_db' 
)
SELECT
    CASE
        WHEN RRC.RawRows = SRC.StagingRows AND RCC.RawCols = SCC.StagingCols THEN 'Match'
        ELSE 'Mismatch'
    END AS Status,
    RRC.RawRows,
    SRC.StagingRows,
    RCC.RawCols,
    SCC.StagingCols
FROM
    RawRowCount RRC,
    StagingRowCount SRC,
    RawColCount RCC,
    StagingColCount SCC;
    