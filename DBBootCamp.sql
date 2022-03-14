-- CREATE ALL NEW TABLES

DROP TABLE IF EXISTS TavernOwners
CREATE TABLE TavernOwners(
    id INT NOT NULL,
    OwnerName VARCHAR(255) NOT NULL,
    Birthday DATETIME NOT NULL,
    RoleID NVARCHAR(255) NOT NULL,
	ClassID INT NOT NULL
);
ALTER TABLE
    TavernOwners ADD CONSTRAINT "tavernowners_id_primary" PRIMARY KEY("id");
ALTER TABLE 
	TavernOwners ADD FOREIGN KEY (ClassID) REFERENCES Classes(id);

DROP TABLE IF EXISTS Locations
CREATE TABLE Locations(
    id INT NOT NULL,
    LocationName NVARCHAR(255) NOT NULL
);
ALTER TABLE
    Locations ADD CONSTRAINT "locations_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Locations ADD FOREIGN KEY (id) REFERENCES Taverns(id);

DROP TABLE IF EXISTS Taverns
CREATE TABLE Taverns(
    id INT NOT NULL,
    TavernName NVARCHAR(255) NOT NULL,
    FloorsCount INT NOT NULL,
    OwnerID NVARCHAR(255) NOT NULL,
    LocationID INT NOT NULL
);
ALTER TABLE
    Taverns ADD CONSTRAINT "taverns_id_primary" PRIMARY KEY("id");
ALTER TABLE 
	Taverns ADD FOREIGN KEY (LocationID) REFERENCES Locations(LocationName);

DROP TABLE IF EXISTS Roles
CREATE TABLE Roles(
    id INT NOT NULL,
    RoleName NVARCHAR(255) NOT NULL
);
ALTER TABLE
    Roles ADD CONSTRAINT "roles_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Roles ADD FOREIGN KEY (id) REFERENCES TavernOwners(RoleID);

DROP TABLE IF EXISTS Inventory
CREATE TABLE Inventory(
    id INT NOT NULL,
    SupplyID NVARCHAR(255) NOT NULL,
    TavernID INT NOT NULL,
    InvName NVARCHAR(255) NOT NULL,
    Unit INT NOT NULL,
    DateUpdated DATETIME NOT NULL,
    StockAmt INT NOT NULL
);
ALTER TABLE
    Inventory ADD CONSTRAINT "inventory_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Inventory ADD FOREIGN KEY (SupplyID) REFERENCES Taverns(id);

DROP TABLE IF EXISTS TavernServices
CREATE TABLE TavernServices(
    id INT NOT NULL,
    ServiceName NVARCHAR(255) NOT NULL,
    StatusID INT NOT NULL
);
ALTER TABLE
    TavernServices ADD CONSTRAINT "tavernservices_id_primary" PRIMARY KEY("id");
ALTER TABLE
	TavernServices ADD FOREIGN KEY (ServiceName) REFERENCES Taverns(StatusID);

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales(
    id INT NOT NULL,
    ServiceName NVARCHAR(255) NOT NULL,
    GuestID INT NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    DatePurchased DATETIME NOT NULL,
    AmtPurchased INT NOT NULL,
    TavernID INT NOT NULL,
	StockAmt INT NOT NULL
);
ALTER TABLE
    Sales ADD CONSTRAINT "sales_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Sales ADD FOREIGN KEY (id) REFERENCES Inventory(SupplyID);

--Statuses Linking Table

DROP TABLE IF EXISTS Statuses
CREATE TABLE Statuses(
    id INT NOT NULL,
    StatusName VARCHAR(255) NOT NULL
);
ALTER TABLE
    Statuses ADD CONSTRAINT "statuses_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Statuses ADD FOREIGN KEY (StatusName) REFERENCES TavernServices(StatusID);

DROP TABLE IF EXISTS Guests
CREATE TABLE Guests(
	id INT NOT NULL,
	GuestName VARCHAR(255) NOT NULL,
	Notes VARCHAR(max) NOT NULL,
	Birthday DATETIME NOT NULL,
	Cakeday DATETIME NOT NULL,
	GuestStatus INT NOT NULL
);
ALTER TABLE
	Guests ADD CONSTRAINT "guests_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Guests ADD FOREIGN KEY (id) REFERENCES GuestStatuses(StatusName);

-- GuestStatuses Linking Table

DROP TABLE IF EXISTS GuestStatuses
CREATE TABLE GuestStatuses(
	id INT NOT NULL,
	StatusName VARCHAR(255) NOT NULL
	);
ALTER TABLE
	GuestStatuses ADD CONSTRAINT "gueststatuses_id_primary" PRIMARY KEY("id");
ALTER TABLE
	GuestStatuses ADD FOREIGN KEY (id) REFERENCES Guests(GuestStatus);

--Levels Linking Table

