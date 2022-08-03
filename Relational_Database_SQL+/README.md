# Will build multiple Databases to improve my SQL skills.

# Sources:
* [Free Code Camp](https://www.freecodecamp.org/learn/)
* [W3schools](https://www.w3schools.com/sql/default.asp)
 

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
* ALIASES - 
>> * Used to give a table, or a column in a table, a temporary name.
>> * Used to make column names more readable.
>> * Only exists for the duration of that query.
>> * Is created with the AS keyword.
* ALL means that the condition will be true only if the operation is true for all values in the range. 
>> * returns a boolean value as a result.
>> * returns TRUE if ALL of the subquery values meet the condition.
>> * is used with SELECT, WHERE and HAVING statements.
* ALTER DATABASE database_name RENAME TO new_database_name; - rename a data base
* ALTER Table <table_name> ADD COLUMN <column_name> DATATYPE - This will alter teh table to add a column. We will need to label the datatype the column is.
* ALTER TABLE <table_name> DROP COLUMN <column_name> - will drop a columns from a table
* ALTER TABLE <table_name> RENAME COLUMN <column_name> TO <new_name>; - Change name of a column
* ALTER TABLE table_name ADD PRIMARY KEY(column_name) - Add a primary key to a table
* ALTER TABLE table_name DROP CONSTRAINT constraint_name; - Drop a constraint like a primary key.
* ANY - operator, means that the condition will be true if the operation is true for any of the values in the range.
>> * returns a boolean value as a result.
>> * returns TRUE if ANY of the subquery values meet the condition.
* AVG() - function returns the average value of a numeric column. 
* BACKUP DATABASE <database> TO DISK = 'filepath'; - is used in SQL Server to create a full back up of an existing SQL database.
* BETWEEN - operator selects values within a given range. The values can be numbers, text, or dates. Is inclusive: begin and end values are included.
* CASE statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause. Example:
> * CASE
> * WHEN condition1 THEN result1
> * WHEN condition2 THEN result2
> * WHEN conditionN THEN resultN
> * ELSE result
> * END;

If there is no ELSE part and no conditions are true, it returns NULL.
* CREATE DATABASE - This will creat a database from teh terminal into postgresSQL
* CREATE TABLE (); 0 This will create a table in the current data base
* COUNT() - function returns the number of rows that matches a specified criterion.
* DELETE FROM table_name WHERE condition; - statement is used to delete existing records in a table. (delete the record you entered with a condition)
* DISTINCT - statement is used to return only distinct (different) values.
* DROP DATABASE <Database_name>; - Drops an entire database.
* DROP TABLE table_name; - Drops a table from the database.
* EXISTS - is used to test for the existence of any record in a subquery. Returns TRUE if the subquery returns one or more records.
* GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country"
  >> * Is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
* HAVING - was added to SQL because the WHERE keyword cannot be used with aggregate functions. Example:
>> * SELECT column_name(s)
>> * FROM table_name
>> * WHERE condition
>> * GROUP BY column_name(s)
>> * HAVING condition
>> * ORDER BY column_name(s);
* IN - operator allows you to specify multiple values in a WHERE clause. Is a shorthand for multiple OR conditions.
* JOIN - clause is used to combine rows from two or more tables, based on a related column between them.
>> * INNER JOIN  - keyword selects records that have matching values in both tables.
>> * LEFT JOIN  - keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.
>> * RIGHT JOIN  - keyword returns all records from the right table (table2), and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.
>> * The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
>> >> * FULL OUTER JOIN and FULL JOIN are the same.
>> * SELF JOIN is a regular join, but the table is joined with itself. Examples:
>> >> * SELECT column_name(s)
>> >> * FROM table1 T1, table1 T2
>> >> * WHERE condition;
  >> >> * T1 and T2 are different table aliases for the same table.
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
* NULL Functions - IFNULL(), ISNULL(), COALESCE(), and NVL() Functions
>> * MySQL IFNULL()  - Return the specified value IF the expression is NULL, otherwise return the expression
>> * MySQL COALESCE()  - Return the first non-null value in a list
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
* SELECT INTO  - statement copies data from one table into a new table. Requires that the data types in source and target tables match.
  >> * SELECT column1, column2, column3, ...
  >> * INTO newtable [IN externaldb]
  >> * FROM oldtable
  >> * WHERE condition;
* SELECT TOP(Special Case not used in MySQL) - clause is used to specify the number of records to return. Is useful on large tables with thousands of records. Returning a large number of records can impact performance.
* Stored Procedure - A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again. So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it. You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed. Example:
 >> * CREATE PROCEDURE procedure_name
 >>  >> * AS
 >>  >> * sql_statement
 >>  >> * GO;
 >> * Execute a Stored Procedure:
 >>  >> * EXEC procedure_name;
 >> * Stored Procedure With One Parameter - statement creates a stored procedure that selects Customers from a particular City from the "Customers" table:
 >>  >> * CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
>>  >> AS
>> >> * SELECT * FROM Customers WHERE City = @City
>>  >> * GO;
>> *  Execute the stored procedure above as follows:
 >> >> * EXEC SelectAllCustomers @City = 'London';
 >> * Stored Procedure With Multiple Parameters - Setting up multiple parameters is very easy. Just list each parameter and the data type separated by a comma as shown below. The following SQL statement creates a stored procedure that selects Customers from a particular City with a particular PostalCode from the "Customers" table:
>>  >> * CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
>>  >> * AS
>>  >> * SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
>>  >> * GO;
>> * Execute the stored procedure above as follows:
>>  >> * EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';
* SUM() - function returns the total sum of a numeric column. 
* TRUNCATE TABLE - command deletes the data inside a table, but not the table itself
* UNION operator is used to combine the result-set of two or more SELECT statements.
>> * Every SELECT statement within UNION must have the same number of columns.
>> * The columns must also have similar data types.
>> * The columns in every SELECT statement must also be in the same order.
* UNION ALL - The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL.
* UPDATE table_name SET column_name=new_value WHERE condition; -statement is used to modify the existing records in a table. (Updates a row value based on a condition.)
* VARCHAR(#) - this is a string data type that requires a number in between the () to put a limit on how many chars can be added.
* WHERE - clause is used to filter records.
* Wildcard Characters -  A wildcard character is used to substitute one or more characters in a string.  Wildcard characters are used with the LIKE operator. The LIKE operator is used in a WHERE clause to search for a specified pattern in a column. Wildcard Characters in SQL Server Examples:
>> * Symbol	| Description	| Example
>> * %	| Represents zero or more characters | bl% finds bl, black, blue, and blob
>> * _	| Represents a single character	| h_t finds hot, hat, and hit
>> * []	| Represents any single character within the brackets	| h[oa]t finds hot and hat, but not hit
>> * ^	| Represents any character not in the brackets	| h[^oa]t finds hit, but not hot and hat
>> * \-	| Represents any single character within the specified range	| c[a-b]t finds cat and cbt  
* Wildar Card examples(continued):
>> ### All the wildcards can also be used in combinations!
>> #### Here are some examples showing different LIKE operators with '%' and '_' wildcards:
>> * LIKE Operator |	Description
>> * WHERE CustomerName LIKE 'a%'	| Finds any values that starts with "a"
>> * WHERE CustomerName LIKE '%a'	| Finds any values that ends with "a"
>> * WHERE CustomerName LIKE '%or%'	| Finds any values that have "or" in any position
>> * WHERE CustomerName LIKE '_r%'	| Finds any values that have "r" in the second position
>> * WHERE CustomerName LIKE 'a__%'	| Finds any values that starts with "a" and are at least 3 characters in length
>> * WHERE ContactName LIKE 'a%o'	| Finds any values that starts with "a" and ends with "o"

# SQL Project(WIP)
#### Bug in teh system waiting for a response before I can complete.
