Create Table Students
(
StudentId int Primary key not null,
StudentName varchar(50) not null,
ContactName varchar(50) not null,
City varchar(50) not null,
Country varchar(50) not null
);
 Select * from Students;

 Insert into Students(StudentId,StudentName,ContactName,City,Country)
 Values
 (7,'Sibra','Shaikh','Karachi','Pakistan'),
 (8,'Hassan','Abbas','Karachi','Pakistan'),
 (9,'Hamza','Shaikh','Karachi','Dubai');

 Update Students
 Set StudentName='Kamil'
 where StudentId=8;

 Delete from Students;

 Select * from Students
 Order By Country Asc;

  Select * from Students
 Order By Country Desc;

 Select * from Students;

 Select Min(StudentId) from Students;
 Select Max(StudentId) from Students;
 Select Count(StudentId) from Students;

Select * from Students
Where StudentId < 9;



Create Table Books
(
BookID int Primary key not null,
AuthorName varchar(10) not null
);

Select * from Books;

Insert into Books(BookID,AuthorName)
Values
(5,'Wolf');

Select BookID,AuthorName from Books
Where BookID >= 5;



