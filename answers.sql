-- Create a database named `education_db` and create the following two tables:
create database education_db;
use education_db;
-- *Course

--  `course_id` – Primary Key, Auto Increment
--  `course_name` – NOT NULL, UNIQUE
--  `duration`
--  `fee`
create table course(course_id int not null auto_increment primary key,
					course_name varchar(30) not null unique,
                    duration int,
                    fee int);
-- Student

--  `student_id` – Primary Key, Auto Increment
--  `student_name` – NOT NULL
--  `email` – UNIQUE
--  `age`
--  `gender`
--  `mark`
--  `courseid` – Foreign Key referencing `Course(courseid)`
create table student(student_id int not null auto_increment primary key,
					 student_name varchar(30) not null,
                     email varchar(30) unique,
                     age int,
                     gender varchar(20),
                     mark int,
                     courseid int,
                     foreign key(courseid) references course(course_id));

-- Insert records
insert into course(course_name,duration,fee)
			values("python",6,25000),
				  ("java",7,30000),
                  ("data science",8,45000);
                  
insert into student (student_name, email, age, gender, mark, courseid)
			  values('Arun', 'arun@gmail.com', 21, 'Male', 85, 1),
					('Anjali', 'anjali@gmail.com', 22, 'Female', 92, 2),
					('Rahul', 'rahul@gmail.com', 20, 'Male', 76, 3),
					('Meera', 'meera@gmail.com', 23, 'Female', 88, 3);
                    
insert into student(student_name, email, age, gender, mark, courseid)
			values("Vishnu", 'vishnu@gmail.com', 21, 'Male', 69, 1),
				  ('Sneha', 'sneha@gmail.com', 22, 'Female', 95, 2);
-- ### Questions

-- 1. Write a query to display all students who scored more than *80 marks, ordered by mark in descending order.
select * from student where mark>80 order by mark desc;
-- 2. Write a query to find the highest mark, lowest mark, and average mark of all students.
select max(mark),min(mark),avg(mark) from student;
-- 3. Write a query to display the top 5 students based on their marks.
select * from student order by mark desc limit 5;
-- 4. Write a query to display the names and marks of students whose age is between 18 and 25, ordered by age.
select student_name,mark from student where age between 18 and 25 order by age;
-- 5. Write a query to find the number of students in each course.
select courseid,count(*) from student group by courseid;
-- 6. Write a query to display the courses that have more than 2 students.
select course_name from course inner join student on course.course_id=student.courseid group by course_id having count(student_id)>2;
-- 7. Write a query to display the student name, mark, and course name using an `INNER JOIN`.
select student_name,mark,course_name from course inner join student on course.course_id=student.courseid;
-- 8. Write a query to display all courses and their students, including courses that have no students, using a `LEFT JOIN`.
select student_name,course_name from course left join student on course.course_id=student.courseid;
-- 9. Write a query to display students whose marks are greater than the overall average mark using a subquery.
select * from student where mark>(select avg(mark) from student);
-- 10. Write a query to find the second-highest mark and display the student name, mark, and course name using a subquery and `JOIN`.
select student_name,mark,course_name from course inner join student on course.course_id=student.courseid where mark=(select max(mark) from student where mark<(select max(mark) from student));
-- ### Git Repository Task
-- 1. Create a new GitHub repository for this SQL practice task.
-- 2. Create a file named `answers.sql` and write the SQL queries for all 10 questions in it.
-- 3. Commit and push the file to your GitHub repository.
-- 4. Make the repository public and share the GitHub repository link*.
-- 5.