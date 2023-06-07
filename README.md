# Angular Ecommerce Web App

This tree tier web application is created using Nodejs, Angular and MySQL. This project also uses Ant Design for its UI and SwiperJS for its carousels. The backend is built using Node.js, Express.js, Joi for input validation, and JWT for authentication.

We will be using this application to learn and understand the deployment steps of 3-tier web-application on various services of AWS and GCP.. like AWS-EC2, AWS-EKS, AWS-ECS, AWS-beanstalk, GCP-ComputeInstances, GCP-GKS. 

<br/>

![](1.gif)
![](2.gif)

## Functionality

The application allows you to browse the home page for products, check out each of the details of the product and add them to your cart for a later checkout.

Adding products to your cart will make a notification pop up and indicate that the product was added successfully.

You are able to see a preview of the cart on the top bar or even navigate into a more detailed cart page.

The checkout process is a multi-page form that at the end allows you to place an order that will later be shown on the order history page.

<br/>

Application Deployment in AWS – EC2 "OR"
Three tier web Application Deployment in AWS – EC2 "OR"
Node.js, Angular.js, MySQL-based Web Application deployment in AWS – EC2 "OR"
Frontend, Backend and Database based web Application deployment in AWS – EC2

Here we are using one EC2 instance to install the frontend, backend, and database. 

Step 1: Create an AWS Linux machine using AWS Linux AMI, using instance type t2.small ( 1 CPU and 2 GB memory) or the above configuration. ( c4.large config is 2 cpu and 3.75gb memory)
Edit the Linux machine’s security group and in inbound rules allow ports 4200, 5000, and 3306. 


Step 2: Installation
-	Install GIT: yum install git
-	Install NPM: yum install npm
-	Install Node Version Manager: curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash  
-	Install Node version 16 and use it : 
nvm install 16
nvm use 16
-	Install Angular: npm install -g @angular/cli
-	Install and configure MySQL:
sudo rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
sudo yum install mysql-community-server 
systemctl start mysqld 
grep 'temporary password' /var/log/mysqld.log 
mysql_secure_installation ( change password and say “yes” for other options)

mysql -u root -p
create database webapp;
CREATE USER webapp_u@localhost IDENTIFIED BY 'Webapp_1234';
GRANT ALL PRIVILEGES ON webapp.* TO webapp_u@localhost;
FLUSH PRIVILEGES;
exit;


Step 3: Download Code and install node modules 
-	cd /home
mkdir webapp
cd webapp
git clone https://github.com/michaelparkadze/angular-ecommerce-app.git

-	Install node modules for both frontend and backend.

cd /home/webapp/angular-ecommerce-app/backend
npm install

/home/webapp/angular-ecommerce-app/client
npm install


Step 4: Import the database and update it (some hands-on on the database) 

-	Use provided sample sql database and import it to mysql
cd /home/webapp/angular-ecommerce-app/backend
mysql -u root -p webapp < sql_dump.sql

-	Delete mandatory column “username” from table “users” from database “webapp”;

mysql -u root -p
show databases ;
use myapp;
show tables;
select * from categories;
select * from users;
ALTER TABLE users DROP COLUMN username; 
select * from users;



Step 5: Changes related to running the application in the Production environment.

-	Create a folder called env in the root of the backend directory and create a produciton.env file.
cd /home/webapp/angular-ecommerce-app/backend/env

[root@ip-172-31-80-191 env]# cat production.env 
PORT=5000
DB_HOST='localhost'
DB_USER='root'
DB_PASSWORD='********'
DB_NAME='webapp'


-	Edit environment.prod.ts file

cd /home/webapp/angular-ecommerce-app/client/src/environments
vi environment.prod.ts

[root@ip-172-31-80-191 environments]# cat environment.prod.ts 
export const environment = {
        production: true,
        apiUrl: 'http://ec2-35-175-245-177.compute-1.amazonaws.com:5000/api/v1/',
};

In the above environment.prod.ts file grep the apiURL value from the Amazon ec2 Public IPv4 DNS name.



Step 6:  Start the Application frontend and backend in two separate session

-	Start Frontend 
cd /home/webapp/angular-ecommerce-app/client
ng serve --prod --port 4200 --host 0.0.0.0 --disable-host-check         (-  this step takes some time)

-	Start Backend 
cd /home/webapp/angular-ecommerce-app/backend
npm run start



Step 7: Check the application in the web-browser

ec2-35-175-245-177.compute-1.amazonaws.com:5000   (Use your own Amazon ec2 Public IPv4 DNS name) 
ec2-35-175-245-177.compute-1.amazonaws.com:4200


That’s all – your application is up and running. 
Here we are using one EC2- instance, in which frontend, backend, and database are installed. 







PS: The original copy of this project can be viewed at: https://github.com/michaelparkadze/angular-ecommerce-app.git


