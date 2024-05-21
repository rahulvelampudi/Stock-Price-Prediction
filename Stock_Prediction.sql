# Creating a database names 'assignment'
CREATE DATABASE assignment;
USE assignment;

-----------------------------------------------------------------------  'Creating Table bajaj1'  -----------------------------------------------------------------------------
#Importing and intializing 'bajaj_auto' table 
DESCRIBE bajaj_auto;
SELECT *FROM bajaj_auto;

# Adding a column 'formatted_date' containing correct format of dates
alter table `bajaj_auto`
add formatted_date date;

# Formatting Date Correctly
update bajaj_auto 
set formatted_date = str_to_date(date, '%d-%M-%Y');

# using window function, Creating a table 'bajaj1' adding columns '20 Day MA' and '50 Day MA' 
CREATE TABLE bajaj1 
SELECT Formatted_date as Date,`Close Price`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 49 PRECEDING) AS `50 Day MA`
FROM bajaj_auto;

# Checking 'bajaj1' table
SELECT *FROM bajaj1;
DESCRIBE bajaj1;


-----------------------------------------------------------------------  'Creating Table eicher1'  -----------------------------------------------------------------------------
#Importing and intializing 'eicher_motors' table 
DESCRIBE eicher_motors;
SELECT *FROM eicher_motors;

# Adding a column 'format_date' containing correct format of dates
alter table `eicher_motors`
add formatted_date date;

# Formatting Date Correctly
update eicher_motors 
set formatted_date = str_to_date(date, '%d-%M-%Y');

# using window function, Creating a table 'eicher1' adding columns '20 Day MA' and '50 Day MA' 
CREATE TABLE eicher1 
SELECT Formatted_date as Date,`Close Price`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 49 PRECEDING) AS `50 Day MA`
FROM eicher_motors;

# Checking eicher1 table
SELECT *FROM eicher1;
DESCRIBE eicher1;

-----------------------------------------------------------------------  'Creating Table hero1'  -----------------------------------------------------------------------------
#Importing and intializing 'hero_motocorp' table 
DESCRIBE hero_motocorp;
SELECT *FROM hero_motocorp;

# Adding a column 'format_date' containing correct format of dates
alter table `hero_motocorp`
add formatted_date date;

# Formatting Date Correctly
update hero_motocorp 
set formatted_date = str_to_date(date, '%d-%M-%Y');

# using window function, Creating a table 'hero1' adding columns '20 Day MA' and '50 Day MA' 
CREATE TABLE hero1 
SELECT Formatted_date as Date,`Close Price`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 49 PRECEDING) AS `50 Day MA`
FROM hero_motocorp;

# Checking 'hero1' table
SELECT *FROM hero1;
DESCRIBE hero1;

-----------------------------------------------------------------------  'Creating Table infosys1'  -----------------------------------------------------------------------------
#Importing and intializing 'infosys' table 
DESCRIBE infosys;
SELECT *FROM infosys;

# Adding a column 'format_date' containing correct format of dates
alter table `infosys`
add formatted_date date;

# Formatting Date Correctly
update infosys 
set formatted_date = str_to_date(date, '%d-%M-%Y');

# using window function, Creating a table 'infosys1' adding columns '20 Day MA' and '50 Day MA'  
CREATE TABLE infosys1
SELECT Formatted_date as Date,`Close Price`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 49 PRECEDING) AS `50 Day MA`
FROM infosys;

# Checking 'infosys1' table
SELECT *FROM infosys1;
DESCRIBE infosys1;

-----------------------------------------------------------------------  'Creating Table tcs1'  -----------------------------------------------------------------------------
# Checking 'TCS' table that was imported
DESCRIBE tcs;
SELECT *FROM tcs;

# Adding a column 'format_date' containing correct format of dates
alter table `tcs`
add formatted_date date;

# Formatting Date Correctly
update tcs 
set formatted_date = str_to_date(date, '%d-%M-%Y');

# using window function, Creating a table 'tcs1' adding columns '20 Day MA' and '50 Day MA' 
CREATE TABLE tcs1
SELECT Formatted_date as Date,`Close Price`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 49 PRECEDING) AS `50 Day MA`
FROM tcs;

# Checking 'tcs1' table
SELECT *FROM tcs1;
DESCRIBE tcs1;

-----------------------------------------------------------------------  'Creating Table tvs1'  -----------------------------------------------------------------------------
#Importing and intializing 'tvs_motors' table 
DESCRIBE tvs_motors;
SELECT *FROM tvs_motors;

# Adding a column 'format_date' containing correct format of dates
alter table `tvs_motors`
add formatted_date date;

