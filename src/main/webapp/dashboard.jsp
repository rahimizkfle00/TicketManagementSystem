<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<%!
    @SuppressWarnings("unchecked")
    public Map<String, Integer> getCategoryMap(Object value) {
        return value == null ? null : (Map<String, Integer>) value;
    }

    public int percent(Integer value, Integer total) {
        if (value == null || total == null || total == 0) {
            return 0;
        }

        return Math.round((value * 100.0f) / total);
    }
%>

<%
    Integer totalTickets = (Integer) request.getAttribute("totalTickets");
    Integer openTickets = (Integer) request.getAttribute("openTickets");
    Integer closedTickets = (Integer) request.getAttribute("closedTickets");
    Integer pendingTickets = (Integer) request.getAttribute("pendingTickets");
    Integer ticketsThisMonth = (Integer) request.getAttribute("ticketsThisMonth");

    Map<String, Integer> categoryMap = getCategoryMap(request.getAttribute("categoryMap"));

    if (totalTickets == null) totalTickets = 0;
    if (openTickets == null) openTickets = 0;
    if (closedTickets == null) closedTickets = 0;
    if (pendingTickets == null) pendingTickets = 0;
    if (ticketsThisMonth == null) ticketsThisMonth = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Helpdesk Dashboard</title>

    <link rel="stylesheet" href="css/style.css">
    <style>
    .dashboard-chart-grid {
        display: grid !important;
        grid-template-columns: repeat(2, 1fr) !important;
        gap: 24px !important;
    }

    .chart-list {
        display: flex !important;
        flex-direction: column !important;
        gap: 18px !important;
    }

    .chart-row {
        display: grid !important;
        grid-template-columns: 140px 1fr 50px !important;
        gap: 14px !important;
        align-items: center !important;
    }

    .chart-info strong {
        display: block !important;
        font-size: 14px !important;
        color: #111827 !important;
        font-weight: 800 !important;
    }

    .chart-info span {
        display: block !important;
        font-size: 12px !important;
        color: #64748b !important;
        margin-top: 4px !important;
    }

    .chart-track {
        width: 100% !important;
        height: 14px !important;
        background: #e5e7eb !important;
        border-radius: 999px !important;
        overflow: hidden !important;
        display: block !important;
    }

    .chart-fill {
        height: 100% !important;
        border-radius: 999px !important;
        min-width: 4px !important;
        display: block !important;
    }

    .open-fill {
        background: linear-gradient(135deg, #22c55e, #15803d) !important;
    }

    .closed-fill {
        background: linear-gradient(135deg, #8b5cf6, #7c3aed) !important;
    }

    .pending-fill {
        background: linear-gradient(135deg, #f97316, #c2410c) !important;
    }

    .category-fill {
        background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    }

    .chart-percent {
        font-size: 13px !important;
        font-weight: 900 !important;
        color: #111827 !important;
        text-align: right !important;
    }

    @media (max-width: 1000px) {
        .dashboard-chart-grid {
            grid-template-columns: 1fr !important;
        }
    }

    @media (max-width: 650px) {
        .chart-row {
            grid-template-columns: 1fr !important;
            gap: 8px !important;
        }

        .chart-percent {
            text-align: left !important;
        }
    }
</style>
</head>

<body class="helpdesk-page">

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="top-header">
        <div class="logo-box">📊</div>
        <div>
            <h1>Helpdesk Dashboard</h1>
            <p>Summary overview of helpdesk ticket records</p>
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


    <!-- DASHBOARD ACTIONS -->
    <div class="card">

        <div class="section-title section-title-between">
            <div class="section-title-left">
                <div class="section-icon blue">⚡</div>
                <div>
                    <h2>Quick Actions</h2>
                    <p>Access ticket form, ticket list and export data</p>
                </div>
            </div>

            <div class="dashboard-actions">
                <a href="${pageContext.request.contextPath}/addTicket.jsp" class="top-action-btn">+ Add Ticket</a>
                <a href="${pageContext.request.contextPath}/ticket-list" class="top-action-btn">View Tickets</a>
                <a href="${pageContext.request.contextPath}/export-tickets" class="top-action-btn">Export CSV</a>
            </div>
        </div>

    </div>


    <!-- SUMMARY CARDS -->
    <div class="dashboard-grid helpdesk-card-space">

        <div class="dashboard-card">
            <div class="dashboard-icon blue-bg">🎫</div>
            <div>
                <p>Total Tickets</p>
                <h2><%= totalTickets %></h2>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="dashboard-icon green-bg">🟢</div>
            <div>
                <p>Case Open</p>
                <h2><%= openTickets %></h2>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="dashboard-icon purple-bg">✅</div>
            <div>
                <p>Case Closed</p>
                <h2><%= closedTickets %></h2>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="dashboard-icon orange-bg">⏳</div>
            <div>
                <p>Pending Tickets</p>
                <h2><%= pendingTickets %></h2>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="dashboard-icon dark-bg">📅</div>
            <div>
                <p>This Month</p>
                <h2><%= ticketsThisMonth %></h2>
            </div>
        </div>

    </div>


    <!-- DASHBOARD CHARTS -->
    <div class="dashboard-chart-grid helpdesk-card-space">

        <!-- STATUS BREAKDOWN CHART -->
        <div class="card">

            <div class="section-title">
                <div class="section-icon blue">📊</div>
                <div>
                    <h2>Status Breakdown</h2>
                    <p>Visual summary of ticket status</p>
                </div>
            </div>

            <div class="chart-list">

                <div class="chart-row">
                    <div class="chart-info">
                        <strong>Case Open</strong>
                        <span><%= openTickets %> ticket(s)</span>
                    </div>

                    <div class="chart-track">
                        <div class="chart-fill open-fill" style="width: <%= percent(openTickets, totalTickets) %>%;"></div>
                    </div>

                    <div class="chart-percent">
                        <%= percent(openTickets, totalTickets) %>%
                    </div>
                </div>

                <div class="chart-row">
                    <div class="chart-info">
                        <strong>Case Closed</strong>
                        <span><%= closedTickets %> ticket(s)</span>
                    </div>

                    <div class="chart-track">
                        <div class="chart-fill closed-fill" style="width: <%= percent(closedTickets, totalTickets) %>%;"></div>
                    </div>

                    <div class="chart-percent">
                        <%= percent(closedTickets, totalTickets) %>%
                    </div>
                </div>

                <div class="chart-row">
                    <div class="chart-info">
                        <strong>Pending</strong>
                        <span><%= pendingTickets %> ticket(s)</span>
                    </div>

                    <div class="chart-track">
                        <div class="chart-fill pending-fill" style="width: <%= percent(pendingTickets, totalTickets) %>%;"></div>
                    </div>

                    <div class="chart-percent">
                        <%= percent(pendingTickets, totalTickets) %>%
                    </div>
                </div>

            </div>

        </div>


        <!-- CATEGORY BREAKDOWN CHART -->
        <div class="card">

            <div class="section-title">
                <div class="section-icon purple">📂</div>
                <div>
                    <h2>Category Breakdown</h2>
                    <p>Visual summary of tickets by category</p>
                </div>
            </div>

            <div class="chart-list">

                <% if (categoryMap == null || categoryMap.isEmpty()) { %>

                    <div class="empty-row">No category data available.</div>

                <% } else { %>

                    <% for (Map.Entry<String, Integer> entry : categoryMap.entrySet()) { %>

                        <div class="chart-row">
                            <div class="chart-info">
                                <strong><%= entry.getKey() %></strong>
                                <span><%= entry.getValue() %> ticket(s)</span>
                            </div>

                            <div class="chart-track">
                                <div class="chart-fill category-fill" style="width: <%= percent(entry.getValue(), totalTickets) %>%;"></div>
                            </div>

                            <div class="chart-percent">
                                <%= percent(entry.getValue(), totalTickets) %>%
                            </div>
                        </div>

                    <% } %>

                <% } %>

            </div>

        </div>

    </div>


    <!-- CATEGORY SUMMARY -->
    <div class="card helpdesk-card-space">

        <div class="section-title">
            <div class="section-icon purple">📂</div>
            <div>
                <h2>Tickets by Category</h2>
                <p>Breakdown of ticket records based on issue category</p>
            </div>
        </div>

        <div class="category-list">

            <% if (categoryMap == null || categoryMap.isEmpty()) { %>

                <div class="empty-row">No category data available.</div>

            <% } else { %>

                <% for (Map.Entry<String, Integer> entry : categoryMap.entrySet()) { %>

                    <div class="category-row">
                        <div>
                            <strong><%= entry.getKey() %></strong>
                            <span><%= entry.getValue() %> ticket(s)</span>
                        </div>

                        <div class="category-count">
                            <%= entry.getValue() %>
                        </div>
                    </div>

                <% } %>

            <% } %>

        </div>

    </div>

</div>

</body>
</html>
