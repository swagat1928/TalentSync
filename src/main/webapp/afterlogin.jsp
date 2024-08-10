<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .card h2 {
            margin-top: 0;
        }

        .card p {
            margin-bottom: 5px;
        }

        .card .button {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
        }

        .card .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%
ResultSet rs = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    PreparedStatement statement = con.prepareStatement("SELECT * FROM freelancer");
    rs = statement.executeQuery();

} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>




<div class="container">
  
  <div class="row">
  <%
	while(rs.next())
	{
%>   
<div class="card mx-3" style="width: 18rem;">
  <img src="images/<%=rs.getString("image") %>" class="card-img-top" alt="..." height="150" width="150">
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("firstname") %></h5>
    <p class="card-text"><%=rs.getString("bio") %></p>
    <p class="card-text">Rate : <%=rs.getDouble("rate") %></p>
    <a href="Profile_freel.jsp" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
	
    <%} %>
    </div>
</div>






<!--     <div class="card">
        <h2>Job Title: Graphic Designer</h2>
        <p>Company: ABC Designs</p>
        <p>Location: New York, NY</p>
        <p>Description: ABC Designs is seeking a creative graphic designer to join our team...</p>
        <a href="Profile_freel.jsp" class="button">Apply Now</a>
    </div> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</body>
</html>