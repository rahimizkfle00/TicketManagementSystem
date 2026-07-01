package com.helpdesk.servlet;

import java.io.IOException;

import com.helpdesk.dao.TicketDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-ticket")
public class DeleteTicketServlet extends HttpServlet {
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

            TicketDAO.deleteTicket(ticketId);

            response.sendRedirect("ticket-list?deleted=1");

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("ticketList.jsp").forward(request, response);
        }
    }
}