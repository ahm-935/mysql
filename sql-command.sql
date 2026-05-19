drop table if exists student_logs;
create table  if not exists student_logs (
    id int unsigned auto_increment primary key,
    student_id int ,
    status varchar(20),
    time timestamp
);

-- Trigger --
create trigger if not exists add_student
after insert on students
for each row
insert into student_logs(student_id, status, time) 
values(new.id, "Added", now());

insert into students(full_name, email, is_inactive) 
values("Noushin", "noushin@mail.info", 0);

insert into students(full_name, email, is_inactive) 
values("Nahid", "nahid@mail.info", 0);


insert into students(full_name, email, is_inactive) 
values("N/A", "abc@mail.info", 1);

drop trigger if exists update_student;
create trigger if not exists update_student
after update on students
for each row
insert into student_logs(student_id, status, time) 
values(old.id, "Updated", now());
update students set email = "mian@mail.info", address = "Cartoon" where id = 1;
update students set email = "raju@mail.info", address = "Dhaka" where id = 5;

drop trigger if exists delete_student;
create trigger if not exists delete_student
after delete on students
for each row
insert into student_logs(student_id, status, time)
values(old.id, "Deleted", now());
delete from students where id = 10;