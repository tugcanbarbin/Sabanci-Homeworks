<!DOCTYPE html>
<html>
<head>
<title>Password Change</title>

</head>
<body>
<style>
body {
  background: url('img/ucak.jpg') no-repeat center fixed;
  background-size: cover;
}
</style>
<div align="center">	
<h3 align="center">CHANGE PASSWORD</h3>
<div><?php if(isset($message)) { echo $message; } ?></div>

<form action="changepasswords.php" method="POST">
	<input type="password" name="password" placeholder="Type your password"><br>
	<input type="password" name="confirmPassword" placeholder="Type your new password"><br>
	<input type="password" name="newPassword" placeholder="Type your  new password"><br>
	<button>SEND</button>

</form>

<br>
<br>


</div>
</body>
</html>
<?php session_start(); ?>
<?php if (isset($_SESSION['company_name'])): ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div align="center">
	

<form action="company_profile.php">
	<button>Back</button>
	
</form>	
</div>
</body>
</html>
<?php endif; ?>

<?php if (isset($_SESSION['mail'])): ?>	
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div align="center">
<form action="account.php">
	<button>Back</button>
	
</form>	
</div>	 
</body>
</html>
<?php endif; ?>






