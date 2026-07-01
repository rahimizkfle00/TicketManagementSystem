<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.helpdesk.model.Ticket" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!
    public String filterValue(Object value) {
        return value == null ? "" : value.toString();
    }

    public String filterSelected(Object currentValue, String optionValue) {
        if (currentValue == null) {
            return "";
        }

        return currentValue.toString().equals(optionValue) ? "selected" : "";
    }

    public String dateTimeValue(Object value) {
        if (value == null) {
            return "-";
        }

        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            return formatter.format(value);
        } catch (Exception e) {
            return value.toString();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket List</title>

    <link rel="stylesheet" href="css/style.css">
</head>

<body class="helpdesk-page">

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="top-header">
        <div class="logo-box">📋</div>
        <div>
            <h1>Helpdesk Ticket List</h1>
            <p>View, search, filter and manage saved helpdesk tickets from the local database</p>
        </div>
    </div>

    <div class="progress-bar">
        <span class="active"></span>
        <span class="active"></span>
        <span class="active"></span>
    </div>

    <% if ("1".equals(request.getParameter("updated"))) { %>
        <div class="success-message">
            ✅ Ticket updated successfully.
            Ticket No: <strong><%= request.getParameter("ticketNo") %></strong>
        </div>
    <% } %>

    <% if ("1".equals(request.getParameter("deleted"))) { %>
        <div class="success-message">
            ✅ Ticket deleted successfully.
        </div>
    <% } %>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            ❌ Error: <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>


    <!-- SEARCH / FILTER -->
    <div class="card helpdesk-card-space">

        <div class="section-title section-title-between">
            <div class="section-title-left">
                <div class="section-icon blue">🔍</div>
                <div>
                    <h2>Search / Filter Tickets</h2>
                    <p>Search ticket records by keyword, status, category or date range</p>
                </div>
            </div>
        </div>

        <form action="ticket-list" method="get">

            <div class="filter-grid">

                <div class="form-field">
                    <label>Keyword</label>
                    <div class="input-box">
                        <i>🔎</i>
                        <input type="text"
                               name="keyword"
                               placeholder="Ticket No, Name, Site, Issue..."
                               value="<%= filterValue(request.getAttribute("keyword")) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Status</label>
                    <div class="input-box">
                        <i>●</i>
                        <select name="status">
                            <option value="">All Status</option>
                            <option value="CASE OPEN" <%= filterSelected(request.getAttribute("status"), "CASE OPEN") %>>CASE OPEN</option>
                            <option value="CASE CLOSED" <%= filterSelected(request.getAttribute("status"), "CASE CLOSED") %>>CASE CLOSED</option>
                            <option value="RECEIVED REPLACEMENT" <%= filterSelected(request.getAttribute("status"), "RECEIVED REPLACEMENT") %>>RECEIVED REPLACEMENT</option>
                            <option value="PENDING USER" <%= filterSelected(request.getAttribute("status"), "PENDING USER") %>>PENDING USER</option>
                            <option value="PENDING VENDOR" <%= filterSelected(request.getAttribute("status"), "PENDING VENDOR") %>>PENDING VENDOR</option>
                            <option value="PENDING PART" <%= filterSelected(request.getAttribute("status"), "PENDING PART") %>>PENDING PART</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>Category</label>
                    <div class="input-box">
                        <i>📂</i>
                        <select name="category">
                            <option value="">All Category</option>
                            <option value="Software" <%= filterSelected(request.getAttribute("category"), "Software") %>>Software</option>
                            <option value="Hardware" <%= filterSelected(request.getAttribute("category"), "Hardware") %>>Hardware</option>
                            <option value="Network" <%= filterSelected(request.getAttribute("category"), "Network") %>>Network</option>
                            <option value="Printer" <%= filterSelected(request.getAttribute("category"), "Printer") %>>Printer</option>
                            <option value="Monitor" <%= filterSelected(request.getAttribute("category"), "Monitor") %>>Monitor</option>
                            <option value="PoE Switch" <%= filterSelected(request.getAttribute("category"), "PoE Switch") %>>PoE Switch</option>
                            <option value="CoreRVT" <%= filterSelected(request.getAttribute("category"), "CoreRVT") %>>CoreRVT</option>
                            <option value="Others" <%= filterSelected(request.getAttribute("category"), "Others") %>>Others</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>Date From</label>
                    <div class="input-box">
                        <i>📅</i>
                        <input type="date"
                               name="dateFrom"
                               value="<%= filterValue(request.getAttribute("dateFrom")) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Date To</label>
                    <div class="input-box">
                        <i>📅</i>
                        <input type="date"
                               name="dateTo"
                               value="<%= filterValue(request.getAttribute("dateTo")) %>">
                    </div>
                </div>

                <div class="filter-actions">
                    <button type="submit" class="filter-btn">Search</button>
                    <a href="ticket-list" class="reset-filter-btn">Reset</a>
                </div>

            </div>

        </form>

    </div>


    <!-- TICKET TABLE -->
    <div class="card helpdesk-card-space">

        <div class="section-title section-title-between">
            <div class="section-title-left">
                <div class="section-icon blue">🎫</div>
                <div>
                    <h2>All Tickets</h2>
                    <p>Latest ticket records appear at the top</p>
                </div>
            </div>

           
<div class="dashboard-actions">
    <a href="${pageContext.request.contextPath}/dashboard" class="top-action-btn">← Dashboard</a>
    <a href="${pageContext.request.contextPath}/addTicket.jsp" class="top-action-btn">+ Add Ticket</a>
    <a href="${pageContext.request.contextPath}/export-tickets" class="top-action-btn">Export CSV</a>
</div>

        </div>

        <div class="table-container">

            <table class="ticket-table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Status</th>
                        <th>CM Form No.</th>
                        <th>Ticket No.</th>
                        <th>Date</th>
                        <th>Last Updated</th>
                        <th>Name</th>
                        <th>Site</th>
                        <th>Room Location</th>
                        <th>Category</th>
                        <th>Issue</th>
                        <th>View</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        List<Ticket> ticketList = (List<Ticket>) request.getAttribute("ticketList");

                        if (ticketList == null || ticketList.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="14" class="empty-row">No tickets found.</td>
                        </tr>
                    <%
                        } else {
                            int no = 1;

                            for (Ticket ticket : ticketList) {
                    %>
                        <tr>
                            <td><%= no++ %></td>

                            <td>
                                <span class="status-badge">
                                    <%= ticket.status == null ? "-" : ticket.status %>
                                </span>
                            </td>

                            <td><%= ticket.cfmFormNumber == null ? "-" : ticket.cfmFormNumber %></td>
                            <td><strong><%= ticket.ticketNumber == null ? "-" : ticket.ticketNumber %></strong></td>
                            <td><%= ticket.ticketDate == null ? "-" : ticket.ticketDate %></td>
                            <td><%= dateTimeValue(ticket.updatedAt) %></td>
                            <td><%= ticket.reporterName == null ? "-" : ticket.reporterName %></td>
                            <td><%= ticket.site == null ? "-" : ticket.site %></td>
                            <td><%= ticket.roomLocation == null ? "-" : ticket.roomLocation %></td>
                            <td><%= ticket.category == null ? "-" : ticket.category %></td>
                            <td class="issue-cell"><%= ticket.issue == null ? "-" : ticket.issue %></td>

                            <td>
                                <a href="view-ticket?id=<%= ticket.ticketId %>" class="view-btn">View</a>
                            </td>

                            <td>
                                <a href="edit-ticket?id=<%= ticket.ticketId %>" class="edit-btn">Edit</a>
                            </td>

                            <td>
                                <a href="delete-ticket?id=<%= ticket.ticketId %>"
                                   class="delete-btn"
                                   onclick="return confirm('Are you sure you want to delete this ticket?');">
                                   Delete
                                </a>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

        </div>

    </div>

</div>

</body>
</html>
