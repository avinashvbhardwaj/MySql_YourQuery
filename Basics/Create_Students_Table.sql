--
-- Specify Schema
--
USE curious_coder_advance_sql;

--
-- DROP TABLE IF EXISTS
--
DROP TABLE IF EXISTS Students;

-- 
-- Table mmStructure for Students
--
CREATE TABLE students (
	id INT PRIMARY KEY,
	student_name VARCHAR(50),
	grade_level INT,
	gpq DECIMAL(2, 1),
	school_lunch VARCHAR(3),
	birthday DATE,
	email VARCHAR(100),
	does_sports BOOLEAN
)