--Alias Table Syntax
use abc
SELECT age,marks FROM students AS abc
select * from students;

--Alias Column Syntax
SELECT age AS b03age, name AS b03name fROM students;
select * from students;

--Alias Multiple Column Syntax
SELECT  CONCAT(name,', ',age) AS info,marks FROM students;

-- merging Column Syntax without Alias
SELECT * FROM students, pupil;
SELECT students.name, students.age, pupil.name FROM students, pupil wHERE  students.name=pupil.name;

--Alias merging Column Syntax
SELECT * FROM students AS s, pupil AS p;
SELECT p.name, s.age, s.marks FROM students AS s, pupil AS pWHERE s.name=p.name;
SELECT * FROM students AS s, pupil AS p WHERE s.name=p.name;