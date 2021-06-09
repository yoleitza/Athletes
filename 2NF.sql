USE Athletes

--  Alter Teams Table to include a TeamId --

ALTER TABLE Teams
ADD TeamId varchar(20);  --cloumn initially has to admit NULL vaues because it is empty --

SELECT * FROM Teams

UPDATE Teams
	SET TeamID= 'T1'
	WHERE noc='CHN';

UPDATE Teams
	SET TeamID= 'T2'
	WHERE noc='DEN';


UPDATE Teams
	SET TeamID= 'T3'
	WHERE noc='EST';


UPDATE Teams
	SET TeamID= 'T4'
	WHERE noc='FIN';


UPDATE Teams
	SET TeamID= 'T5'
	WHERE noc='FRA';


UPDATE Teams
	SET TeamID= 'T6'
	WHERE noc='NED';


UPDATE Teams
	SET TeamID= 'T7'
	WHERE noc='NOR';


UPDATE Teams
	SET TeamID= 'T8'
	WHERE noc='ROU';


UPDATE Teams
	SET TeamID= 'T9'
	WHERE noc='USA';

SELECT * FROM Teams

ALTER TABLE Teams
ALTER COLUMN TeamId varchar(20) NOT NULL;  --Added the NOT NULL condition to the column --

ALTER TABLE Teams 
DROP COLUMN noc;

--  Update Athletes Table to include the TeamID  --

SELECT * FROM Athletes

ALTER TABLE Athletes
ADD TeamId varchar(20);

UPDATE Athletes
	SET TeamID= 'T1'
	WHERE team='China';

UPDATE Athletes
	SET TeamID= 'T2'
	WHERE team='Denmark';

UPDATE Athletes
	SET TeamID= 'T2'
	WHERE team='Denmark/Sweden';

UPDATE Athletes
	SET TeamID= 'T3'
	WHERE team='Estonia';

UPDATE Athletes
	SET TeamID= 'T4'
	WHERE team='Finland';

UPDATE Athletes
	SET TeamID= 'T5'
	WHERE team='France';

UPDATE Athletes
	SET TeamID= 'T6'
	WHERE team='Netherlands';

UPDATE Athletes
	SET TeamID= 'T7'
	WHERE team='Norway';

UPDATE Athletes
	SET TeamID= 'T8'
	WHERE team='Romania';

UPDATE Athletes
	SET TeamID= 'T9'
	WHERE team='United States';

ALTER TABLE Athletes
ALTER COLUMN TeamId varchar(20) NOT NULL;  --data type changed, added NOT NULLS --


SELECT * FROM Athletes

--Once the TeamId was inserted, the column Team is dropped since it's not needed anymore --

ALTER TABLE Athletes 
DROP COLUMN team;

--  Create a GameId in the Games Table --

SELECT * FROM Games

ALTER TABLE Games
ADD GameId varchar(20);

UPDATE Games 
SET GameId=CASE
	WHEN games='1900 Summer' THEN 'G1'
	WHEN games='1912 Summer' THEN 'G2'
	WHEN games='1920 Summer' THEN 'G3'
	WHEN games='1924 Summer' THEN 'G4' 
	WHEN games='1932 Summer' THEN 'G5'
	WHEN games='1936 Summer' THEN 'G6' 
	WHEN games='1948 Summer' THEN 'G7' 
	WHEN games='1952 Summer' THEN 'G8' 
	WHEN games='1960 Winter' THEN 'G9' 
	WHEN games='1964 Winter' THEN 'G10' 
	WHEN games='1968 Summer' THEN 'G11' 
	WHEN games='1972 Summer' THEN 'G12' 
	WHEN games='1980 Winter' THEN 'G13'
	WHEN games='1984 Summer' THEN 'G14'
	WHEN games='1984 Winter' THEN 'G15'
	WHEN games='1988 Summer' THEN 'G16'
	WHEN games='1988 Winter' THEN 'G17'
	WHEN games='1992 Summer' THEN 'G18'
	WHEN games='1992 Winter' THEN 'G19'
	WHEN games='1994 Winter' THEN 'G20'
	WHEN games='1996 Summer' THEN 'G21'
	WHEN games='1998 Winter' THEN 'G22'
	WHEN games='2000 Summer' THEN 'G23'
	WHEN games='2002 Winter' THEN 'G24'
	WHEN games='2004 Summer' THEN 'G25'
	WHEN games='2006 Winter' THEN 'G26'
	WHEN games='2008 Summer' THEN 'G27'
	WHEN games='2012 Summer' THEN 'G28'
	WHEN games='2014 Winter' THEN 'G29'
	WHEN games='2016 Summer' THEN 'G30'
	END;


