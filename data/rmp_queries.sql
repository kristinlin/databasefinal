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

call update_pwd(1, "newpwd1");
select student_login(1, "newpwd1");
