# SQL-UseCursor

## Use a cursor to interate over all table entries

This SQL script use a cursor to get access of each table row. In some cases this is needed.
It's better as a simple while loop with select last id (saved in a variable).

## Notifications

* The results will saved in a temporary table.
* For sure you needed a existing database with a table if interest
* Check if the database is correct (right connection)

## How to use this SQL script

1. Clone this project
2. Edit the main.sql as following:
    - Specify the database if is needed (uncomment line 13 and enter the database name)
    - Set the name of your source table in line 18 and 29
    - Define you needed fields in line 21..23, 28, 38, 43, 45
    - Adjust the where condition in line 31
4. Save the main.sql after editing
5. Copy the code via drag and drop into the SQL Management Studio (see download link before)
6. Click the execute button

Download link for SQL Management Studio

https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16
