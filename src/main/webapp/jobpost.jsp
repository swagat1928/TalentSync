<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <section class="vh-100" style="background-color: #14a800;">
    <form action="jobServlet" method="post">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <h1 class="text-white mb-4">Apply for a job</h1>

        <div class="card" style="border-radius: 15px;">
          <div class="card-body">

            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Title</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="title" class="form-control form-control-lg" />

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Description</h6>

              </div>
              <div class="col-md-9 pe-5">

                <textarea type="text" name="description" class="form-control form-control-lg"> </textarea> 

              </div>
            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Expected Duration</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="duration" class="form-control" rows="3" placeholder="6 month" />

              </div>
            </div>

			<div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Complexity</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="complexity" class="form-control" rows="3" placeholder="beginner,expert,..." />

              </div>
            </div>
			
			<div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Required Skills</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="skill" class="form-control" rows="3" placeholder="Web development" />

              </div>
            </div>
            
            <hr class="mx-n3">

		
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Payment Amount</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="number" name="amount" class="form-control" rows="3" placeholder="" />

              </div>
            </div>

            <hr class="mx-n3">

            <div class="px-5 py-4">
              <button type="submit" class="btn btn-lg" style="background-color: #14a800;">post job</button>
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