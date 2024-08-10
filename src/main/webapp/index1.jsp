<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration</title>
    <style>.lab{
	cursor: pointer;
    
    margin-right: 40px;
}
input[name="userType"] {
  accent-color:#8b5cc8;
}

    </style>
    <link rel="stylesheet" href="style.css" />
    
	    <link rel="stylesheet" https="style.css" />
  </head>
  <body>
  <input type="hidden" id="flag" value=<%=session.getAttribute("flag") %>>
 
    	<%session.setAttribute("flag","Success"); %>
    <!-- Header -->
    <header class="header">
      <nav class="nav">
        <a href="#" class="nav_logo">freelancer</a>

        <ul class="nav_items">
          <li class="nav_item">
            <a href="#" class="nav_link">Home</a>
            <a href="#" class="nav_link">Product</a>
            <a href="#" class="nav_link">Services</a>
            <a href="#" class="nav_link">Contact</a>
          </li>
        </ul>

        <button class="button" id="form-open">Login</button>

      </nav>
    </header>

    <!-- Home -->
    <section class="home">
      <div class="form_container">
        <i class="uil uil-times form_close"></i>
        <!-- Login From -->
        <div class="form login_form">
          <form action="loginServlet" method="post">
            <h2>Login</h2>

            <div class="input_box">
              <input type="email" name="email" placeholder="Enter your email" required />
              <i class="uil uil-envelope-alt email"></i>
            </div>
            <div class="input_box">
              <input type="password" name="password" placeholder="Enter your password" required />
              <i class="uil uil-lock password"></i>
              <i class="uil uil-eye-slash pw_hide"></i>
            </div>

            <div class="option_field">
              <span class="checkbox">
                <input type="checkbox" id="check" />
                <label for="check">Remember me</label>
              </span>
              <a href="#" class="forgot_pw">Forgot password?</a>
            </div>

            <button class="button">Login Now</button>

            <div class="login_signup">Don't have an account? <a href="#" id="signup">Signup</a></div>
          </form>
        </div>

        <!-- Signup From -->
        
        <div class="form signup_form">
          <form action="userServlet" >
            <h2>Signup</h2><br>
            Join as<br>
            <div class="radio-group">
            
 			<input type="radio" id="freelancer" name="userType" value="freelancer" color="blue">
  			<label class="lab" for="freelancer">Freelancer</label>
  			<input type="radio" id="client" name="userType" value="client">
  			<label class="lab" for="client">Client</label><br>

            
            </div>
            <div class="input_box">
              <input type="text" name="username" placeholder="Enter your user name" required />
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
        </div>
      </div>
    </section>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="script.js"> </script>
     <script>
   /* var status=document.getElementById("status").value;
    if(status == "success"){
    	alert("Sorry email","wrong Username","error");
    	
    }
    else{
    	alert("Sorry  pass ","wrong Email","error");}*/
    	
    	var flag=document.getElementById("flag").value;
    	console.log(flag);
    	if(flag=="failed")
    		{	
    		swal("Sorry!","You entered wrong details","error");
    		}
    	else if(flag=="invalidUser"){
    		swal("Sorry!","Invalid username username should be greater than 6 letter","error");
    	}
    	else if(flag=="invalidEmail"){
    		swal("sorry!","Wrong Email","error");
    	}
    	else if(flag=="invalidpassword"){
    		swal("sorry!","Please Enter Password ","error");
    	}
    	else if(flag=="invalidconfirmpassword"){
    		swal("sorry!","Password and confirm password don't match","error");
    	}
    	else if(flag=="Invalid email format"){
    		swal("sorry!","Wrong Email format","error");
    	}
    	else if(flag=="emailexist"){
    		swal("Oops!","Email Already Exists","error")
    	}
    	else if(flag == "registered")
    	{
    		swal("Congratulations!","Signed Up successfully","success");
    	}
    	
    		
    	</script>
  </body>
</html>