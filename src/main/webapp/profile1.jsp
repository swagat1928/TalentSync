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
	
	
 <form action="profileServlet" method="post" enctype="multipart/form-data">
        
    
	<div class="div1">
   	It’s the very first thing clients see, so make it count. Stand out by describing your expertise in your own words.<br><br>
	
Your professional role
	<input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>
<input aria-labelledby="title-label" aria-required="true" type="text" name="role" placeholder="Software Engineer | Javascript | iOS" class="input1"><br><br>
		<label for="name">First Name:</label>
        <input type="text" id="fname" name="fname" required><br><br>
        <label for="name">Last Name:</label>
        <input type="text" id="lname" name="lname" required><br><br>
        <label for="name">University:</label>
        <input type="text" id="uni" name="uni" required><br><br>
        <label for="name">Degree:</label>
        <input type="text" id="degree" name="degree" required><br><br>
        <label for="name">Skill:</label>
        <input type="text" id="degree" name="skill" required><br><br>
        let’s set your hourly rate.
        <label for="rate">Hourly Rate:</label>
        <input type="number" id="rate" name="rate" required><br><br>
        write a bio to tell the world about yourself.<br>
        <label for="bio">Bio:</label>
        <textarea id="bio" name="bio" required></textarea><br><br>
        <label for="name">Contact Number:</label>
        <input type="text" id="degree" name="contact" required><br><br>
        <label for="name">Address:</label>
        <input type="text" id="degree" name="address" required><br><br>
        Select image to upload:
        <input type="file" name="image" id="file">
        <input type="submit" value="Create Profile">
        </div>
</form>
</body>
</html>