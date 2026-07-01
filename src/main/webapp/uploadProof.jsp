<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.helpdesk.model.Ticket" %>
<%@ page import="com.helpdesk.dao.TicketDAO" %>

<%!
    public String dash(Object value) {
        return value == null ? "-" : value.toString();
    }

    public boolean hasValue(String value) {
        return value != null && !value.trim().isEmpty();
    }

    public boolean isPdf(String value) {
        return value != null && value.toLowerCase().endsWith(".pdf");
    }
%>

<%
    Ticket ticket = null;
    String pageError = null;
    int ticketId = 0;

    try {
        Object ticketIdAttribute = request.getAttribute("ticketId");

        if (ticketIdAttribute != null) {
            ticketId = Integer.parseInt(ticketIdAttribute.toString());
        } else if (request.getParameter("id") != null) {
            ticketId = Integer.parseInt(request.getParameter("id"));
        }

        if (ticketId > 0) {
            ticket = TicketDAO.getTicketById(ticketId);
        } else {
            pageError = "Invalid ticket ID.";
        }

        if (ticketId > 0 && ticket == null) {
            pageError = "Ticket not found.";
        }

    } catch (Exception e) {
        pageError = e.getMessage();
    }

    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Proof</title>

    <link rel="stylesheet" href="css/style.css">

    <style>
        .proof-preview-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 18px;
            margin-top: 15px;
        }

        .proof-box {
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 16px;
            background: #ffffff;
        }

        .proof-box h3 {
            margin: 0 0 10px 0;
            font-size: 15px;
            color: #374151;
        }

        .proof-box img {
            width: 100%;
            max-height: 260px;
            object-fit: contain;
            border-radius: 12px;
            border: 1px solid #e5e7eb;
            background: #f9fafb;
        }

        .proof-link-row {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        .proof-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 36px;
            padding: 8px 12px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            font-size: 13px;
            color: #2563eb;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
        }

        .proof-link:hover {
            background: #dbeafe;
        }

        .proof-delete-link {
            color: #dc2626;
            background: #fef2f2;
            border: 1px solid #fecaca;
        }

        .proof-delete-link:hover {
            background: #fee2e2;
        }

        .proof-empty {
            padding: 22px;
            border-radius: 12px;
            background: #f9fafb;
            color: #6b7280;
            text-align: center;
            border: 1px dashed #d1d5db;
        }

        .proof-note {
            margin-top: 8px;
            font-size: 13px;
            color: #6b7280;
        }

        .upload-proof-actions {
            display: flex;
            gap: 14px;
            margin-top: 25px;
        }

        .upload-proof-actions button {
            flex: 1;
        }

        .upload-proof-actions .cancel-proof-btn {
            flex: 1;
            height: 50px;
            border-radius: 14px;
            background: #f3f4f6;
            color: #374151;
            font-weight: 700;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #d1d5db;
        }

        .upload-proof-actions .cancel-proof-btn:hover {
            background: #e5e7eb;
        }
    </style>
</head>