# Formatting Date Correctly
update tvs_motors 
set formatted_date = str_to_date(date, '%d-%M-%Y');

# Creating table 'tvs1' adding columns '20 Day MA' and '50 Day MA' using window function
CREATE TABLE tvs1
SELECT Formatted_date as Date,`Close Price`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER(ORDER BY formatted_date ROWS 49 PRECEDING) AS `50 Day MA`
FROM tvs_motors;

# checking 'tvs1' table
SELECT *FROM tvs1;
DESCRIBE tvs1;

-----------------------------------------------------------------------  'Creating Table bajaj2'  -----------------------------------------------------------------------------
# Creating a table using case statements as 'bajaj2' and adding it as 'signal'
CREATE TABLE bajaj2
SELECT Date, `Close Price`,
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END AS 'Signal'
FROM bajaj1;

# Checking table 'bajaj2'
SELECT *FROM bajaj2;
DESCRIBE bajaj2;

-----------------------------------------------------------------------  'Creating Table eicher2'  -----------------------------------------------------------------------------
# Creating a table using case statements as 'eicher2' and adding it as 'signal'
CREATE TABLE eicher2
SELECT Date, `Close Price`,
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END AS 'Signal'
FROM eicher1;

# Checking table 'eicher2'
SELECT *FROM eicher2;
DESCRIBE eicher2;

-----------------------------------------------------------------------  'Creating Table hero2'  -----------------------------------------------------------------------------
# Creating a table using case statements as 'hero2' and adding it as 'signal'
CREATE TABLE hero2
SELECT Date, `Close Price`,
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END AS 'Signal'
FROM hero1;

# Checking table 'hero2'
SELECT *FROM hero2;
DESCRIBE hero2;

-----------------------------------------------------------------------  'Creating Table infosys2'  -----------------------------------------------------------------------------
# Creating a table using case statements as 'infosys2' and adding it as 'signal'
CREATE TABLE infosys2
SELECT Date, `Close Price`,
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END AS 'Signal'
FROM infosys1;

# Checking table 'infosys2'
SELECT *FROM infosys2;
DESCRIBE infosys2;

-----------------------------------------------------------------------  'Creating Table tcs2'  -----------------------------------------------------------------------------
# Creating a table using case statements as 'tcs2' and adding it as 'signal'
CREATE TABLE tcs2
SELECT Date, `Close Price`,
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END AS 'Signal'
FROM tcs1;

# Checking table 'tcs2'
SELECT *FROM tcs2;
DESCRIBE tcs2;

-----------------------------------------------------------------------  'Creating Table tvs2'  -----------------------------------------------------------------------------
# Creating a table using case statements as 'tvs2' and adding it as 'signal'
CREATE TABLE tvs2
SELECT Date, `Close Price`,
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END AS 'Signal'
FROM tvs1;

# checking table 'tvs2'
SELECT *FROM tvs2;
DESCRIBE tvs2;

-------------------------------------------------------------------- Creating master table assignment ----------------------------------------------------------------------------
CREATE TABLE assignment (
    Date DATE,
    Bajaj DOUBLE,
    TCS DOUBLE,
    TVS DOUBLE,
    Infosys DOUBLE,
    Eicher DOUBLE,
    Hero DOUBLE
);

insert into assignment (Date, Bajaj, TCS, TVS, Infosys, Eicher, Hero )

SELECT 
    b.Date,
    b.`Close Price`,
    tc.`Close Price`,
    tv.`Close Price`,
    i.`Close Price`,
    e.`Close Price`,
    h.`Close Price`
FROM
    bajaj1 b
        LEFT JOIN
    tcs1 tc ON tc.Date = b.Date
        LEFT JOIN
    tvs1 tv ON tv.Date = b.Date
        LEFT JOIN
    infosys1 i ON i.Date = b.Date
        LEFT JOIN
    eicher1 e ON e.Date = b.Date
        LEFT JOIN
    hero1 h ON h.Date = b.Date
ORDER BY b.Date;
        
# Inspecting table 'assignment'
SELECT *FROM assignment;
Describe assignment;

-------------------------------------------------------------------- Creating User Defined Fucntion 'Signal_bajaj' ----------------------------------------------------------------------------
CREATE FUNCTION signal_create(d varchar(15))
	RETURNS char(5) DETERMINISTIC    
RETURN(SELECT 
CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` THEN 'SELL'
ELSE 'HOLD'
END
FROM bajaj1
WHERE d = Date); 

# Checking the date by'2015-03-20'
SELECT signal_create('2015-02-20') AS `Signal`;