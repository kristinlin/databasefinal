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
cid INT NOT NULL,
pid INT NOT NULL,
sid INT NOT NULL,
PRIMARY KEY (cid, pid, sid),	
CONSTRAINT cbp_cid_fk FOREIGN KEY (cid) REFERENCES course(cid),
CONSTRAINT cbp_pid_fk FOREIGN KEY (pid) REFERENCES professor(pid),
CONSTRAINT cbp_sid_fk FOREIGN KEY (sid) REFERENCES semester(sid)
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

CREATE TABLE review (
nuid  		INT		NOT NULL,
cid 		INT NOT NULL,
pid 		INT NOT NULL,
sid 		INT NOT NULL,
rating 		DECIMAL(2,1),
comment_id 	INT NOT NULL,
CHECK (rating <= 10.0),
CONSTRAINT student_fk 
	FOREIGN KEY (nuid) 
    REFERENCES student(nuid),
CONSTRAINT cbp_fk 
	FOREIGN KEY (cid, pid, sid) 
    REFERENCES course_by_professor(cid, pid, sid),
CONSTRAINT review_comment_fk 
	FOREIGN KEY (review_comment) 
    REFERENCES review_comment(comment_id)
);


