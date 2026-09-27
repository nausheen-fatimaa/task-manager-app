# DevOps Task Manager

A Java-based **Task Manager Web Application** built using Jakarta Servlets, JSP, MySQL, Maven, BCrypt, and Apache Tomcat.

The application provides user registration and authentication and allows users to manage their tasks through a web interface.

---

## 🚀 Features

* User registration
* Secure password hashing using BCrypt
* User login/logout
* Session-based authentication
* Task management
* MySQL database integration
* JSP-based web interface
* Jakarta Servlet-based backend
* Maven build management
* Deployable as a WAR file on Apache Tomcat

---

## 🏗️ Application Architecture

```text
                    ┌─────────────────────┐
                    │      Browser        │
                    │   Chrome / Edge     │
                    └──────────┬──────────┘
                               │
                               │ HTTP
                               ▼
                    ┌─────────────────────┐
                    │    Apache Tomcat    │
                    │       :8081         │
                    └──────────┬──────────┘
                               │
                 ┌─────────────┴─────────────┐
                 │                           │
                 ▼                           ▼
        ┌─────────────────┐        ┌─────────────────┐
        │ JSP / Servlets  │        │   User Session  │
        │  Web Interface  │        │ Authentication  │
        └────────┬────────┘        └─────────────────┘
                 │
                 ▼
        ┌─────────────────┐
        │   Service Layer │
        │   UserService   │
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
        │ Repository Layer│
        │ UserRepository  │
        └────────┬────────┘
                 │
                 │ JDBC
                 ▼
        ┌─────────────────┐
        │      MySQL      │
        │    vprofile DB  │
        │      :3306      │
        └─────────────────┘
```

---

## 🛠️ Technologies Used

| Technology       | Purpose                         |
| ---------------- | ------------------------------- |
| Java             | Application development         |
| Jakarta Servlets | Backend request handling        |
| JSP              | Web interface                   |
| MySQL            | Database                        |
| JDBC             | Database connectivity           |
| BCrypt           | Password hashing                |
| Maven            | Build and dependency management |
| Apache Tomcat    | Application server              |
| HTML/CSS         | Frontend                        |
| Git              | Version control                 |
| GitHub           | Source code hosting             |

---

## 📁 Project Structure

```text
task-manager-app/
│
├── database/
│   └── schema.sql
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── devops/
│       │           └── vprofile/
│       │               ├── config/
│       │               │   └── DatabaseConfig.java
│       │               │
│       │               ├── controller/
│       │               │   ├── LoginController.java
│       │               │   ├── LogoutController.java
│       │               │   └── UserController.java
│       │               │
│       │               ├── model/
│       │               │   └── User.java
│       │               │
│       │               ├── repository/
│       │               │   └── UserRepository.java
│       │               │
│       │               └── service/
│       │                   └── UserService.java
│       │
│       ├── resources/
│       │   ├── application.properties
│       │   └── db.properties
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           │
│           ├── css/
│           ├── dashboard.jsp
│           ├── login.jsp
│           ├── register.jsp
│           └── index.jsp
│
├── pom.xml
├── README.md
└── .gitignore
```

---

# ⚙️ Prerequisites

Before running the application, install:

### 1. Java

Verify:

```powershell
java -version
```

Example:

```text
openjdk version "25.0.4"
```

### 2. Maven

Verify:

```powershell
mvn -version
```

### 3. MySQL

Verify that the MySQL service is running.

On Windows:

```powershell
Get-Service MySQL80
```

Start it if necessary:

```powershell
Start-Service MySQL80
```

### 4. Apache Tomcat

This project is designed to run on Apache Tomcat.

Jenkins in the development environment uses port `8080`, so Tomcat is configured to use:

```text
8081
```

---

# 🗄️ Database Setup

The application uses a MySQL database named:

```text
vprofile
```

The database schema is available at:

```text
database/schema.sql
```

## Step 1: Login to MySQL

```powershell
& "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
```

Enter your MySQL root password.

---

## Step 2: Create the Database

You can execute the schema from PowerShell:

```powershell
Get-Content .\database\schema.sql | & "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
```

The schema creates:

```text
vprofile
```

with tables such as:

```text
users
tasks
```

---

## Step 3: Verify the Database

```powershell
& "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
```

Then:

```sql
SHOW DATABASES;
```

You should see:

```text
vprofile
```

Select the database:

```sql
USE vprofile;
```

Check tables:

```sql
SHOW TABLES;
```

---

# 🔐 Database Configuration

The application database configuration is stored in:

```text
src/main/resources/db.properties
```

Example:

```properties
db.url=jdbc:mysql://localhost:3306/vprofile
db.username=vprofile
db.password=<your-password>
```

For production environments, database credentials should be supplied through environment variables or a secrets-management system instead of committing passwords to Git.

---

# 🔑 Authentication

User passwords are not stored as plain text.

The application uses:

```text
BCrypt
```

for password hashing.

Registration flow:

```text
User
  │
  ▼
Registration Form
  │
  ▼
UserController
  │
  ▼
UserService
  │
  ▼
BCrypt Hash
  │
  ▼
UserRepository
  │
  ▼
MySQL
```

Login flow:

```text
User
  │
  ▼
Login Form
  │
  ▼
LoginController
  │
  ▼
UserService
  │
  ▼
Find User by Email
  │
  ▼
BCrypt Password Verification
  │
  ▼
Create Session
  │
  ▼
Dashboard
```

---

# 🔨 Build the Application

Navigate to the project:

```powershell
cd "C:\Users\Nausheen fatima\OneDrive\Desktop\task-manager-app"
```

