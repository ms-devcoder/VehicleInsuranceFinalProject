🚗 Vehicle Insurance Management System
📩 For queries or collaboration:

Email: 180040507ece@gmail.com

📘 Overview

The Vehicle Insurance Management System (VIS) is a web-based platform that enables customers to apply for vehicle insurance, upload proofs, and track their policy status online.
Developed as part of a Cognizant (CTS) internship project, the system was built by a team where I primarily handled backend development, while collaborating with teammates for frontend integration.

For detailed UI flow and operations, refer to the [User Manual (High-Level PDF)] available in the repository.

🧠 Objective

To create a digital interface that:

Simplifies insurance application and approval workflows.

Allows customers to apply, submit proofs, and receive policy updates online.

Provides administrators, field officers, and policy admins with dashboards to review, approve, and manage requests efficiently.

🛠️ Technologies Used
Layer	Technology
Frontend	JSP, HTML, CSS
Backend	Java, Spring Boot
Database	MySQL
IDE & Tools	Spring Tool Suite (STS), MySQL Workbench
Architecture	MVC (Model-View-Controller)
👥 User Roles & Functionalities
1. Customer

Register and log in to personal dashboard.

Change password directly from login page.

Profile Management: Edit and view user details.

New Policy Request:

Submit documents for policy application.

Track policy approval status.

Reviews: View or submit reviews after policy approval.

Help Desk: Raise tickets for queries directed to the Admin.

Logout option to exit securely.

2. Admin

Initial Setup:

Admin credentials must be inserted manually into the database via SQL before first login.

Dashboard Functions:

Notifications Panel includes:

Registration Requests from Field Officers & Policy Admins for account approval.

Policy Requests submitted by Customers.

Validated Policies approved by Field Officers.

Approved / Rejected Policies lists for processed applications.

Help Requests: Manage concerns submitted by users (except Admin).

Profile Management: Edit and view personal profile.

Logout securely from the session.

3. Field Officer

Registers independently but requires Admin approval before accessing the dashboard.

Dashboard Functions:

My Assignments: View assigned customer details and uploaded proofs for verification.

Help: Raise tickets to Admin for issues.

Profile Management (Edit/View).

Logout.

4. Policy Admin

Similar to Field Officer — requires Admin approval for dashboard access.

Dashboard Functions:

My Assignments: Review customer proofs forwarded by Admin after verification.

Help: Raise tickets to Admin for assistance.

Profile Management (Edit/View).

Logout.

🧩 Database Design

Database Name: vis

CREATE DATABASE vis;
USE vis;

CREATE TABLE admintable (
  id INT NOT NULL,
  username VARCHAR(255),
  password VARCHAR(255),
  concern VARCHAR(1500),
  reply VARCHAR(1500),
  PRIMARY KEY (id)
);

CREATE TABLE fieldofficertable (
  id INT NOT NULL AUTO_INCREMENT,
  category VARCHAR(255),
  designation VARCHAR(255),
  dob VARCHAR(255),
  email VARCHAR(255),
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  gender VARCHAR(255),
  mblnumber VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  role VARCHAR(255),
  perm VARCHAR(255),
  concern VARCHAR(1500),
  reply VARCHAR(1500),
  PRIMARY KEY (id)
);

CREATE TABLE policyadmintable (
  id INT NOT NULL AUTO_INCREMENT,
  category VARCHAR(255),
  designation VARCHAR(255),
  dob VARCHAR(255),
  email VARCHAR(255),
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  gender VARCHAR(255),
  mblnumber VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  role VARCHAR(255),
  perm VARCHAR(255),
  concern VARCHAR(1500),
  reply VARCHAR(1500),
  PRIMARY KEY (id)
);

CREATE TABLE usertable (
  id INT NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  gender VARCHAR(255),
  dob VARCHAR(255),
  email VARCHAR(255),
  username VARCHAR(45),
  password VARCHAR(255),
  mblnumber VARCHAR(255),
  lnumber VARCHAR(255),
  policyreq VARCHAR(255),
  policyaccept VARCHAR(45),
  concern VARCHAR(1500),
  reply VARCHAR(1500),
  ad_to_fo VARCHAR(45),
  fo_to_adac VARCHAR(45),
  fo_to_adrej VARCHAR(45),
  ad_to_po VARCHAR(45),
  po_to_adac VARCHAR(45),
  po_to_adrej VARCHAR(45),
  review VARCHAR(1000),
  PRIMARY KEY (id)
);

CREATE TABLE imagetable (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  bytes LONGBLOB,
  filename VARCHAR(255),
  filetype VARCHAR(255),
  PRIMARY KEY (id)
);

🧾 Highlights

Fully role-based access control with separate dashboards per user type.

Multi-step approval workflow for policy applications.

Integrated help-desk system for communication between users and admin.

Modular architecture supporting scalability and easy maintenance.

📂 Repository Contents

src/ → Java & JSP source code

resources/ → Configuration and templates

usermanual.pdf → Frontend walkthrough & functional explanation

sql/ → Database creation script

💡 Future Enhancements

Email-based verification and OTP login.

Integration with third-party payment APIs.

Spring Security & JWT-based authentication.

PDF-based policy certificate generation.

✅ Project Type: Internship (Cognizant Technology Solutions)
📅 Domain: Insurance Management System
🧑‍💻 Role: Backend Developer (Java + Spring Boot)
📍 Frontend Support: Handled by team members
