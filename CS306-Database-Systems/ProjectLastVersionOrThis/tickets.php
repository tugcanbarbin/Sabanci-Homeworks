<!DOCTYPE html>
<html>
<head>
	<title>Ticktes</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style_ticket.css">
</head>
<body>

	<h1>Plane Tickes</h1>
	<hr>

	<table>
		<tr id="header">
			<th>Company</th>
			<th>From</th>
			<th>To</th>
			<th>Date</th>
		</tr>

		<?php

		include "config.php";

		$sql_statement = "SELECT * FROM ticket";
		$result = mysqli_query($db, $sql_statement);

		while($row = mysqli_fetch_assoc($result))
		{
			$company_id = $row['company_id'];
			$from = $row['startpoint'];
			$to = $row['destination'];
			$date = $row['flight_time'];

			echo "<tr>" . "<th>";
			if($company_id == 0){
				echo "<img src=\"img/Turkish Airlines.png\" class=\"rounded\" width=\"88\">";
			}
			elseif($company_id == 1){
				echo "<img src=\"img/Pegasus.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 2){
				echo "<img src=\"img/Frontier.png\" class=\"rounded\" width=\"48\">";
			}
			elseif($company_id == 3){
				echo "<img src=\"img/Onur Air.png\" class=\"rounded\" width=\"56\">";
			}
			elseif($company_id == 4){
				echo "<img src=\"img/Emirates.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 5){
				echo "<img src=\"img/United Airlines.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 6){
				echo "<img src=\"img/Anadolu Jet.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 7){
				echo "<img src=\"img/Qatar Airways.png\" class=\"rounded\" width=\"48\">";
			}
			elseif($company_id == 8){
				echo "<img src=\"img/Swiss air.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 9){
				echo "<img src=\"img/American Airlines.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 10){
				echo "<img src=\"img/Singapore Airlines.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 11){
				echo "<img src=\"img/Lufthansa.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 12){
				echo "<img src=\"img/Japan Airlines.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 13){
				echo "<img src=\"img/Air France.png\" class=\"rounded\" width=\"64\">";
			}
			elseif($company_id == 14){
				echo "<img src=\"img/Asiana Airlines.png\" class=\"rounded\" width=\"64\">";
			}
			echo "</th>" . "<th>" . $from . "</th>" . "<th>" . $to . "</th>" . "<th>" . $date . "</th>" . "</tr>";
		}



		?>



	</table>




</body>
</html>