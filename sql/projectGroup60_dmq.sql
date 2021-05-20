-- colon : character being used to denote the variables that will have data from the backend programming language


-- Teams Page:
-- select data for table: 
SELECT * FROM `teams`;

-- add team:
INSERT INTO `teams` (team_name, jersey_color) VALUES (:team_name_input, :jersey_color_input);

-- delete team: 
DELETE FROM `teams` WHERE `team_id` = :team_id_delete;

-- update team:
UPDATE `teams`
SET
    team_name = :team_name_input,
    jersey_color = :jersey_color_input
WHERE `team_id` = :team_id_update;



-- Players Page:
-- select data for table:
SELECT * FROM `players`;

-- select data for search:
SELECT * FROM `players` WHERE team_id = :team_id_search;

-- add player:
INSERT INTO `players` (pf_name, pl_name, phone_num, email, team_id) VALUES (:pf_name_input, :pl_name_input, :phone_num_input, :email_input, team_id_input);


-- delete player:
DELETE FROM `players` WHERE `player_id` = :player_id_input;

-- update player:
UPDATE `players`
SET
	pf_name = :pf_name_input, 
	pl_name = :pl_name_input, 
	phone_num = :phone_num_input, 
	email = :email_input, 
	team_id = team_id_input
WHERE `player_id` = `player_id_update`;



-- Coaches Page:
-- select data for table:
SELECT * FROM `coaches`;

-- add coach:
INSERT INTO `coaches`(cf_name, cl_name, phone_num, email, team_id) VALUES (:cf_name_input, :cl_name_input, :phone_num_input, :email, team_id_input);


-- delete coach:
DELETE FROM `coaches` WHERE `coach_id` = :coach_id_input;

-- update coach:
UPDATE `coaches`
SET
	cf_name = :cf_name_input, 
	cl_name = :cl_name_input, 
	phone_num = :phone_num_input, 
	email = :email_input, 
	team_id = team_id_input
WHERE `coach_id` = `coach_id_update`;



-- Venues Page:
-- select data for table:
SELECT * FROM `venues`;

-- add venue:
INSERT INTO `venues` (name, city) VALUES (:name_input, :city_input);

-- delete venue:
DELETE FROM `venues` WHERE `venue_id` = :venue_id_delete;

-- update venue:
UPDATE `venue`
SET
    name = :name_input,
    city = :city_input
WHERE `venue_id` = :venue_id_update;



-- Matches Page:
-- select data for table
SELECT * FROM `matches`;

-- add matches:
INSERT INTO `matches` (time, month, day, year, home_score, visiting_score, venue_id) VALUES (:time, :month, :day, :year, :home_score, :visiting_score, :venue_id) ;

-- delete matches:
DELETE FROM `matches` WHERE `match_id` = :match_id_delete;

-- update matches:
UPDATE `matches`
SET
	time= :time_input, 
	month= :month_input, 
	day= :day_input, 
	year= :year_input, 
	home_score= :home_score_input, 
	visiting_score= :visiting_score_input, 
	venue_id= :venue_id_input
WHERE `match_id` = :match_id_update;



-- matches_teams Page:
-- select data for table:
SELECT * FROM `matches_teams`;

-- add new row:
INSERT INTO `matches_teams` (home_team_id, visiting_team_id, match_id) VALUES (:home_team_id_input, :visiting_team_id_input, :match_id_input);

-- delete row:
DELETE FROM `matches_teams` WHERE `matches_teams_id` = :matches_teams_id_delete;

-- update row:
UPDATE `matches_teams`
SET
    home_team_id = :home_team_id_input,
    visiting_team_id = :visiting_team_id_input,
    Match_id = :match_id_input
WHERE `matches_teams_id` = :matches_teams_id_update;