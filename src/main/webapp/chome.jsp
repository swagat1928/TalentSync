<!DOCTYPE html>
<!-- Coding by CodingLab | www.codinglabweb.com-->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Website with Customize Color Theme | CodingLab </title>
    <link rel="stylesheet" href="chomestyle.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
		<style> .profile-button {
            background-color: white;
            color: black;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        /* Styles for the icon */
        .profile-button i {
            margin-right: 5px;
        }
		</style>
   </head>
<body>
  <!-- <nav>
    <div class="navbar">
      <div class="logo"><a href="#">Talentsync</a></div>
      <ul class="nav-links">
     
        <li><a href="jobpost1.jsp">post job</a></li>

        
        <li><a href="#">Contact</a></li>
      </ul>
      <div class="buttons">
        <a href="#" class="signup">Post a job</a>
        <a href="#" class="signup">Profile</a>
        <a href="#" class="signup">Logout</a>
      </div>
    </div>
  </nav> -->
<nav class="navbar navbar-expand-lg bg-body-light " style="background-color: #330c43;">
  <div class="container-fluid">
    <a class="navbar-brand" style="color:white;" href="#">TalentSync</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="jobpost1.jsp">POST JOB</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="showapp.jsp">View Applicants</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="showacceptapp.jsp">Accepted Applicants</a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link active" style="color:white;"  aria-current="page" href=paymentjobs.jsp>Completed Jobs</a>
        </li> -->
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle"  style="color:white;"href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Completed Jobs
          </a>
          <ul class="dropdown-menu">
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href=paymentjobs.jsp>Unpaid Contract</a>
        </li>
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href=paymentjobscomplete.jsp>Paid Contract</a>
        </li>
   
          </ul>
        </li>
      </ul>
      <form class="d-flex" role="search" action="Searchfree" method="get">
        <input class="form-control me-2" type="search" name="skill" placeholder="Search By Skills" aria-label="Search">
        <button class="btn btn-light" type="submit">Search</button>
      </form>
       <a href="showcprofile.jsp"><button style="margin:10px;" class="profile-button">
        <i class="fa fa-user mx-2" ><%=session.getAttribute("email") %>
        </i>
    	</button></a>
    	<form action="logout" method="post">
    	<a href="showprofile.jsp"><button class="profile-button"><img src="box-arrow-right.svg" width="23"></img>
        <i class="fa fa" >Logout
        </i>
    	</button></a></form>
    </div>
  </div>
</nav>
  <section class="home-content">
    <div class="texts">
      <h2 class="text">"Unlock Talent, Unleash Success</h2>
      <h3 class="text">"Browse a Freelancer Now!"</h3>
      <p>  </p>
      <a href="showjobs.jsp">Browse
      <i class="fas fa-location-arrow"></i></a>
      <a href="jobpost1.jsp">Post Job
      <i class="fas fa-location-arrow"></i></a>
    </div>
  </section>

  <script src="chomescript.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
