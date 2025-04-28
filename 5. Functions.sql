use EMS
select * from Employee
------------------------------------------------------aggregate functions------------------------------------------------------------
--count function
SELECT COUNT(*) FROM Employee;
SELECT COUNT(Designation)FROM Employee;
SELECT COUNT(DISTINCT Designation) FROM Employee
SELECT COUNT(FirstName) AS NumberOfEmployees FROM Employee --with alias

--Sum function
SELECT SUM(Salary)FROM Employee
SELECT Sum(Salary) AS totalMarks FROM Employee

--Average function
SELECT AVG(Salary)FROM Employee 
SELECT AVG(Salary) AS AverageAge FROM Employee
SELECT AVG(Salary) FROM Employee WHERE Salary<60000

--Max function
SELECT MAX(Salary)FROM Employee
--Min function
SELECT MIN(Salary)FROM Employee


-------------------------------------------------------math functions--------------------------------------------

SELECT COS(90) as _cos
SELECT sin(90)
SELECT ROUND(5.693893,3)
select sqrt(49)
select sign(-9123)
select sign(9123)
select floor(45.4567)
select ceiling(45.456)
select abs(-92)
select power(4,3)
--getting value from table
SELECT power(salary,1) from Employee
select * from Employee
---Ranking function----

------------------We can add sequence row number to a SQL select query starting from 1 onwards.
---------Using built in SQL function ROW_NUMBER()--------
create table b1804b1
(
s_id int,
s_name varchar(30),
s_dept varchar(20),
s_marks int
)


insert into b1804b1 values(1,'farhan','electrical',790),(2,'humaira','materials',769),
(3,'talha','IT',894),(4,'osama','electrical',345),(5,'bahadur','electrical',990),
(6,'iqra','materials',850),(7,'theseeen','electrical',345),(8,'karim','IT',657),
(9,'adyan','materials',869)

select * from b1804b1
select s_id,s_name,s_dept,s_marks,ROW_NUMBER() over(order by s_marks) as position from b1804b1
select s_name,ROW_NUMBER() over(order by s_marks desc) as position from b1804b1

-------------------------------------------------------------------------------------------------DATE FUNCTIONS---------------------------------------

select GETDATE() as "Sytem Date"


select datepart(SS, GETDATE()) --second
select datepart(MI, GETDATE()) --minute
select datepart(HH, GETDATE()) --hour
select datepart(DW, GETDATE()) --weekday
select datepart(WK, GETDATE()) --week
select datepart(DD, GETDATE()) --day number
select datepart(DY, GETDATE()) --day of the year
select datepart(MM, GETDATE()) --month
select datepart(QQ, GETDATE()) --quarter
select datepart(YY, GETDATE()) --year

select DATENAME(DW, GETDATE()) -- day name
select DATEADD(DW, 4, GETDATE()) --after 4 day

select DATEDIFF(DAY,'8/12/2014','8/15/2014')--difference between 2 days/dates

-------After variables
declare 
@firstTime datetime ='2014-02-20',
@secondTime datetime ='2014-02-24'
select DATEDIFF(DW, @firstTime, @secondTime)


-------------------------------------------------------------------------------------------Conversion function---------------------------------------

SELECT CONVERT(TIME,GETDATE()) AS HourMinuteSeconds;

SELECT CONVERT(DATE,GETDATE()) AS DateOnly;

-----------------------------------------------------------------------VARIABLES-------------------------------------------------------------------------


declare @Myname varchar(30) = 'adyan';
----------------OR-------------------
declare @Myname nvarchar(30)
set @Myname = 'adyan';
----------------With Alias------------------
declare @mydate date = getdate()
select @mydate as dated
------------------------------------------------string or scalar function---------------------------------------------------------------------------
select * from Employee
select UPPER(FirstName) from Employee --for upper
select lower(FirstName) from Employee --for lower 
select concat(FirstName,Salary) as b from Employee --for join
select FirstName,LEN(FirstName)  as lengthOfname from Employee--for length
select replace(LastName,'a','i') from Employee where LastName='Albert'--for replace
select FirstName,reverse(FirstName) from Employee --for reverse
select SUBSTRING(FirstName,4,7) from Employee where FirstName='smith' --syntax: SUBSTRING(col_name,starting digit,No of elements)
select char(65)
select ASCII('a')
select ASCII('Aptech')--only 1 char's ASCII will be returned
-------------------------------------------------------------------------STRING FUNCTIONS with variables----------------------------------------------------------------



declare
@abc char(10) = ASCII('a')
select @abc


declare @abc char(1) 
set @abc= char(65)
select @abc

declare
@abc char(10) = 'CPISM'
select left(@abc, 3)

select left('CPISM',3) as Left_Char
select right('DISM',3) as Right_Char

declare
@abc char(10) = 'AptechNN'
select lower(@abc)
--------OR-------------
select lower('Aptech')


declare
@abc char(10) = '    aatika'
select @abc

declare
@abc char(10) = '    aatika'
select ltrim(@abc)

declare
@abc char(10) = 'aatika'   
declare
@xyz char(10) = 'Liaquat'  
select @abc + @xyz

declare @abc char(10) = 'aatika     ',@xyz char(10) = 'Liaquat'  
select rtrim(@abc) +  @xyz