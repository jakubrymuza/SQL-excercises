-- 1
SELECT * FROM Connections con
ORDER BY (
	SELECT SUM(c.quantity) FROM Cargo c
	WHERE c.connection_id = con.connection_id)/con.max_capacity DESC

-- 2
DECLARE @avg numeric(11,2)
SET @avg = (SELECT SUM(quantity) FROM CARGO)/(SELECT COUNT(*) FROM Connections)

SELECT * FROM Connections con
WHERE @avg < (
	SELECT SUM(c.quantity) FROM Cargo c
	WHERE c.connection_id = con.connection_id)


-- 3
SELECT li.airline_id, li.name, li.country FROM Airlines li
JOIN( 
	SELECT l.airline_id, COUNT(DISTINCT c.owner_id) AS number FROM Airlines l
	JOIN Connections con ON con.airline_id=l.airline_id
	JOIN Cargo c ON c.connection_id=con.connection_id
	GROUP BY l.airline_id
	) Clients ON Clients.airline_id = li.airline_id

JOIN( 
	SELECT l.airline_id, COUNT(DISTINCT p.country) AS number FROM Airlines l
	JOIN Connections con ON con.airline_id=l.airline_id
	JOIN Airports p ON p.airport_id = con.start_airport_id
	GROUP BY l.airline_id
	) Countries ON Countries.airline_id = li.airline_id

WHERE Clients.number>1 AND Countries.number>1

-- 4
SELECT p.country, SUM(c.quantity)/COUNT(con.connection_id) AS average FROM Airports p
JOIN Connections con ON p.airport_id = con.end_airport_id
JOIN Cargo c ON c.connection_id = con.connection_id
GROUP BY p.country

-- 5
SELECT DISTINCT country FROM Airports p
WHERE p.country NOT IN (
	SELECT country FROM Airports p
	JOIN Connections con ON p.airport_id = con.end_airport_id
	JOIN Cargo c ON c.connection_id = con.connection_id
	WHERE c.type LIKE 'frozen')