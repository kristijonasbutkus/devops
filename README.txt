######################################################
README file contains instructions on how to setup working environment for developers
######################################################

Pull website files from GitHub:
	git clone https://github.com/adeoweb/devops-workshop src

Pull configuration files from GitHub:
	git clone https://github.com/kristijonasbutkus/devops configs

######################################################

Configuration files
There are 2 configuration files in "configs" directory that you can to edit to match your needs:
	docker-compose.yml
Here you set your MySQL database login username and password.

	site.conf
In this file you can set a different website working directory. By default it is set to:
	"src/public"


######################################################
Getting ready to connect

1) First off you need to navigate to "configs" folder and execute the following command:

	sudo docker-compose up

2) After everything loads up execute one more command:

	sudo docker exec -i configs_php_1 bash -c "cd /src && composer install"

3) Open ".env" file in your website directory
Edit this file in order to change MySQL credentials (must match docker-compose.yml credentials):

	DATABASE_URL=mysql://username:password@mysql:3306/db

4) Open "doctrine.yaml" file which is located in your website directory src/config/packages folder and edit these lines according to current mysql driver and mysql version:

	       driver: 'pdo_mysql'
        server_version: '5.6.39'

5) Lastly, execute commands below to update mysql database with your website content:

	sudo docker exec -i configs_php_1 bash -c "cd /src && bin/console doctrine:schema:update --force"

	sudo docker exec -i configs_php_1 bash -c "cd /src && bin/console doctrine:fixtures:load"

######################################################
Connecting to the website

In order to connect to your website you can use URL below with port 8080:

	localhost:8080


