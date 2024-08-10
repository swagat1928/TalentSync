<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Freelancer Profile</title>
    <!-- Include your CSS and JavaScript files here -->
</head>
<body>
<%
String a = (String) session.getAttribute("email");
if (a == null || a.isEmpty()) {
    // Redirect the user to login page or show an error message
    response.sendRedirect("login.jsp");
} else {
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
        PreparedStatement statement = con.prepareStatement("SELECT * FROM freelancer WHERE user_id IN (SELECT user_id FROM users WHERE email=?)");
        statement.setString(1, a);
        rs = statement.executeQuery();

        if (rs.next()) {
%>
            <div>
                <h1>Freelancer Profile</h1>
                <p>Firstname: <%= rs.getString("firstname") %></p>
                <p>Lastname: <%= rs.getString("lastname") %></p>
                <p>Role: <%= rs.getString("role") %></p>
                <p>University: <%= rs.getString("university") %></p>
                <p>Degree: <%= rs.getString("degree") %></p>
                <p>Skill: <%= rs.getString("skill") %></p>
                <p>Rate: <%= rs.getDouble("rate") %></p>
                <p>Bio: <%= rs.getString("bio") %></p>
                <p>Contact: <%= rs.getString("contact") %></p>
                <p>Location: <%= rs.getString("location") %></p>
                <!-- Add more details as needed -->
                <img src="image/<%= rs.getString("image") %>" alt="Freelancer Image" style="max-height: 200px; max-width: 200px;">

                <!-- Continue Button for Payment Process -->
                <form action="payment_process.jsp">
                    <input type="hidden" name="freelancerId" value="<%= rs.getInt("id") %>">
                    <button type="submit">Continue</button>
                </form>

                <!-- Contact Me Button for Chat -->
                <form action="chat.jsp" method="post">
                    <input type="hidden" name="freelancerId" value="<%= rs.getInt("id") %>">
                    <button type="submit">Contact Me</button>
                </form>
            </div>
<%
        } else {
            out.println("Freelancer not found");
        }

        rs.close();
        statement.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        // Handle any errors that may occur
        out.println("An error occurred: " + e.getMessage());
    }
}
%>
</body>
</html>
