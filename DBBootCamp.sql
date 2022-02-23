CREATE TABLE "Taverns"(
    "ID" INT NOT NULL,
    "Name" NVARCHAR(50) NOT NULL,
    "FloorsCount" INT NOT NULL,
    "OwnerID" NVARCHAR(50) NOT NULL,
    "LocationID" INT NOT NULL
);
ALTER TABLE
    "Taverns" ADD CONSTRAINT "taverns_id_primary" PRIMARY KEY("ID");
CREATE TABLE "Users"(
    "id" INT NOT NULL,
    "Name" INT NOT NULL,
    "Birthday" DATETIME NOT NULL,
    "RoleID" NVARCHAR(50) NOT NULL
);
ALTER TABLE
    "Users" ADD CONSTRAINT "users_id_primary" PRIMARY KEY("id");
CREATE TABLE "Locations"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(50) NOT NULL
);
ALTER TABLE
    "Locations" ADD CONSTRAINT "locations_id_primary" PRIMARY KEY("id");
CREATE TABLE "Roles"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(max) NOT NULL
);
ALTER TABLE
    "Roles" ADD CONSTRAINT "roles_id_primary" PRIMARY KEY("id");
CREATE TABLE "BasementRats"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(50) NOT NULL,
    "TavernID" INT NOT NULL
);
ALTER TABLE
    "BasementRats" ADD CONSTRAINT "basementrats_id_primary" PRIMARY KEY("id");
CREATE TABLE "Inventory"(
    "id" INT NOT NULL,
    "SupplyID" INT NOT NULL,
    "TavernID" INT NOT NULL,
    "Name" NVARCHAR(50) NOT NULL,
    "Unit" INT NOT NULL,
    "DateUpdated" DATETIME NOT NULL,
    "StockAmt" INT NOT NULL
);
ALTER TABLE
    "Inventory" ADD CONSTRAINT "inventory_id_primary" PRIMARY KEY("id");
CREATE TABLE "TaverenServices"(
    "id" INT NOT NULL,
    "Name" NVARCHAR(50) NOT NULL,
    "Status" NVARCHAR(50) NOT NULL
);
ALTER TABLE
    "TaverenServices" ADD CONSTRAINT "taverenservices_id_primary" PRIMARY KEY("id");
CREATE TABLE "ServicesStatus"(
    "id" INT NOT NULL,
    "Active" BIT NOT NULL,
    "Inactive" BIT NOT NULL,
    "OutOfStock" BIT NOT NULL,
    "Discontinued" BIT NOT NULL
);
ALTER TABLE
    "ServicesStatus" ADD CONSTRAINT "servicesstatus_id_primary" PRIMARY KEY("id");
CREATE TABLE "SalesTable"(
    "id" INT NOT NULL,
    "Service" NVARCHAR(50) NOT NULL,
    "Guest" NVARCHAR(50) NOT NULL,
    "Price" INT NOT NULL,
    "DatePurchased" DATETIME NOT NULL,
    "AmtPurchased" INT NOT NULL,
    "TavernID" INT NOT NULL
);
ALTER TABLE
    "SalesTable" ADD CONSTRAINT "salestable_id_primary" PRIMARY KEY("id");