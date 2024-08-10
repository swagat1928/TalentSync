<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <!-- custom style -->
  <link rel="stylesheet" href="./assets/style.css">
  <!-- bootstrap  -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <title>Fiverr</title>
  <!--bootstrap icons-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<body>
   <input type="hidden" id="flag" value=<%=session.getAttribute("flag") %>>
 
    	<%session.setAttribute("flag","Success"); %>
  <header>
    <!-- Top navbar -->
    <nav class="p-0 fixed-top text-white" id="top-nav">
      <div class="top-nav row mx-auto my-auto pt-3 pb-3 w-100 container-fluid text-white">
        <div class="toggle-btn col-auto text-white text-start p-0 d-md-none" style="cursor: pointer;" id="nav-toggler">
          <span class=" bi bi-list fs-2 text-start ms-0 me-auto"></span>
        </div>
        <a href="#" class="nav-logo col-sm col-8 mx-auto mx-sm-0 text-sm-start text-center my-auto">
          <div style="width: fit-content;" class="mx-auto mx-sm-0">
            <img class="nav-logo-white d-block" src="logo_nitish.svg" alt="fiverr" height="80px" width="200px">
            <img class="nav-logo-black d-none" src="logo_nitish.svg" alt="fiverr"  height="80px" width="200px">
          </div>
        </a>
        <ul class="d-none d-md-flex text-white col-auto row fw-semibold my-auto">
          <li class="col-auto d-none d-lg-block">
            
          </li>
        </ul>
        <a href="sigh.jsp" class="d-none d-sm-block text-white col-auto my-auto text-end fs-6 fw-semibold">Sign In</a>
        <a href="sigh.jsp"
          class="join-btn col-auto my-auto text-white text-end fs-6 px-3 py-1 fw-semibold border border-1 border-white rounded-2">Join</a>
      </div>
    </nav>
    <!-- mobile sidebar -->
    <nav class="mobile-nav text-nowrap" id="mobile-nav">
      <div class="fixed-top text-muted bg-white vh-100 px-3 pt-3" id="sidebar">
        <ul class="fw-normal d-flex flex-column mx-auto">
          <li class="join-btn col-auto mt-2 mb-3  fs-6 px-3 w-50 py-2 fw-semibold text-white border rounded-2"
            style="background-color: var(--primary--color-p);">
            Join TalentSync
          </li>
          <li class="col-auto my-2 fs-6">Sign in</li>
          <li class="col-auto my-2 fs-6">Browse Categories</li>
          <li class="col-auto my-2 fs-6">Explore</li>
          <li class="col-auto my-2 fs-6" style="color: var(--primary--color);">TalentSync Business</li>
        </ul>
        <p class="fw-semibold text-black mt-4">General</p>
        <hr>
        <ul class="fw-normal d-flex flex-column mx-auto">
          <li class="col-auto my-2 fs-6">Sign in</li>
          <li class="col-auto my-2 fs-6">
            <svg width="18" height="18" fill="grey" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
              <path
                d="M9 1C4.58875 1 1 4.58875 1 9C1 13.4113 4.58875 17 9 17C13.4113 17 17 13.4113 17 9C17 4.58875 13.4113 1 9 1ZM8.53125 4.92676C7.81812 4.89612 7.11218 4.7959 6.43811 4.63293C6.54578 4.37781 6.6626 4.13281 6.78857 3.90063C7.30542 2.94824 7.93994 2.27991 8.53125 2.03784V4.92676ZM8.53125 5.86499V8.53125H5.60339C5.64465 7.4906 5.82202 6.45752 6.11536 5.51782C6.8927 5.71362 7.70874 5.83215 8.53125 5.86499ZM8.53125 9.46875V12.135C7.70874 12.1678 6.8927 12.2864 6.11536 12.4822C5.82202 11.5425 5.64465 10.5094 5.60339 9.46875H8.53125ZM8.53125 13.0732V15.9622C7.93994 15.7201 7.30542 15.0518 6.78857 14.0994C6.6626 13.8672 6.54578 13.6222 6.43811 13.3671C7.11218 13.2041 7.81799 13.1039 8.53125 13.0732ZM9.46875 13.0732C10.1819 13.1039 10.8878 13.2041 11.5619 13.3671C11.4542 13.6222 11.3374 13.8672 11.2114 14.0994C10.6946 15.0518 10.0601 15.7201 9.46875 15.9622V13.0732ZM9.46875 12.135V9.46875H12.3966C12.3553 10.5094 12.178 11.5425 11.8846 12.4822C11.1073 12.2864 10.2913 12.1678 9.46875 12.135ZM9.46875 8.53125V5.86499C10.2913 5.83215 11.1073 5.71362 11.8846 5.51782C12.178 6.45752 12.3553 7.4906 12.3966 8.53125H9.46875ZM9.46875 4.92676V2.03784C10.0601 2.27991 10.6946 2.94824 11.2114 3.90063C11.3374 4.13281 11.4542 4.37781 11.5619 4.63293C10.8878 4.7959 10.1819 4.89612 9.46875 4.92676ZM12.0354 3.45349C11.8007 3.02087 11.5457 2.63953 11.2769 2.31421C12.2141 2.63428 13.0631 3.14636 13.7771 3.8031C13.3699 4.02124 12.931 4.21069 12.4694 4.36902C12.3384 4.0509 12.1936 3.74487 12.0354 3.45349ZM5.9646 3.45349C5.8064 3.74487 5.66162 4.0509 5.53064 4.36902C5.06897 4.21069 4.63013 4.02112 4.2229 3.8031C4.93689 3.14636 5.78589 2.63428 6.72314 2.31421C6.45435 2.63953 6.19946 3.02075 5.9646 3.45349ZM5.2135 5.25012C4.89355 6.27368 4.70544 7.38953 4.66492 8.53125H1.95349C2.05383 7.00769 2.63892 5.61438 3.5564 4.50525C4.06555 4.79724 4.62317 5.047 5.2135 5.25012ZM4.66492 9.46875C4.70544 10.6106 4.89355 11.7263 5.2135 12.7499C4.62317 12.953 4.06555 13.2028 3.5564 13.4948C2.63892 12.3856 2.05383 10.9923 1.95349 9.46875H4.66492ZM5.53064 13.631C5.66162 13.9491 5.8064 14.2551 5.9646 14.5465C6.19946 14.9791 6.45435 15.3605 6.72314 15.6858C5.78589 15.3657 4.93689 14.8536 4.22302 14.1969C4.63 13.9789 5.06897 13.7893 5.53064 13.631ZM12.0354 14.5465C12.1936 14.2551 12.3384 13.9491 12.4694 13.631C12.931 13.7893 13.3699 13.9789 13.7771 14.1969C13.0631 14.8536 12.2141 15.3657 11.2769 15.6858C11.5457 15.3605 11.8005 14.9792 12.0354 14.5465ZM12.7865 12.7499C13.1064 11.7263 13.2946 10.6105 13.3351 9.46875H16.0465C15.9462 10.9923 15.3611 12.3856 14.4436 13.4948C13.9344 13.2028 13.3768 12.953 12.7865 12.7499ZM13.3351 8.53125C13.2946 7.3894 13.1064 6.27368 12.7865 5.25012C13.3768 5.047 13.9344 4.79724 14.4436 4.50525C15.3611 5.61438 15.9462 7.00769 16.0465 8.53125H13.3351Z"
                stroke-width="0.2"></path>
            </svg>
            English
          </li>
          <li class="col-auto my-2 fs-6">â¹ INR</li>
        </ul>
      </div>
      <div class="mobile-nav-overlay d-none"></div>
    </nav>
    <!-- Hero section -->
    <section class="hero d-flex justify-content-start ps-md-5 px-2">
      <div
        class="content text-white d-flex flex-column justify-content-center align-items-center align-items-md-start text-center text-md-start">
      </div>
    </section>
    <section class="clients bg-secondary bg-opacity-10" id="clients-container">
    </section>
  </header>
  <!-- custom scripts -->
  <script src="./assets/utils/content.js"></script>
  <script src="./assets/script.js"></script>
  <!-- bootstrap  -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
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