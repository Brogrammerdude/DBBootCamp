CREATE TABLE "Taverns"(
    "ID" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "FloorsCount" INT NOT NULL,
    "OwnerID" NVARCHAR(255) NOT NULL,
    "LocationID" INT NOT NULL
);
ALTER TABLE
    "Taverns" ADD CONSTRAINT "taverns_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Users"(
    "id" INT NOT NULL,
    "Name" INT NOT NULL,
    "Birthday" DATETIME NOT NULL,
    "RoleID" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Users" ADD CONSTRAINT "users_id_primary" PRIMARY KEY("id");
CREATE TABLE "Locations"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Locations" ADD CONSTRAINT "locations_id_primary" PRIMARY KEY("id");
CREATE TABLE "Roles"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Roles" ADD CONSTRAINT "roles_id_primary" PRIMARY KEY("id");
CREATE TABLE "BasementRats"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "TavernID" INT NOT NULL
);
ALTER TABLE
    "BasementRats" ADD CONSTRAINT "basementrats_id_primary" PRIMARY KEY("id");
CREATE TABLE "Inventory"(
    "id" INT NOT NULL,
    "SupplyID" NVARCHAR(255) NOT NULL,
    "TavernID" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "Unit" INT NOT NULL,
    "DateUpdated" DATETIME NOT NULL,
    "StockAmt" INT NOT NULL
);
ALTER TABLE
    "Inventory" ADD CONSTRAINT "inventory_id_primary" PRIMARY KEY("id");
CREATE TABLE "TavernServices"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "StatusID" INT NOT NULL
);
ALTER TABLE
    "TavernServices" ADD CONSTRAINT "services_id_primary" PRIMARY KEY("id");
CREATE TABLE "SalesTable"(
    "id" INT NOT NULL,
    "Service" NVARCHAR(255) NOT NULL,
    "Guest" NVARCHAR(255) NOT NULL,
    "Price" DECIMAL(8, 2) NOT NULL,
    "DatePurchased" DATETIME NOT NULL,
    "AmtPurchased" INT NOT NULL,
    "TavernID" INT NOT NULL
);
ALTER TABLE
    "SalesTable" ADD CONSTRAINT "salestable_id_primary" PRIMARY KEY("id");
CREATE TABLE "Statuses"(
    "id" INT NOT NULL,
    "Name" INT NOT NULL
);
ALTER TABLE
    "Statuses" ADD CONSTRAINT "statuses_id_primary" PRIMARY KEY("id");

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
('Johns',5);

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

INSERT INTO BasementRats (Name, TavernID)
VALUES
('Ralph',1),
('Roland',2),
('Merkand',5),
('Dolph',7),
('Garry',8);

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

INSERT INTO SalesTable (Service, TavernID)
VALUES
('Blade Sharpening',1),
('Gambling',3),
('Pool',4),
('Brothel',2),
('Apothecary',5),
('Blacksmith',6);