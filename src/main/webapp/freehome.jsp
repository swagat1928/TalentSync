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
	
</head>
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
<input type="hidden" id="flag" value=<%=session.getAttribute("flag") %>>
 

<%
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3=null;
try {
	String a =(String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    
    PreparedStatement statement3 = con.prepareStatement("SELECT id FROM freelancer WHERE user_id IN (SELECT user_id FROM users WHERE email=?)");
    statement3.setString(1,a);
    rs3 = statement3.executeQuery();
    int userId = -1; // Default value if no user ID is found
	if (rs3.next()) {
	    userId = rs3.getInt("id");
	}
	
    PreparedStatement statement = con.prepareStatement("SELECT * from job where id not in(select job_id from applied where free_id=?)");
    statement.setInt(1,userId); 
    rs = statement.executeQuery();

  

} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>

<nav class="navbar navbar-expand-lg bg-body-light " style="background-color: #330c43; margin-bottom:10px">
  <div class="container-fluid">
    <a class="navbar-brand" style="color:white;" href="#">TalentSync</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="freeaccjobs.jsp">Accepted Jobs</a>
        </li> 
         <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="freepayjob.jsp">Payment Completed</a>
        </li> 
       
      
      </ul>
      <form class="d-flex" role="search" action="search" method="get">
        <input class="form-control me-2" type="search" name="skill" placeholder="Search By Skills" aria-label="Search">
        <button class="btn btn-light" type="submit">Search</button>
      </form>
       <a href="showprofile.jsp"><button style="margin:10px;" class="profile-button">
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

<div class="container">
<div class="row">
<%
	while(rs.next())
	{
		try {
			int cid=Integer.parseInt(rs.getString("client_id"));
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
		    PreparedStatement statement2 = conn.prepareStatement("SELECT * FROM client where id=? ");
		    statement2.setInt(1,cid);
		    rs2 = statement2.executeQuery();
			rs2.next();
		  

		} catch (ClassNotFoundException | SQLException e) {
		    // Handle any errors that may occur
		    e.printStackTrace();
		}
%>



  <div class="col-sm-6 mb-3 mb-sm-0">
    <div class="card">
      <div class="card-body" style="width: 40rem;height:20rem">
        <h5 class="card-title"><h2><%=rs.getString("title") %></h2></h5>
        <p class="card-text">Company : <%=rs2.getString("company_name") %></p>
         <p class="card-text">Description : <%= rs.getString("description")%></p>
         <p class="card-text">Required skill : <%=rs.getString("skill") %></p>
         <p class="card-text">Amount : <%=rs.getDouble("payment_amount") %></p>
         <form action="ApplyServlet" method="post" >
         <input type="hidden" id="flag" name="id" value=<%=rs.getInt("id") %>>
         <input type="hidden" id="flag" name="client_id" value=<%=rs.getInt("client_id") %>>
        <button class="btn btn-primary">Apply</button>
        </form>
      </div>
    </div>
  </div>

<%} %>
</div>
</div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script>
	var flag=document.getElementById("flag").value;
    	console.log(flag);
    	if(flag=="unjob")
    		{	
    		swal("Sorry!","Unable to apply for job","error");
    		}
    	else if(flag == "job")
    	{
    		swal("Congratulations!","You Applied For Job successfully","success");
    	}
    	<%session.setAttribute("flag","temp"); %>
    	
    	</script>
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