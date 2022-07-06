<?php

include"config.php";
include"changepassword.php";

?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<div align = "center">
<?php
session_start();
if (isset($_SESSION['mail'])) 
{
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
				echo"Password Changed Sucessfully!";
				header("Location: account.php");
			}
			else{
				echo "\nChanging Failed!";
			}

				$message = "Password Changed Sucessfully";

			}
			else
			{	
				echo" Password and new password are not same!";
			}
		} 
		else if ( $newPassword != $confirmPassword){
				echo"New Password and confirm Password are not same! Try again!";
			}
		else {
			echo"Password is not true!";
		}	
	}
}
else if (isset($_SESSION['company_name'])) {
	if(isset($_POST['password'])) {
		$company_name=$_SESSION["company_name"];
		$password = $_POST['password'];
		$newPassword = $_POST['newPassword'];
		$confirmPassword = $_POST['confirmPassword'];	
		$sql_statement = "SELECT company.company_name, company.password FROM company WHERE company.company_name = '$company_name' AND company.password = '$password'";
		$result = mysqli_query($db, $sql_statement);
		$row = mysqli_fetch_array($result);
			
		if($password == $row["password"] && $newPassword == $confirmPassword) {
			if($password !=  $newPassword){
				$sql_statement2 = "UPDATE company SET company.password= '$newPassword'  WHERE company.company_name= '$company_name' "; 
				$result2=mysqli_query($db,$sql_statement2);
				if($result2 != false)
			{
				echo"Password Changed Sucessfully!";
				header("Location: company_profile.php");
			}
			else{
				echo "\nChanging Failed!";
			}

				$message = "Password Changed Sucessfully";

			}
			else
			{	echo"<br>";
				echo" Password and new password are not same!";
			}
		} 
		else if ( $newPassword != $confirmPassword){
				echo"<br>";
				echo"New Password and confirm Password are not same! Try again!";
			}
		else {
			echo"<br>";
			echo"Password is not true!";
		}


	}
}
?>

</div>
</body>
</html>