<body class="helpdesk-page">

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="top-header">
        <div class="logo-box">📷</div>
        <div>
            <h1>Upload Ticket Proof</h1>
            <p>Upload before photo, after photo and scanned CM form after the ticket is completed</p>
        </div>
    </div>

    <div class="progress-bar">
        <span class="active"></span>
        <span class="active"></span>
        <span class="active"></span>
    </div>

    <% if (pageError != null) { %>
        <div class="error-message">
            ❌ Error: <%= pageError %>
        </div>

        <div class="page-action-row">
            <a href="${pageContext.request.contextPath}/ticket-list" class="top-action-btn">← Back to List</a>
        </div>
    <% } %>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            ❌ Error: <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <% if ("1".equals(request.getParameter("proofDeleted"))) { %>
        <div class="success-message">
            ✅ Proof file deleted successfully.
        </div>
    <% } %>

    <% if ("1".equals(request.getParameter("deleteError"))) { %>
        <div class="error-message">
            ❌ Failed to delete proof file.
        </div>
    <% } %>

    <% if (ticket != null) { %>

    <!-- PAGE ACTION BUTTONS -->
    <div class="page-action-row">
        <a href="${pageContext.request.contextPath}/ticket-list" class="top-action-btn">← Back to List</a>
        <a href="${pageContext.request.contextPath}/view-ticket?id=<%= ticket.ticketId %>" class="top-action-btn">View Ticket</a>
    </div>

    <!-- TICKET SUMMARY -->
    <div class="card">

        <div class="section-title">
            <div class="section-icon blue">🎫</div>
            <div>
                <h2><%= dash(ticket.ticketNumber) %></h2>
                <p>Ticket reference and current status</p>
            </div>
        </div>

        <div class="detail-grid">

            <div class="detail-item">
                <span>Ticket ID</span>
                <strong><%= ticket.ticketId %></strong>
            </div>

            <div class="detail-item">
                <span>CM Form Number</span>
                <strong><%= dash(ticket.cfmFormNumber) %></strong>
            </div>

            <div class="detail-item">
                <span>Status</span>
                <strong><%= dash(ticket.status) %></strong>
            </div>

            <div class="detail-item">
                <span>Status Detail</span>
                <strong><%= dash(ticket.statusDetail) %></strong>
            </div>

            <div class="detail-item full-detail">
                <span>Issue</span>
                <strong><%= dash(ticket.issue) %></strong>
            </div>

        </div>

    </div>


    <!-- UPLOAD PROOF FORM -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple">📤</div>
            <div>
                <h2>Upload Proof Files</h2>
                <p>Upload only after the ticket is closed or completed. Uploading a new file will replace the existing file.</p>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/upload-proof"
              method="post"
              enctype="multipart/form-data">

            <input type="hidden" name="ticketId" value="<%= ticket.ticketId %>">

            <div class="form-grid">

                <div class="form-field">
                    <label>Before Photo</label>
                    <div class="input-box">
                        <i>🖼</i>
                        <input type="file" name="beforePhoto" accept="image/*">
                    </div>
                    <p class="proof-note">Image only. Example: before replacement / before repair.</p>
                </div>

                <div class="form-field">
                    <label>After Photo</label>
                    <div class="input-box">
                        <i>🖼</i>
                        <input type="file" name="afterPhoto" accept="image/*">
                    </div>
                    <p class="proof-note">Image only. Example: after replacement / after repair.</p>
                </div>

                <div class="form-field full">
                    <label>Scanned CM Form</label>
                    <div class="input-box">
                        <i>📄</i>
                        <input type="file" name="cmFormFile" accept=".pdf,image/*">
                    </div>
                    <p class="proof-note">PDF or image accepted. Example: signed/scanned CM form.</p>
                </div>

            </div>

            <div class="upload-proof-actions">
                <button type="submit">Upload Proof</button>
                <a href="${pageContext.request.contextPath}/view-ticket?id=<%= ticket.ticketId %>" class="cancel-proof-btn">Cancel</a>
            </div>

        </form>

    </div>


    <!-- CURRENT PROOF FILES -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple-dark">📁</div>
            <div>
                <h2>Current Uploaded Proof</h2>
                <p>Existing proof files saved for this ticket</p>
            </div>
        </div>

        <div class="proof-preview-grid">

            <div class="proof-box">
                <h3>Before Photo</h3>

                <% if (hasValue(ticket.beforePhoto)) { %>
                    <img src="<%= contextPath + "/" + ticket.beforePhoto %>" alt="Before Photo">

                    <div class="proof-link-row">
                        <a class="proof-link"
                           href="<%= contextPath + "/" + ticket.beforePhoto %>"
                           target="_blank">Open Before Photo</a>

                        <a class="proof-link proof-delete-link"
                           href="${pageContext.request.contextPath}/delete-proof?ticketId=<%= ticket.ticketId %>&type=before"
                           onclick="return confirm('Delete before photo?');">Delete Before Photo</a>
                    </div>
                <% } else { %>
                    <div class="proof-empty">No before photo uploaded yet.</div>
                <% } %>
            </div>

            <div class="proof-box">
                <h3>After Photo</h3>

                <% if (hasValue(ticket.afterPhoto)) { %>
                    <img src="<%= contextPath + "/" + ticket.afterPhoto %>" alt="After Photo">

                    <div class="proof-link-row">
                        <a class="proof-link"
                           href="<%= contextPath + "/" + ticket.afterPhoto %>"
                           target="_blank">Open After Photo</a>

                        <a class="proof-link proof-delete-link"
                           href="${pageContext.request.contextPath}/delete-proof?ticketId=<%= ticket.ticketId %>&type=after"
                           onclick="return confirm('Delete after photo?');">Delete After Photo</a>
                    </div>
                <% } else { %>
                    <div class="proof-empty">No after photo uploaded yet.</div>
                <% } %>
            </div>

            <div class="proof-box">
                <h3>Scanned CM Form</h3>

                <% if (hasValue(ticket.cmFormFile)) { %>

                    <% if (isPdf(ticket.cmFormFile)) { %>
                        <div class="proof-empty">PDF CM form uploaded.</div>
                    <% } else { %>
                        <img src="<%= contextPath + "/" + ticket.cmFormFile %>" alt="Scanned CM Form">
                    <% } %>

                    <div class="proof-link-row">
                        <a class="proof-link"
                           href="<%= contextPath + "/" + ticket.cmFormFile %>"
                           target="_blank">Open Scanned CM Form</a>

                        <a class="proof-link proof-delete-link"
                           href="${pageContext.request.contextPath}/delete-proof?ticketId=<%= ticket.ticketId %>&type=cm"
                           onclick="return confirm('Delete scanned CM form?');">Delete Scanned CM Form</a>
                    </div>

                <% } else { %>
                    <div class="proof-empty">No scanned CM form uploaded yet.</div>
                <% } %>
            </div>

        </div>

    </div>

    <% } %>

</div>

</body>
</html>

