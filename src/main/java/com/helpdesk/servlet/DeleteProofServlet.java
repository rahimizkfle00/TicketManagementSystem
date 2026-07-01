package com.helpdesk.servlet;

import java.io.File;
import java.io.IOException;

import com.helpdesk.dao.TicketDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-proof")
public class DeleteProofServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int ticketId = 0;

        try {
            String ticketIdValue = request.getParameter("ticketId");
            String proofType = request.getParameter("type");

            if (ticketIdValue == null || ticketIdValue.trim().isEmpty()) {
                throw new Exception("Missing ticket ID.");
            }

            if (proofType == null || proofType.trim().isEmpty()) {
                throw new Exception("Missing proof type.");
            }

            ticketId = Integer.parseInt(ticketIdValue);

            String filePath = TicketDAO.getProofFilePath(ticketId, proofType);

            TicketDAO.deleteProofFile(ticketId, proofType);

            if (filePath != null && !filePath.trim().isEmpty()) {
                String fullPath = request.getServletContext().getRealPath("/" + filePath);

                if (fullPath != null) {
                    File file = new File(fullPath);

                    if (file.exists()) {
                        file.delete();
                    }
                }
            }

            response.sendRedirect("uploadProof.jsp?id=" + ticketId + "&proofDeleted=1");

        } catch (Exception e) {
            e.printStackTrace();

            if (ticketId > 0) {
                response.sendRedirect("uploadProof.jsp?id=" + ticketId + "&deleteError=1");
            } else {
                response.sendRedirect("ticket-list");
            }
        }
    }
}
