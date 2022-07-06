
<!DOCTYPE html>
<html>
<head>
	<title>Change Password</title>
</head>
<body>
<div align = "center">
<?php

session_start();

include "config.php";
include "index.html";

if(isset($_POST['email']))
{
	$mail = $_POST['email'];
	$password = $_POST['password'];

	if ($mail == 'admin') 
	{
		echo "Nice try.";
	}
	$sql_statement1 = "SELECT  account.passwrd FROM account WHERE account.mail = '$mail' AND account.passwrd = '$password'";
	$result1 = mysqli_query($db, $sql_statement1);
	$row1 = mysqli_fetch_array($result1);	
	if($password == $row1["passwrd"])
	{
		echo "<br>";
		echo "New password can not be same with the old password.";
	}
	else
	{
		$sql_statement = "UPDATE account SET account.passwrd= '$password'  WHERE account.mail= '$mail'"; 
		$result = mysqli_query($db, $sql_statement);
		if($result != false)
		{
			echo "<br>";
			echo"Password Changed Sucessfully";
		}
		else
		{
			echo "\nchange in Failed!";
		}
  	}
}
else
{
	echo "The form is not set!";
}


?>


</div>
</body>
</html>
