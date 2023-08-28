### join 실습 ###

# 3개의 테이블을 사용하는 조인 실습 #

create database practiceDB;
use practiceDB;

create table Students (
	student_id int primary key,
    student_name varchar(50),
    age int,
    major varchar(50)
);

create table Courses (
	course_id int primary key,
    course_name varchar(50),
    credit int
);

create table enrollments (
	enrollment_id int primary key,
    student_id int,
    course_id int,
    grade varchar(2),
    foreign key (student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
);
