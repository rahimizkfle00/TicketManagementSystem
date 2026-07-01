package com.helpdesk.servlet;

import java.io.IOException;
import java.util.Map;

import com.helpdesk.dao.TicketDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int totalTickets = TicketDAO.getTotalTickets();
            int openTickets = TicketDAO.getTicketsByStatus("CASE OPEN");
            int closedTickets = TicketDAO.getTicketsByStatus("CASE CLOSED");
            int pendingTickets = TicketDAO.getPendingTickets();
            int ticketsThisMonth = TicketDAO.getTicketsThisMonth();

            Map<String, Integer> categoryMap = TicketDAO.getTicketsByCategory();

            request.setAttribute("totalTickets", totalTickets);
            request.setAttribute("openTickets", openTickets);
            request.setAttribute("closedTickets", closedTickets);
            request.setAttribute("pendingTickets", pendingTickets);
            request.setAttribute("ticketsThisMonth", ticketsThisMonth);
            request.setAttribute("categoryMap", categoryMap);

            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}
