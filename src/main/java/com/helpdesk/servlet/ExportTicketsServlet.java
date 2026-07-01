package com.helpdesk.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.helpdesk.dao.TicketDAO;
import com.helpdesk.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/export-tickets")
public class ExportTicketsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/csv; charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"helpdesk_tickets.csv\"");

        try (PrintWriter writer = response.getWriter()) {

            writer.write('\uFEFF');

            List<Ticket> ticketList = TicketDAO.getAllTickets();

            writer.println(
                "No,Status,Status Detail,CM Form Number,Ticket Number,Date," +
                "Name,Contact Number,Email,Time Reported,Site,Room Location," +
                "Issue,Category,Subcategory,Issue Type,Brand Model,Asset Tag,Serial Number,Root Cause," +
                "Action Taken 1,RRT 1,IRT 1,ORT 1,PRT STOP 1," +
                "Action Taken 2,ORT 2,PRT STOP 2," +
                "Action Taken 3,ORT 3,PRT STOP 3"
            );

            int no = 1;

            for (Ticket ticket : ticketList) {
                writer.println(
                    csv(no++) + "," +
                    csv(ticket.status) + "," +
                    csv(ticket.statusDetail) + "," +
                    csv(ticket.cfmFormNumber) + "," +
                    csv(ticket.ticketNumber) + "," +
                    csv(ticket.ticketDate) + "," +

                    csv(ticket.reporterName) + "," +
                    csv(ticket.contactNumber) + "," +
                    csv(ticket.email) + "," +
                    csv(ticket.timeReported) + "," +
                    csv(ticket.site) + "," +
                    csv(ticket.roomLocation) + "," +

                    csv(ticket.issue) + "," +
                    csv(ticket.category) + "," +
                    csv(ticket.subcategory) + "," +
                    csv(ticket.issueType) + "," +
                    csv(ticket.brandModel) + "," +
                    csv(ticket.assetTag) + "," +
                    csv(ticket.serialNumber) + "," +
                    csv(ticket.rootCause) + "," +

                    csv(ticket.actionTaken1) + "," +
                    csv(ticket.rrt1) + "," +
                    csv(ticket.irt1) + "," +
                    csv(ticket.ort1) + "," +
                    csv(ticket.prtStop1) + "," +

                    csv(ticket.actionTaken2) + "," +
                    csv(ticket.ort2) + "," +
                    csv(ticket.prtStop2) + "," +

                    csv(ticket.actionTaken3) + "," +
                    csv(ticket.ort3) + "," +
                    csv(ticket.prtStop3)
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/plain");
            response.getWriter().println("Export failed: " + e.getMessage());
        }
    }

    private String csv(Object value) {
        if (value == null) {
            return "";
        }

        String text = value.toString();
        text = text.replace("\"", "\"\"");

        return "\"" + text + "\"";
    }
}