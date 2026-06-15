--
--	Use Schema to connect
--
USE `curious_coder_advance_sql`;

--
--	Table structure for table `employees_test`
--
DROP TABLE IF EXISTS `employees_test`;

CREATE	TABLE	`employees_test`	(
	`id`	int		NOT	NULL	AUTO_INCREMENT,
	`name`	varchar(45)	DEFAULT	NULL,
	`salary`	int	DEFAULT	NULL,
	`managerId`	int	DEFAULT	NULL,
	PRIMARY KEY (`id`)
)	ENGINE	=	InnoDB	AUTO_INCREMENT	=	1	DEFAULT	CHARSET	=	latin1;


INSERT	INTO	employees_test	(id,	name,	salary,		managerId)	value	(1,	'Joe',		70000,	3);
INSERT	INTO	employees_test	(id,	name,	salary,		managerId)	value	(2,	'Hanry',	80000,	4);
INSERT	INTO	employees_test	(id,	name,	salary,		managerId)	value	(3,	'Sam',		60000,	null);
INSERT	INTO	employees_test	(id,	name,	salary,		managerId)	value	(4,	'Max',		90000,	null);
commit;


SELECT	e.id,	e.name,		e.salary,	e.managerId,	m.name,	m.salary
FROM	employees_test	e 
		INNER		JOIN	employees_test	m
		ON		e.managerId	=	m.id	AND	e.salary	>	m.salary;