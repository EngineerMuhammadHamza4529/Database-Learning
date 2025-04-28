CREATE TABLE results (
	StudentId INT not null ,
	ExamId INT not null,
    Mark int NOT NULL,
    ResultGrade char(20) not null primary key,
     foreign key (StudentId) references student(StudentId),
     foreign key (ExamId) references exam(ExamId)
);


insert into results (StudentId, ExamId, Mark, ResultGrade)
values
(1, 1, 85, 'A'),
(1, 2, 78, 'B');



select * from results;