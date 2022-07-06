
<!DOCTYPE html>
<html>
<head>
	<title>Main Page</title>
</head>


START POINT
<BR>
<form action="searchflight.php" method = "POST">
<select name = "startpoint">

<?php

include "config.php";


	$sql_command = "SELECT DISTINCT ticket.startpoint FROM ticket";
	$myresult = mysqli_query($db, $sql_command);

	while ($start_row = $myresult->fetch_assoc())
	{
		$startpoint = $start_row['startpoint'];
		echo "<option value =$startpoint>".$startpoint."</option>";
		
	}


?>
</select>
<br>
DESTINATION
<br>

<form action="searchflight.php" method = "POST">
<select name = "endpoint">

<?php

    //include "config.php";
	$sql_command2 = "SELECT DISTINCT ticket.destination FROM ticket";
	$myresult2 = mysqli_query($db, $sql_command2);

	while ($end_row = $myresult2->fetch_assoc())
	{
		$destination = $end_row['destination'];
		echo "<option value =$destination>".$destination."</option>";
	}
	
?>
</select>
<br>
SEARCH BY MAX PRICE
<br>
	<form action="searchflight.php" method = "POST">
	<select name = "maxprice">
	<label for="maxprice">MAX PRICE</label>
	  <option value="null">nullptr</option>
	  <option value="100">100</option>
	  <option value="500">500</option>
	  <option value="1000">1000</option>
	  <option value="2500">2500</option>
	  <option value="5000">5000++++</option>
	</select>



<br>

SEARCH BY POPULARITY
<br>
	<form action="searchflight.php" method = "POST">
	<select name = "popularity">
	<label for="popularity">POPULARITY</label>
	  <option value="null">nullptr</option>
	  <option value="notpopular">Tickets with discount</option>
	  <option value="popular">Popular tickets</option>
	</select>

<br>
<h2>Date</h2>
<br>
	

<div>
	
	<form>
		<input type="Date">
		<input type="Date">

		<button>Submit</button>
	</form>

</div>


</body>
</html>
