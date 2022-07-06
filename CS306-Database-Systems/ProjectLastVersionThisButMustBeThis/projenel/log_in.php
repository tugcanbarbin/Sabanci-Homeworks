<?php

session_start();

include "config.php";

if(isset($_POST['email']))
{
	$mail = $_POST['email'];
	$password = $_POST['password'];

	if ($mail == 'admin' && $password == 'password') 
	{
		header("Location: admin.php");
		exit();
	}


	$sql_statement = "SELECT account.mail,account.account_id, account.passwrd FROM account WHERE account.mail = '$mail' AND account.passwrd = '$password'";
	$result = mysqli_query($db, $sql_statement);
  	
	while($row = mysqli_fetch_assoc($result))
	{
		if(($mail == $row['mail']) && ($password == $row['passwrd']))
		{
			session_start();
			$_SESSION['mail'] = $mail;
			$_SESSION['account_id'] = $row['account_id'];
			header("Location: main_page.php");
			exit();
		}
	}
	header("Location: failed_log_in.html");
	exit();
}
else
{
	echo "The form is not set!";
}


?>

