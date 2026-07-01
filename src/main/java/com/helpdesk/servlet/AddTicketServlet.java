package com.helpdesk.servlet;

import java.io.IOException;
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

@WebServlet("/add-ticket")
public class AddTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Ticket ticket = new Ticket();

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
            ticket.rrt1 = toTimestamp(getValue(request, "rrt1"));
            ticket.irt1 = toTimestamp(getValue(request, "irt1"));
            ticket.ort1 = toTimestamp(getValue(request, "ort1"));
            ticket.prtStop1 = getValue(request, "prtStop1");

            ticket.action2Enabled = request.getParameter("action2Enabled") != null;
            ticket.actionTaken2 = getValue(request, "actionTaken2");
            ticket.ort2 = toTimestamp(getValue(request, "ort2"));
            ticket.prtStop2 = getValue(request, "prtStop2");

            ticket.action3Enabled = request.getParameter("action3Enabled") != null;
            ticket.actionTaken3 = getValue(request, "actionTaken3");
            ticket.ort3 = toTimestamp(getValue(request, "ort3"));
            ticket.prtStop3 = getValue(request, "prtStop3");

            TicketDAO.saveTicket(ticket);

            response.sendRedirect("addTicket.jsp?success=1&ticketNo=" + encode(ticket.ticketNumber));

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("addTicket.jsp").forward(request, response);
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

        return Time.valueOf(value + ":00");
    }

    private Timestamp toTimestamp(String value) {
        if (value == null) {
            return null;
        }

        String formattedValue = value.replace("T", " ") + ":00";
        return Timestamp.valueOf(formattedValue);
    }

    private String encode(String value) {
        if (value == null) {
            return "";
        }

        return value.replace(" ", "%20");
    }
}