package com.helpdesk.servlet;

import java.io.IOException;

import com.helpdesk.dao.TicketDAO;
import com.helpdesk.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit-ticket")
public class EditTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idParam = request.getParameter("id");

            if (idParam == null || idParam.trim().isEmpty()) {
                response.sendRedirect("ticket-list");
                return;
            }

            int ticketId = Integer.parseInt(idParam);

            Ticket ticket = TicketDAO.getTicketById(ticketId);

            if (ticket == null) {
                request.setAttribute("errorMessage", "Ticket not found.");
                request.getRequestDispatcher("editTicket.jsp").forward(request, response);
                return;
            }

            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("editTicket.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("editTicket.jsp").forward(request, response);
        }
    }
}