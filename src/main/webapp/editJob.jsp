<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Job</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        .edit-form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 5px;
        }
        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Edit Job</h1>

    <div class="edit-form">
        <% 
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

                // Get the jobId parameter from the URL
                int jobId = Integer.parseInt(request.getParameter("jobId"));

                // Prepare SQL query to retrieve job details
                String sql = "SELECT * FROM job WHERE id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, jobId);

                // Execute the query
                rs = stmt.executeQuery();

                // Display the job details in an edit form
                if (rs.next()) {
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String skill = rs.getString("skill");
                    String deadline = rs.getString("deadline");
                    double paymentAmount = rs.getDouble("payment_amount");

                    // Display the edit form
                    out.println("<form action='jobupdatesucc.jsp' method='post'>");
                    out.println("<input type='hidden' name='jobId' value='" + jobId + "'>");
                    out.println("<div class='form-group'><label>Title:</label> <input type='text' name='title' value='" + title + "'></div>");
                    out.println("<div class='form-group'><label>Description:</label> <textarea name='description'>" + description + "</textarea></div>");
                    out.println("<div class='form-group'><label>Skill:</label> <input type='text' name='skill' value='" + skill + "'></div>");
                    out.println("<div class='form-group'><label>Deadline:</label> <input type='date' name='deadline' value='" + deadline + "'></div>");
                    out.println("<div class='form-group'><label>Payment Amount:</label> <input type='text' name='paymentAmount' value='" + paymentAmount + "'></div>");
                    out.println("<div class='form-group'><input type='submit' value='Update'></div>");
                    out.println("</form>");
                } else {
                    // Job not found
                    out.println("<div>Job not found</div>");
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
</body>
</html>
