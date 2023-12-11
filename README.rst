Python-MySQL-Docker Template
############################

What This Repo Is
*****************
This repo is a template for building Docker images for Python and MySQL on a Docker network, both of which can have data loaded into them from the outset--the former through a Git clone, the latter through included data definition language and data manipulation language files. While the most basic form of this template creates programs that will contained on a single workstation, this template serves as a slightly more sophisticated version of Python's own virtual environments, as they include a linked SQL database and can have their own changes tracked through version control.

On Files From This Template
===========================
While the majority of a project's code will be in a Git repo hosted online, this template has the ability to save additional files that will be copied into the image containing that repo in locations that cause the files to be interspersed with those from the Git repo. For example, if the GitHub repo contains a directory repo/foo with no subdirectories, and this template has a file at ./src/foo/bar/file.txt, the image will have a file ./root/repo/foo/bar/file.txt. Including ./root/repo/foo/bar in the Git repo .gitignore keeps the files added in with this method from being added to the public Git repo.

How to Create a Program Based Off This Template
***********************************************

1. Prepare the SQL Files and MySQL Dockerfile
=============================================

1. Replace ``<<schema_name>>`` in "mysql/DDL.sql" and "mysql/DML.sql" with the name of the schema the project will use
2. Add the data definition language (the ``CREATE TABLE`` statements) to "mysql/DDL.sql"
3. Add the data manipulation language (the ``INSERT`` statements) to "mysql/DML.sql"
4. Replace ``<<MySQL_root_password>>`` in "mysql/Dockerfile" with the MySQL root password the project will use

2. Prepare the Python Environment and Files
===========================================

1. Add version numbers to the packages in "requirements.txt"
2. All all other non-standard library packages required by the project to "requirements.txt"
3. Add any passwords the project needs to "src/repo_secrets.py"
4. Add any other files needed in the project that cannot be committed to its public repository to "src/"
