package com.helpdesk.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import com.helpdesk.dao.TicketDAO;
import com.helpdesk.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update-ticket")
public class UpdateTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Ticket ticket = new Ticket();

            ticket.ticketId = Integer.parseInt(getValue(request, "ticketId"));

            ticket.status = getValue(request, "status");
            ticket.statusDetail = getValue(request, "statusDetail");
            ticket.cfmFormNumber = getValue(request, "cfmFormNumber");
            ticket.ticketNumber = getValue(request, "ticketNumber");
            ticket.ticketDate = toSqlDate(getValue(request, "ticketDate"));

            ticket.reporterName = getValue(request, "reporterName");
            ticket.contactNumber = getValue(request, "contactNumber");
            ticket.email = getValue(request, "email");
            ticket.timeReported = toSqlTime(getValue(request, "timeReported"));

            ticket.site = getValue(request, "site");
            ticket.roomLocation = getValue(request, "roomLocation");

            ticket.issue = getValue(request, "issue");
            ticket.category = getValue(request, "category");
            ticket.subcategory = getValue(request, "subcategory");
            ticket.issueType = getValue(request, "issueType");
            ticket.brandModel = getValue(request, "brandModel");
            ticket.assetTag = getValue(request, "assetTag");
            ticket.serialNumber = getValue(request, "serialNumber");
            ticket.rootCause = getValue(request, "rootCause");

            ticket.actionTaken1 = getValue(request, "actionTaken1");
            ticket.rrt1 = toSqlTimestamp(getValue(request, "rrt1"));
            ticket.irt1 = toSqlTimestamp(getValue(request, "irt1"));
            ticket.ort1 = toSqlTimestamp(getValue(request, "ort1"));
            ticket.prtStop1 = getValue(request, "prtStop1");

            ticket.action2Enabled = request.getParameter("action2Enabled") != null;
            ticket.actionTaken2 = getValue(request, "actionTaken2");
            ticket.ort2 = toSqlTimestamp(getValue(request, "ort2"));
            ticket.prtStop2 = getValue(request, "prtStop2");

            ticket.action3Enabled = request.getParameter("action3Enabled") != null;
            ticket.actionTaken3 = getValue(request, "actionTaken3");
            ticket.ort3 = toSqlTimestamp(getValue(request, "ort3"));
            ticket.prtStop3 = getValue(request, "prtStop3");

            TicketDAO.updateTicket(ticket);

            String ticketNo = ticket.ticketNumber == null ? "" : ticket.ticketNumber;
            String encodedTicketNo = URLEncoder.encode(ticketNo, StandardCharsets.UTF_8);

            response.sendRedirect("ticket-list?updated=1&ticketNo=" + encodedTicketNo);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("editTicket.jsp").forward(request, response);
        }
    }

    private String getValue(HttpServletRequest request, String name) {
        String value = request.getParameter(name);

        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        return value.trim();
    }

    private Date toSqlDate(String value) {
        if (value == null) {
            return null;
        }

        return Date.valueOf(value);
    }

    private Time toSqlTime(String value) {
        if (value == null) {
            return null;
        }

        if (value.length() == 5) {
            value = value + ":00";
        }

        return Time.valueOf(value);
    }

    private Timestamp toSqlTimestamp(String value) {
        if (value == null) {
            return null;
        }

        value = value.replace("T", " ");

        if (value.length() == 16) {
            value = value + ":00";
        }

        return Timestamp.valueOf(value);
    }
}