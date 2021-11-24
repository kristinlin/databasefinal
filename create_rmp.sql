CREATE DATABASE das_a_link_dd;
USE das_a_link_dd;

CREATE TABLE course (
cid  	INT		PRIMARY KEY		AUTO_INCREMENT,
course_subject CHAR(4) NOT NULL,
course_num INT NOT NULL,
title VARCHAR(40) NOT NULL
);

CREATE TABLE professor (
pid  	INT		PRIMARY KEY		AUTO_INCREMENT,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30) NOT NULL
);

CREATE TABLE semester (
sid INT		PRIMARY KEY		AUTO_INCREMENT,
sem_year YEAR(4) NOT NULL,
sem_season VARCHAR(10) NOT NULL,
is_active BOOLEAN DEFAULT 0
);

CREATE TABLE course_by_professor (
cbp_id INT PRIMARY KEY AUTO_INCREMENT,
cid INT NOT NULL,
pid INT NOT NULL,
sid INT NOT NULL,
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

CREATE TABLE student (
nuid  	INT		PRIMARY KEY		AUTO_INCREMENT,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30) NOT NULL
);

CREATE TABLE review_comment (
comment_id INT		PRIMARY KEY		AUTO_INCREMENT,
content VARCHAR(255),
likes INT,
dislikes INT
);

CREATE TABLE abilities (
aid INT PRIMARY KEY AUTO_INCREMENT,
description VARCHAR(255) UNIQUE
);

CREATE TABLE review (
    nuid INT NOT NULL,
    cbp_id INT NOT NULL,
    rating DECIMAL(2 , 1 ),
    comment_id INT,
    strength1 INT,
    strength2 INT,
    weakness1 INT,
    weakness2 INT,
    PRIMARY KEY (nuid , cbp_id),
    CHECK (rating <= 10.0),
    CONSTRAINT student_fk 
		FOREIGN KEY (nuid)
        REFERENCES student (nuid)
        ON UPDATE cascade
		ON DELETE restrict,
    CONSTRAINT cbp_fk 
		FOREIGN KEY (cbp_id)
        REFERENCES course_by_professor (cbp_id)
        ON UPDATE cascade
		ON DELETE restrict,
    CONSTRAINT review_comment_fk 
		FOREIGN KEY (review_comment)
        REFERENCES review_comment (comment_id)
        ON UPDATE cascade
		ON DELETE set NULL,
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
		ON DELETE set NULL,
);


