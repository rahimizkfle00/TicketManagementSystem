# Ticket Management System

## Title of your application

| Application Title               |
| ------------------------------- |
| Ticket Management System ver1.0 |

## Description

Ticket Management System is a local helpdesk ticket tracking system developed using JSP, Servlet, PostgreSQL, and Apache Tomcat. This system allows users to record, view, update, search, filter, delete, and export helpdesk ticket records.

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

## Result / Output

| No. | Screenshot                                                                                  | Description                                      |
| --- | ------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| 1   | `<img width="1900" alt="Dashboard Screenshot" src="PASTE_DASHBOARD_IMAGE_LINK_HERE" />`     | Dashboard page showing ticket summary and charts |
| 2   | `<img width="1900" alt="Add Ticket Screenshot" src="PASTE_ADD_TICKET_IMAGE_LINK_HERE" />`   | Add ticket form page                             |
| 3   | `<img width="1900" alt="Ticket List Screenshot" src="PASTE_TICKET_LIST_IMAGE_LINK_HERE" />` | Ticket list page with search and filter function |
| 4   | `<img width="1900" alt="View Ticket Screenshot" src="PASTE_VIEW_TICKET_IMAGE_LINK_HERE" />` | Full ticket details page                         |
| 5   | `<img width="1900" alt="Edit Ticket Screenshot" src="PASTE_EDIT_TICKET_IMAGE_LINK_HERE" />` | Edit ticket form page                            |
| 6   | `<img width="1900" alt="CSV Export Screenshot" src="PASTE_EXPORT_IMAGE_LINK_HERE" />`       | Exported CSV file opened in Excel                |

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

## Database Setup

| Step | Instruction                                           |
| ---- | ----------------------------------------------------- |
| 1    | Open pgAdmin                                          |
| 2    | Create a database named `helpdeskdb`                  |
| 3    | Open Query Tool under `helpdeskdb`                    |
| 4    | Run the SQL script from `database.sql`                |
| 5    | Make sure the table `tickets` is created successfully |

## Database Connection

The database connection file is located at:

src/main/java/com/helpdesk/util/DBConnection.java

Default database configuration:


private static final String URL = "jdbc:postgresql://localhost:5432/helpdeskdb";
private static final String USER = "postgres";
private static final String PASSWORD = "admin";

If the PostgreSQL password is different, update the password in `DBConnection.java`.

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

## Project Status

Completed for local testing and colleague review.
