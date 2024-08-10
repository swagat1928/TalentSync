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
     
    <link rel="stylesheet" href="styles.css">
   
</head>
<body>
	
	
 <form action="profileServlet" method="post" enctype="multipart/form-data" style="margin-top:20px;">
       	<center><h3>Create Your Profile</h3></center>
    
	<input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>

		<label for="name">Role:</label>
        <input type="text" id="fname" name="role" required><br><br>
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
        <label for="rate">Rate:</label>
        <input type="number" id="rate" name="rate" required><br><br>
        <label for="bio">Bio:</label>
        <textarea id="bio" name="bio" required></textarea><br><br>
        <label for="name">Contact Number:</label>
        <input type="text" id="degree" name="contact" required><br><br>
        <label for="name">Address:</label>
        <input type="text" id="degree" name="address" required><br><br>
        Select image to upload:
        <input type="file" name="image" id="file">
        <br> <br>
        <input type="submit" value="Create Profile">
        </div>
</form>
</body>
</html>