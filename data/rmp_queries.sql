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

select pid_profname(5);




drop procedure if exists get_abilities;
delimiter $$
create procedure get_abilities
()
begin
	select * from abilities;
end$$
delimiter ;






