<!DOCTYPE html>
<!-- Coding By CodingNepal - www.codingnepalweb.com -->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fiverr Homepage Clone | CodingNepal</title>
  <link rel="stylesheet" href="style1.css">
  <!-- Google Icons Link -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
</head>
<body>
 <input type="hidden" id="flag" value=<%=session.getAttribute("flag") %>>
 
    	<%session.setAttribute("flag","Success"); %>
  <header>
    <nav class="navbar">
      <a href="#" class="logo">
        <img src="logo-no-background.png" alt="TalentSync Logo" >
      </a>
      <ul class="menu-links">
        
        <li><a href="contactus.jsp">Contact Us</a></li>
        <li><a href="sample.html">About Us</a></li>
        
        <li class="join-btn"><a href="sigh.jsp">Join Us</a></li>
        <span id="close-menu-btn" class="material-symbols-outlined">close</span>
      </ul>
      <span id="hamburger-btn" class="material-symbols-outlined">menu</span>
    </nav>
  </header>

  <section class="hero-section">
    <div class="content">
      <h1>Find the right freelance service, right away</h1> 
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
  
  <script>
    const header = document.querySelector("header");
    const hamburgerBtn = document.querySelector("#hamburger-btn");
    const closeMenuBtn = document.querySelector("#close-menu-btn");

    // Toggle mobile menu on hamburger button click
    hamburgerBtn.addEventListener("click", () => header.classList.toggle("show-mobile-menu"));

    // Close mobile menu on close button click
    closeMenuBtn.addEventListener("click", () => hamburgerBtn.click());
  </script>
</body>
</html>