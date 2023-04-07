DROP TABLE IF EXISTS Customers CASCADE;
CREATE TABLE Customers (
CustomerId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
Name VARCHAR (100) NOT NULL,
PhoneNumber numeric(11)  NOT NULL
);

DROP TABLE IF EXISTS Positions CASCADE;
CREATE TABLE Positions (
PositionId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
Name VARCHAR (100) NOT NULL
);

DROP TABLE IF EXISTS Employees CASCADE;
CREATE TABLE Employees (
EmployeeId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
NAME  VARCHAR (100) NOT NULL,
DateOfBirth VARCHAR (100) NOT NULL,
PositionId INT NOT NULL,
PhoneNumber numeric (11) NOT NULL,
Salary float  NOT NULL
);

DROP TABLE IF EXISTS Fish CASCADE;
CREATE TABLE Fish (
FishId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
NAME  VARCHAR (100) NOT NULL, 
Weight VARCHAR (100) NOT NULL
);
		
DROP TABLE IF EXISTS FishPonds  CASCADE;
CREATE TABLE FishPonds  (
FishPondId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
FishId INT NOT NULL,
PondId INT NOT NULL,
CONSTRAINT fk_Ponds
FOREIGN KEY(PondId)
REFERENCES Ponds,
CONSTRAINT fk_Fish
FOREIGN KEY(FishId)
REFERENCES Fish
);
	 	
DROP TABLE IF EXISTS PondTypes CASCADE;
CREATE TABLE PondTypes (
PondTypeId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
Name VARCHAR (100) NOT NULL
);
	
DROP TABLE IF EXISTS Ponds CASCADE;
CREATE TABLE Ponds (
PondId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
Description VARCHAR (200) NOT NULL ,
Depth VARCHAR (100) NOT NULL,
PriceInHour float  NOT NULL, 
PondTypeId integer NOT NULL,
CONSTRAINT fk_PondTypes
FOREIGN KEY(PondTypeId)
REFERENCES PondTypes
 ); 
 
DROP TABLE IF EXISTS Orders CASCADE;
CREATE TABLE Orders (
OrderId INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
CustomerId integer NOT NULL,
PondId integer NOT NULL,
EmployeeId integer NOT NULL,
CONSTRAINT fk_Employees
FOREIGN KEY(EmployeeId)
REFERENCES Employees,
CONSTRAINT fk_Ponds
FOREIGN KEY(PondId)
REFERENCES Ponds,
CONSTRAINT fk_Customers
FOREIGN KEY(CustomerId)
REFERENCES Customers
);

INSERT INTO Customers ( Name, PhoneNumber )
VALUES ('Иван', 89771267348 ),
('Олег', 89516532891),
('Елена', 88381643782);

INSERT INTO Positions ( Name )
VALUES ('Управляющий'),
('Кассир'),
('Подсобный рабочий');

INSERT INTO Employees ( Name, DateOfBirth, PhoneNumber, Salary, PositionId)
VALUES ('Александр','11-05-1990','89772346534', 90000,1),
('Ольга','21-11-2001','89654873259', 55000,2),
('Николай', '05-08-1987','89654329856', 60000,3);

INSERT INTO Fish ( Name, Weight )
VALUES ('осетр','5,5кг'),
('стерлядь','3,8кг'),
('форель','2,5кг'),
('карп','7,7кг');

INSERT INTO PondTypes ( Name )
VALUES ('Проточный'),
('Родниковый'),
('Камышовый');

INSERT INTO Ponds ( Description, Depth, PriceInHour,PondTypeId)
VALUES ('Проточный пруд – мечта любого рыбака, его населяют наши элитные виды рыб привезенные
из самой глубокой и чистой реки России, из реки Енисей','5m','2000',1),
('Родниковый пруд - подходит любителям активной рыбалки, в нем обитает форель это одна из самых
сильных и бойких рыб, ее вываживани доставит вам самые яркие эмоции в вашей жизни',
'4м','1500',2),
('Камышовый пруд - заинтересует любителей настоящих трофеев, в нем обитают карпы 
выведенные в научном центре Австрии, отличаются исключительными гастронамическими качествами ',
'3м','1000',3);
  
INSERT INTO FishPonds (FishId, PondId)
VALUES (1,1),
(2,1),
(3,2),
(4,3);

INSERT INTO Orders (CustomerId,PondId,EmployeeId)
VALUES (1,1,2),
(2,2,1),
(2,2,2),
(3,3,2),
(3,3,3)
  