Run:

```powershell
mvn clean package
```

If the build is successful, Maven generates the WAR file inside:

```text
target/
```

For example:

```text
target/task-manager-app.war
```

---

# 🚀 Deploy to Apache Tomcat

Copy the generated WAR file into Tomcat's:

```text
webapps
```

directory.

Example:

```powershell
Copy-Item .\target\*.war "C:\apache-tomcat-10.1.xx\webapps\"
```

Replace `10.1.xx` with your installed Tomcat version.

---

# ▶️ Start Tomcat

Open PowerShell:

```powershell
cd "C:\apache-tomcat-10.1.xx\bin"
```

Start Tomcat:

```powershell
.\startup.bat
```

Tomcat should start on:

```text
http://localhost:8081
```

---

# 🌐 Access the Application

If the WAR file is:

```text
task-manager-app.war
```

open:

```text
http://localhost:8081/task-manager-app/
```

The application should display the login page.

---

# 👤 Register a User

Open:

```text
http://localhost:8081/task-manager-app/register
```

Enter:

```text
Name
Email
Password
```

Click:

```text
Register
```

After successful registration, the application redirects to the login page.

---

# 🔐 Login

Open:

```text
http://localhost:8081/task-manager-app/login
```

Enter your registered:

```text
Email
Password
```

After successful authentication, the application redirects to the dashboard.

---

# 🛑 Stop Tomcat

To stop the application server:

```powershell
cd "C:\apache-tomcat-10.1.xx\bin"
.\shutdown.bat
```

If Tomcat does not stop, check port `8081`:

```powershell
Get-NetTCPConnection -LocalPort 8081 -ErrorAction SilentlyContinue
```

---

# 🔍 Troubleshooting

## MySQL Connection Error

Check whether MySQL is running:

```powershell
Get-Service MySQL80
```

Start it:

```powershell
Start-Service MySQL80
```

Verify the database:

```sql
SHOW DATABASES;
```

---

## Port 8081 Already in Use

Check:

```powershell
Get-NetTCPConnection -LocalPort 8081
```

Find the process:

```powershell
Get-Process -Id <PID>
```

---

## Maven Build Failure

Run:

```powershell
mvn clean
mvn clean package
```

For more detailed Maven output:

```powershell
mvn clean package -X
```

---

## Login Fails

Check:

1. MySQL is running.
2. `vprofile` database exists.
3. `users` table exists.
4. `db.properties` contains the correct database configuration.
5. The user was successfully registered.
6. Tomcat logs do not contain database connection errors.

---

# 📊 Application Flow

```text
                  START
                    │
                    ▼
              Open Application
                    │
                    ▼
             ┌──────────────┐
             │ Login Page   │
             └──────┬───────┘
                    │
             New User?
              /          \
            Yes           No
             │             │
             ▼             ▼
        Registration      Login
             │             │
             ▼             ▼
          MySQL       Validate Password
                           │
                     ┌─────┴─────┐
                     │           │
                   Valid       Invalid
                     │           │
                     ▼           ▼
                 Dashboard     Login Page
                     │
                     ▼
                   Tasks
                     │
                     ▼
                   Logout
```

---

# 🔒 Security Considerations

This project is intended for learning and DevOps practice.

For production deployment, consider adding:

* Environment-based database credentials
* HTTPS/TLS
* Secure session cookies
* CSRF protection
* Input validation
* Connection pooling
* Security headers
* Centralized logging
* Database backups
* Secrets management
* Containerization
* CI/CD pipeline
* Monitoring and alerting

---

# 🐳 Future DevOps Improvements

This application can be extended into a complete DevOps project using:

```text
GitHub
   │
   ▼
Jenkins
   │
   ▼
Maven Build
   │
   ▼
Unit Tests
   │
   ▼
Docker Image
   │
   ▼
Container Registry
   │
   ▼
Kubernetes
   │
   ▼
AWS
   │
   ▼
Monitoring
```

Possible future implementation:

* Jenkins CI/CD pipeline
* Docker containerization
* Docker Compose
* Kubernetes deployment
* AWS EC2 deployment
* AWS RDS MySQL
* Terraform infrastructure
* Prometheus monitoring
* Grafana dashboards
* Automated deployment and rollback

---

# 📸 Screenshots

Add screenshots of the application here.

Recommended screenshots:

```text
screenshots/
├── login.png
├── register.png
├── dashboard.png
└── task-management.png
```

Example:

```markdown
## Login

![Login Page](screenshots/login.png)

## Registration

![Registration Page](screenshots/register.png)

## Dashboard

![Dashboard](screenshots/dashboard.png)
```

---

# 🧪 Project Validation

The application was tested for:

* MySQL connectivity
* User registration
* BCrypt password hashing
* User login
* Session authentication
* Maven WAR packaging
* Apache Tomcat deployment
* Browser-based application access

---

# 📌 Project Information

**Project:** DevOps Task Manager

**Application Type:** Java Web Application

**Build Tool:** Maven

**Database:** MySQL

**Application Server:** Apache Tomcat

**Backend:** Jakarta Servlets

**Frontend:** JSP / HTML / CSS

**Authentication:** BCrypt + HTTP Session

---

# 👩‍💻 Author

**Nausheen Fatima**

MBA | DevOps Learner

Skills practiced with this project:

```text
Linux
Git & GitHub
Java
Maven
MySQL
Jenkins
Docker
Kubernetes
AWS
Terraform
CI/CD
```

---

## ⭐ If you find this project useful

Feel free to explore the source code, experiment with the deployment process, and extend the application with additional DevOps automation.