DROP TABLE IF EXISTS Levels
CREATE TABLE Levels(
 id INT NOT NULL,
 LevelName VARCHAR(255) NOT NULL,
 GuestID INT NOT NULL,
 StatusID INT NOT NULL,
 LevelDate DATETIME NOT NULL
 );
 ALTER TABLE
	Levels ADD CONSTRAINT "levels_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Levels ADD FOREIGN KEY (id) REFERENCES Classes(ClassName);

-- Classes Linking Table

DROP TABLE IF EXISTS Classes
CREATE TABLE Classes(
	id INT NOT NULL,
	ClassName VARCHAR(255)
);
ALTER TABLE
	Classes ADD CONSTRAINT "classes_id_primary" PRIMARY KEY("id");
ALTER TABLE 
	Classes ADD FOREIGN KEY (id) REFERENCES Levels(LevelName);

DROP TABLE IF EXISTS SupplySales
CREATE TABLE SupplySales(
	id INT NOT NULL,
	SupplyRcvd VARCHAR(255) NOT NULL,
	TavernID INT NOT NULL,
	SupplyID INT NOT NULL,
	SaleDate DATETIME NOT NULL
);
ALTER TABLE
	SupplySales ADD CONSTRAINT "supplysales_id_primary" PRIMARY KEY("id");
ALTER TABLE
	SupplySales ADD FOREIGN KEY (TavernID) REFERENCES TavernServices(ServiceName);

DROP TABLE IF EXISTS Rooms
CREATE TABLE Rooms(
	id INT NOT NULL,
	RoomStatus INT NOT NULL,
	AssocTavern VARCHAR(255) NOT NULL,
	StayDate DATETIME NOT NULL,
	RoomStays INT NOT NULL
);
ALTER TABLE
	Rooms ADD CONSTRAINT "rooms_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Rooms ADD FOREIGN KEY (id) REFERENCES Tavern(TavernName);

DROP TABLE IF EXISTS RoomStays
CREATE TABLE RoomStays(
	id INT NOT NULL,
	Sale VARCHAR(50),
	GuestID INT NOT NULL,
	RoomID INT NOT NULL,
	StayDate DATETIME NOT NULL,
	Rate DECIMAL NOT NULL
);
ALTER TABLE
	RoomStays ADD CONSTRAINT "roomstays_id_primary" PRIMARY KEY("id");
ALTER TABLE
	RoomStays ADD FOREIGN KEY (id) REFERENCES Rooms(StayDate);

-- Seeding Tables with data

INSERT INTO Statuses (StatusName)
VALUES 
('Active'),
('Inactive'),
('Out Of Stock'),
('Discontinued');

INSERT INTO Taverns(TavernName,LocationID)
VALUES
('Mordoor',1),
('Rusty Wheel',2),
('Broken Lantern',3),
('The Smiling Goat',4),
('John''s',5);

INSERT INTO TavernOwners(OwnerName, RoleID)
VALUES
('Rothaga','Warrior'),
('Kylar','Blacksmith'),
('Blykyl','Bard'),
('Ryland','Brewmaster'),
('Glendyl','Mage');

INSERT INTO Roles(RoleName)
VALUES
('Warrior'),
('Bladesmith'),
('Blacksmith'),
('Bard'),
('Mage'),
('Brewmaster'),
('Guild Leader'),
('Archer'),
('Pirate');

INSERT INTO Locations (LocationName)
VALUES
('Riverbend'),
('WolfBane'),
('The Quarry'),
('The Wastelands'),
('Vykill');


INSERT INTO Inventory (InvName, StockAmt)
VALUES
('Mead',500),
('Mutton',150),
('Arrows',240),
('Gunpowder',375),
('Sheepskin',75),
('Boots',20),
('Lead Balls',400);

INSERT INTO TavernServices (ServiceName, StatusID)
VALUES
('Blade Sharpening',1),
('Gambling',1),
('Pool',1),
('Brothel',1),
('Apothecary',1),
('Explosives',2),
('Blacksmith',1);

INSERT INTO Sales (ServiceName, TavernID, Price)
VALUES
('Blade Sharpening',1,20.0),
('Gambling',3,25.0),
('Pool',4,5.0),
('Brothel',2,50.0),
('Apothecary',5,30.0),
('Blacksmith',6,50.0),
('Darts',7,5.0),
('Mercenary',8,200.0),
('Rune Casting',9,25.0),
('Clothes Mending',10,15.0);

INSERT INTO Guests (GuestName, GuestStatus)
VALUES
('Merlin',1),
('Frodo',1),
('Bilbo',3),
('Gandalf',2),
('Merkin',3);

INSERT INTO GuestStatuses (id, StatusName)
VALUES
(1,'hangry'),
(2,'sick'),
(3,'fine'),
(4,'raging'),
(5,'placid');

INSERT INTO Levels (GuestID, StatusID)
VALUES
(1,1),
(2,3),
(1,5),
(3,1),
(5,2);

