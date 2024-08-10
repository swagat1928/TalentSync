<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Total Number of Jobs with Client Name</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
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
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .job-details {
            margin-top: 20px;
        }
        .detail {
            margin-bottom: 10px;
        }
        .detail label {
            font-weight: bold;
        }
        .action-buttons {
            margin-top: 10px;
        }
        .action-buttons button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Admin.jsp">Home</a>
    </div>

    <h1>Total Number of Jobs</h1>

    <div class="job-details">
        <% 
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

                // Prepare SQL query to retrieve job details along with client name
                String sql = "SELECT j.id, j.title, j.description, j.skill, j.deadline, j.payment_amount, c.firstname, c.lastname FROM job j INNER JOIN client c ON j.client_id = c.id";
                stmt = conn.prepareStatement(sql);

                // Execute the query
                rs = stmt.executeQuery();

                // Display job details with client names
                while (rs.next()) {
                    int jobId = rs.getInt("id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String skill = rs.getString("skill");
                    Date deadline = rs.getDate("deadline");
                    double paymentAmount = rs.getDouble("payment_amount");
                    String clientFirstName = rs.getString("firstname");
                    String clientLastName = rs.getString("lastname");

                    // Display job details with client names
                    out.println("<div class='detail'><label>Title:</label> " + title + "</div>");
                    out.println("<div class='detail'><label>Description:</label> " + description + "</div>");
                    out.println("<div class='detail'><label>Skill:</label> " + skill + "</div>");
                    out.println("<div class='detail'><label>Deadline:</label> " + deadline + "</div>");
                    out.println("<div class='detail'><label>Payment Amount:</label> " + paymentAmount + "</div>");
                    out.println("<div class='detail'><label>Client Name:</label> " + clientFirstName + " " + clientLastName + "</div>");
                    out.println("<div class='action-buttons'>");
                    out.println("<button onclick='editJob(" + jobId + ")'>Edit</button>");
                    out.println("<button onclick='deleteJob(" + jobId + ")'>Delete</button>");
                    out.println("</div>");
                    out.println("<hr>");
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

   <!-- Existing code... -->

<script>
    function editJob(jobId) {
        // Redirect to the edit job page with the jobId as a parameter
        window.location.href = "editJob.jsp?jobId=" + jobId;
    }

    function deleteJob(jobId) {
        if (confirm("Are you sure you want to delete this job?")) {
            // Send an AJAX request to DeleteJob.jsp to delete the job
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "deleteJobs.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Reload the page to reflect the changes
                    window.location.reload();
                }
            };
            xhr.send("jobId=" + jobId);
        }
    }
</script>

<!-- Existing code... -->

</body>
</html>
