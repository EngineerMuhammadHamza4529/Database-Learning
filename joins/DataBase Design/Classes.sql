CREATE TABLE classes (
    ClassId INT not null AUTO_INCREMENT PRIMARY KEY,
	TeacherId INT,
    ClassRoom varchar(50) NOT NULL,
    Schedule varchar(100),
    foreign key (TeacherId) references teacher(TeacherId)
);

insert into classes( TeacherId, ClassRoom,   Schedule)
values
(1, "A101", "Monday, Wednesday, Friday 10:00AM to 12:00PM" ),
(2, "B102",  "Tuesday, Thursday 10:00AM to 12:00PM");



select * from classes;