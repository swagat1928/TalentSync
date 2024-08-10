<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

        // Get the job ID from the request parameter
        int jobId = Integer.parseInt(request.getParameter("jobId"));

        // Prepare SQL query to delete the job
        String sql = "DELETE FROM job WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, jobId);

        // Execute the query
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
