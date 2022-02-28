/* This simple query creates a database named Saleries in a Saleries s
	schema. Then We create a table and manuplate the table by inserting, 
    deleteiing entities from the created table.  
	*/
# Creating a database
drop database IF exists Sales;
create database IF not exists Sales;

# Create a schema
drop schema IF exists Sales;
create schema IF not exists Sales;

# Create a table in the Sales schema
drop table if exists test_table;
CREATE TABLE test_table (
    test_field DECIMAL(5 , 3 )
);

# Select statement to show the created table 
SELECT 
    *
FROM
    test_table;

# Insert statement -- insert values in the test_field
insert test_table(test_field) values (10.5),(14.666);
# delete the row from the table 
DELETE FROM test_table 
WHERE
    test_field = 10.5;

# Select statement to show the created table 
SELECT 
    *
FROM
    test_table;