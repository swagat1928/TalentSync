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
      
   
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #175d69;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
        }

        form {
            max-width: 700px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
         input[type="number"],
        select,
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #175d69;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    
   
</head>
<body>
	<%
String a;
ResultSet rs = null;
try {
	a =(String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    PreparedStatement statement = con.prepareStatement("SELECT * FROM freelancer WHERE user_id IN (SELECT user_id FROM users WHERE email=?)");
    statement.setString(1,a);
    rs = statement.executeQuery();
    rs.next();
} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>
	
 <form action="profileUpdateServlet" method="post" style="margin-top:20px;">
        <input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>
    	<center><h3>Update Your Profile</h3></center>
	
   	
		<label for="name">Professional Role:</label>
        <input type="text" id="fname" name="role" value="<%=rs.getString("role")%>" required><br><br>
		<label for="name">First Name:</label>
        <input type="text" id="fname" name="fname" value=<%=rs.getString("firstname")%> required><br><br>
        <label for="name">Last Name:</label>
        <input type="text" id="lname" name="lname" value=<%=rs.getString("lastname") %> required><br><br>
        <label for="name">University:</label>
        <input type="text" id="uni" name="uni" value=<%=rs.getString("university") %> required><br><br>
        <label for="name">Degree:</label>
        <input type="text" id="degree" name="degree" value=<%=rs.getString("degree") %> required><br><br>
        <label for="name">Skill:</label>
        <input type="text" id="degree" name="skill" value="<%=rs.getString("skill")%>" required><br><br>
        
        <label for="rate">Rate:</label>
        <input type="number" id="rate" name="rate" value=<%=rs.getString("rate") %> required><br><br>
        
        <label for="bio">Bio:</label>
        <textarea id="bio" name="bio" required><%=rs.getString("bio") %></textarea><br><br>
        <label for="name">Contact Number:</label>
        <input type="text" id="degree" name="contact" value=<%=rs.getString("contact") %> required><br><br>
        <label for="name">Address:</label>
        <input type="text" id="degree" name="address" value=<%=rs.getString("location") %> required><br><br>
       
        <input type="submit" value="Update Profile">
        
</form>

</body>
</html>