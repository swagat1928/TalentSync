<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Status</title>
</head>
<body>
    <h1>Login Status</h1>
    <% 
    // Retrieve form parameters
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JDBC variables
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        // JDBC connection and SQL query
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ca2304", "root", "pass");
        ps = con.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        ps.setString(1, username);
        ps.setString(2, password);

        rs = ps.executeQuery();
        if (rs.next()) {
            // User authenticated, show welcome message
            String firstName = rs.getString("first_name");
            out.println("<h2>Welcome " + firstName + "</h2>");
        } else {
            // Authentication failed, show error message
            out.println("<p>Error: Invalid username or password.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            out.println("<p>Error closing database connection: " + ex.getMessage() + "</p>");
        }
    }
    %>
</body>
</html>
