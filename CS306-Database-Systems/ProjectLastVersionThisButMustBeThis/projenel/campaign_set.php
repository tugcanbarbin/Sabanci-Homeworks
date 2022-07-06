<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div align="center">
<?php
include"config.php";
include"campaign.php";
session_start();
$company_name=$_SESSION['company_name'];
$percentage=$_POST['percentage'];
$flight_id=$_POST['flight_id'];


$sql_statement = "SELECT company_id FROM company WHERE company.company_name = '$company_name'";
$result = mysqli_query($db,$sql_statement);
$row = mysqli_fetch_array($result);

$companyid = $row['company_id'];

$sql_statement2 = "INSERT INTO campaign (company_id,percentage,flight_id)
VALUES ($companyid,$percentage,$flight_id)";
$result2 = mysqli_query($db,$sql_statement2);
if($result2){

echo"Campaign is set successfully. ";

}
else {
	echo"asd";
}
?>	
</div>
</body>
</html>