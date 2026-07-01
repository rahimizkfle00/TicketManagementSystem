package com.helpdesk.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.helpdesk.dao.TicketDAO;
import com.helpdesk.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ticket-list")
public class TicketListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String keyword = getValue(request, "keyword");
            String status = getValue(request, "status");
            String category = getValue(request, "category");
            Date dateFrom = toSqlDate(getValue(request, "dateFrom"));
            Date dateTo = toSqlDate(getValue(request, "dateTo"));

            List<Ticket> ticketList = TicketDAO.searchTickets(keyword, status, category, dateFrom, dateTo);

            request.setAttribute("ticketList", ticketList);

            request.setAttribute("keyword", keyword);
            request.setAttribute("status", status);
            request.setAttribute("category", category);
            request.setAttribute("dateFrom", getValue(request, "dateFrom"));
            request.setAttribute("dateTo", getValue(request, "dateTo"));

            request.getRequestDispatcher("ticketList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("ticketList.jsp").forward(request, response);
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
}