package com.helpdesk.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.helpdesk.model.Ticket;
import com.helpdesk.util.DBConnection;

public class TicketDAO {
	public static int updateProofFiles(int ticketId, String beforePhoto, String afterPhoto, String cmFormFile) throws Exception {

	    String sql =
	        "UPDATE tickets SET " +
	        "before_photo = COALESCE(?, before_photo), " +
	        "after_photo = COALESCE(?, after_photo), " +
	        "cm_form_file = COALESCE(?, cm_form_file), " +
	        "updated_at = CURRENT_TIMESTAMP " +
	        "WHERE ticket_id = ?";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, beforePhoto);
	        ps.setString(2, afterPhoto);
	        ps.setString(3, cmFormFile);
	        ps.setInt(4, ticketId);

	        return ps.executeUpdate();
	    }
	}
    public static int saveTicket(Ticket ticket) throws Exception {

        String sql =
            "INSERT INTO tickets (" +
            "status, status_detail, cfm_form_number, ticket_number, ticket_date, " +
            "reporter_name, contact_number, email, time_reported, " +
            "site, room_location, " +
            "issue, category, subcategory, issue_type, brand_model, asset_tag, serial_number, root_cause, " +
            "action_taken_1, rrt_1, irt_1, ort_1, prt_stop_1, " +
            "action_2_enabled, action_taken_2, ort_2, prt_stop_2, " +
            "action_3_enabled, action_taken_3, ort_3, prt_stop_3" +
            ") VALUES (" +
            "?, ?, ?, ?, ?, " +
            "?, ?, ?, ?, " +
            "?, ?, " +
            "?, ?, ?, ?, ?, ?, ?, ?, " +
            "?, ?, ?, ?, ?, " +
            "?, ?, ?, ?, " +
            "?, ?, ?, ?" +
            ")";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ticket.status);
            ps.setString(2, ticket.statusDetail);
            ps.setString(3, ticket.cfmFormNumber);
            ps.setString(4, ticket.ticketNumber);
            ps.setDate(5, ticket.ticketDate);

            ps.setString(6, ticket.reporterName);
            ps.setString(7, ticket.contactNumber);
            ps.setString(8, ticket.email);
            ps.setTime(9, ticket.timeReported);

            ps.setString(10, ticket.site);
            ps.setString(11, ticket.roomLocation);

            ps.setString(12, ticket.issue);
            ps.setString(13, ticket.category);
            ps.setString(14, ticket.subcategory);
            ps.setString(15, ticket.issueType);
            ps.setString(16, ticket.brandModel);
            ps.setString(17, ticket.assetTag);
            ps.setString(18, ticket.serialNumber);
            ps.setString(19, ticket.rootCause);

            ps.setString(20, ticket.actionTaken1);
            ps.setTimestamp(21, ticket.rrt1);
            ps.setTimestamp(22, ticket.irt1);
            ps.setTimestamp(23, ticket.ort1);
            ps.setString(24, ticket.prtStop1);

            ps.setBoolean(25, ticket.action2Enabled);
            ps.setString(26, ticket.actionTaken2);
            ps.setTimestamp(27, ticket.ort2);
            ps.setString(28, ticket.prtStop2);

            ps.setBoolean(29, ticket.action3Enabled);
            ps.setString(30, ticket.actionTaken3);
            ps.setTimestamp(31, ticket.ort3);
            ps.setString(32, ticket.prtStop3);

            return ps.executeUpdate();
        }
    }

    public static List<Ticket> getAllTickets() throws Exception {

        List<Ticket> ticketList = new ArrayList<>();

        String sql =
            "SELECT * FROM tickets " +
            "ORDER BY ticket_id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ticketList.add(mapTicket(rs));
            }
        }

        return ticketList;
    }

    public static Ticket getTicketById(int ticketId) throws Exception {

        Ticket ticket = null;

        String sql = "SELECT * FROM tickets WHERE ticket_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, ticketId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ticket = mapTicket(rs);
                }
            }
        }

        return ticket;
    }

    public static int updateTicket(Ticket ticket) throws Exception {

        String sql =
            "UPDATE tickets SET " +
            "status = ?, status_detail = ?, cfm_form_number = ?, ticket_number = ?, ticket_date = ?, " +
            "reporter_name = ?, contact_number = ?, email = ?, time_reported = ?, " +
            "site = ?, room_location = ?, " +
            "issue = ?, category = ?, subcategory = ?, issue_type = ?, brand_model = ?, asset_tag = ?, serial_number = ?, root_cause = ?, " +
            "action_taken_1 = ?, rrt_1 = ?, irt_1 = ?, ort_1 = ?, prt_stop_1 = ?, " +
            "action_2_enabled = ?, action_taken_2 = ?, ort_2 = ?, prt_stop_2 = ?, " +
            "action_3_enabled = ?, action_taken_3 = ?, ort_3 = ?, prt_stop_3 = ?, " +
            "updated_at = CURRENT_TIMESTAMP " +
            "WHERE ticket_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ticket.status);
            ps.setString(2, ticket.statusDetail);
            ps.setString(3, ticket.cfmFormNumber);
            ps.setString(4, ticket.ticketNumber);
            ps.setDate(5, ticket.ticketDate);

            ps.setString(6, ticket.reporterName);
            ps.setString(7, ticket.contactNumber);
            ps.setString(8, ticket.email);
            ps.setTime(9, ticket.timeReported);

            ps.setString(10, ticket.site);
            ps.setString(11, ticket.roomLocation);

            ps.setString(12, ticket.issue);
            ps.setString(13, ticket.category);
            ps.setString(14, ticket.subcategory);
            ps.setString(15, ticket.issueType);
            ps.setString(16, ticket.brandModel);
            ps.setString(17, ticket.assetTag);
            ps.setString(18, ticket.serialNumber);
            ps.setString(19, ticket.rootCause);

            ps.setString(20, ticket.actionTaken1);
            ps.setTimestamp(21, ticket.rrt1);
            ps.setTimestamp(22, ticket.irt1);
            ps.setTimestamp(23, ticket.ort1);
            ps.setString(24, ticket.prtStop1);

            ps.setBoolean(25, ticket.action2Enabled);
            ps.setString(26, ticket.actionTaken2);
            ps.setTimestamp(27, ticket.ort2);
            ps.setString(28, ticket.prtStop2);

            ps.setBoolean(29, ticket.action3Enabled);
            ps.setString(30, ticket.actionTaken3);
            ps.setTimestamp(31, ticket.ort3);
            ps.setString(32, ticket.prtStop3);

            ps.setInt(33, ticket.ticketId);

            return ps.executeUpdate();
        }
    }

    public static int deleteTicket(int ticketId) throws Exception {

        String sql = "DELETE FROM tickets WHERE ticket_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, ticketId);

            return ps.executeUpdate();
        }
    }

    public static List<Ticket> searchTickets(String keyword, String status, String category, Date dateFrom, Date dateTo)
            throws Exception {

        List<Ticket> ticketList = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM tickets WHERE 1=1 ");

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append("AND (");
            sql.append("ticket_number ILIKE ? OR ");
            sql.append("cfm_form_number ILIKE ? OR ");
            sql.append("reporter_name ILIKE ? OR ");
            sql.append("site ILIKE ? OR ");
            sql.append("room_location ILIKE ? OR ");
            sql.append("issue ILIKE ?");
            sql.append(") ");

            String searchKeyword = "%" + keyword.trim() + "%";

            params.add(searchKeyword);
            params.add(searchKeyword);
            params.add(searchKeyword);
            params.add(searchKeyword);
            params.add(searchKeyword);
            params.add(searchKeyword);
        }

        if (status != null && !status.trim().isEmpty()) {
            sql.append("AND status = ? ");
            params.add(status.trim());
        }

        if (category != null && !category.trim().isEmpty()) {
            sql.append("AND category = ? ");
            params.add(category.trim());
        }

        if (dateFrom != null) {
            sql.append("AND ticket_date >= ? ");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append("AND ticket_date <= ? ");
            params.add(dateTo);
        }

        sql.append("ORDER BY ticket_id DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ticketList.add(mapTicket(rs));
                }
            }
        }

        return ticketList;
    }

    public static int getTotalTickets() throws Exception {

        String sql = "SELECT COUNT(*) FROM tickets";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }

    public static int getTicketsByStatus(String status) throws Exception {

        String sql = "SELECT COUNT(*) FROM tickets WHERE status = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }

        return 0;
    }

    public static int getPendingTickets() throws Exception {

        String sql = "SELECT COUNT(*) FROM tickets WHERE status ILIKE 'PENDING%'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }

    public static int getTicketsThisMonth() throws Exception {

        String sql =
            "SELECT COUNT(*) FROM tickets " +
            "WHERE EXTRACT(MONTH FROM ticket_date) = EXTRACT(MONTH FROM CURRENT_DATE) " +
            "AND EXTRACT(YEAR FROM ticket_date) = EXTRACT(YEAR FROM CURRENT_DATE)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }

    public static Map<String, Integer> getTicketsByCategory() throws Exception {

        Map<String, Integer> categoryMap = new LinkedHashMap<>();

        String sql =
            "SELECT COALESCE(category, 'Uncategorized') AS category_name, COUNT(*) AS total " +
            "FROM tickets " +
            "GROUP BY COALESCE(category, 'Uncategorized') " +
            "ORDER BY total DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                categoryMap.put(rs.getString("category_name"), rs.getInt("total"));
            }
        }

        return categoryMap;
    }
    public static String getProofFilePath(int ticketId, String proofType) throws Exception {

        String columnName = getProofColumnName(proofType);

        String sql = "SELECT " + columnName + " FROM tickets WHERE ticket_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, ticketId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString(columnName);
                }
            }
        }

        return null;
    }

    public static int deleteProofFile(int ticketId, String proofType) throws Exception {

        String columnName = getProofColumnName(proofType);

        String sql =
            "UPDATE tickets SET " +
            columnName + " = NULL, " +
            "updated_at = CURRENT_TIMESTAMP " +
            "WHERE ticket_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, ticketId);

            return ps.executeUpdate();
        }
    }

    private static String getProofColumnName(String proofType) throws Exception {

        if ("before".equals(proofType)) {
            return "before_photo";
        }

        if ("after".equals(proofType)) {
            return "after_photo";
        }

        if ("cm".equals(proofType)) {
            return "cm_form_file";
        }

        throw new Exception("Invalid proof file type.");
    }
    private static Ticket mapTicket(ResultSet rs) throws Exception {

        Ticket ticket = new Ticket();

        ticket.ticketId = rs.getInt("ticket_id");

        ticket.status = rs.getString("status");
        ticket.statusDetail = rs.getString("status_detail");
        ticket.cfmFormNumber = rs.getString("cfm_form_number");
        ticket.ticketNumber = rs.getString("ticket_number");
        ticket.ticketDate = rs.getDate("ticket_date");

        ticket.reporterName = rs.getString("reporter_name");
        ticket.contactNumber = rs.getString("contact_number");
        ticket.email = rs.getString("email");
        ticket.timeReported = rs.getTime("time_reported");

        ticket.site = rs.getString("site");
        ticket.roomLocation = rs.getString("room_location");

        ticket.issue = rs.getString("issue");
        ticket.category = rs.getString("category");
        ticket.subcategory = rs.getString("subcategory");
        ticket.issueType = rs.getString("issue_type");
        ticket.brandModel = rs.getString("brand_model");
        ticket.assetTag = rs.getString("asset_tag");
        ticket.serialNumber = rs.getString("serial_number");
        ticket.rootCause = rs.getString("root_cause");

        ticket.actionTaken1 = rs.getString("action_taken_1");
        ticket.rrt1 = rs.getTimestamp("rrt_1");
        ticket.irt1 = rs.getTimestamp("irt_1");
        ticket.ort1 = rs.getTimestamp("ort_1");
        ticket.prtStop1 = rs.getString("prt_stop_1");

        ticket.action2Enabled = rs.getBoolean("action_2_enabled");
        ticket.actionTaken2 = rs.getString("action_taken_2");
        ticket.ort2 = rs.getTimestamp("ort_2");
        ticket.prtStop2 = rs.getString("prt_stop_2");

        ticket.action3Enabled = rs.getBoolean("action_3_enabled");
        ticket.actionTaken3 = rs.getString("action_taken_3");
        ticket.ort3 = rs.getTimestamp("ort_3");
        ticket.prtStop3 = rs.getString("prt_stop_3");

        ticket.createdAt = rs.getTimestamp("created_at");
        ticket.updatedAt = rs.getTimestamp("updated_at");

        ticket.beforePhoto = rs.getString("before_photo");
        ticket.afterPhoto = rs.getString("after_photo");
        
        ticket.cmFormFile = rs.getString("cm_form_file");

        return ticket;
    }
}

