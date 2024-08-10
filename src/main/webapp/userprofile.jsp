<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        .user-details {
            margin-top: 20px;
        }
        .detail {
            margin-bottom: 10px;
        }
        .detail label {
            font-weight: bold;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Admin.jsp">Home</a>
        <a href="AdminView.jsp">back</a>
    </div>
    
    <div class="user-details">
        <% 
            // Fetch user details based on the userId parameter from the URL
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

                // Prepare SQL statement to fetch user details
                String sql = "SELECT user_id,username, email, usertype, first_time_login FROM users WHERE user_id=?";
                stmt = conn.prepareStatement(sql);
                // Get the userId parameter from the URL
                int userId = Integer.parseInt(request.getParameter("userId"));
                stmt.setInt(1, userId);

                // Execute the query
                rs = stmt.executeQuery();

                // Check if user exists
                if (rs.next()) {
                    int userIdFromDB = rs.getInt("user_id"); // Get the user ID from the database
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String userType = rs.getString("usertype");
                    boolean firstTimeLogin = rs.getBoolean("first_time_login");

                    // Display user details
                    out.println("<div class='detail'><label>UserId:</label> " +userIdFromDB  + "</div>");
                    out.println("<div class='detail'><label>Username:</label> " + username + "</div>");
                    out.println("<div class='detail'><label>Email:</label> " + email + "</div>");
                    out.println("<div class='detail'><label>User Type:</label> " + userType + "</div>");
                
                    out.println("<a href='userprofile.jsp?userId=" + userId + "'></a> <button class=\"delete-btn\" onclick=\"deleteUser(" + userId + ")\">Delete</button>");
                    
                    // Add button based on user type
                   
                } else {
                    // User not found
                    out.println("<div>User not found</div>");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                // Close database resources
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
    </div>
     <script>
        function deleteUser(userId) {
            if (confirm("Are you sure you want to delete this user?")) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "deleteUser.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            alert(xhr.responseText); // Display success message
                            location.reload(); // Reload the page after deletion
                        } else {
                            alert("Failed to delete user"); // Display error message
                        }
                    }
                };
                xhr.send("userId=" + userId);
            }
        }
    </script>
</body>
</html>
