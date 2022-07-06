<!DOCTYPE html>
<html>
<head>
	<title>CAMPAIGN</title>
</head>
<body>
<style>
body {
  background: url('img/ucak.jpg') no-repeat center fixed;
  background-size: cover;
}
</style>
<div align="center">	

<h3 align="center">NEW CAMPAIGN</h3>

<form action="campaign_set.php" method="POST">
	<input type="text" name="flight_id" placeholder="Type flight id"><br>
	<input type="number" name="percentage" placeholder="Type new percentage"><br><br>
	<button>Start Campaign</button><br>
</form>	
<form action="company_profile.php">
	<button>Back</button>
	
</form>	


</div>
</body>
</html>