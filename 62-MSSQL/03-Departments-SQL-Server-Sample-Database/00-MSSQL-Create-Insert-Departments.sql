USE master;
GO

CREATE DATABASE Departments;
GO

USE Departments;
GO

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	id BIGINT NOT NULL,
	name VARCHAR(20) NULL,
	dept_name VARCHAR(20) NULL,
	seniority VARCHAR(20) NULL,
	graduation VARCHAR(20) NULL,
	salary BIGINT NULL,
	hire_date DATE NULL,

    CONSTRAINT pk_1 PRIMARY KEY (id)
 ) ;

 ALTER TABLE departments
ADD CONSTRAINT unique_id_constraint UNIQUE (id);

INSERT departments (id, name, dept_name, seniority, graduation, salary, hire_date)
VALUES
(10238,	'Eric'	   ,'Economics'			,'Experienced'	,'MSc' ,72000	,'2019-12-01'),
(13378,	'Karl'	   ,'Music'				,'Candidate'	,'BSc' ,42000	,'2022-01-01'),
(23493,	'Jason'	   ,'Philosophy'       ,'Candidate'		,'MSc' ,45000	,'2022-01-01'),
(30766,	'Jack'     ,'Economics'	       ,'Experienced'	,'BSc' ,68000	,'2020-06-04'),
(36299,	'Jane'	   ,'Computer Science' ,'Senior'		,'PhD' ,91000	,'2018-05-15'),
(40284,	'Mary'	   ,'Psychology'       ,'Experienced'	,'MSc' ,78000	,'2019-10-22'),
(43087,	'Brian'	   ,'Physics'	       ,'Senior'		,'PhD' ,93000	,'2017-08-18'),
(53695,	'Richard'  ,'Philosophy'       ,'Candidate'		,'PhD' ,54000	,'2021-12-17'),
(58248,	'Joseph'   ,'Political Science','Experienced'	,'BSc' ,58000	,'2021-09-25'),
(63172,	'David'	   ,'Art History'      ,'Experienced'	,'BSc' ,65000	,'2021-03-11'),
(64378,	'Elvis'	   ,'Physics'	       ,'Senior'		,'MSc' ,87000	,'2018-11-23'),
(96945,	'John'	   ,'Computer Science' ,'Experienced'	,'MSc' ,80000	,'2019-04-20'),
(99231,	'Santosh'  ,'Computer Science' ,'Experienced'	,'BSc' ,74000	,'2020-05-07');