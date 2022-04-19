ALTER TABLE Cargo ADD max_delivery_time datetime

UPDATE Cargo
SET max_delivery_time=con.date+CAST(con.duration AS datetime)+CAST('6:00:00' AS datetime)
FROM Cargo c JOIN Connections con ON c.connection_id=con.connection_id

