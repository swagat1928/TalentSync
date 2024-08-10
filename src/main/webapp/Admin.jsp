<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home Page</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
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

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        h1 {
            color: #175d69;
        }

        h2 {
            color: #175d69;
        }

        .logout-link {
            text-decoration: none;
            color: #fff;
            display: block;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
            background-color: #175d69;
        }

        .logout-link:hover {
            background-color: #330c43;
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
    <div class="content">
        <h1>Welcome Admin!</h1>
    
        <!-- Your content goes here -->
    </div>
</body>
</html>
