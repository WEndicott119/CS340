DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
	`team_id` int(11) NOT NULL AUTO_INCREMENT,
	`team_name` varchar(255) NOT NULL,
	`jersey_color` varchar(255) NOT NULL,
	PRIMARY KEY(`team_id`),
	UNIQUE KEY team(`team_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
	`player_id` int(11) NOT NULL AUTO_INCREMENT,
	`pf_name` varchar(255) NOT NULL,
	`pl_name` varchar(255) NOT NULL,
	`phone_num` varchar(255) NOT NULL,
	`email`  varchar(255) NOT NULL,
	`team_id` int(11) NOT NULL,
	PRIMARY KEY(`player_id`),
	FOREIGN KEY(`team_id`) REFERENCES `teams`(`team_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `coaches`;
CREATE TABLE `coaches` (
	`coach_id` int(11) NOT NULL AUTO_INCREMENT UNIQUE,
	`cf_name` varchar(255) NOT NULL,
	`cl_name` varchar(255) NOT NULL,
	`phone_num` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`team_id` int(11) NOT NULL,
	PRIMARY KEY(`coach_id`),
	FOREIGN KEY(`team_id`) REFERENCES `teams`(`team_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `venues`;
CREATE TABLE `venues` (
	`venue_id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`city` varchar(255) NOT NULL,
	PRIMARY KEY(`venue_id`),
	UNIQUE KEY `venue` (`venue_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
	`match_id` int(11) NOT NULL AUTO_INCREMENT,
	`time` int(11) NOT NULL,
	`month` varchar(255) NOT NULL,
	`day` varchar(255) NOT NULL,
	`year` varchar(255) NOT NULL,
	`home_score` int(11),
	`visiting_score` int(11),
	FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`),
	PRIMARY KEY(`match_id`),
	UNIQUE KEY `match` (`match_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `matches_teams`;
CREATE TABLE `matches_teams` (
    `matches_teams_id` int(11) NOT NULL AUTO_INCREMENT,
    `home_team_id` int(11) NOT NULL,
    `visiting_team_id` int(11) NOT NULL,
    `match_id` int(11) NOT NULL,
    PRIMARY KEY(`matches_teams_id`),
    UNIQUE KEY `matches_teams` (`home_team_id`,`visiting_team_id`),
    FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`),
    FOREIGN KEY (`visiting_team_id`) REFERENCES `teams` (`team_id`),
    FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`)
) ENGINE=InnoDB;




INSERT INTO `teams` (team_name, jersey_color) VALUES 
('Bend FC', 'Blue'), 
('Houston FC', 'Yellow'), 
('Dallas FC', 'Red');

INSERT INTO `players` (pf_name, pl_name, phone_num, email, team_id) VALUES 
('John','Smith','123-456-7890','JohnS@hello.com',1),
('Johnny','Smithy','(123) 456-7890','JohnY@hello.com',2), 
('Johnie','Smithie','123.456.7890','JohnIE@hello.com',3);

INSERT INTO `coaches` (cf_name, cl_name, phone_num, email, team_id) VALUES 
('Ron', 'Funches', '123.456.7890', 'ron@hello.com', 1),
('Bob', 'Bradley', '123-456-7890', 'bob@hello.com', 2),
('Dominic', 'Kinnear', '(123) 456-7890', 'dom@hello.com', 3);

INSERT INTO `venues` (name, city) VALUES 
('Bend FC','Bend'),
('Houston Civic Center','Houston'),
('Dallas Center','Dallas');

INSERT INTO `matches` (time, month, day, year, home_score, visiting_score, venue_id) VALUES
(1200, 3, 6, 2021, 0, 3, 1),
(1400, 3, 7, 2021, 4, 3, 2),
(1600, 3, 8, 2021, 3, 3, 1);

INSERT INTO `matches_teams` (home_team_id,  visiting_team_id, match_id) VALUES 
(1, 2, 2), 
(2, 3, 1),
(3, 1, 3);