<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
            padding: 5px;
            border-radius: 5px;
            margin-left:16%;
            margin-right:40%;
          
        }
        p{
            margin-bottom: 10px;
            padding: 5px;
         
            border-radius: 5px;
            margin-left:16%;
            margin-right:16%;
            font-weight:bold;
           
        }
        .delete-btn {
            background-color: #ff0000;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
         .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #175d69;
            padding-top: 20px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar li {
            padding: 10px;
            text-align: center;
            position: relative;
        }

        .sidebar li:not(:last-child)::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 10px;
            right: 10px;
            border-bottom: 1px solid #555;
        }

        .sidebar a {
            text-decoration: none;
            color: #fff;
            display: block;
            padding: 10px 20px;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .sidebar a:hover {
            background-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2 style="color: #fff; text-align: center;">TalentSync</h2>
        <ul>
            <a href="AdminView.jsp">View Users</a>
            <a href="jobstotal.jsp">Posted jobs</a>
            <a href="show_contact.jsp">Feedbacks</a>     
             </ul>
    </div>
    <h1>All Users</h1>
    
    <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

        // Query to retrieve total count of users
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT COUNT(*) AS totalUsers FROM users");
        int totalUsers = 0;
        if (rs.next()) {
            totalUsers = rs.getInt("totalUsers");
        }

        // Query to retrieve user details
        rs = stmt.executeQuery("SELECT user_id, username, usertype FROM users");

        out.println("<p>Total Users: " + totalUsers + "</p>");
        out.println("<ul>");
        while (rs.next()) {
            int userId = rs.getInt("user_id");
            String username = rs.getString("username");
            String userType = rs.getString("usertype");
            // Create a link to the user's profile page with their ID
            out.println("<li><a href='userprofile.jsp?userId=" + userId + "'>" + username + " - " + userType + "</a> <button class=\"delete-btn\" onclick=\"deleteUser(" + userId + ")\">Delete</button></li>");
        }
        out.println("</ul>");
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (stmt != null) {
            try { stmt.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
    %>
<script>
    function deleteUser(userId) {
        console.log("Deleting user with ID: " + userId);
        if (confirm("Are you sure you want to delete this user?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "DeleteUser.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    console.log("Response from server: " + xhr.responseText);
                    if (xhr.status === 200) {
                        // Reload the page to reflect the changes
                        window.location.reload();
                    } else {
                        console.error("Error deleting user. Status code: " + xhr.status);
                    }
                }
            };
            xhr.send("userId=" + userId);
        }
    }
</script>

    
</body>
</html>
