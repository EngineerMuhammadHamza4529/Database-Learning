   --always encrypted
    Create Table EmployeeDetails  
    (  
       EmployeeDetailsId INT IDENTITY(1,1) PRIMARY KEY,  
       EmployeeNo VARCHAR(10),  
       FirstName VARCHAR(20),  
       MiddleName VARCHAR(20) NULL,  
       LastName VARCHAR(20),  
    )  

	


	--masking
	create user asp without login;
	grant select on student to asp;

	alter table student alter column s_pwd add masked with(function='default()') 
	alter table student alter column s_pwd add masked with(function='') 
	execute as user='danish';
	select * from student;
	revert;  --come back to masking

alter table student alter column s_pwd drop masked; 



            --json
SELECT s_id,s_name,s_pwd  FROM  student WHERE s_id in (1,3) FOR JSON AUTO;
 	
DECLARE @json NVARCHAR(MAX) = N'
{
  "FirstName":"asad",
  "LastName":"user",
  "NatID":245797967,
  "Current":false,
  "Skills":["Dev","QA","PM"],
  "Region":{"Country":"Canada","Territory":"North America"},
  "Age":24
}';
 
SELECT * FROM OPENJSON(@json);









--query store
alter database T3Session set query_store =on  
alter database T3Session set query_store ( operation_mode= READ_ONLY,
cleanup_policy= (STALE_QUERY_THRESHOLD_DAYS = 367),
DATA_FLUSH_INTERVAL_SECONDS=900,
INTERVAL_LENGTH_MINUTES=60,
MAX_STORAGE_SIZE_MB=100,
QUERY_CAPTURE_MODE=AUTO,
SIZE_BASED_CLEANUP_MODE=AUTO)

select name,type_desc from sys.all_objects
where name like '%query_store%' or name='query_context_settings'