USE Athletes

--change NA values to NULL --

SELECT* FROM athlete_events

UPDATE dbo.athlete_events   -- 9474 rows affected --
SET Age= NULL
WHERE Age='NA';

UPDATE dbo.athlete_events   --60171 rows affected --
SET height= NULL
WHERE height='NA';

UPDATE dbo.athlete_events   --62875 rows affected  --
SET weight= NULL
WHERE Weight='NA';


-- Create Tables from csv files --

-- Events Table --

SELECT
	id,
	name,
	sex,
	age,
	height,
	weight,
	team,
	noc,
	games,
	year,
	season,
	city,
	sport,
	event,
	medal

FROM dbo.athlete_events;

CREATE TABLE Events (
    id int NOT NULL,
	name varchar(max) NOT NULL,
	sex varchar(max) NOT NULL,
	age int,
	height int,
	weight int,
	team varchar(max) NOT NULL,
	noc varchar(10) NOT NULL,
	games varchar(max) NOT NULL,
	year int NOT NULL,
	season varchar(max),
	city varchar(max),
	sport varchar(max),
	event varchar(max),
	medal varchar(max));

ALTER TABLE Events
ALTER COLUMN weight numeric   --there are some entries with decimals, changed column from int to numeric --

INSERT INTO Events
SELECT top 100 
	id, name, sex, age, height, weight, team, noc, games, year, season, city, sport, event, medal
FROM dbo.athlete_events

UPDATE Events   --79 rows affected  --
SET Medal= NULL
WHERE Medal='NA';

SELECT * FROM Events


--NOC Table --

SELECT
	noc,
	region,
	notes
	
FROM dbo.noc_regions;

CREATE TABLE Regions (
    noc varchar(5) NOT NULL,
	region nvarchar(50),
	notes nvarchar(max));

INSERT INTO Regions
SELECT * FROM dbo.noc_regions

