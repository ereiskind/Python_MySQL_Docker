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

3. Prepare the Python Dockerfile and Docker Compose File
========================================================

1. In "Dockerfile"

   1. Replace ``<<Python_version>>`` with the Python version being used for the project
   2. Replace ``<<Git_clone_URL>>`` with the URL for cloning the project repo
   3. Replace ``<<project_file_name>>`` with the name of the file the project will have in the container

2. In "docker-compose.yaml"

   1. Replace ``<<Python_version>>`` with the Python version being used for the project
   2. Replace ``<<MySQL_root_password>>`` with the MySQL root password the project will use

How to Run a Program Based Off This Template
********************************************

1. Build the Connected Python and MySQL Containers
==================================================

1. Open the folder of the project using this template in Windows Explorer, then type ``cmd`` in the address bar to open a Command Prompt window
2. Create the image by typing ``docker compose build`` in the Command Prompt window
3. Create a detached container from that image by typing ``docker compose up -d`` in the Command Prompt window

2. Access the Program
=====================

Interact with the Python Program
--------------------------------

1. Access the Python container by typing ``docker exec -it python-container bash`` in the Command Prompt window
2. Interact with the program via the CLI
3. Exit the Python container by typing ``exit`` in the Command Prompt window

Interact with the MySQL CLI
---------------------------

1. Access the MySQL container by typing ``docker exec -it mysql-container mysql --user=root --password=`` and then the value used for ``<<MySQL_root_password>>`` in the Command Prompt window
2. Select the usage statistics database by typing ``USE `<<schema_name>>`;`` in the Command Prompt window
3. Type SQL statements into Command Prompt to run them
4. Exit the MySQL container by typing ``exit`` in the Command Prompt window

Transfer SQL Data to the Local Machine
--------------------------------------

1. Access the MySQL container by typing ``docker exec -it mysql-container mysql --user=root --password=`` and then the value used for ``<<MySQL_root_password>>`` in the Command Prompt window
2. Dump the database contents to a file by typing ``mysqldump -u root -p <<schema_name>> > filename.sql``  where ``<<schema_name>>`` is replaced by the same schema name value used in the DDL and DML files and  ``filename`` is the name the SQL file will have
3. If prompted for a password, enter the value used for ``<<MySQL_root_password>>`` in the Command Prompt window
4. Exit the MySQL container by typing ``exit`` in the Command Prompt window
5. Copy the file from the container to the local machine by typing ``docker container cp mysql-container:/filename.sql .`` where ``filename`` is the name given to the SQL file in the ``mysqldump`` command

3. Destroy Containers and Images for Refreshing
===============================================

1. Exit out of any containers
2. Destroy the containers by typing ``docker compose down -v`` in the Command Prompt window
3. Destroy the images and clear the cache by typing ``docker system prune -a`` in the Command Prompt window