<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button><input  value=<%=session.getAttribute("email") %>></button>
welcome page

	<a href="showprofile.jsp">click here</a> 
	<form action="ClientServlet" >
            <h2>Signup</h2><br>
            Join as<br>
            <div class="radio-group">
            
 			<input type="radio" id="freelancer" name="userType" value="freelancer" color="blue">
  			<label class="lab" for="freelancer">Freelancer</label>
  			<input type="radio" id="client" name="userType" value="client">
  			<label class="lab" for="client">Client</label><br>

            
            </div>
            <div class="input_box">
              <input type="text" name="user" placeholder="Enter your user name" required />
              <i class="uil uil-envelope-alt lastname"></i>
            </div>

            <div class="input_box">
              <input type="email" name="email" placeholder="Enter your email" required />
              <i class="uil uil-envelope-alt email"></i>
            </div>
            <div class="input_box">
              <input type="password" name="password" placeholder="Create password" required />
              <i class="uil uil-lock password"></i>
              <i class="uil uil-eye-slash pw_hide"></i>
            </div>
            <div class="input_box">
              <input type="password" name="cpassword" placeholder="Confirm password" required />
              <i class="uil uil-lock password"></i>
              <i class="uil uil-eye-slash pw_hide"></i>
            </div>

            <button type="submit" class="button">Signup Now</button>

            <div class="login_signup">Already have an account? <a href="#" id="login">Login</a></div>
          </form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="script.js"> </script>
     <script>
<script>
	if(flag=="sign"){
    		swal("Congratulations!","SignIn successfully","success");
    	}
</script>

</body>
</html>