--Creating Tables
DROP TABLE Player_Info
CREATE TABLE Player_Info (
	Team varchar(50),
	Player varchar(50),
	College varchar(50),
	Draft_Year INT,
	Pro_height_inches FLOAT, 
	Pro_weight_lb FLOAT,
	Date_of_Birth DATE
)
;
SELECT* FROM Player_Info;

DROP TABLE College_Team
CREATE TABLE College_Team(
	College varchar(50),
	College_Year INT,
	Games INT,
	Wins INT
)
;
SELECT* FROM College_Team;

DROP TABLE NBA_Team
CREATE TABLE NBA_Team(
	Team varchar(20),
	W_L varchar(20),
	NBA_Year INT
)
;
SELECT* FROM NBA_Team;

DROP TABLE Player_Table
SELECT Team, Player, College
INTO Player_Table
FROM Player_Info;

SELECT* FROM Player_Table;

--Editing columns of table
ALTER TABLE Player_Info
DROP COLUMN Team;

ALTER TABLE Player_Info
DROP COLUMN College;

ALTER TABLE NBA_Team
ADD COLUMN Player_Count INT;

ALTER TABLE College_Team
ADD COLUMN Player_Count INT;

--Creating player count
SELECT COUNT(Player), Team
FROM Player_Table
GROUP BY Team;

--Inserting new data into table
INSERT INTO College_Team (Player_Count)
SELECT COUNT(Player_Table.Player) 
FROM Player_Table
GROUP BY College;


--Creating table to merge into
CREATE TABLE NBA_Team2(	
	Team varchar(20),
	Player_Count INT, 
	Win_Count INT);
SELECT* FROM NBA_Team2

CREATE TABLE College_Team2(
	Team varchar(20),
	Player_Count INT, 
	Win_Count INT);

--Editing table
ALTER TABLE College_Team2
DROP COLUMN games

ALTER TABLE College_Team2
Drop Column college_year

--Creating temporary tables
CREATE TABLE NBA_Team3(
	Team varchar(20),
	Player_Count INT, 
	Win_Count INT
)
SELECT* FROM NBA_Team3

CREATE TABLE NBA_Team4(
	Team varchar(20),
	Player_Count INT, 
	Win_Count INT);
Select* FROM NBA_Team4

DROP TABLE NBA_TEAM5
Create Table NBA_Team5(
	Team varchar(20),
	Player_Count INT, 
	Win_Count INT);
Select* From Nba_team5

Drop Table temper;
Create table temper(
	Player_Count int,
	Team varchar(20)
);
Select* FROM Temper

Create table temp_table(
	Win_count int,
	Team varchar(20)
);

--Distinct column
insert into nba_team2(team)
SELECT DISTINCT team
FROM nba_team;

--Merge data
INSERT INTO NBA_Team2(Player_Count, NBA_Team)
SELECT COUNT(Player), Team
FROM Player_Table
GROUP BY Team;

INSERT INTO NBA_Team3 (Win_count, Team)
SELECT temper.Win_Count, temper.Team
FROM NBA_Team2 
INNER JOIN temper
ON NBA_Team2 .Team = temper.Team;
Drop Table temper

INSERT INTO NBA_Team4(Team, win_count)
SELECT NBA_Team2.Team, NBA_Team3.Win_count
FROM NBA_Team2 
INNER JOIN NBA_Team3
ON NBA_Team2 .Team = NBA_Team3.Team;

Insert into temper(Player_Count, Team)
SELECT COUNT(Player), Team
FROM Player_table
GROUP BY Team; 
select * from temper

Insert into NBA_Team5(Team, Player_Count, Win_Count)
SELECT NBA_Team4 .Team, temper.Player_Count, NBA_Team4 .Win_count
FROM temper
INNER JOIN NBA_Team4 
ON NBA_Team4 .Team = temper.Team

--joining tables
INSERT INTO College_Team2 (Team, Player_Count, W_L, NBA_Year)
SELECT College_Team.College, Temp_Table.Player_Count, College_Team.College_Year, College_Team.Games, College_Team.Wins
FROM Temp_Table
INNER JOIN College_team
ON Temp_Table.college2 = College_team.college;
Select* From College_team2

-- inserts win count into it 
Insert into temper(Win_count, Team)
SELECT COUNT(W_L), Team
FROM nba_team
WHERE W_L = 'W'
GROUP BY Team

--Adding Primary Key
ALTER TABLE College_team2
ADD PRIMARY KEY (College);

ALTER TABLE NBA_team5
ADD PRIMARY KEY (Team);

ALTER TABLE Player_Table
ADD FOREIGN KEY (College) REFERENCES College_team2(College);

--Showing Tables
SELECT* FROM player_table
SELECT* FROM player_info
SELECT* FROM NBA_Team5
SELECT* FROM college_team2

--Dropping excess tables
DROP TABLE college_team
DROP TABLE nba_team
DROP TABLE nba_team2
DROP TABLE nba_team3
DROP TABLE nba_team4
DROP TABLE temper