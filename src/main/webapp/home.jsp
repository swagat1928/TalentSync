<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration</title>
    <link rel="stylesheet" href="style.css" />
    
    <link rel="stylesheet" https="style.css" />
  </head>
  <body>
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

       
        <button class="ses"><%=session.getAttribute("email") %></button>
      </nav>
    </header>

    <!-- Home -->
    <section class="home">
      <div class="form_container">
        <i class="uil uil-times form_close"></i>
        <!-- Login From -->
        

        <!-- Signup From -->

      </div>
    </section>

    <script src="script.js">
    
    </script>
  </body>
</html>