| ## Application Title               |
| ------------------------------- |
| Ticket Management System ver1.0 |

## Description

Ticket Management System is a local helpdesk ticket tracking system developed using **JSP**, **Servlet**, **PostgreSQL**, and **Apache Tomcat**.

This system allows users to record, view, update, search, filter, delete, and export helpdesk ticket records. It is designed for local testing and internal helpdesk ticket monitoring.

---

## List of all the endpoints

| No. | Endpoint / File      | Method | Description                                                       |
| --- | -------------------- | ------ | ----------------------------------------------------------------- |
| 1   | `/index.jsp`         | GET    | Redirects or navigates user to the main system page               |
| 2   | `/dashboard`         | GET    | Displays dashboard summary, ticket statistics, and chart overview |
| 3   | `/addTicket.jsp`     | GET    | Displays the form to add a new helpdesk ticket                    |
| 4   | `/add-ticket`        | POST   | Saves the new ticket information into the PostgreSQL database     |
| 5   | `/ticket-list`       | GET    | Displays all ticket records with search and filter function       |
| 6   | `/view-ticket?id=`   | GET    | Displays full details of a selected ticket                        |
| 7   | `/edit-ticket?id=`   | GET    | Displays the edit form for a selected ticket                      |
| 8   | `/update-ticket`     | POST   | Updates the selected ticket information in the database           |
| 9   | `/delete-ticket?id=` | GET    | Deletes the selected ticket record from the database              |
| 10  | `/export-tickets`    | GET    | Exports all ticket records into CSV format                        |

---

## Result / Output

| No. | Screenshot                                                                                | Description                                      |
| --- | ----------------------------------------------------------------------------------------- | ------------------------------------------------ |
| 1   | <img width="1900" alt="Dashboard Screenshot" src="PASTE_DASHBOARD_IMAGE_LINK_HERE" />     | Dashboard page showing ticket summary and charts |
| 2   | <img width="1900" alt="Add Ticket Screenshot" src="PASTE_ADD_TICKET_IMAGE_LINK_HERE" />   | Add ticket form page                             |
| 3   | <img width="1900" alt="Ticket List Screenshot" src="PASTE_TICKET_LIST_IMAGE_LINK_HERE" /> | Ticket list page with search and filter function |
| 4   | <img width="1900" alt="View Ticket Screenshot" src="PASTE_VIEW_TICKET_IMAGE_LINK_HERE" /> | Full ticket details page                         |
| 5   | <img width="1900" alt="Edit Ticket Screenshot" src="PASTE_EDIT_TICKET_IMAGE_LINK_HERE" /> | Edit ticket form page                            |
| 6   | <img width="1900" alt="CSV Export Screenshot" src="PASTE_EXPORT_IMAGE_LINK_HERE" />       | Exported CSV file opened in Excel                |

---

## Technologies Used

| No. | Technology              | Purpose                                   |
| --- | ----------------------- | ----------------------------------------- |
| 1   | Java                    | Backend programming language              |
| 2   | JSP                     | Web page interface                        |
| 3   | Servlet                 | Handles request and response logic        |
| 4   | PostgreSQL              | Database for storing ticket records       |
| 5   | Apache Tomcat 11        | Local server to run the web application   |
| 6   | HTML / CSS / JavaScript | Frontend layout, styling, and interaction |
| 7   | Eclipse IDE             | Development environment                   |

---

## Software Requirements

Before running this project, please install:

| No. | Software                                           |
| --- | -------------------------------------------------- |
| 1   | Eclipse IDE for Enterprise Java and Web Developers |
| 2   | JDK 21                                             |
| 3   | Apache Tomcat 11                                   |
| 4   | PostgreSQL                                         |
| 5   | pgAdmin                                            |
| 6   | Git                                                |

---

## Database Setup

| Step | Instruction                                           |
| ---- | ----------------------------------------------------- |
| 1    | Open pgAdmin                                          |
| 2    | Create a database named `helpdeskdb`                  |
| 3    | Open Query Tool under `helpdeskdb`                    |
| 4    | Run the SQL script from `database.sql`                |
| 5    | Make sure the table `tickets` is created successfully |

