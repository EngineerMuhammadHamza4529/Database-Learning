create table kuchbhi
(
id int identity(1,1) primary key,
namee varchar(20),
balance int,
expended int
)

insert into kuchbhi(namee,balance,expended) values ('Sara',100,100),('Saba',200,150),('Farah',85,100),('ALI',900,900)

SELECT * FROM kuchbhi
SELECT * FROM kuchbhi K1 JOIN kuchbhi K2 ON K1.balance=K2.expended