ALTER TABLE Games   --Dropped the games column once the GameId was inserted--
DROP COLUMN games;

ALTER TABLE Games
ALTER COLUMN GameId varchar(20) NOT NULL;  -- Added the NOT NULL condition to the GameId column--

--  Include the GameID in the Medals Table --
-- Drop the Athlete's name column and leave only the Id --

SELECT * FROM Medals

ALTER TABLE Medals
ADD GameId varchar(20);

UPDATE Medals 
SET GameId=CASE
	WHEN games='1900 Summer' THEN 'G1'
	WHEN games='1912 Summer' THEN 'G2'
	WHEN games='1920 Summer' THEN 'G3'
	WHEN games='1924 Summer' THEN 'G4' 
	WHEN games='1932 Summer' THEN 'G5'
	WHEN games='1936 Summer' THEN 'G6' 
	WHEN games='1948 Summer' THEN 'G7' 
	WHEN games='1952 Summer' THEN 'G8' 
	WHEN games='1960 Winter' THEN 'G9' 
	WHEN games='1964 Winter' THEN 'G10' 
	WHEN games='1968 Summer' THEN 'G11' 
	WHEN games='1972 Summer' THEN 'G12' 
	WHEN games='1980 Winter' THEN 'G13'
	WHEN games='1984 Summer' THEN 'G14'
	WHEN games='1984 Winter' THEN 'G15'
	WHEN games='1988 Summer' THEN 'G16'
	WHEN games='1988 Winter' THEN 'G17'
	WHEN games='1992 Summer' THEN 'G18'
	WHEN games='1992 Winter' THEN 'G19'
	WHEN games='1994 Winter' THEN 'G20'
	WHEN games='1996 Summer' THEN 'G21'
	WHEN games='1998 Winter' THEN 'G22'
	WHEN games='2000 Summer' THEN 'G23'
	WHEN games='2002 Winter' THEN 'G24'
	WHEN games='2004 Summer' THEN 'G25'
	WHEN games='2006 Winter' THEN 'G26'
	WHEN games='2008 Summer' THEN 'G27'
	WHEN games='2012 Summer' THEN 'G28'
	WHEN games='2014 Winter' THEN 'G29'
	WHEN games='2016 Summer' THEN 'G30'
	END;

SELECT * FROM Medals 

ALTER TABLE Medals
ALTER COLUMN GameId varchar(20) NOT NULL;  -- Added the NOT NULL condition to the GameId column--

ALTER TABLE Medals   --Dropped the games column once the GameId was inserted--
DROP COLUMN games;

--Add TeamId  into the Medals Table --

ALTER TABLE Medals
ADD TeamId varchar(20);

UPDATE Medals 
SET TeamId=CASE
	WHEN team='China' THEN 'T1'
	WHEN team='Denmark' THEN 'T2'
	WHEN team='Denmark/Sweden' THEN 'T2'
	WHEN team='Estonia' THEN 'T3'
	WHEN team='Finland' THEN 'T4'
	WHEN team='France' THEN 'T5'
	WHEN team='Netherlands' THEN 'T6'
	WHEN team='Norway' THEN 'T7'
	WHEN team='Romania' THEN 'T8'
	WHEN team='United States' THEN 'T9'
	END;

ALTER TABLE Medals
ALTER COLUMN TeamId varchar(20) NOT NULL; 

SELECT * FROM Medals

--  Drop the Team and name columns from the Medals  --

ALTER TABLE Medals   
DROP COLUMN team;

ALTER TABLE Medals   
DROP COLUMN name;

--  Creating a SportsId Table

CREATE TABLE Sports(
	SportId varchar(50) NOT NULL,
	sport varchar(max));

INSERT INTO Sports
SELECT sport 
FROM Events;





-- TABLES SO FAR --

SELECT * FROM Athletes
SELECT * FROM Teams
SELECT * FROM Medals
SELECT * FROM Games






