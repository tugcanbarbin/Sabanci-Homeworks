<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<style>

</style>
<div align="center"></div>
<form action="addticketadmin.php" method="POST">
	<input type="number" name="ticket_id" placeholder="Type ticket id">
	<input type="number" name="company_id" placeholder="Type company id">
	<input type="number" name="seat_no" placeholder="Type seat no">
	<input type="text" name="start" placeholder="Type start location">
	<input type="text" name="end" placeholder="Type destination">
	<input type="date" name="flight_time" placeholder="Type flight time">
	<input type="number" name="flight_id" placeholder="Type flight id">
	<input type="number" name="ticket_price" placeholder="Type ticket price">
	<button>ADD</button><br><br><br>
</form>
<form action="admin.php">
	<button>Back</button>
	
</form>		
<?php
include"config.php";
if(isset($_POST['ticket_id']) &&isset($_POST['company_id']) && isset($_POST['seat_no']) && isset($_POST['start']) && isset($_POST['end']) && isset($_POST['flight_time']) && isset($_POST['ticket_price'])
&& isset($_POST['flight_id']))
{
  $ticket_id = $_POST['ticket_id'];
  $company_id = $_POST['company_id'];
  $seat_no = $_POST['seat_no'];
  $start = $_POST['start'];
  $end = $_POST['end'];
  $flight_time = $_POST['flight_time'];
  echo"$flight_time";
  $ticket_price = $_POST['ticket_price'];
  $flight_id = $_POST['flight_id'];
  $sql_statement = "INSERT INTO ticket(`ticket_id`, `company_id`, `seat_no`, `frequency`, `flight_time`, `startpoint`, `destination`, `flight_id`, `ticket_price`) VALUES ($ticket_id,$company_id,$seat_no,0,'$flight_time', '$start','$end', $flight_id,$ticket_price)";
  $result=mysqli_query($db,$sql_statement);
  if(!$result){

    echo"Ticket id is already taken.Try again!";


  }
else{

	echo "Ticket is added successfully.";
}

  
}	


?> 
</body>
</html>