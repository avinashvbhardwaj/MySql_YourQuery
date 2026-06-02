-- Specify the schema
DROP SCHEMA IF EXISTS curious_coder_advance_sql;
CREATE SCHEMA curious_coder_advance_sql;
USE curious_coder_advance_sql;

--
-- DROP TABLE IF EXISTS
--
DROP TABLE IF EXISTS students;

--
-- Table structure for table `students`
--

CREATE TABLE students (
    id INT PRIMARY KEY,
    student_name VARCHAR(50),
    grade_level INT,
    gpa DECIMAL(2, 1),
    school_lunch VARCHAR(3),
    birthday DATE,
    email VARCHAR(100)
);