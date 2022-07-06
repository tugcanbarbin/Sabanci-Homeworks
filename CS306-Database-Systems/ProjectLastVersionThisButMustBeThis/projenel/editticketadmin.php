<!DOCTYPE html>
<html>
<head>
	<title>
		EDIT PAGE

	</title>
</head>
<body>
<form action="editticket2admin.php" method="POST">
<input type="number" name="price" placeholder="Enter new price"><br>
<input type="text" name="start" placeholder="Enter start location"><br>
<input type="text" name="end" placeholder="Enter destination"><br>
<input type="date" name="flight_time" placeholder="Enter flight_time"><br>
<button>SEND</button>


<?php

$ticket_id = $_POST['ticket_id'];

session_start();
$_SESSION['ticketadmin'] = $ticket_id;
 

?>
</body>
</html>


