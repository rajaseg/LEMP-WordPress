# LEMP-WordPress
Deploy WordPress on LEMP Stack using Docker Compose

## Contents of the Repository
This repository contains WordPress application running on LEMP Stack, supported by Docker and orchestrated by Docker Compose.

It Includes:

A container for Nginx;\
A container for WordPress;\
A container for MariaDB;\
A container for Adminer;

## Pre-Requisites

> ```start-wordpress.sh``` script will install docker and docker compose if you don't have them on the server

If you want to proceed manually, make sure Docker and Docker Compose installed on the server where you are going to install the stack.

> Create **wordpress** and **db** folders as well in the same directory to persist WordPress and MariaDB data.

If you are cloning the repository, then no need to create below files. or else ***Please make sure you have below secret files created in the directory***

wordpress_db_host.txt -->It should have db host name. Here it is db:3306 \
wordpress_db_user.txt -->It shoould have user name to log into db container. Here it is someuser \
wordpress_db_name.txt -->It shoould have database name for WordPress container. Here it is wordpress-user \
mysql_user.txt -->It should be same as wordpress_db_name.txt \
mysql_db_password.txt -->It shoould have password to connect and utilise wordpress database. Here it is somesecret \
wordpress_table_prefix.txt -->It shoould have table prefix for the databases for security purposes. Here it is sometext_ \
mysql_database.txt -->It shoould have database name for WordPress container. Here it is wordpress \
mysql_root_password.txt -->It shoould have user name to manage MariaDB container through Adminer. Here it is root 

## Install or Set up WordPress
> Please make sure to update ```example.com``` in Nginx Configuration before proceeding to install WordPresss

> Also make sure that ```DNS entry (example.com)``` updated with ```IP``` of the server where you are installing the script

Clone or Download this repository. Once after getting the repository, there is a script file "start-wordpress.sh" if you want to automate whole process.

Change the file permission with 777

```sudo chmod 777 start-wordpress.sh```

Run the script with sudo.

```sudo ./start-wordpress.sh```

If you want to proceed manual process; please make sure pre-requisites installed to proceed further.

Once after getting the repository, use ```docker-compose up -d``` and wait for the containers to configure the WordPress site.

Open the domain, example.com in the web browser. Create an admin account and click the Install WordPress button.

## Manage MariaDB using Adminer
You can manage your MariaDB database using Adminer container that was included in the repository.

Open the web browser and enter dbadmin.example.com to open Adminer interface. Use root account and myswl_root_password to log into it.

## Remove WordPress and Cleanup
Use command ```docker-compose down``` removes the containers, but preserves your WordPress database.

Use command ```docker-compose down --volumes``` to remove everything from the server, i.e containers, network, WordPress data and MariaDB data.
