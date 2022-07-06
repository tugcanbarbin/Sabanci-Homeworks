<?php
include"config.php";
session_start();
if(isset($_POST['password'])) {
	$mail=$_SESSION["mail"];
	$password = $_POST['password'];
	$newPassword = $_POST['newPassword'];
	$confirmPassword = $_POST['confirmPassword'];	
	$sql_statement = "SELECT account.mail, account.passwrd FROM account WHERE account.mail = '$mail' AND account.passwrd = '$password'";
	$result = mysqli_query($db, $sql_statement);
	$row = mysqli_fetch_array($result);	
	if($password == $row["passwrd"] && $newPassword == $confirmPassword) {
		if($password !=  $newPassword){
			$sql_statement2 = "UPDATE account SET account.passwrd= '$newPassword'  WHERE account.mail= '$mail' "; 
			$result2=mysqli_query($db,$sql_statement2);
			if($result2 != false)
		{
			echo"Password Changed Sucessfully";
		}
		else{
			echo "\nchange in Failed!";
		}

			$message = "Password Changed Sucessfully";

		}
		else {
		 $message = "Password is not same!";
		}
	} 
	else{
		$message = "Password is not correct";
		}
}
?>