DROP DATABASE IF EXISTS das_a_link_dd;
CREATE DATABASE das_a_link_dd;
USE das_a_link_dd;

DROP TABLE IF EXISTS course;
CREATE TABLE course (
cid  	INT		PRIMARY KEY		AUTO_INCREMENT,
course_subject CHAR(4) NOT NULL,
course_num INT NOT NULL,
title VARCHAR(40) NOT NULL
);

DROP TABLE IF EXISTS professor;
CREATE TABLE professor (
pid  	INT		PRIMARY KEY		AUTO_INCREMENT,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS semester;
CREATE TABLE semester (
sid INT		PRIMARY KEY		AUTO_INCREMENT,
sem_year YEAR(4) NOT NULL,
sem_season VARCHAR(10) NOT NULL,
is_active BOOLEAN DEFAULT 0
);

DROP TABLE IF EXISTS course_by_professor;
CREATE TABLE course_by_professor (
cbp_id INT PRIMARY KEY AUTO_INCREMENT,
cid INT NOT NULL,
pid INT NOT NULL,
sid INT NOT NULL,
num_students INT NOT NULL DEFAULT 0,
unique key cid_pid_sid (cid, pid, sid),
CONSTRAINT cbp_cid_fk 
	FOREIGN KEY (cid) 
    REFERENCES course(cid)
    ON UPDATE cascade
    ON DELETE restrict,
CONSTRAINT cbp_pid_fk 
	FOREIGN KEY (pid) 
	REFERENCES professor(pid)
    ON UPDATE cascade
    ON DELETE restrict,
CONSTRAINT cbp_sid_fk 
	FOREIGN KEY (sid) 
    REFERENCES semester(sid)
    ON UPDATE restrict
    ON DELETE restrict
);

DROP TABLE IF EXISTS student;
CREATE TABLE student (
nuid  	INT		PRIMARY KEY		AUTO_INCREMENT,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30) NOT NULL,
pwd varchar(255) NOT NULL 
);

DROP TABLE IF EXISTS student_course;
CREATE TABLE student_course (
student_course_id INT PRIMARY KEY AUTO_INCREMENT,
nuid  	INT		NOT NULL,
cbp_id 	INT		NOT NULL,
is_active BOOLEAN NOT NULL DEFAULT 1,
UNIQUE KEY (nuid, cbp_id),
CONSTRAINT student_course_nuid_fk 
	FOREIGN KEY (nuid) 
    REFERENCES student(nuid)
    ON UPDATE restrict
    ON DELETE restrict,
CONSTRAINT student_course_cbp_id_fk 
	FOREIGN KEY (cbp_id) 
    REFERENCES course_by_professor(cbp_id)
    ON UPDATE restrict
    ON DELETE restrict
);

DROP TABLE IF EXISTS abilities;
CREATE TABLE abilities (
aid INT PRIMARY KEY AUTO_INCREMENT,
description VARCHAR(255) UNIQUE
);

DROP TABLE IF EXISTS review;
CREATE TABLE review (
	review_id  	INT		PRIMARY KEY		AUTO_INCREMENT,
    student_course_id INT UNIQUE NOT NULL,
    rating DECIMAL(3, 1 ) NOT NULL DEFAULT 5,
    review_comment VARCHAR(1000),
    likes INT NOT NULL DEFAULT 0,
    strength1 INT,
    strength2 INT,
    weakness1 INT,
    weakness2 INT,
    CONSTRAINT review_student_course_id_fk 
		FOREIGN KEY (student_course_id)
        REFERENCES student_course (student_course_id)
        ON UPDATE cascade
		ON DELETE restrict,
    FOREIGN KEY (strength1)
        REFERENCES abilities (aid)
        ON UPDATE cascade
		ON DELETE set NULL,
    FOREIGN KEY (strength2)
        REFERENCES abilities (aid)
		ON UPDATE cascade
		ON DELETE set NULL,
    FOREIGN KEY (weakness1)
        REFERENCES abilities (aid)
        ON UPDATE cascade
		ON DELETE set NULL,
    FOREIGN KEY (weakness2)
        REFERENCES abilities (aid)
        ON UPDATE cascade
		ON DELETE set NULL
);

DROP TABLE IF EXISTS student_likes_review;
CREATE TABLE student_likes_review (
student_like_review_id INT PRIMARY KEY AUTO_INCREMENT,
nuid  	INT		NOT NULL,
review_id 	INT		NOT NULL,

UNIQUE KEY (nuid, review_id),
CONSTRAINT slr_nuid_fk 
	FOREIGN KEY (nuid) 
    REFERENCES student(nuid)
    ON UPDATE cascade
    ON DELETE cascade,
CONSTRAINT slr_review_id_fk 
	FOREIGN KEY (review_id) 
    REFERENCES review(review_id)
    ON UPDATE cascade
    ON DELETE cascade
);

DROP TRIGGER IF EXISTS add_review_likes_insert;
DELIMITER $$

CREATE TRIGGER add_review_likes_insert	
AFTER INSERT ON student_likes_review
FOR EACH ROW
BEGIN

update review set likes = likes + 1 where review_id=new.review_id;

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS subtract_review_likes_delete;
DELIMITER $$

CREATE TRIGGER subtract_review_likes_delete	
BEFORE DELETE ON student_likes_review
FOR EACH ROW
BEGIN

update review set likes = likes - 1 where review_id = old.review_id;

END $$

DELIMITER ;

