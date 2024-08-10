<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
Connection conn = null;
PreparedStatement pstmt = null;

try {
    // Extract form parameters
    String firstName = request.getParameter("first_name");
    String lastName = request.getParameter("last_name");
    String email = request.getParameter("email");
    String mobileNumber = request.getParameter("contact");
    String message = request.getParameter("message");

    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

    // Prepare SQL statement for insertion
    String sql = "INSERT INTO contact_submissions (first_name, last_name, email, mobile_number, message) VALUES (?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, firstName);
    pstmt.setString(2, lastName);
    pstmt.setString(3, email);
    pstmt.setString(4, mobileNumber);
    pstmt.setString(5, message);

    // Execute insertion query
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        out.println("Form submitted successfully");
    } else {
        out.println("Failed to submit form");
    }
} catch (Exception ex) {
    ex.printStackTrace();
} finally {
    // Close database resources
    if (pstmt != null) {
        try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
    }
    if (conn != null) {
        try { conn.close(); } catch (SQLException e) { /* ignored */ }
    }
}
%>
