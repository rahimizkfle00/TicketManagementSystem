package com.helpdesk.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import com.helpdesk.dao.TicketDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload-proof")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 30
)
public class UploadProofServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int ticketId = 0;

        try {
            ticketId = Integer.parseInt(request.getParameter("ticketId"));

            String beforePhoto = saveUploadedFile(request, "beforePhoto", "image");
            String afterPhoto = saveUploadedFile(request, "afterPhoto", "image");
            String cmFormFile = saveUploadedFile(request, "cmFormFile", "document");

            TicketDAO.updateProofFiles(ticketId, beforePhoto, afterPhoto, cmFormFile);

            response.sendRedirect("view-ticket?id=" + ticketId + "&proofUploaded=1");

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("ticketId", ticketId);
            request.getRequestDispatcher("uploadProof.jsp?id=" + ticketId).forward(request, response);
        }
    }

    private String saveUploadedFile(HttpServletRequest request, String partName, String fileType) throws Exception {
        Part filePart = request.getPart(partName);

        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String contentType = filePart.getContentType();

        if (contentType == null) {
            throw new Exception("Invalid file type for " + partName);
        }

        if ("image".equals(fileType)) {
            if (!contentType.startsWith("image/")) {
                throw new Exception("Only image files are allowed for before and after photos.");
            }
        }

        if ("document".equals(fileType)) {
            boolean isImage = contentType.startsWith("image/");
            boolean isPdf = "application/pdf".equals(contentType);

            if (!isImage && !isPdf) {
                throw new Exception("Only PDF or image file is allowed for scanned CM form.");
            }
        }

        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        if (originalFileName == null || originalFileName.trim().isEmpty()) {
            return null;
        }

        String extension = "";

        int dotIndex = originalFileName.lastIndexOf(".");
        if (dotIndex >= 0) {
            extension = originalFileName.substring(dotIndex);
        }

        String newFileName =
            partName + "_" +
            System.currentTimeMillis() + "_" +
            UUID.randomUUID().toString() +
            extension;

        String uploadPath = request.getServletContext().getRealPath("/uploads");

        File uploadFolder = new File(uploadPath);

        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        String fullPath = uploadPath + File.separator + newFileName;

        filePart.write(fullPath);

        return "uploads/" + newFileName;
    }
}

