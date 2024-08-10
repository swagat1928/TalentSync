<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
    <section class="vh-100" style="background-color: #14a800;">
    <form action="clientServlet" method="post" enctype="multipart/form-data">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <h1 class="text-white mb-4">Create Profile</h1>

        <div class="card" style="border-radius: 15px;">
          <div class="card-body">
			<input type="hidden" id="flag" name="email" value=<%=session.getAttribute("email") %>>
            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">First Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="fname" class="form-control form-control-lg" />

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Last Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="lname" class="form-control form-control-lg" /> 

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Company Name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="cname" class="form-control" rows="3" placeholder="" />

              </div>
            </div>

			 <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Description</h6>

              </div>
              <div class="col-md-9 pe-5">

                <textarea type="text" name="description" class="form-control form-control-lg"> </textarea> 

              </div>
            </div>
			
			<div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Contact No.</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="number" name="cno" class="form-control" rows="3" placeholder="" />

              </div>
            </div>
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Select an image</h6>

              </div>
              <div class="col-md-9 pe-5">

                
        	<input type="file" name="image" id="file">
        		
              </div>
            </div>
            <hr class="mx-n3">


            <div class="px-5 py-4">
              <button type="submit" class="btn btn-lg" style="background-color: #14a800;">Create Profile</button>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
  </form>
</section>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
