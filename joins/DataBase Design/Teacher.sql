CREATE TABLE teacher (
    TeacherId INT not null AUTO_INCREMENT PRIMARY KEY,
    TeacherName VARCHAR(50) NOT NULL,
    Subject varchar(50) not null,
    TeacherContact varchar(50) not null
);

insert into teacher( TeacherName, Subject,  TeacherContact)
values
("Mr. Johnson", "Mathematics", "mr.johnson@gmail.com"),
("Ms. Williams", "Science", "ms.williams@gmail.com");

select * from teacher;