INSERT INTO Classes (id, ClassName)
VALUES
(1,'lvl1 mage'),
(2,'lvl3 fighter'),
(3,'lvl2 archer'),
(4,'lvl5 healer'),
(5,'lvl4 tank');

INSERT INTO SupplySales (SupplyRcvd, SaleDate)
VALUES
('flour',20220201),
('honey',20220208),
('lard',20220129),
('corn',20220115),
('sourghum',20220214);

INSERT INTO Guests (GuestName, Birthday)
VALUES
('Gollum',19820101),
('Merlin',19111111),
('Bilbo',19961225),
('Yoda',20000129),
('Draco',18771225);

INSERT INTO RoomStays (RoomID, Rate)
VALUES
(1,50.0),
(2,40.0),
(3,100.0),
(4,120.0),
(5,145.0),
(6,175.0),
(7,60.0);


-- SELECT Statements

SELECT Birthday FROM Guests
WHERE Birthday < 20000101
ORDER BY Birthday

SELECT Rate FROM RoomStays
WHERE Rate > 100
ORDER BY RoomID

SELECT DISTINCT * FROM 
Guests JOIN Users ON
Users.UserName = UserName.id
WHERE Guests.GuestName
ORDER BY UserName AS UniqueName

SELECT * FROM Guests
WHERE GuestName 
ORDER BY DESC

SELECT TOP 10 * FROM Sales
WHERE Prices < 100
ORDER BY ASC
SELECT 
    id 
    StatusName
    FROM
        Statuses
UNION ALL
   SELECT
    id 
	StatusName
    FROM
        GuestStatuses
UNION ALL
   SELECT
    id 
	LevelName 
	GuestID 
	StatusID 
	LevelDate 
    FROM
        Levels
UNION ALL
   SELECT
    id 
	ClassName
    FROM
        Classes
;


SELECT OwnerName FROM TavernOwners
JOIN Roles ON Roles.RoleName AND TavernOwners ON RoleID;

SELECT OwnerName FROM TavernOwners
INNER JOIN Roles ON Roles.RoleName AND Taverns ON TavernLocation
AND LocationName ON Locations;

select * from guests g 
left join classes classname and levels on g.id = levels.levelname 
order by guestname asc;

select top 10 from sales
join sales as saleslist on sales.price and sales.ServiceName on sales;

select * from gueststatuses 
join Classes on Classes.GuestName and Guests on GuestStatus = Guest.Class;

SELECT Guests.Guestname as Guest, Class.Classname as Class FROM Guests
JOIN Level ON Guests.ID = Levels.guests_ID
JOIN (SELECT Levels.guests_ID, max(Levels.levelsName) as HighestLevel FROM Levels 
      GROUP BY Levels.guests_ID)
      as ML ON ML.guests_ID = Guests.ID
JOIN Classes ON Levels.classes.ID = Class.ID
GROUP BY Guests.Guestname, Classes.Classname;

-- Creating functions

IF OBJECT_ID(N'dbo.levelRequest', N'FN') IS NOT NULL
    DROP FUNCTION dbo.levelRequest;
GO
CREATE FUNCTION dbo.levelRequest(@inputLevel int)
RETURNS varchar(50)
AS 
BEGIN 
    DECLARE @levelGrouping varchar(50);
    SELECT @levelGrouping =
    CASE 
        WHEN @inputLevel >= 1 AND @inputLevel <=5 THEN '1-5'
        WHEN @inputLevel > 5 AND @inputLevel <=10 THEN '6-10'
        WHEN @inputLevel > 10 AND @inputLevel <=20 THEN '11-20'
        WHEN @inputLevel > 20 THEN 'Greater than 20'
    END
    FROM Levels
    RETURN @levelGrouping
END
GO

IF OBJECT_ID(N'dbo.TavernOwnersReport', N'FN') IS NOT NULL
    DROP FUNCTION dbo.TavernOwnersReport;
GO
CREATE FUNCTION dbo.TavernOwnersReport(@inputTavOwners int)
RETURNS TABLE
AS 
RETURN
(
	SELECT OwnerName FROM TavernOwners AS OwnersReport
	JOIN Locations ON Locations.id = TavernLocation.ID
	JOIN SupplySales ON Taverns.TavernName
GO

F OBJECT_ID (N'dbo.', N'IF') IS NOT NULL  
    DROP FUNCTION Sales.getSalesByStore;  
GO  
CREATE FUNCTION Sales.getSalesByStore (@storeid int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name  
);  



IF OBJECT_ID(N'dbo.GuestClasses', N'FN') IS NOT NULL
    DROP FUNCTION dbo.GuestClasses;
GO
CREATE FUNCTION dbo.GuestClasses(@inputGuestClass int)
RETURNS varchar(50)
AS 
BEGIN 
    DECLARE @ varchar(max);
    SELECT @inputOwnersReport = TavernServices
    END
    FROM Levels
    RETURN @inputOwnersReport
END
GO

