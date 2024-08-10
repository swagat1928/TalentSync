<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
     <style>
    	.div1{  font-size: 20px;
    			font-family: "Poppins", sans-serif;
    	}
    	.input1{      width: 40%;
    				height: 4vh;
    	}
    </style>
    <link rel="stylesheet" href="styles.css">
   
</head>
<body><%=session.getAttribute("email") %>
	<%
String a;
ResultSet rs = null;
try {
	a =(String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    PreparedStatement statement = con.prepareStatement("SELECT * FROM freelance WHERE user_id IN (SELECT user_id FROM users WHERE email=?)");
    statement.setString(1,a);
    rs = statement.executeQuery();

} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>
	<% while(rs.next()){ %>
	<section class="vh-100" style="background-color: #14a800;">
    <form action="clientServlet" method="post" enctype="multipart/form-data">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <h1 class="text-white mb-4">Create Profile</h1>

        <div class="card" style="border-radius: 15px;">
          <div class="card-body">
			<input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>
            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">First Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="fname" value=<%=rs.getString("firstname") %>class="form-control form-control-lg" />

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Last Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="lname" name="fname" value=<%=rs.getString("lastname") %>class="form-control form-control-lg" /> 

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">University</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="uni" value=<%=rs.getString("university") %>class="form-control" rows="3"  />

              </div>
            </div>

			 <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Degree</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="degree" value=<%=rs.getString("degree") %> class="form-control" rows="3" /> 

              </div>
            </div>
			
			<div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Skill</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="number" name="skill" value=<%=rs.getString("skill") %> class="form-control" rows="3" placeholder="" />

              </div>
            </div>
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Rate</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="rate" value=<%=rs.getString("rate") %>class="form-control" rows="3"  />

              </div>
            </div><div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Bio</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="bio" required><%=rs.getString("bio") %>class="form-control" rows="3"  />

              </div>
            </div><div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Contact</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="contact" value=<%=rs.getString("contact") %>class="form-control" rows="3"  />

              </div>
            </div><div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Location</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="address" value=<%=rs.getString("location") %>class="form-control" rows="3"  />

              </div>
            </div>
            <hr class="mx-n3">


            <div class="px-5 py-4">
              <button type="submit" class="btn btn-lg" style="background-color: #14a800;">Update Profile</button>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
  </form>
</section>	
 
<%} %>
</body>
</html>