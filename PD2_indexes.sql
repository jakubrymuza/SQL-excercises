-- oprocz indeksow clustered dla primary key

CREATE INDEX country_index ON Airports (country);

CREATE INDEX country_index ON Airlines (country);
CREATE UNIQUE INDEX code_index ON Airlines (code);

CREATE INDEX airline_index ON Connections (airline_id);
CREATE INDEX airports_index ON Connections (start_airport_id, end_airport_id);
CREATE INDEX date_index ON Connections (date);

CREATE INDEX connection_index ON Cargo (connection_id);
CREATE INDEX name_index ON Cargo (name);
CREATE INDEX owner_index ON Cargo (owner_id);
