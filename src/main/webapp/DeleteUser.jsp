<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

        // Get the user ID from the request parameter
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Delete associated records in the freelancer table
        String deleteFreelancerSql = "DELETE FROM freelancer WHERE user_id = ?";
        stmt = conn.prepareStatement(deleteFreelancerSql);
        stmt.setInt(1, userId);
        stmt.executeUpdate();

        // Now delete the user
        String deleteUserSql = "DELETE FROM users WHERE user_id = ?";
        stmt = conn.prepareStatement(deleteUserSql);
        stmt.setInt(1, userId);
        stmt.executeUpdate();
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        // Close database resources
        if (stmt != null) {
            try { stmt.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
%>
