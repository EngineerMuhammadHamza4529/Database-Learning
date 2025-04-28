use newDb;
select * from Students;
select * from courses;


SELECT * FROM Students
WHERE StudentName LIKE 'A%';


SELECT * FROM Students
WHERE StudentName LIKE '%a';

SELECT * FROM Students
WHERE StudentName LIKE '%ah%';

SELECT * FROM Students
WHERE StudentName LIKE '_a%';


SELECT * FROM Students
WHERE City LIKE 'K%';

SELECT * FROM Students
WHERE City LIKE '%e%';

SELECT * FROM Students
WHERE StudentName LIKE '_________';


SELECT * FROM Students
WHERE StudentName LIKE 'F%a';



SELECT * FROM Students
WHERE Gender = 'Female' AND StudentName LIKE '%ma%';
