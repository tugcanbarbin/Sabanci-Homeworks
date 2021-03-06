<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Company Log In</title>
		<meta name="description" content="Bootstrap Recitation">
		<meta name="author" content="CS306-201802">
		
		<! Bootstrap files >
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="style.css">

		<script src="https://kit.fontawesome.com/a076d05399.js"></script>
		<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
	</head>
	
	<body>	
		<div class = "jumbotron jumbotron-fluid">
			<div class = "container">
				<h1 class ="display-4"> BBTTE</h1>
				<p class="lead"> Best ticketing site ever!</p>
			</div>
		</div>

		<div class="contianer">
			<div class="row">
				<div class="col">&nbsp;</div>
			</div>

			<div class="row justify-content-md-center">
				<div class="col"></div>
				<div class="col-md-auto">
					<h2>COMPANY LOG IN</h2>
				</div>
				<div class="col"></div>
			</div>

			<div class="text-center">
				<img src="img/Logo.png" class="rounded" alt="Logo" width="128">
			</div>

			<div class="row">
				<div class="col">&nbsp;</div>
			</div>

			<div class="row justify-content-md-center">
				<div class="col-3"></div>
				<div class="col-6">
					
					<form action="company_logins.php" method="POST">
						<div class="form-group row">
							<label for="inpuTcompany_name" class="col-sm-2 col-form-label">company_name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inpuTcompany_name" placeholder="company name" name="company_name" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="inpuTPassword" class="col-sm-2 col-form-label">Password</label>
							<div class="col-sm-10">
								<input type="Password" class="form-control" id="inputPassword" placeholder="Password" name="password" required>
							</div>
						</div>

						<button type="submit" class="btn btn-primary btn-block btn-lg">Submit</button>
					</form>

				</div>
				<div class="col-3"></div>
			</div>

		</div>

	

	</body>
</html>