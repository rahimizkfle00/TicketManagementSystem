# Ticket Management System

## Description

Ticket Management System is a local helpdesk ticket tracking system developed using **JSP**, **Servlet**, **PostgreSQL**, and **Apache Tomcat**.

This system allows users to record, view, update, search, filter, delete, export, and manage helpdesk ticket records. It is designed for local testing and internal helpdesk ticket monitoring. The system also supports uploading proof files after a ticket is completed, such as before photo, after photo, and scanned CM form.

---

## List of all the endpoints

| No. | Endpoint / File | Method | Description |
| --- | --------------- | ------ | ----------- |
| 1 | `/index.jsp` | GET | Redirects or navigates user to the main system page |
| 2 | `/dashboard` | GET | Displays dashboard summary, ticket statistics, and chart overview |
| 3 | `/addTicket.jsp` | GET | Displays the form to add a new helpdesk ticket |
| 4 | `/add-ticket` | POST | Saves the new ticket information into the PostgreSQL database |
| 5 | `/ticket-list` | GET | Displays all ticket records with search and filter function |
| 6 | `/view-ticket?id=` | GET | Displays full details of a selected ticket including proof evidence |
| 7 | `/edit-ticket?id=` | GET | Displays the edit form for a selected ticket |
| 8 | `/update-ticket` | POST | Updates the selected ticket information in the database |
| 9 | `/uploadProof.jsp?id=` | GET | Displays the upload and view proof page for a selected ticket |
| 10 | `/upload-proof` | POST | Uploads before photo, after photo, and scanned CM form |
| 11 | `/delete-proof` | GET | Deletes selected proof file from the ticket |
| 12 | `/delete-ticket?id=` | GET | Deletes the selected ticket record from the database |
| 13 | `/export-tickets` | GET | Exports all ticket records into CSV format |

---

## Result / Output

| No. | Screenshot | Description |
| --- | ---------- | ----------- |
| 1 | <img width="1695" height="937" alt="image" src="https://github.com/user-attachments/assets/4374013a-5741-4679-9ad9-4c45bb057438" /> | Dashboard page showing ticket summary and charts |
| 2 | <img width="1563" height="565" alt="image" src="https://github.com/user-attachments/assets/7bc8a235-7de4-4b34-8f1e-f955185256c1" /> | Add ticket form page |
| 3 | <img width="1302" height="766" alt="image" src="https://github.com/user-attachments/assets/05f2d0c3-364e-4ddc-9d53-cf0f5f56b37b" /> | Ticket list page with search, filter, and proof button |
| 4 | <img width="1277" height="788" alt="image" src="https://github.com/user-attachments/assets/85db496b-5e70-47f6-91f0-11cc6efd8660" /> | Full ticket details page |
| 5 | <img width="1147" height="467" alt="image" src="https://github.com/user-attachments/assets/df90bb0d-f3d0-4dcb-921c-66271ca9196f" /> | Edit ticket form page |
| 6 | <img width="1542" height="748" alt="image" src="https://github.com/user-attachments/assets/356620e7-3624-4367-b9e3-972683f978a7" /> | Exported CSV file opened in Excel |
| 7 | <img width="980" height="367" alt="image" src="https://github.com/user-attachments/assets/5866d793-5a67-4f9f-9646-2ab2da847c2e" />  | Upload proof page for before photo, after photo, and scanned CM form |
| 8 | <img width="970" height="377" alt="image" src="https://github.com/user-attachments/assets/554262e0-e0f0-404d-a6e2-a17aedb9b157" />| Proof evidence section showing uploaded files and delete buttons |

---

## Main Features

| No. | Feature | Description |
| --- | ------- | ----------- |
| 1 | Add Ticket | Allows user to create a new helpdesk ticket |
| 2 | View Ticket List | Displays all saved ticket records |
| 3 | View Ticket Details | Displays full information for a selected ticket |
| 4 | Edit Ticket | Allows user to update ticket information |
| 5 | Delete Ticket | Allows user to delete selected ticket record |
| 6 | Search Ticket | Allows user to search ticket by keyword |
| 7 | Filter Ticket | Allows user to filter by status, category, and date |
| 8 | Dashboard Summary | Displays total tickets, open cases, closed cases, pending tickets, and monthly tickets |
| 9 | Dashboard Chart | Displays ticket statistics visually |
| 10 | Export CSV | Exports ticket records into CSV format |
| 11 | Created At Tracking | Records when the ticket was created |
| 12 | Last Updated Tracking | Records when the ticket was last updated |
| 13 | Upload Proof Files | Allows user to upload proof files after ticket completion |
| 14 | View Proof Evidence | Displays before photo, after photo, and scanned CM form in ticket details |
| 15 | Replace Proof Files | Allows user to replace uploaded proof by uploading a new file |
| 16 | Delete Proof Files | Allows user to delete uploaded proof files |

---

## Technologies Used

| No. | Technology | Purpose |
| --- | ---------- | ------- |
| 1 | Java | Backend programming language |
| 2 | JSP | Web page interface |
| 3 | Servlet | Handles request and response logic |
| 4 | PostgreSQL | Database for storing ticket records |
| 5 | Apache Tomcat 11 | Local server to run the web application |
| 6 | HTML / CSS / JavaScript | Frontend layout, styling, and interaction |
| 7 | Eclipse IDE | Development environment |

