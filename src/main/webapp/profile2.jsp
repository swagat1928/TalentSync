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
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
        }

        form {
            max-width: 500px;
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
        select,
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        
        body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.input1 {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

label {
    font-weight: bold;
}

textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="file"] {
    margin-bottom: 10px;
}

input[type="submit"] {
    background-color: #330c43;
    color: white;
    padding: 15px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color:  #330c43;
}
submit-btn {
    width: 100%;
    padding: 15px;
    background-color: #330c43; /* New color */
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

.submit-btn:hover {
    background-color: #0f3e47; /* Darker shade on hover */
}


    </style>
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
        <label for="rate">Rate:</label>
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
        <br> <br>
        <input type="submit" value="Create Profile">
        </div>
</form>
</body>
</html>