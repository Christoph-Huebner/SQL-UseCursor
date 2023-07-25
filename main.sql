-----------------------------------------------------------------------------------
-- Header
-----------------------------------------------------------------------------------
-- Programname: SQL-UseCursor 
-- Current version: v0.1
-- Owner: C. Huebner
-- Creation date: 2023-07-25
-----------------------------------------------------------------------------------
-- Changes
--
-----------------------------------------------------------------------------------
-- Clean up the temp. tables
DROP TABLE IF EXISTS #tmp;
-- !! Set you source table name
SELECT * INTO #tmp FROM <SourceTable> WHERE 1 = 2;

-- !! Set the field names that you want extract
DECLARE @<Field1> VARCHAR(255);
DECLARE @<Field2> INTEGER;
DECLARE @<Field3> DATETIME;

-- Define SQL connection
DECLARE cur CURSOR FOR
    -- !! Set the fields of the source table that you want
	SELECT <Field1>, <Field2>, <Field3>   
	FROM <SourceTable>
    -- !! Specify you condition (default: get the entries from the last 10 days of the datetime field3)
	WHERE <Field3> >= DATEADD(DAY, -10, GETDATE())
	-- Get the latest entries (id - primary key)
    ORDER BY id DESC;

    -- Open SQL connection
	OPEN cur;
    -- Save the first entry from the SQL Query (source table) in the variables
	FETCH NEXT FROM cur INTO @<Field1>, @<Field2>, @<Field3>;
	-- Interate over all source table entries
	WHILE @@FETCH_STATUS = 0  
	BEGIN
        -- Insert the values into the temp. table, that was stored in the variables
		INSERT INTO #tmp(<Field1>, <Field2>, <Field3>) VALUES (@<Field1>, @<Field2>, @<Field3>)
		-- Save the next entry from the SQL Query (source table) in the variables
        FETCH NEXT FROM cur INTO @<Field1>, @<Field2>, @<Field3>;
	END  

-- Close and deallocate SQL connection  
	CLOSE cur  
DEALLOCATE cur

-- Show the results
SELECT * FROM #tmp;