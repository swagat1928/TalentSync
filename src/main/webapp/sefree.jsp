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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
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
         .profile-button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        /* Styles for the icon */
        .profile-button i {
            margin-right: 5px;
        }
           .profile-button {
            background-color: white;
            color: black;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        /* Styles for the icon */
        .profile-button i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<%
ResultSet rs = null;

try {
	String skills;
	skills = (String)session.getAttribute("searchskill");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    PreparedStatement statement = con.prepareStatement("SELECT * FROM freelancer where skill like ?");
    statement.setString(1, "%"+skills+"%");
    rs = statement.executeQuery();

  

} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>
<nav class="navbar navbar-expand-lg bg-body-light " style="background-color: #330c43;">
  <div class="container-fluid">
    <a class="navbar-brand" style="color:white;" href="#">TalentSync</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="jobpost1.jsp">POST JOB</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="showapp.jsp">View Applicants</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="showacceptapp.jsp">Accepted Applicants</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;"  aria-current="page" href=paymentjobs.jsp>Completed Jobs</a>
        </li>
      
      </ul>
      <form class="d-flex" role="search" action="Searchfree" method="get">
        <input class="form-control me-2" type="search" name="skill" placeholder="Search By Skills" aria-label="Search">
        <button class="btn btn-light" type="submit">Search</button>
      </form>
       <a href="showcprofile.jsp"><button style="margin:10px;" class="profile-button">
        <i class="fa fa-user mx-2" ><%=session.getAttribute("email") %>
        </i>
    	</button></a>
    	<form action="logout" method="post">
    	<a href="showprofile.jsp"><button class="profile-button"><img src="box-arrow-right.svg" width="23"></img>
        <i class="fa fa" >Logout
        </i>
    	</button></a></form>
    </div>
  </div>
</nav>
<h3>Browse Freelancer</h3>


<div class="container">
<div class="row">
<%
	while(rs.next())
	{
%>



  <div class="col-sm-3 mb-3 mb-sm-0">
    <div class="card" style="width: 18rem;">
    	<img src="images/<%=rs.getString("image") %>" class="card-img-top" alt="..." height="150" width="50">
      <div class="card-body">
        <h5 class="card-title"><h2><%=rs.getString("firstname") %></h2></h5>
         <p class="card-text">Description :<%= (rs.getString("bio") != null && rs.getString("bio").length() > 40) ? rs.getString("bio").substring(0, 40) + "..." : rs.getString("bio") %></p>
         <p class="card-text">Skills : <%=rs.getString("skill") %></p>
         <p class="card-text">Rate : <%=rs.getDouble("rate") %>Rs</p>
        <form action="profileServlet" method="post">
        <input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>
        <a href="showprofiletoclient.jsp?em=<%=rs.getString("id") %>" class="btn btn-primary">View Profile</a></form>
      </div>
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
        <a href="#" class="button">Apply Now</a>
    </div> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</body>
</html>