# VehicleInsuranceFinalProject
************for any queries u can contact me on mail--180040507ece@gmail.com---

The main Purpose of project is to make a interface for customer to apply for insurance for their vehicle by submiting proofs online.
It is my cts internship project done by me long with team where i only member worked for Backend and took help for frontend by my teammates.
********************************------------***************
** you can refer """usermanual(Highlevel pdf file)""" in for frontend operations how the system works.
********************************-------------***********


*****************
Technologies Used: Java,Mysql,Jsp,Html,Css,Springboot
Ides:Spring-Tool-Suite(Sts),Mysql WorkBench
*****************


For Admin who is one of the user of webpage ,you have to firstly insert username and password directly using sql query.
*******************Database Creation*****
CREATE DATABASE vis;

USE vis;

CREATE TABLE admintable (
  id int NOT NULL,
  password varchar(255) DEFAULT NULL,
  username varchar(255) DEFAULT NULL,
  concern varchar(1500) DEFAULT NULL,
  reply varchar(1500) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE fieldofficertable (
  id int NOT NULL AUTO_INCREMENT,
  category varchar(255) DEFAULT NULL,
  designation varchar(255) DEFAULT NULL,
  dob varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  firstname varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  lastname varchar(255) DEFAULT NULL,
  mblnumber varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  perm varchar(255) DEFAULT NULL,
  role varchar(255) DEFAULT NULL,
  username varchar(255) DEFAULT NULL,
  concern varchar(1500) DEFAULT NULL,
  reply varchar(1500) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE policyadmintable (
  id int NOT NULL AUTO_INCREMENT,
  category varchar(255) DEFAULT NULL,
  designation varchar(255) DEFAULT NULL,
  dob varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  firstname varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  lastname varchar(255) DEFAULT NULL,
  mblnumber varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  perm varchar(255) DEFAULT NULL,
  role varchar(255) DEFAULT NULL,
  username varchar(255) DEFAULT NULL,
  concern varchar(1500) DEFAULT NULL,
  reply varchar(1500) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE usertable (
  id int NOT NULL AUTO_INCREMENT,
  dob varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  firstname varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  lastname varchar(255) DEFAULT NULL,
  lnumber varchar(255) DEFAULT NULL,
  mblnumber varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  policyreq varchar(255) DEFAULT NULL,
  policyaccept varchar(45) DEFAULT NULL,
  username varchar(45) DEFAULT NULL,
  concern varchar(1500) DEFAULT NULL,
  reply varchar(1500) DEFAULT NULL,
  ad_to_fo varchar(45) DEFAULT NULL,
  fo_to_adac varchar(45) DEFAULT NULL,
  fo_to_adrej varchar(45) DEFAULT NULL,
  ad_to_po varchar(45) DEFAULT NULL,
  po_to_adac varchar(45) DEFAULT NULL,
  po_to_adrej varchar(45) DEFAULT NULL,
  review varchar(1000) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE imagetable (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  bytes longblob,
  filename varchar(255) DEFAULT NULL,
  filetype varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);


******************************************End Of database Creation*******************************
