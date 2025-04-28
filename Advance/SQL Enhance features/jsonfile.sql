select * from master.sys.databases order by 1 
FOR JSON PTH,ROOT('Bases')

DECLARE @varJData AS NVARCHAR(4000)
SET @varJData = 
N'{
	"OrderInfo":{
		"Tag":"#ONLORD_12546_45634",
		"HeaderInfo":{
			"CustomerNo":"CUS0001",
			"OrderDate":"04-Jun-2016",
			"OrderAmount":1200.00,
			"OrderStatus":"1",
			"Contact":["+0000 000 0000000000", 
			"info@abccompany.com", "finance@abccompany.com"]
		},
		"LineInfo":[
			{"ProductNo":"P00025", "Qty":3, "Price":200},
			{"ProductNo":"P12548", "Qty":2, "Price":300}
		]
	}
}'
SELECT ISJSON(@varJData)