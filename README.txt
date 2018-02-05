######################################################
README file contains instructions on how to setup working environment for developers
######################################################

Pulling website files from GitHub:
	"git clone https://github.com/adeoweb/devops-workshop src"
-------pull "config" folder and "docker-composer.yml" file

######################################################

Configuration files
There are 2 main configuration files in "configs" directory that you can to edit to match your needs:
	docker-compose.yml
Here you set your MySQL database login username and password.

	site.conf
In this file you can set a different website working directory. By default it is set to:
	"src/public"


######################################################
Getting ready to connect

1) First off you need to navigate to "configs" folder and execute the following command:

	docker-compose up

2) After everything loads up execute one more command:

	docker exec -i configs_php_1 bash -c "cd /src && composer install"

3) Open ".env" file in your website directory
Edit this file in order to change MySQL credentials (must match docker-compose.yml credentials):

	DATABASE_URL=mysql://<username>:<password>@mysql:3306/<database name>

4) Open "doctrine.yaml" file which is located in your website directory src/config/packages folder and edit these lines according to current mysql driver and mysql version:

	       driver: 'pdo_mysql'
        server_version: '5.6.39'

5) Lastly, execute commands below to update mysql database with your website content:

	docker exec -i configs_php_1 bash -c "cd /src && bin/console doctrine:schema:update --force"

	docker exec -i configs_php_1 bash -c "cd /src && bin/console doctrine:fixtures:load"

######################################################
Connecting to the website

In order to connect to your website you can use URL below with port 1337:

	localhost:1337


