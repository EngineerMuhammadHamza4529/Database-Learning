
Create Table Employee_Information
(
EmpId int primary key Identity(100,1) not null,
EmpName varchar(20) not null,
Gender varchar(20) not null,
Salary int not null,
City varchar(20) not null,
DeptId varchar(20) not null,
);


Insert into Employee_Information(EmpName , Gender, Salary , City , DeptId)
Values
('Usman' , 'Male' , 25000 , 'Hyderabad' , 2),
('Anus' , 'Male' , 45000 , 'Karachi' , 1),
('Aram' , 'Female' , 35000 , 'Sukkur' , 3),
('Ali' , 'Male' , 45000 , 'Hyderabad' , 4),
('Ausgar' , 'Male' , 35000 , 'Karachi' , 2),
('Usama' , 'Male' , 25000 , 'Sukkur' , 1),
('Amara' , 'Female' , 15000 , 'Hyderabad' , 3),
('Zain' , 'Male' , 35000 , 'Karachi' , 2),
('Nimra' , 'Female' , 35000 , 'Sukkur' , 1),
('Ameer' , 'Male' , 45000 , 'Hyderabad' , 4),
('Sumbul' , 'Female' , 25000 , 'Karachi', 3);

Select * from Employee_Information;



--By using having clause and group by and order by --
Select Gender , City , sum(Salary) as [Total salaries according to cities] from Employee_Information
group by City , Gender;


Select Gender , City , Count(EmpName) as [Total salaries according to cities] from Employee_Information
group by City , Gender;


Select City , sum(Salary) as [Total Salary] from Employee_Information
group by City
having City = 'Karachi';

Select City , sum(Salary) as [Total Salary] from Employee_Information
where City = 'Sukkur'
group by City;

Select City , sum(Salary) as [Total Salary] from Employee_Information
where City = 'Hyderabad'
group by City;

Select City , sum(Salary) as [Total Salary] from Employee_Information
group by City
Having sum(Salary) >= 50000;


Select City , sum(Salary) as [Total salay] from Employee_Information
where City in ('Hyderabad' , 'Karachi' , 'Sukkur')
group by City
having sum(Salary) >= 140000;

Select City , sum(Salary) as [total salary] from Employee_Information
Where City not in ('Hyderabad' , 'Sukkur')
group by City;

Select City , Sum(Salary) as [total salary] from Employee_Information
Where City not in ('Hyderabad','Karachi')
group by City
having sum(Salary) >= 95000;

Select City , sum(Salary) as [Total Salary] from Employee_Information
group by City
having City not in ('Sukkur');

Select City , sum(Salary) as [Total Salary] from Employee_Information
group by City
having City in ('Sukkur');









