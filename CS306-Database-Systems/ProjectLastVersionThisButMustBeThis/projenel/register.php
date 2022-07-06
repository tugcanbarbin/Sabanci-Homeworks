<?php

include "config.php";
if(isset($_POST['email']))
{
	$mail = $_POST['email'];
	$password = $_POST['password'];

	if($mail == 'admin' || $password == 'password')
	{
		header("Location: failed_register.html");
		exit();
	}

	$sql_statement = "INSERT INTO account(mail, passwrd, is_loyal, discount_points)
						VALUES ('$mail', '$password', 0, 0)";

	$result = mysqli_query($db, $sql_statement);
	if($result)
	{
		header("Location: lol.php");
		exit();
	}
	else
	{
		echo "Registration failed!";
	}
	
}
else
{
	echo "Form is not set.";
}

?>