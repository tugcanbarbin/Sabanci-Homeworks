<!DOCTYPE html>
<html>
<head>
	<title>Ticktes</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style_ticket.css">
</head>
<body>

	

	<div class="header">
		<h1>Plane Tickets Left</h1>
		<hr>
	</div>
	
	<div class="table">
		<table>
			<tr id="header">
				<th>Company</th>
				<th>From</th>
				<th>To</th>
				<th>Date</th>
				<th>Price</th>
				<th>Flight</th>
				<th>Seat no</th>
				<th></th>
			</tr>

			<?php

			include "config.php";

 	       session_start();
 	       if(isset($_POST['flight_id']))
 		   	{
   
    	   	$flight_id = $_POST['flight_id'];


			$sql_statement6 = "SELECT T.destination, T.startpoint, T.flight_time,T.company_id, Ca.percentage,T.ticket_id,T.seat_no,T.company_name,T.ticket_price
                           FROM (SELECT *
                                FROM (SELECT Ti.ticket_id,Ti.flight_id, Ti.destination, Ti.startpoint,C.company_name, Ti.ticket_price, Ti.flight_time,Ti.company_id,Ti.seat_no
                                      FROM ticket Ti, company C
                                      WHERE Ti.company_id = C.company_id) as K
                                WHERE K.ticket_id NOT IN (SELECT ticket.ticket_id
                                                          FROM  ticket , shopping_history S, buy B
                                                          WHERE ticket.ticket_id = S.ticket_id AND B.purchase_date = S.purchase_date)) as T
                           JOIN campaign Ca
                           ON T.flight_id = Ca.flight_id and T.company_id = Ca.company_id
                           WHERE T.flight_id = $flight_id;";

			$result10 = mysqli_query($db, $sql_statement6);

			while($row40 = mysqli_fetch_assoc($result10))
			{
			
				$company_id = $row40['company_id'];
				$from = $row40['startpoint'];
				$to = $row40['destination'];
				$date = $row40['flight_time'];
				$percentage = $row40['percentage'];
				$ticket_id = $row40['ticket_id'];
				$seat_no = $row40['seat_no'];
				$company_name = $row40['company_name'];
				$price = $row40['ticket_price'];

			
				$_SESSION['flight_id'] = $flight_id;
	            $_SESSION['ticket_id'] = $ticket_id;

	            $_SESSION['flight_time'] = $date;
	        	$_SESSION['ticket_id'] = $ticket_id;
	        	$_SESSION['startpoint'] = $from;
	        	$_SESSION['destination'] = $to;
	        	$_SESSION['seat_no'] = $seat_no;
	        	$_SESSION['company_name'] = $company_name;
			
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
				echo "</th>" . "<th>" . $from . "</th>" . "<th>" . $to . "</th>" . "<th>" . $date . "</th>" ."<th>" . $price . "</th>". "<th>" . $flight_id . "</th>"."<th>" .$seat_no ."</th>"."</tr>";




			}

    	}

	    ?>



		</table>
	</div>

<form action="buy.php" method="POST">
	<br><br><br><br>
	<input type="number" name="flight_id" placeholder="Type flight_id to buy "><br>
	<input type="number" name="seat_no" placeholder="Type seat no to buy"><br>
	<button>BUY</button>
</form>	
</body>
</html>