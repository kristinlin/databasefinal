use das_a_link_dd;

drop function if exists student_login;
delimiter $$
create function student_login
(
	nuid int,
    pwd varchar(255)
)
returns int
deterministic reads sql data
begin
	declare successful_login int;
	set successful_login = (select count(nuid) from student s where s.nuid= nuid and s.pwd = pwd);
    return successful_login;
end$$
delimiter ;


-- select student_login(1, "password1");
-- select student_login(1, "password2");

drop procedure if exists update_pwd;
delimiter $$
create procedure update_pwd
(
	in nuid int,
    in new_pwd varchar(255)
)
begin
	update student set pwd = new_pwd
    where student.nuid = nuid;
end$$
delimiter ;

-- call update_pwd(1, "newpwd1");
-- select student_login(1, "newpwd1");


drop procedure if exists get_student_courses;
delimiter $$
create procedure get_student_courses
(
	in in_nuid int
)
begin
	select sid, course_subject, course_num, title, pid, student_course_id  from 
	course c, (select cbp_id, student_course_id from student_course where nuid = in_nuid) as t, course_by_professor cbp
    where cbp.cbp_id = t.cbp_id and
    cbp.cid = c.cid;
end$$
delimiter ;

-- call get_student_courses(1);

drop function if exists sid_semester;
delimiter $$
create function sid_semester
(
	in_sid int
)
returns varchar (15)
deterministic reads sql data
begin
	declare sem_string varchar(15);
    set sem_string = 
    (select concat(sem_season, " ", sem_year) from semester s
    where s.sid = in_sid );
    return sem_string;
end$$
delimiter ;

-- select sid_semester(4); 

drop function if exists student_course_review;
delimiter $$
create function student_course_review
(
	in_student_course_id int
)
returns int
deterministic reads sql data
begin
	declare stud_course_review int;
	set stud_course_review = (select review_id from review r where r.student_course_id = in_student_course_id);
    
    if stud_course_review is NULL then set stud_course_review = -1;
    end if;
    
    return stud_course_review;
end$$
delimiter ;


drop function if exists pid_profname;
delimiter $$
create function pid_profname
(
	in_pid int
)
returns varchar (61)
deterministic reads sql data
begin
	declare profname varchar(61);
    set profname = 
    (select concat(fname, " ", lname) from professor p
    where p.pid = in_pid );
    return profname;
end$$
delimiter ;

-- select pid_profname(5);


drop procedure if exists get_abilities;
delimiter $$
create procedure get_abilities
()
begin
	select * from abilities;
end$$
delimiter ;

drop procedure if exists get_course_subjects;
delimiter $$
create procedure get_course_subjects
()
begin
	select DISTINCT(course_subject) from course;
end$$
delimiter ;

drop procedure if exists get_course_nums;
delimiter $$
create procedure get_course_nums
()
begin
	select DISTINCT(course_num) from course order by course_num ASC;
end$$
delimiter ;


drop procedure if exists get_search;
delimiter $$
create procedure get_search
(
	in in_subject CHAR(4),
    in in_course_num INT,
    in in_professor_lname VARCHAR(30)
)
begin
	if in_subject is not NULL and in_course_num is not NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid,c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject and course_num = in_course_num) c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is NULL and in_course_num is not NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_num = in_course_num) c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is not NULL and in_course_num is NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject) c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is not NULL and in_course_num is not NULL and in_professor_lname is NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject and course_num = in_course_num) c, 
        (select pid, fname, lname from professor) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is NULL and in_course_num is NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        course c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is NULL and in_course_num is not NULL and in_professor_lname is NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_num = in_course_num) c, 
        (select pid, fname, lname from professor) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is not NULL and in_course_num is NULL and in_professor_lname is NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject) c, 
        (select pid, fname, lname from professor) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	end if;
end$$
delimiter ;

call get_search("CS", 1800, "Hescat"); 

call get_search("CS", 1800, NULL);
call get_search("CS", NULL, "Hescat");
call get_search(NULL, 1800, "Hescat");

call get_search(NULL, NULL, "Hescat");
call get_search(NULL, 1800, NULL);
call get_search("CS", NULL, NULL);

call get_search(NULL, NULL, NULL);

drop procedure if exists insert_review;
delimiter $$
create procedure insert_review
(
	in in_rating DECIMAL(2, 1),
    in in_student_course_id INT,
    in in_review_comment VARCHAR(1000),
    in in_strength1 INT,
    in in_strength2 INT,
    in in_weakness1 INT,
    in in_weakness2 INT
)
begin
	insert into review (rating, student_course_id, review_comment, strength1, strength2, weakness1, weakness2) 
    values (in_rating, in_student_course_id, in_review_comment, in_strength1, in_strength2, in_weakness1, in_weakness2); 
