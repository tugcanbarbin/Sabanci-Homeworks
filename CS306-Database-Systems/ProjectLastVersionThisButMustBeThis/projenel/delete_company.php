<?php 
include "config.php";
?>
<!DOCTYPE html>
<html>
<head>
	<style>
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white;
  color: black;
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.button2 {
  background-color: white;
  color: black;
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}

</style>
	<title>Delete Company Account</title>
</head>
<body>
<div align="center">
<b>Are You Sure ??<b>
<br><br><br><br><br><br><br><br><br><br><br>
<b>You need to verify your password to delete your company account<b>
<br>
<style>
body {
  background: url('img/ucak.jpg') no-repeat center fixed;
  background-size: cover;
}
</style>
<form action="delete_company.php" method="POST">
	<input type="password" name="password" placeholder="Type your password">
	<button>DELETE</button>
</form>
<form action="company_profile.php">
	<button>Back</button>
	
</form>	
<?php
session_start() ;
if(isset($_POST['password']))
{
	$password = $_POST['password'];
	$company_name = $_SESSION['company_name'];
	$sql_statement = "SELECT company.password as psw FROM company WHERE company.company_name = '$company_name'";
	$result = mysqli_query($db, $sql_statement);
	echo "$password";
  	$data=mysqli_fetch_array($result);

	if($data['psw'] == $password)
	{
		$sql_statement2 = "DELETE FROM company WHERE company.company_name = '$company_name'";

		$result2 = mysqli_query($db, $sql_statement2);
		if($result2 != false)
		{
			header("Location: index.html");
			exit();
		}
		else
		{
			echo "\nDeletion Failed!";
		}
	}
	else
	{
		echo"<br>";
		echo "Wrong password, Try Again";
	}
}
?>
</div>
</body>
</html>
