<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
  <%
String a;
ResultSet rs = null;
try {
	a =(String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    PreparedStatement statement = con.prepareStatement("SELECT * FROM client WHERE user_id IN (SELECT user_id FROM users WHERE email=?)");
    statement.setString(1,a);
    rs = statement.executeQuery();

} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>
    <section class="vh-100" style="background-color: #175d69;">
    <% while(rs.next()){ %>
    <form action="UpdateclientServlet" method="post">
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

                <input type="text" name="fname" value=<%=rs.getString("firstname")%> class="form-control form-control-lg" />

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Last Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="lname" value=<%=rs.getString("lastname")%> class="form-control form-control-lg" /> 

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Company Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="cname"  value=<%=rs.getString("company_name")%> class="form-control" rows="3" placeholder="" />

              </div>
            </div>

			 <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Description</h6>

              </div>
              <div class="col-md-9 pe-5">

                <textarea type="text" name="description"  class="form-control form-control-lg"><%=rs.getString("bio")%> </textarea> 

              </div>
            </div>
			
			<div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Contact No.</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="number" name="cno" value=<%=rs.getString("contact_no")%> class="form-control" rows="3" placeholder="" />

              </div>
            </div>
            
            <hr class="mx-n3">


            <div class="px-5 py-4">
              <button type="submit" class="btn btn-lg" style="background-color: #330c43; color:white; ">Update Profile</button>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
  </form>
  <%} %>
</section>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
