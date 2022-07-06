<!DOCTYPE html>
<html>
<head>
	<title>Are you sure?</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style_ticket.css">
</head>
<body>

<h1>Are you sure to buy ticket?</h1>
<hr>
<div align="center">
<br><br><br><br><br><br><br>

<?php
	include "config.php";
	session_start();
	$account_id = $_SESSION['account_id'];


	$sql_statement = "SELECT A.discount_points FROM account A WHERE A.account_id = $account_id";
	$result = mysqli_query($db, $sql_statement);
	
	$row = mysqli_fetch_assoc($result);
	$disc_po = $row['discount_points'];
	$_SESSION['discount_points'] = $disc_po;
	
?>

<form action= "sold.php" method="POST">
	<button class="buy">BUY</button>


	<br><br>
	<br><br>
	<br><br>
</div>


</body>
</html>




   



	




