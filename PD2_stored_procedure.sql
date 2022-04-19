CREATE PROCEDURE myProcedure
@country varchar(25),
@date date
AS
BEGIN

	-- usuwanie mrozonek
	DELETE c FROM Cargo c
	JOIN Connections con ON con.connection_id=c.connection_id
	JOIN Airports p ON p.airport_id=con.start_airport_id OR p.airport_id=con.end_airport_id
	WHERE p.country = @country AND CAST(con.date AS date) = @date AND c.type LIKE 'frozen'

	
	-- aktualizowanie ceny
	DECLARE con_cursor CURSOR LOCAL FOR SELECT DISTINCT con.connection_id FROM Connections con
		JOIN Cargo c ON con.connection_id=c.connection_id
		JOIN Airports p ON p.airport_id=con.start_airport_id OR p.airport_id=con.end_airport_id
		WHERE p.country = @country AND CAST(con.date AS date) = @date

	DECLARE @con_id int

	OPEN con_cursor
	FETCH NEXT FROM con_cursor into @con_id
	WHILE @@FETCH_STATUS=0
	BEGIN
		DECLARE @tax real
		DECLARE @packages_count int

		SET @packages_count = (
			SELECT SUM(quantity) FROM Cargo
			WHERE connection_id=@con_id)

		IF @packages_count < 5
			SET @tax = 1.20;
		ELSE IF @packages_count < 10
			SET @tax = 1.10;
		ELSE SET @tax = 1.05;

		UPDATE Cargo 
		SET cost = cost*@tax
		WHERE connection_id = @con_id

		FETCH NEXT FROM con_cursor into @con_id

	END

	CLOSE con_cursor
	DEALLOCATE con_cursor
END

-- przykladowe wywolanie (z rollbackiem zmian)
BEGIN TRANSACTION
	EXEC myProcedure 'USA', '2021-05-26'
	SELECT * FROM Cargo
ROLLBACK
