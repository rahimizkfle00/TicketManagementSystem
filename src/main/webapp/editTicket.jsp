<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.helpdesk.model.Ticket" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!
    public String val(Object value) {
        return value == null ? "" : value.toString();
    }

    public String selected(String currentValue, String optionValue) {
        if (currentValue == null) {
            return "";
        }
        return currentValue.equals(optionValue) ? "selected" : "";
    }

    public String checked(boolean value) {
        return value ? "checked" : "";
    }

    public String dateValue(Object value) {
        return value == null ? "" : value.toString();
    }

    public String timeValue(Object value) {
        if (value == null) {
            return "";
        }

        String time = value.toString();
        return time.length() >= 5 ? time.substring(0, 5) : time;
    }

    public String dateTimeValue(Object value) {
        if (value == null) {
            return "";
        }

        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            return formatter.format(value);
        } catch (Exception e) {
            return "";
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
    <title>Edit Ticket</title>

    <link rel="stylesheet" href="css/style.css">
</head>

<body class="helpdesk-page">

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="top-header">
        <div class="logo-box">✏️</div>
        <div>
            <h1>Edit Helpdesk Ticket</h1>
            <p>Update saved ticket details and action records</p>
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

    <form id="ticketForm" action="${pageContext.request.contextPath}/update-ticket" method="post">

        <input type="hidden" name="ticketId" value="<%= ticket.ticketId %>">

        <!-- TICKET STATUS -->
        <div class="card">

            <div class="section-title section-title-between">
                <div class="section-title-left">
                    <div class="section-icon blue">📌</div>
                    <div>
                        <h2>Ticket Status</h2>
                        <p>Update ticket number, date and current status</p>
                    </div>
                </div>

                <a href="ticket-list" class="top-action-btn">← Back to List</a>
            </div>

            <div class="form-grid">

                <div class="form-field">
                    <label>Status</label>
                    <div class="input-box">
                        <i>●</i>
                        <select name="status">
                            <option value="">-- Select Status --</option>
                            <option value="CASE OPEN" <%= selected(ticket.status, "CASE OPEN") %>>CASE OPEN</option>
                            <option value="CASE CLOSED" <%= selected(ticket.status, "CASE CLOSED") %>>CASE CLOSED</option>
                            <option value="RECEIVED REPLACEMENT" <%= selected(ticket.status, "RECEIVED REPLACEMENT") %>>RECEIVED REPLACEMENT</option>
                            <option value="PENDING USER" <%= selected(ticket.status, "PENDING USER") %>>PENDING USER</option>
                            <option value="PENDING VENDOR" <%= selected(ticket.status, "PENDING VENDOR") %>>PENDING VENDOR</option>
                            <option value="PENDING PART" <%= selected(ticket.status, "PENDING PART") %>>PENDING PART</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>Status Detail</label>
                    <div class="input-box">
                        <i>✓</i>
                        <select name="statusDetail">
                            <option value="">-- Select Detail --</option>
                            <option value="DONE" <%= selected(ticket.statusDetail, "DONE") %>>DONE</option>
                            <option value="NOT YET" <%= selected(ticket.statusDetail, "NOT YET") %>>NOT YET</option>
                            <option value="WAITING CONFIRMATION" <%= selected(ticket.statusDetail, "WAITING CONFIRMATION") %>>WAITING CONFIRMATION</option>
                            <option value="WAITING REPLACEMENT" <%= selected(ticket.statusDetail, "WAITING REPLACEMENT") %>>WAITING REPLACEMENT</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>CM Form Number</label>
                    <div class="input-box">
                        <i>#</i>
                        <input type="text" name="cfmFormNumber" value="<%= val(ticket.cfmFormNumber) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Ticket Number</label>
                    <div class="input-box">
                        <i>🎫</i>
                        <input type="text" name="ticketNumber" value="<%= val(ticket.ticketNumber) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Date</label>
                    <div class="input-box">
                        <i>📅</i>
                        <input type="date" name="ticketDate" value="<%= dateValue(ticket.ticketDate) %>">
                    </div>
                </div>

            </div>

        </div>


        <!-- REPORTER / COURT INFORMATION -->
        <div class="card helpdesk-card-space">

            <div class="section-title">
                <div class="section-icon purple">👤</div>
                <div>
                    <h2>Reporter / Court Information</h2>
                    <p>Update user contact details and location</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field">
                    <label>Name</label>
                    <div class="input-box">
                        <i>👤</i>
                        <input type="text" name="reporterName" value="<%= val(ticket.reporterName) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Contact Number</label>
                    <div class="input-box">
                        <i>☎</i>
                        <input type="text" name="contactNumber" value="<%= val(ticket.contactNumber) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Email</label>
                    <div class="input-box">
                        <i>@</i>
                        <input type="email" name="email" value="<%= val(ticket.email) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Time Reported</label>
                    <div class="input-box">
                        <i>⏰</i>
                        <input type="time" name="timeReported" value="<%= timeValue(ticket.timeReported) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Site</label>
                    <div class="input-box">
                        <i>🏢</i>
                        <input type="text" name="site" value="<%= val(ticket.site) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Room Location</label>
                    <div class="input-box">
                        <i>📍</i>
                        <input type="text" name="roomLocation" value="<%= val(ticket.roomLocation) %>">
                    </div>
                </div>

            </div>

        </div>


        <!-- ISSUE INFORMATION -->
        <div class="card helpdesk-card-space">

            <div class="section-title">
                <div class="section-icon purple-dark">⚙</div>
                <div>
                    <h2>Issue Information</h2>
                    <p>Update problem, asset and root cause information</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field full">
                    <label>Issue</label>
                    <div class="textarea-box">
                        <i>📝</i>
                        <textarea name="issue"><%= val(ticket.issue) %></textarea>
                    </div>
                </div>

                <div class="form-field">
                    <label>Category</label>
                    <div class="input-box">
                        <i>📂</i>
                        <select name="category">
                            <option value="">-- Select Category --</option>
                            <option value="Software" <%= selected(ticket.category, "Software") %>>Software</option>
                            <option value="Hardware" <%= selected(ticket.category, "Hardware") %>>Hardware</option>
                            <option value="Network" <%= selected(ticket.category, "Network") %>>Network</option>
                            <option value="Printer" <%= selected(ticket.category, "Printer") %>>Printer</option>
                            <option value="Monitor" <%= selected(ticket.category, "Monitor") %>>Monitor</option>
                            <option value="PoE Switch" <%= selected(ticket.category, "PoE Switch") %>>PoE Switch</option>
                            <option value="CoreRVT" <%= selected(ticket.category, "CoreRVT") %>>CoreRVT</option>
                            <option value="Others" <%= selected(ticket.category, "Others") %>>Others</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>Subcategory</label>
                    <div class="input-box">
                        <i>📁</i>
                        <input type="text" name="subcategory" value="<%= val(ticket.subcategory) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Issue Type</label>
                    <div class="input-box">
                        <i>⚠</i>
                        <input type="text" name="issueType" value="<%= val(ticket.issueType) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Brand / Model</label>
                    <div class="input-box">
                        <i>💻</i>
                        <input type="text" name="brandModel" value="<%= val(ticket.brandModel) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Asset Tag</label>
                    <div class="input-box">
                        <i>🏷</i>
                        <input type="text" name="assetTag" value="<%= val(ticket.assetTag) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>Serial Number</label>
                    <div class="input-box">
                        <i>S/N</i>
                        <input type="text" name="serialNumber" value="<%= val(ticket.serialNumber) %>">
                    </div>
                </div>

                <div class="form-field full">
                    <label>Root Cause</label>
                    <div class="textarea-box">
                        <i>🔍</i>
                        <textarea name="rootCause"><%= val(ticket.rootCause) %></textarea>
                    </div>
                </div>

            </div>

        </div>


        <!-- ACTION TAKEN 1 -->
        <div class="card helpdesk-card-space">

            <div class="section-title">
                <div class="section-icon blue">🛠</div>
                <div>
                    <h2>Action Taken 1</h2>
                    <p>Update first troubleshooting action and response time record</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field full">
                    <label>Action Taken 1</label>
                    <div class="textarea-box">
                        <i>📝</i>
                        <textarea name="actionTaken1"><%= val(ticket.actionTaken1) %></textarea>
                    </div>
                </div>

                <div class="form-field">
                    <label>RRT 1</label>
                    <div class="input-box">
                        <i>⏱</i>
                        <input type="datetime-local" name="rrt1" value="<%= dateTimeValue(ticket.rrt1) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>IRT 1</label>
                    <div class="input-box">
                        <i>⏱</i>
                        <input type="datetime-local" name="irt1" value="<%= dateTimeValue(ticket.irt1) %>">
                    </div>
                </div>

                <div class="form-field">
                    <label>ORT 1</label>
                    <div class="input-box">
                        <i>⏱</i>
                        <input type="datetime-local" name="ort1" value="<%= dateTimeValue(ticket.ort1) %>">
                    </div>
                </div>

                <div class="form-field full">
                    <label>PRT / STOP 1</label>
                    <div class="textarea-box small-textarea">
                        <i>✅</i>
                        <textarea name="prtStop1"><%= val(ticket.prtStop1) %></textarea>
                    </div>
                </div>

            </div>

        </div>


        <!-- ACTION TAKEN 2 -->
        <div class="card helpdesk-card-space">

            <div class="section-title section-title-between">
                <div class="section-title-left">
                    <div class="section-icon purple">🛠</div>
                    <div>
                        <h2>Action Taken 2</h2>
                        <p>Enable this only if the ticket has second follow-up action</p>
                    </div>
                </div>

                <label class="switch">
                    <input type="checkbox" id="enableAction2" name="action2Enabled" onchange="toggleAction(2)" <%= checked(ticket.action2Enabled) %>>
                    <span class="slider"></span>
                </label>
            </div>

            <div id="actionSection2" class="<%= ticket.action2Enabled ? "" : "hidden-section" %>">

                <div class="form-grid">

                    <div class="form-field full">
                        <label>Action Taken 2</label>
                        <div class="textarea-box">
                            <i>📝</i>
                            <textarea name="actionTaken2"><%= val(ticket.actionTaken2) %></textarea>
                        </div>
                    </div>

                    <div class="form-field">
                        <label>ORT 2</label>
                        <div class="input-box">
                            <i>⏱</i>
                            <input type="datetime-local" name="ort2" value="<%= dateTimeValue(ticket.ort2) %>">
                        </div>
                    </div>

                    <div class="form-field full">
                        <label>PRT / STOP 2</label>
                        <div class="textarea-box small-textarea">
                            <i>✅</i>
                            <textarea name="prtStop2"><%= val(ticket.prtStop2) %></textarea>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!-- ACTION TAKEN 3 -->
        <div class="card helpdesk-card-space">

            <div class="section-title section-title-between">
                <div class="section-title-left">
                    <div class="section-icon purple-dark">🛠</div>
                    <div>
                        <h2>Action Taken 3</h2>
                        <p>Enable this only if the ticket has third follow-up action</p>
                    </div>
                </div>

                <label class="switch">
                    <input type="checkbox" id="enableAction3" name="action3Enabled" onchange="toggleAction(3)" <%= checked(ticket.action3Enabled) %>>
                    <span class="slider"></span>
                </label>
            </div>

            <div id="actionSection3" class="<%= ticket.action3Enabled ? "" : "hidden-section" %>">

                <div class="form-grid">

                    <div class="form-field full">
                        <label>Action Taken 3</label>
                        <div class="textarea-box">
                            <i>📝</i>
                            <textarea name="actionTaken3"><%= val(ticket.actionTaken3) %></textarea>
                        </div>
                    </div>

                    <div class="form-field">
                        <label>ORT 3</label>
                        <div class="input-box">
                            <i>⏱</i>
                            <input type="datetime-local" name="ort3" value="<%= dateTimeValue(ticket.ort3) %>">
                        </div>
                    </div>

                    <div class="form-field full">
                        <label>PRT / STOP 3</label>
                        <div class="textarea-box small-textarea">
                            <i>✅</i>
                            <textarea name="prtStop3"><%= val(ticket.prtStop3) %></textarea>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!-- BUTTONS -->
        <div class="button-row">
            <button type="submit">Update Ticket</button>
            <a href="ticket-list" class="secondary-link-btn">Cancel</a>
        </div>

    </form>

    <% } %>

</div>


<script>
    function toggleAction(actionNo) {
        const checkbox = document.getElementById("enableAction" + actionNo);
        const section = document.getElementById("actionSection" + actionNo);

        if (checkbox.checked) {
            section.classList.remove("hidden-section");
        } else {
            section.classList.add("hidden-section");
            clearSectionFields(section);
        }
    }

    function clearSectionFields(section) {
        const fields = section.querySelectorAll("input, textarea, select");

        fields.forEach(function(field) {
            field.value = "";
        });
    }
</script>

</body>
</html>