---

## Software Requirements

Before running this project, please install:

| No. | Software |
| --- | -------- |
| 1 | Eclipse IDE for Enterprise Java and Web Developers |
| 2 | JDK 21 |
| 3 | Apache Tomcat 11 |
| 4 | PostgreSQL |
| 5 | pgAdmin |
| 6 | Git |

---

## Database Setup

| Step | Instruction |
| ---- | ----------- |
| 1 | Open pgAdmin |
| 2 | Create a database named `helpdeskdb` |
| 3 | Open Query Tool under `helpdeskdb` |
| 4 | Run the SQL script from `database.sql` |
| 5 | Make sure the table `tickets` is created successfully |

The `tickets` table stores ticket information, action records, timestamps, and proof file paths.

### Important Database Columns

| Column | Purpose |
| ------ | ------- |
| `cfm_form_number` | Stores the CM form reference number |
| `ticket_number` | Stores the official helpdesk ticket number |
| `created_at` | Stores when the ticket was created |
| `updated_at` | Stores when the ticket was last updated |
| `before_photo` | Stores uploaded before-work photo path |
| `after_photo` | Stores uploaded after-work photo path |
| `cm_form_file` | Stores uploaded scanned CM form file path |

---

## Database Connection

The database connection file is located at:

```text
src/main/java/com/helpdesk/util/DBConnection.java
````

Default database configuration:

```java
private static final String URL = "jdbc:postgresql://localhost:5432/helpdeskdb";
private static final String USER = "postgres";
private static final String PASSWORD = "admin";
```

If your PostgreSQL password is different, update the password in `DBConnection.java`.

Example:

```java
private static final String PASSWORD = "your_password";
```

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

```text
http://localhost:8080/TicketManagement/dashboard
```

---

## Tester / Colleague Instruction

Hi, please help to test this local Helpdesk Ticket Management System.

GitHub repository:

```text
https://github.com/rahimizkfle00/TicketManagementSystem
```

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

```sql
helpdeskdb
```

3. Open Query Tool under `helpdeskdb`.
4. Copy and run the SQL script from:

```text
database.sql
```

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

```text
src/main/java/com/helpdesk/util/DBConnection.java
```

Check this line:

```java
private static final String PASSWORD = "admin";
```

If your PostgreSQL password is different, change `"admin"` to your own PostgreSQL password.

### Run System

1. Right click project.
2. Choose `Run As > Run on Server`.
3. Select Tomcat 11.
4. Open browser:

```text
http://localhost:8080/TicketManagement/dashboard
```

---

## Testing Checklist

| No. | Test Case           | Expected Result                                                          |
| --- | ------------------- | ------------------------------------------------------------------------ |
| 1   | Add new ticket      | Ticket is saved successfully                                             |
| 2   | View ticket list    | Ticket appears in the list                                               |
| 3   | View ticket details | Full ticket information is displayed                                     |
| 4   | Edit ticket         | Ticket information is updated                                            |
| 5   | Check Last Updated  | Last Updated date/time changes after update                              |
| 6   | Search ticket       | Matching ticket records are displayed                                    |
| 7   | Filter ticket       | Records are filtered by selected criteria                                |
| 8   | Upload proof files  | Before photo, after photo, and scanned CM form are uploaded successfully |
| 9   | View proof evidence | Uploaded proof files appear inside ticket details                        |
| 10  | Replace proof file  | Uploading a new file replaces the existing proof file                    |
| 11  | Delete proof file   | Selected proof file is deleted successfully                              |
| 12  | Export CSV          | CSV file is downloaded successfully                                      |
| 13  | Delete test ticket  | Ticket is removed from the system                                        |

---

## Common Issues

| Issue                           | Solution                                                     |
| ------------------------------- | ------------------------------------------------------------ |
| Database connection failed      | Check PostgreSQL is running and database password is correct |
| Table does not exist            | Run `database.sql` inside `helpdeskdb`                       |
| Page not found                  | Open `/dashboard` instead of random JSP or Servlet path      |
| Project cannot run              | Make sure Apache Tomcat 11 is selected                       |
| PostgreSQL login failed         | Update the password in `DBConnection.java`                   |
| CSV export not opening properly | Open the exported file using Microsoft Excel                 |
| Upload proof failed             | Make sure the uploaded before and after files are images     |
| Scanned CM form upload failed   | Use PDF or image file only                                   |
| Uploaded image not shown        | Re-upload the file and make sure Tomcat is running properly  |

---

## Important Notes

* This system is intended to run locally.
* PostgreSQL must be running before using the system.
* Ticket number is entered manually because the official ticket number is provided separately.
* CM Form Number is different from Scanned CM Form.
* `cfm_form_number` stores the CM form reference number.
* `cm_form_file` stores the uploaded scanned CM form file path.
* Proof files should be uploaded only after the ticket is completed or closed.
* Uploading a new proof file will replace the existing file path in the system.
* Uploaded proof files are stored locally in:

```text
src/main/webapp/uploads
```

* The PostgreSQL JDBC driver is included inside:

```text
src/main/webapp/WEB-INF/lib
```

* Use Apache Tomcat 11 because the system uses Jakarta Servlet.
* Uploaded proof files are ignored by Git using `.gitignore` to avoid pushing test images or PDF files to GitHub.

---

## Project Status

Version 1.0 completed for local testing and colleague review.

