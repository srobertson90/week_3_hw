DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams (
id serial4 primary key,
name varchar(255)
);

CREATE TABLE matches (
id serial8 primary key,
home_team_id int2 references teams(id) ON DELETE CASCADE, 
away_team_id int2 references teams(id) ON DELETE CASCADE,
home_team_score int2,
away_team_score int2
);