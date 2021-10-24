# sql-challenge

This project is to create a postgres DB, load data from csv, and run some queries. 

In order to run the code, create a db in Postgres. 
Run the script to create tables and constriants: sql_challenge-create-tables.sql

Next import csv data into the tables. 
When importing csv data into tables, do it in the following order to avoid constraint issues: 
- departments
- titles
- employees
- salaries
- dep_emp
- dep_manager 

Run the script to view the queries: sql-challenge-queries

Bonus: 
I completed some of the bonus exercise.  

Start a jupyter notebook in a PythonData38 session to work with the following file: sql-challenge-bonus.ipynb

I was successful in using SQLAlchemy to connect to my local Postgres DB to view data, add it to a dataframe, and provide one visualization. 

