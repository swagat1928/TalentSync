<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Matching Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
  
    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

   
         .profile-button {
            background-color: #007bff;
            color: #fff;
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

    .container {
      display: flex;
      justify-content: space-between;
      margin: 20px;
    }

    .content {
      flex: 1;
      padding: 20px;
    }
    .small-image {
  width: 400px; /* Adjust the width as needed */
  height: auto; /* Maintain aspect ratio */
}

    .form-container {
      flex: 1;
      padding: 20px;
      width: 30%; /* Adjusted width to 70% */
    margin: 50px auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   /* padding: 40px;*/
    }

    .form-group {
      margin-bottom: 20px;
    }
                                                       
    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="number"],
    textarea,button,input[type="date"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    button {
      padding: 10px 20px;
      background-color: #1dbf73;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background-color: #555;
    }

    input[type="date"]::-webkit-inner-spin-button,
input[type="date"]::-webkit-calendar-picker-indicator {
    display: none;
    -webkit-appearance: none;
}
 .profile-button {
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
<body>
<nav class="navbar navbar-expand-lg bg-body-light " style="background-color: #330c43;">
  <div class="container-fluid">
    <a class="navbar-brand" style="color:white;" href="#">TalentSync</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="chome.jsp">HOME</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="showapp.jsp">View Applicants</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" style="color:white;" aria-current="page" href="showacceptapp.jsp">Accepted Applicants</a>
        </li>
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
      
      </ul>
     
       <a href="showcprofile.jsp"> <button style="margin:5px;" class="profile-button">
        <i class="fa fa-user mx-2" ><%=session.getAttribute("email") %>
        </i>
    	</button></a>
    	<form action="logout" method="post">
    	<a href="showprofile.jsp"><button class="profile-button" style="margin-left:10px;"><img src="box-arrow-right.svg" width="23"></img>
        <i class="fa fa" >Logout
        </i>
    	</button></a></form>
    </div>
  </div>
</nav>
  <div class="container">
    <div class="content">
      <h1>Let the matching begin...</h1>
      <p>This is where you fill us in on the big picture.</p>
      <img src="pjob.jpg" alt="Big Picture" class="small-image">
    </div>
    <div class="form-container">
      <h2>Project Details</h2>
      <form action="jobServlet" method="post" id="project-form">
      <input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>
        <div class="form-group">
          <label for="project-title">Title:</label>
          <input type="text" id="project-title" name="title" required>
        </div>
        <div class="form-group">
          <label for="project-description"> job Description:</label>
          <textarea id="project-description" name="description" rows="4" required></textarea>
        </div>
        <div class="form-group">
          <label for="project-title">skill:</label>
          <input type="text" id="project-title" name="skill" required>
        </div>
        <div class="form-group">
            <label for="budget">Budget</label>
            <input type="number" id="budget" name="budget" required>
        </div>
        <div class="form-group">
            <label for="deadline">Deadline</label>
            <input type="date" id="deadline" name="deadline" required>
        </div>
        <button type="submit">post job</button>
      </form>
    </div>
  </div>
  <!-- <script>
    document.getElementById("project-form").addEventListener("submit", function(event) {
      event.preventDefault();
      // You can handle form submission here, such as sending data to a server or displaying it on the page.
      // For demonstration purposes, let's just log the form data to the console.
      const formData = new FormData(event.target);
      const title = formData.get("title");
      const description = formData.get("description");
      const budget = parseFloat(formData.get("budget")); // Parse the budget as a float

      // Validate the budget
     if (isNaN(budget) || budget <= 0) {
      alert("Please enter a valid budget.");
     return;
    }

     const deadline = formData.get("deadline");

      console.log("Title:", title);
      console.log("Description:", description);
      console.log("Budget:", budget);
      console.log("Deadline:", deadline);
    });
  </script> -->
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
</body>
</html>