---

## Database Connection

The database connection file is located at:
src/main/java/com/helpdesk/util/DBConnection.java

Default database configuration:

private static final String URL = "jdbc:postgresql://localhost:5432/helpdeskdb";
private static final String USER = "postgres";
private static final String PASSWORD = "admin";


If your PostgreSQL password is different, update the password in `DBConnection.java`.

Example:
private static final String PASSWORD = "your_password";
---

## How to Run the Application

| Step | Instruction                                                                 |
| ---- | --------------------------------------------------------------------------- |
| 1    | Open Eclipse IDE                                                            |
| 2    | Import the project using `File > Import > Existing Projects into Workspace` |
| 3    | Select the `TicketManagement` project folder                                |
| 4    | Set the runtime server to Apache Tomcat 11                                  |
| 5    | Make sure PostgreSQL is running                                             |
| 6    | Run the project using `Run As > Run on Server`                              |
| 7    | Open the system in browser                                                  |

Application URL:
http://localhost:8080/TicketManagement/dashboard

---

## Tester / Colleague Instruction
Please install the required software first:

1. Eclipse IDE for Enterprise Java and Web Developers
2. JDK 21
3. Apache Tomcat 11
4. PostgreSQL
5. pgAdmin
6. Git

### Database Setup for Tester

1. Open pgAdmin.
2. Create a database named:
helpdeskdb

3. Open Query Tool under `helpdeskdb`.
4. Copy and run the SQL script from:

```text
database.sql


5. Make sure the table `tickets` is created.

### Project Setup in Eclipse

1. Clone or download the GitHub project.
2. Open Eclipse.
3. Go to `File > Import`.
4. Select `Existing Projects into Workspace`.
5. Choose the `TicketManagement` project folder.
6. Click Finish.
7. Right click project > Properties.
8. Go to `Targeted Runtimes`.
9. Tick Apache Tomcat v11.0.
10. Click Apply and Close.

### Database Password

Open this file:
src/main/java/com/helpdesk/util/DBConnection.java


Check this line:

private static final String PASSWORD = "admin";


If your PostgreSQL password is different, change `"admin"` to your own PostgreSQL password.

### Run System

1. Right click project.
2. Choose `Run As > Run on Server`.
3. Select Tomcat 11.
4. Open browser:

http://localhost:8080/TicketManagement/dashboard


---

## Testing Checklist

| No. | Test Case           | Expected Result                             |
| --- | ------------------- | ------------------------------------------- |
| 1   | Add new ticket      | Ticket is saved successfully                |
| 2   | View ticket list    | Ticket appears in the list                  |
| 3   | View ticket details | Full ticket information is displayed        |
| 4   | Edit ticket         | Ticket information is updated               |
| 5   | Check Last Updated  | Last Updated date/time changes after update |
| 6   | Search ticket       | Matching ticket records are displayed       |
| 7   | Filter ticket       | Records are filtered by selected criteria   |
| 8   | Export CSV          | CSV file is downloaded successfully         |
| 9   | Delete test ticket  | Ticket is removed from the system           |

---

## Common Issues

| Issue                           | Solution                                                     |
| ------------------------------- | ------------------------------------------------------------ |
| Database connection failed      | Check PostgreSQL is running and database password is correct |
| Table does not exist            | Run `database.sql` inside `helpdeskdb`                       |
| Page not found                  | Open `/dashboard` instead of random JSP/Servlet path         |
| Project cannot run              | Make sure Apache Tomcat 11 is selected                       |
| PostgreSQL login failed         | Update the password in `DBConnection.java`                   |
| CSV export not opening properly | Open the exported file using Microsoft Excel                 |

---

## Important Notes

* This system is intended to run locally.
* PostgreSQL must be running before using the system.
* Ticket number is entered manually because the official ticket number is provided separately.
* The PostgreSQL JDBC driver is included inside:

src/main/webapp/WEB-INF/lib

* Use Apache Tomcat 11 because the system uses Jakarta Servlet.
---

## Project Status

Completed for local testing and colleague review.
