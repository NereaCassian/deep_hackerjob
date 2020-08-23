INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('hacker', 1, 'level1', 'Level 1', '0', '{}', '{}'),
	('hacker', 2, 'level2', 'Level 2', '0', '{}', '{}'),
	('hacker', 3, 'level3', 'Level 3', '0', '{}', '{}'),
	('hacker', 4, 'level4', 'Level 4', '0', '{}', '{}'),
  ('hacker', 5, 'level5', 'Level 5', '0', '{}', '{}'),
  ('hacker', 6, 'level6', 'Level 6', '0', '{}', '{}'),
  ('hacker', 7, 'level7', 'Level 7', '0', '{}', '{}'),
  ('hacker', 8, 'level8', 'Level 8', '0', '{}', '{}')
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('hacker','Hacker', '1')
;

CREATE TABLE `hackerlevels` (
  `identifier` varchar(50) NOT NULL,
  `level` int(2) NOT NULL DEFAULT "1",
  `exp` int(6) NOT NULL DEFAULT "0"
);