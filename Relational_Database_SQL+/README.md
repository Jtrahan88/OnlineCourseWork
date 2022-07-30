# Will build multiple Databases to improve my SQL skills.

# Using SQL in Your Web Site
#### To build a web site that shows data from a database, you will need:
* An RDBMS database program (i.e. MS Access, SQL Server, MySQL)
* To use a server-side scripting language, like PHP or ASP
* To use SQL to get the data you want
* To use HTML / CSS to style the page

# RDBMS
* RDBMS stands for Relational Database Management System.
* RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, Oracle, MySQL, and Microsoft Access.
* The data in RDBMS is stored in database objects called tables. A table is a collection of related data entries and it consists of columns and rows.


## Terms/commands to know for each database aspec:

# Bash (power shell) [Boiler Plate Projecct](https://www.freecodecamp.org/learn/relational-database/learn-bash-by-building-a-boilerplate/build-a-boilerplate) 
#### Bug in teh system waiting for a response before I can complete. 
* --help - Most commands have a --help flag to show what the command can do. example ls --help
* cd - change directory
* cd ../.. - For each .. and a / we go back one folder
* cp - copy. copy a file to another directoyr. example cp <desination>
* echo - command lets you print anything to the terminal.
* echo - prints to screen adn can print to a file. example: echo some text >> <filename>
* exit - exits the terminal
* find - you can use find to find things or view a file tree.
* ls - stands for list
* mkdir - "make directory". can add directories to other folder as well. mkdir <folderName>/<new_foldername>
* more - prints a file contents on screen
* mv - stands for move. it can remove or more something. example mv <filename> <new_filename> or mv <filename> <desination>
* pwd - print working directory(folder)
* rm - remove - used to remove files from directories. example rm <filename>
* rmdir - remove directory
* touch <filename> - creates a new file in a directory


# Bash(using SQL syntax) [Building a Mario Database](https://www.freecodecamp.org/learn/relational-database/learn-relational-databases-by-building-a-mario-database/build-a-mario-database)
* \c - This will connect to the date base we would like to enter.
* \d <table_name> - will show information about the specific table
* \d 0 this will check the tables inside the database
* \l - list database, tables, columns, etc.
* ALTER DATABASE database_name RENAME TO new_database_name; - rename a data base
* ALTER Table <table_name> ADD COLUMN <column_name> DATATYPE - This will alter teh table to add a column. We will need to label the datatype the column is.
* ALTER TABLE <table_name> DROP COLUMN <column_name> - will drop a columns from a table
* ALTER TABLE <table_name> RENAME COLUMN <column_name> TO <new_name>; - Change name of a column
* ALTER TABLE table_name ADD PRIMARY KEY(column_name) - Add a primary key to a table
* ALTER TABLE table_name DROP CONSTRAINT constraint_name; - Drop a constraint like a primary key.
* AVG() - function returns the average value of a numeric column. 
* CREATE DATABASE - This will creat a database from teh terminal into postgresSQL
* CREATE TABLE (); 0 This will create a table in the current data base
* COUNT() - function returns the number of rows that matches a specified criterion.
* DELETE FROM table_name WHERE condition; - statement is used to delete existing records in a table. (delete the record you entered with a condition)
* DISTINCT - statement is used to return only distinct (different) values.
* DROP DATABASE <Database_name>; - Drops an entire database.
* DROP TABLE table_name; - Drops a table from teh database
* INSERT INTO table_name(column_1, column_2) VALUES(value1, value2); - statement is used to insert new records in a table.(Add row values to the database table)
* LIKE - operator is used in a WHERE clause to search for a specified pattern in a column.
>> * There are two wildcards often used in conjunction with the LIKE operator:
>> >> * The percent sign (%) represents zero, one, or multiple characters
>> >> * The underscore sign (_) represents one, single character
* MAX() - function returns the largest value of the selected column. 
* MIN() - function returns the smallest value of the selected column.
* Multiple row entries at once: -
>> * INSERT INTO characters(name, homeland, favorite_color)
>> * VALUES('Mario', 'Mushroom Kingdom', 'Red'),
>> * ('Luigi', 'Mushroom Kingdom', 'Green'),
>> * ('Peach', 'Mushroom Kingdom', 'Pink');
* NULL Value - is a field with no value. 
* Operators (AND, OR and NOT):
>> * The WHERE clause can be combined with AND, OR, and NOT operators.
>> * The AND and OR operators are used to filter records based on more than one condition:
>> * The AND operator displays a record if all the conditions separated by AND are TRUE.
>> * The OR operator displays a record if any of the conditions separated by OR is TRUE.
>> * The NOT operator displays a record if the condition(s) is NOT TRUE. 
* ORDER BY - keyword is used to sort the result-set in ascending or descending order. sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
* psql --username= dbname=postgres - Connect to a PostgresSQL data base
* SELECT - statement is used to select data from a database
* SELECT columns FROM table_name ORDER BY column_name; - order columns.
* SELECT columns FROM table_name; - selects a column in the table
* SELECT TOP(Special Case not used in MySQL) - clause is used to specify the number of records to return. Is useful on large tables with thousands of records. Returning a large number of records can impact performance.
* SUM() - function returns the total sum of a numeric column. 
* TRUNCATE TABLE - command deletes the data inside a table, but not the table itself
* UPDATE table_name SET column_name=new_value WHERE condition; -statement is used to modify the existing records in a table. (Updates a row value based on a condition.)
* VARCHAR(#) - this is a string data type that requires a number in between the () to put a limit on how many chars can be added.
* WHERE - clause is used to filter records.
*   
# SQL Project(WIP)
#### Bug in teh system waiting for a response before I can complete.
