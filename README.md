# VehicleInsuranceFinalProject
************for any queries  can contact me on mail--180040507ece@gmail.com---

The main Purpose of project is to make a interface for customer to apply for insurance for their vehicle by submiting proofs online.
It is my cts internship project done by me along with team where i was the one who worked for Backend and took help for frontend by my teammates.
********************************------------***************
** you can refer """usermanual(Highlevel pdf file)""" in repository for frontend operations how the system works.
********************************-------------***********


*****************
Technologies Used: Java,Mysql,Jsp,Html,Css,Springboot
Ides:Spring-Tool-Suite(Sts),Mysql WorkBench
*****************
<11111111111>
Customer:
*Customer can directly register and login to dashboard.
Can change password on login page
1.Userprofile:
User can edit and view profile Details
2.NewPolicyRequest:
*the user can apply for policyInsurance for vehilce by submitiing required Documents and status of approval will be displayed
*the user can view reviews given by another customers for policy nad can give review for policy after approval. 
3.Help:
the customer can take help from admin by raising a ticket.
4.Logout
</11111111111>




<2222222>
Admin:
For Admin who is one of the user of webpage ,you have to firstly insert username and password directly using sql query to login dashboard.
Can change password on login page
**On admin dashboard:
1.Notifacations:
*Registration request:The request from field and policyadmin for thier login approval
*polciyRequest:The polciyrequests fro customer
*policyaftervalidation:the veified and accepted cutomer requests drom fieldofficer
*policyapproved:The approved and proccessed customer detalis
*policyrejected:the customer request rejected by both policyadmin adn fiedl officer.
2.helpRequests:
The helpconcerns from the all user except admin.
3.Logout
4.UserProfile:
User can edit and view profile Details
</22222222>




<333333>
FeildOfficer:
*user can directly register but he can only login only after approval from admin to dashboard.
Can change password on login page
ONDASHBOARD:
1.Myassignments:
The custmor details and proofs for insurance send by admin
2.Help:
the fieldOfficer can take help from admin by raising a ticket.
3.Logout
4.UserProfile:
User can edit and view profile Details
</333333>



<444444444>
PolicyAdmin:
*user can directly register but he can only login only after approval from admin to dashboard.
Can change password on login page
ON DASHBOARD:
1.UserProfile:
User can edit and view profile Details
2.Myassignments:
The custmor details and proofs for insurance send by admin after verified by fieldOfficer.
3.Help:
the fieldOfficer can take help from admin by raising a ticket.
4.Logout
</44444444444444>


*******************Database Creation**********************************************************************
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
