# Ticket Management System

A local helpdesk ticket management system developed using **JSP**, **Servlet**, **PostgreSQL**, and **Apache Tomcat**.
This system is designed to help users record, manage, update, search, filter, and export helpdesk support tickets.

## Features

* Add new helpdesk ticket
* View all ticket records
* View full ticket details
* Edit and update ticket information
* Delete ticket records
* Search tickets by keyword
* Filter tickets by status, category, and date
* Dashboard summary
* Dashboard chart
* Export ticket records to CSV
* Created At and Last Updated tracking

## Technologies Used

* Java
* JSP
* Servlet
* PostgreSQL
* Apache Tomcat
* HTML
* CSS
* JavaScript
* Eclipse IDE

## Software Requirements

Before running this project, please install:

1. Eclipse IDE for Enterprise Java and Web Developers
2. JDK 21
3. Apache Tomcat 11
4. PostgreSQL
5. pgAdmin
6. Git

## Database Setup

1. Open **pgAdmin**.
2. Create a new database named:

helpdeskdb

3. Open **Query Tool** under the `helpdeskdb` database.
4. Run the SQL script provided in:


database.sql

5. Make sure the `tickets` table is created successfully.

## Database Connection

The database connection file is located at:


src/main/java/com/helpdesk/util/DBConnection.java
```

Default configuration:

private static final String URL = "jdbc:postgresql://localhost:5432/helpdeskdb";
private static final String USER = "postgres";
private static final String PASSWORD = "admin";
```

If your PostgreSQL password is different, update this line:

private static final String PASSWORD = "your_password";

## How to Run the Project in Eclipse

1. Open Eclipse.
2. Go to **File > Import**.
3. Choose **Existing Projects into Workspace**.
4. Select the `TicketManagement` project folder.
5. Click **Finish**.
6. Right click the project.
7. Go to **Properties > Targeted Runtimes**.
8. Tick **Apache Tomcat v11.0**.
9. Click **Apply and Close**.
10. Right click the project again.
11. Choose **Run As > Run on Server**.

Open the system in browser:

http://localhost:8080/TicketManagement/dashboard

## Main Pages

/dashboard       - Dashboard summary
/addTicket.jsp   - Add new ticket
/ticket-list     - View ticket list
/export-tickets  - Export ticket records to CSV

## Testing Checklist

Please test the following:

1. Add one new ticket.
2. Check whether the ticket appears in the ticket list.
3. View the ticket details.
4. Edit the ticket and update the status.
5. Check whether the Last Updated value changes.
6. Test search and filter functions.
7. Export tickets to CSV.
8. Open the CSV file in Excel.
9. Delete only the test ticket.

## Important Notes

* This system is intended to run locally.
* PostgreSQL must be running before using the system.
* Ticket number is entered manually because the official ticket number is provided separately.
* If the database password is different, update `DBConnection.java`.
* The PostgreSQL JDBC driver is included inside:
src/main/webapp/WEB-INF/lib

## Project Status
Completed for local testing and colleague review.
