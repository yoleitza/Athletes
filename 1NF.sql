Use Athletes

--  Athletes Table --

SELECT
	id,
	name,
	sex,
	height
	team,
	sport

FROM Events;

CREATE TABLE Athletes (
	id int NOT NULL,
	name varchar(max) NOT NULL,
	sex varchar(max) NOT NULL,
	height int,
	team varchar(max) NOT NULL,
	sport varchar(max));

INSERT INTO Athletes
SELECT 	id, name, sex, height, team, sport
FROM Events;

--  Names are still present multiple times as in original table --
--  Remove duplicates  --

WITH CTE AS(
	SELECT id, name,
	RN=ROW_NUMBER()OVER(PARTITION BY id ORDER BY id)
	FROM Athletes
	)
DELETE FROM CTE WHERE RN>1;

SELECT * FROM Athletes

--  Teams Table --

SELECT 
	noc,
	team
FROM Events;

CREATE TABLE Teams (
	noc varchar(10) NOT NULL,
	team varchar(max) NOT NULL);

INSERT INTO Teams
SELECT noc, team
FROM Events;

SELECT * FROM Teams

-- Remove duplicates from Teams table --

WITH CTE AS(
	SELECT noc, team,
	RN=ROW_NUMBER()OVER(PARTITION BY noc ORDER BY noc)
	FROM Teams
	)
DELETE FROM CTE WHERE RN>1;

SELECT * FROM Teams

--  Create Medals Table --

SELECT
	games,
	name,
	age,
	id,
	sex,
	team,
	sport,
	event,
	medal

FROM Events;

CREATE TABLE Medals (
	games varchar(max) NOT NULL,
	name varchar(max) NOT NULL,
	age int,
	id int NOT NULL,
	sex varchar(max) NOT NULL,
	team varchar(max) NOT NULL,
	sport varchar(max),
	event varchar(max) NOT NULL,
	medal varchar(max));

INSERT INTO Medals
SELECT 	games, 	name, age, id, sex, team, sport, event, medal
FROM Events;

SELECT * FROM Medals 
ORDER BY name;

-- Create Games Table --

SELECT
	games,
	year,
	season,
	city
	
FROM Events;

CREATE TABLE Games (
	games varchar(max) NOT NULL,
	year int NOT NULL,
	season varchar(max) NOT NULL,
	city varchar(max) NOT NULL);

INSERT INTO Games
SELECT 	games, 	year, season, city
FROM Events;

SELECT * FROM Games
ORDER BY year;

-- Remove duplicates from Games table --

WITH CTE AS(
	SELECT *,
	RN=ROW_NUMBER()OVER(PARTITION BY games, year, season, city ORDER BY year)
	FROM Games
	)
DELETE FROM CTE WHERE RN>1;

SELECT * FROM Games
ORDER BY year

-- Alter games column data type in the Games table --
--set up data type as varchar(20) so it can be used a primary key --

ALTER TABLE Games
ALTER COLUMN games varchar(20) NOT NULL;