CREATE TABLE Taverns(
    id INT NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    FloorsCount INT NOT NULL,
    OwnerID NVARCHAR(255) NOT NULL,
    LocationID INT NOT NULL
);
ALTER TABLE
    Taverns ADD CONSTRAINT "taverns_id_primary" PRIMARY KEY("id");
ALTER TABLE 
	Taverns ADD FOREIGN KEY (id) REFERENCES Users(Name);

CREATE TABLE Users(
    id INT NOT NULL,
    Name INT NOT NULL,
    Birthday DATETIME NOT NULL,
    RoleID NVARCHAR(255) NOT NULL
);
ALTER TABLE
    Users ADD CONSTRAINT "users_id_primary" PRIMARY KEY("id");
ALTER TABLE 
	Users ADD FOREIGN KEY (Name) REFERENCES Roles(Name);

CREATE TABLE Locations(
    id INT NOT NULL,
    Name NVARCHAR(255) NOT NULL
);
ALTER TABLE
    Locations ADD CONSTRAINT "locations_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Locations ADD FOREIGN KEY (id) REFERENCES Tavern(Name);

CREATE TABLE Roles(
    id INT NOT NULL,
    Name NVARCHAR(255) NOT NULL
);
ALTER TABLE
    Roles ADD CONSTRAINT "roles_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Roles ADD FOREIGN KEY (id) REFERENCES Users(Name);

CREATE TABLE Inventory(
    id INT NOT NULL,
    SupplyID NVARCHAR(255) NOT NULL,
    TavernID INT NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Unit INT NOT NULL,
    DateUpdated DATETIME NOT NULL,
    StockAmt INT NOT NULL
);
ALTER TABLE
    Inventory ADD CONSTRAINT "inventory_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Inventory ADD FOREIGN KEY (id) REFERENCES Sales(Service);

CREATE TABLE TavernServices(
    id INT NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    StatusID INT NOT NULL
);
ALTER TABLE
    TavernServices ADD CONSTRAINT "tavernservices_id_primary" PRIMARY KEY("id");
ALTER TABLE
	TavernServices ADD FOREIGN KEY (id) REFERENCES Tavern(StatusID);

CREATE TABLE Sales(
    id INT NOT NULL,
    ServiceName NVARCHAR(255) NOT NULL,
    Guest NVARCHAR(255) NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    DatePurchased DATETIME NOT NULL,
    AmtPurchased INT NOT NULL,
    TavernID INT NOT NULL
);
ALTER TABLE
    Sales ADD CONSTRAINT "sales_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Sales ADD FOREIGN KEY (id) REFERENCES Inventory(SupplyID);

CREATE TABLE Statuses(
    id INT NOT NULL,
    Name VARCHAR(255) NOT NULL
);
ALTER TABLE
    Statuses ADD CONSTRAINT "statuses_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Statuses ADD FOREIGN KEY (id) REFERENCES TavernServices(StatusID);

CREATE TABLE Guests(
	id INT NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Notes VARCHAR(max) NOT NULL,
	Birthday DATETIME NOT NULL,
	Cakeday DATETIME NOT NULL,
	Status INT NOT NULL
);
ALTER TABLE
	Guests ADD CONSTRAINT "guests_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Guests ADD FOREIGN KEY (id) REFERENCES GuestStatuses(Name);


CREATE TABLE GuestStatuses(
	id INT NOT NULL,
	Name VARCHAR(255) NOT NULL
	);
ALTER TABLE
	GuestStatuses ADD CONSTRAINT "gueststatuses_id_primary" PRIMARY KEY("id");
ALTER TABLE
	GuestStatuses ADD FOREIGN KEY (id) REFERENCES Guests(Status);

CREATE TABLE Levels(
 id INT NOT NULL,
 GuestID INT NOT NULL,
 StatusID INT NOT NULL,
 Date DATETIME NOT NULL
 );
 ALTER TABLE
	Levels ADD CONSTRAINT "levels_id_primary" PRIMARY KEY("id");
ALTER TABLE
	Levels ADD FOREIGN KEY (id) REFERENCES Classes(Name);

CREATE TABLE Classes(
	id INT NOT NULL,
	Name VARCHAR(255)
);
ALTER TABLE
	Classes ADD CONSTRAINT "classes_id_primary" PRIMARY KEY("id");
ALTER TABLE 
	Classes ADD FOREIGN KEY (id) REFERENCES Levels(Name);


CREATE TABLE SupplySales(
	id INT NOT NULL,
	SupplyRcvd VARCHAR(255) NOT NULL,
	TavernID INT NOT NULL,
	SupplyID INT NOT NULL,
	Date DATETIME NOT NULL
);
ALTER TABLE
	SupplySales ADD CONSTRAINT "supplysales_id_primary" PRIMARY KEY("id");
ALTER TABLE
	SupplySales ADD FOREIGN KEY (id) REFERENCES TavernServices(Name);


INSERT INTO Statuses (Name)
VALUES 
('Active'),
('Inactive'),
('Out Of Stock'),
('Discontinued');

INSERT INTO Taverns(Name,LocationID)
VALUES
('Mordoor',1),
('Rusty Wheel',2),
('Broken Lantern',3),
('The Smiling Goat',4),
('John''s',5);

INSERT INTO Users(Name, RoleID)
VALUES
('Rothaga','Warrior'),
('Kylar','Blacksmith'),
('Blykyl','Bard'),
('Ryland','Brewmaster'),
('Glendyl','Mage');

INSERT INTO Roles(Name)
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

INSERT INTO Locations (Name)
VALUES
('Riverbend'),
('WolfBane'),
('The Quarry'),
('The Wastelands'),
('Vykill');


INSERT INTO Inventory (Name, StockAmt)
VALUES
('Mead',500),
('Mutton',150),
('Arrows',240),
('Gunpowder',375),
('Sheepskin',75),
('Boots',20),
('Lead Balls',400);

INSERT INTO TavernServices (Name, StatusID)
VALUES
('Blade Sharpening',1),
('Gambling',1),
('Pool',1),
('Brothel',1),
('Apothecary',1),
('Explosives',2),
('Blacksmith',1);

INSERT INTO Sales (Service, TavernID)
VALUES
('Blade Sharpening',1),
('Gambling',3),
('Pool',4),
('Brothel',2),
('Apothecary',5),
('Blacksmith',6);

INSERT INTO Guests (Name, Status)
VALUES
('Merlin',1),
('Frodo',1),
('Bilbo',3),
('Gandalf',2),
('Merkin',3);

INSERT INTO GuestStatuses (id, Name)
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

INSERT INTO Classes (id, Name)
VALUES
(1,'lvl1 mage'),
(2,'lvl3 fighter'),
(3,'lvl2 archer'),
(4,'lvl5 healer'),
(5,'lvl4 tank');

INSERT INTO SupplySales (SupplyRcvd, Date)
VALUES
('flour',20220201),
('honey',20220208),
('lard',20220129),
('corn',20220115),
('sourghum',20220214);


-- INSERT INTO Classes (id, Name)
-- VALUES
-- (9,'warrior);