end$$
delimiter ;

-- call insert_review(6.6, 6, "boop", 1, 2, NULL, 5)


drop procedure if exists get_review;
delimiter $$
create procedure get_review
(
	in in_review_id INT
)
begin
	select * from review where review_id = in_review_id;
end$$
delimiter ;

call get_review(5);


drop procedure if exists edit_review;
delimiter $$
create procedure edit_review
(
	in in_review_id INT,
    in in_rating DECIMAL(2, 1),
    in in_review_comment VARCHAR(1000),
    in in_strength1 INT,
    in in_strength2 INT,
    in in_weakness1 INT,
    in in_weakness2 INT
)
begin
	update review 
    set rating = in_rating, review_comment = in_review_comment, strength1=in_strength1, strength2=in_strength2, weakness1=in_weakness1, weakness2=in_weakness2
    where review_id = in_review_id;
end$$
delimiter ;

-- select * from review;
-- call edit_review(6, 6.0, "I am edited!", 1, 2,3,4);

drop procedure if exists delete_review;
delimiter $$
create procedure delete_review
(
	in in_review_id INT
)
begin
	delete from review 
    where review_id = in_review_id;
end$$
delimiter ;

select * from review;


drop procedure if exists get_semesters;
delimiter $$
create procedure get_semesters
(
	in in_cid INT,
    in in_pid INT
)
begin
	select sid, sid_semester(sid) as sem_name from course_by_professor where cid = in_cid and pid = in_pid;
end$$
delimiter ;

call get_semesters(3, 3);



-- drop procedure if exists get_reviews_for_course;
-- delimiter $$
-- create procedure get_reviews_for_course
-- (
-- 	in in_cid INT,
--     in in_pid INT,
--     in in_sid INT
-- )
-- begin
-- 	if in_sid is NULL then
-- 		select * from review where student_course_id in
-- 		(select student_course_id from student_course where cbp_id in
-- 		(select cbp_id from course_by_professor where cid = in_cid and pid = in_pid)); 
-- 	else
-- 		select *, in_sid from review where student_course_id in
-- 		(select student_course_id from student_course where cbp_id in
-- 		(select cbp_id from course_by_professor where cid = in_cid and pid = in_pid and sid = in_sid)); 
-- 	end if;
-- end$$
-- delimiter ;

drop procedure if exists get_reviews_for_course;
delimiter $$
create procedure get_reviews_for_course
(
	in in_nuid INT,
    in in_cid INT,
    in in_pid INT,
    in in_sid INT
)
begin
	if in_sid is NULL then
		select r.*, sid_semester(c.sid) sem_name, student_liked_review(in_nuid, r.review_id) student_liked_review from review r, student_course s, course_by_professor c
        where c.cid = in_cid and c.pid = in_pid and r.student_course_id =  s.student_course_id and s.cbp_id = c.cbp_id;
	else
		select r.*, sid_semester(in_sid) sem_name, student_liked_review(in_nuid, r.review_id) student_liked_review from review r where student_course_id in
		(select student_course_id from student_course where cbp_id in
		(select cbp_id from course_by_professor where cid = in_cid and pid = in_pid and sid = in_sid)); 
	end if;
end$$
delimiter ;

call get_reviews_for_course(2, 3, 3, NULL);
call get_reviews_for_course(2, 3, 3, 4);
-- 
-- select * from student_course;
drop procedure if exists insert_like;
delimiter $$
create procedure insert_like
(
	in in_nuid INT,
    in in_review_id INT
)
begin
	insert into student_likes_review (nuid, review_id) values (in_nuid, in_review_id);
end$$
delimiter ;

drop procedure if exists delete_like;
delimiter $$
create procedure delete_like
(
	in in_nuid INT,
    in in_review_id INT
)
begin
	delete from student_likes_review where in_nuid=nuid and in_review_id=review_id;
end$$
delimiter ;



drop function if exists student_liked_review;
delimiter $$
create function student_liked_review
(
	in_nuid INT,
    in_review_id INT
)
returns bool
deterministic reads sql data
begin
	declare review_liked bool;
    set review_liked = 
    (select count(*) from student_likes_review s where s.nuid = in_nuid and s.review_id = in_review_id) > 0;
    return review_liked;
end$$
delimiter ;

