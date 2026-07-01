<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.helpdesk.model.Ticket" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!
    public String dash(Object value) {
        return value == null ? "-" : value.toString();
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

<%
    Ticket ticket = (Ticket) request.getAttribute("ticket");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Ticket</title>

    <link rel="stylesheet" href="css/style.css">
</head>

<body class="helpdesk-page">

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="top-header">
        <div class="logo-box">🔎</div>
        <div>
            <h1>Ticket Details</h1>
            <p>Full helpdesk ticket information and action records</p>
        </div>
    </div>

    <div class="progress-bar">
        <span class="active"></span>
        <span class="active"></span>
        <span class="active"></span>
    </div>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            ❌ Error: <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <% if (ticket != null) { %>

    <!-- TICKET STATUS -->
    <div class="card">

        <div class="section-title section-title-between">
            <div class="section-title-left">
                <div class="section-icon blue">🎫</div>
                <div>
                    <h2><%= dash(ticket.ticketNumber) %></h2>
                    <p>Ticket status and reference information</p>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/ticket-list" class="top-action-btn">← Back to List</a>
        </div>

        <div class="detail-grid">

            <div class="detail-item">
                <span>Status</span>
                <strong><%= dash(ticket.status) %></strong>
            </div>

            <div class="detail-item">
                <span>Status Detail</span>
                <strong><%= dash(ticket.statusDetail) %></strong>
            </div>

            <div class="detail-item">
                <span>CM Form Number</span>
                <strong><%= dash(ticket.cfmFormNumber) %></strong>
            </div>

            <div class="detail-item">
                <span>Ticket Date</span>
                <strong><%= dash(ticket.ticketDate) %></strong>
            </div>

            <div class="detail-item">
                <span>Created At</span>
                <strong><%= dateTimeValue(ticket.createdAt) %></strong>
            </div>

            <div class="detail-item">
                <span>Last Updated</span>
                <strong><%= dateTimeValue(ticket.updatedAt) %></strong>
            </div>

        </div>

    </div>


    <!-- REPORTER INFO -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple">👤</div>
            <div>
                <h2>Reporter / Court Information</h2>
                <p>User contact details and court location</p>
            </div>
        </div>

        <div class="detail-grid">

            <div class="detail-item">
                <span>Name</span>
                <strong><%= dash(ticket.reporterName) %></strong>
            </div>

            <div class="detail-item">
                <span>Contact Number</span>
                <strong><%= dash(ticket.contactNumber) %></strong>
            </div>

            <div class="detail-item">
                <span>Email</span>
                <strong><%= dash(ticket.email) %></strong>
            </div>

            <div class="detail-item">
                <span>Time Reported</span>
                <strong><%= dash(ticket.timeReported) %></strong>
            </div>

            <div class="detail-item">
                <span>Site</span>
                <strong><%= dash(ticket.site) %></strong>
            </div>

            <div class="detail-item">
                <span>Room Location</span>
                <strong><%= dash(ticket.roomLocation) %></strong>
            </div>

        </div>

    </div>


    <!-- ISSUE INFO -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple-dark">⚙</div>
            <div>
                <h2>Issue Information</h2>
                <p>Problem, asset and root cause information</p>
            </div>
        </div>

        <div class="detail-grid">

            <div class="detail-item full-detail">
                <span>Issue</span>
                <strong><%= dash(ticket.issue) %></strong>
            </div>

            <div class="detail-item">
                <span>Category</span>
                <strong><%= dash(ticket.category) %></strong>
            </div>

            <div class="detail-item">
                <span>Subcategory</span>
                <strong><%= dash(ticket.subcategory) %></strong>
            </div>

            <div class="detail-item">
                <span>Issue Type</span>
                <strong><%= dash(ticket.issueType) %></strong>
            </div>

            <div class="detail-item">
                <span>Brand / Model</span>
                <strong><%= dash(ticket.brandModel) %></strong>
            </div>

            <div class="detail-item">
                <span>Asset Tag</span>
                <strong><%= dash(ticket.assetTag) %></strong>
            </div>

            <div class="detail-item">
                <span>Serial Number</span>
                <strong><%= dash(ticket.serialNumber) %></strong>
            </div>

            <div class="detail-item full-detail">
                <span>Root Cause</span>
                <strong><%= dash(ticket.rootCause) %></strong>
            </div>

        </div>

    </div>


    <!-- ACTION TAKEN 1 -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon blue">🛠</div>
            <div>
                <h2>Action Taken 1</h2>
                <p>First troubleshooting action and response record</p>
            </div>
        </div>

        <div class="detail-grid">

            <div class="detail-item full-detail">
                <span>Action Taken 1</span>
                <strong><%= dash(ticket.actionTaken1) %></strong>
            </div>

            <div class="detail-item">
                <span>RRT 1</span>
                <strong><%= dateTimeValue(ticket.rrt1) %></strong>
            </div>

            <div class="detail-item">
                <span>IRT 1</span>
                <strong><%= dateTimeValue(ticket.irt1) %></strong>
            </div>

            <div class="detail-item">
                <span>ORT 1</span>
                <strong><%= dateTimeValue(ticket.ort1) %></strong>
            </div>

            <div class="detail-item full-detail">
                <span>PRT / STOP 1</span>
                <strong><%= dash(ticket.prtStop1) %></strong>
            </div>

        </div>

    </div>


    <% if (ticket.action2Enabled) { %>

    <!-- ACTION TAKEN 2 -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple">🛠</div>
            <div>
                <h2>Action Taken 2</h2>
                <p>Second follow-up action</p>
            </div>
        </div>

        <div class="detail-grid">

            <div class="detail-item full-detail">
                <span>Action Taken 2</span>
                <strong><%= dash(ticket.actionTaken2) %></strong>
            </div>

            <div class="detail-item">
                <span>ORT 2</span>
                <strong><%= dateTimeValue(ticket.ort2) %></strong>
            </div>

            <div class="detail-item full-detail">
                <span>PRT / STOP 2</span>
                <strong><%= dash(ticket.prtStop2) %></strong>
            </div>

        </div>

    </div>

    <% } %>


    <% if (ticket.action3Enabled) { %>

    <!-- ACTION TAKEN 3 -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple-dark">🛠</div>
            <div>
                <h2>Action Taken 3</h2>
                <p>Third follow-up action</p>
            </div>
        </div>

        <div class="detail-grid">

            <div class="detail-item full-detail">
                <span>Action Taken 3</span>
                <strong><%= dash(ticket.actionTaken3) %></strong>
            </div>

            <div class="detail-item">
                <span>ORT 3</span>
                <strong><%= dateTimeValue(ticket.ort3) %></strong>
            </div>

            <div class="detail-item full-detail">
                <span>PRT / STOP 3</span>
                <strong><%= dash(ticket.prtStop3) %></strong>
            </div>

        </div>

    </div>

    <% } %>

    <% } %>

</div>

</body>
</html>