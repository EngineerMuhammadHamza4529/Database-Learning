CREATE TABLE exam (
    ExamId INT not null AUTO_INCREMENT PRIMARY KEY,
    ExamSubject varchar(50) NOT NULL,
    ExamDate varchar(50) not null,
    ClassId INT not null,
	foreign key (ClassId) references classes(ClassId)
);


insert into exam( ExamSubject, ExamDate,   ClassId)
values
("Mathematics Test", "2024-06-10", 1),
("Science Test", "2024-06-15", 2);

select * from exam;