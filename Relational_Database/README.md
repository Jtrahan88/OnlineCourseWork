# Will build multiple Database to improve my SQL skills.

## Terms/commands to know for each database aspec:

# Bash (power shell) [Boiler Plate Projecct](https://www.freecodecamp.org/learn/relational-database/learn-bash-by-building-a-boilerplate/build-a-boilerplate)
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
* CREATE DATABASE - This will creat a database from teh terminal into postgresSQL
* CREATE TABLE (); 0 This will create a table in the current data base
* DELETE FROM table_name WHERE condition; - delete the record you entered with a condition
* DROP DATABASE <Database_name>; - Drops an entire database.
* DROP TABLE table_name; - Drops a table from teh database
* INSERT INTO table_name(column_1, column_2) VALUES(value1, value2); - Add row values to teh database
* Multiple row entries at once: -
>> * INSERT INTO characters(name, homeland, favorite_color)
>> * VALUES('Mario', 'Mushroom Kingdom', 'Red'),
>> * ('Luigi', 'Mushroom Kingdom', 'Green'),
>> * ('Peach', 'Mushroom Kingdom', 'Pink');
* psql --username= dbname=postgres - Connect to a PostgresSQL data base
* SELECT columns FROM table_name ORDER BY column_name; - order columns.
* SELECT columns FROM table_name; - selects a column in the table
* UPDATE table_name SET column_name=new_value WHERE condition; - updates a row value.
* VARCHAR(#) - this is a string data type that requires a number in between the () to put a limit on how many chars can be added.

  

  


