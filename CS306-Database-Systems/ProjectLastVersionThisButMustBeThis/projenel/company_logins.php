<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div align = "center">
<?php

session_start();

include "config.php";
include "company_login.html";
if(isset($_POST['company_name']))
{
	$company_name = $_POST['company_name'];
	$password = $_POST['password'];

	$sql_statement = "SELECT company.company_name, company.password FROM company WHERE company.company_name = '$company_name' AND company.password = '$password'";
	$result = mysqli_query($db, $sql_statement);
  	
	while($row = mysqli_fetch_assoc($result))
	{
		if(($company_name == $row['company_name']) && ($password == $row['password']))
		{
			session_start();
			$_SESSION['company_name'] = $company_name;
			header("Location: company_profile.php");
			exit();
		}
	}
	 echo "\t\tWrong company name or password! Try again!";  
}
else
{
 echo "The form is not set!";
}


?>
	
</div>

</body>
</html>
