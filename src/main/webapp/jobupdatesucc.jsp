<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Retrieve the form parameters
    int jobId = Integer.parseInt(request.getParameter("jobId"));
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String skill = request.getParameter("skill");
    String deadline = request.getParameter("deadline");
    double paymentAmount = Double.parseDouble(request.getParameter("paymentAmount"));

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "Nitish@123");

        // Prepare SQL query to update the job details
        String sql = "UPDATE job SET title=?, description=?, skill=?, deadline=?, payment_amount=? WHERE id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setString(3, skill);
        stmt.setString(4, deadline);
        stmt.setDouble(5, paymentAmount);
        stmt.setInt(6, jobId);

        // Execute the update query
        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            // If update is successful, redirect to a success page
            response.sendRedirect("updateSuccess.jsp");
        } else {
            // If no rows were affected, display an error message
            out.println("<div>Failed to update job</div>");
        }
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
