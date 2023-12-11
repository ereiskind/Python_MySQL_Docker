Python-MySQL-Docker Template
############################

What This Repo Is
*****************
This repo is a template for building Docker images for Python and MySQL on a Docker network, both of which can have data loaded into them from the outset--the former through a Git clone, the latter through included data definition language and data manipulation language files. While the most basic form of this template creates programs that will contained on a single workstation, this template serves as a slightly more sophisticated version of Python's own virtual environments, as they include a linked SQL database and can have their own changes tracked through version control.

How to Create a Program Based Off This Template
***********************************************

1. Prepare the SQL Files and MySQL Dockerfile
=============================================

1. Replace ``<<schema_name>>`` in "mysql/DDL.sql" and "mysql/DML.sql" with the name of the schema the project will use
2. Add the data definition language (the ``CREATE TABLE`` statements) to "mysql/DDL.sql"
3. Add the data manipulation language (the ``INSERT`` statements) to "mysql/DML.sql"
4. Replace ``<<MySQL_root_password>>`` in "mysql/Dockerfile" with the MySQL root password the project will use