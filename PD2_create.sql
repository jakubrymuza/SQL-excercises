CREATE TABLE "Airports" 
(
	"airport_id" int NOT NULL,
	"name" varchar (50) NOT NULL,
	"country" varchar (25) NOT NULL,

	CONSTRAINT "PKC_Airports" PRIMARY KEY
	(
		"airport_id"
	)
)

CREATE TABLE "Airlines" 
(
	"airline_id" int NOT NULL,
	"name" varchar (50) NOT NULL,
	"code" varchar (25) NOT NULL,
	"country" varchar (25) NOT NULL,
	"logo" varbinary (max) NULL,

	CONSTRAINT "PKC_Airlines" PRIMARY KEY
	(
		"airline_id"
	)
)

CREATE TABLE "Connections" 
(
	"connection_id" int NOT NULL,
	"airline_id" int NOT NULL,
	"start_airport_id" int NOT NULL,
	"end_airport_id" int NOT NULL,
	"max_capacity" int NOT NULL,
	"date" datetime NOT NULL,
	"duration" time NOT NULL,
	"packages_allowed" bit NOT NULL,
	"frozen_allowed" bit NOT NULL,
	"frozen_capacity" int NULL,
	"package_capacity" int NULL,

	CONSTRAINT "PKC_Connections" PRIMARY KEY
	(
		"connection_id"
	),

	CONSTRAINT "FKC_Connections_Airlines" FOREIGN KEY
	(
		"airline_id"
	) 
	REFERENCES "dbo"."Airlines"
	(
		"airline_id"
	),

	CONSTRAINT "FKC_Connections_Airports_start" FOREIGN KEY
	(
		"start_airport_id"
	) 
	REFERENCES "dbo"."Airports"
	(
		"airport_id"
	),

	CONSTRAINT "FKC_Connections_Airports_end" FOREIGN KEY
	(
		"end_airport_id"
	) 
	REFERENCES "dbo"."Airports"
	(
		"airport_id"
	)
)

CREATE TABLE "Owners"
(
	"owner_id" int NOT NULL,
	
	CONSTRAINT "PKC_Owners" PRIMARY KEY
	(
		"owner_id"
	)
)


CREATE TABLE "Cargo" 
(
	"cargo_id" int NOT NULL,
	"connection_id" int NOT NULL,
	"name" varchar (25) NOT NULL,
	"quantity" int NOT NULL,
	"owner_id" int NOT NULL,
	"cost" money NOT NULL,
	"type" varchar (25) NOT NULL,

	CONSTRAINT "PKC_Cargo" PRIMARY KEY
	(
		"cargo_id"
	),

	CONSTRAINT "FKC_Cargo_Connections" FOREIGN KEY
	(
		"connection_id"
	) 
	REFERENCES "dbo"."Connections"
	(
		"connection_id"
	),

	CONSTRAINT "FKC_Cargo_Owners" FOREIGN KEY
	(
		"owner_id"
	) 
	REFERENCES "dbo"."Owners"
	(
		"owner_id"
	)
)



