<?php include "config.php"; ?>
<?php session_start() ?>
<?php if(isset($_SESSION['mail'])):?>
<?php echo $_SESSION['mail']." ".$_SESSION['account_id']; ?>

<!DOCTYPE html>
<html>
<head>
	<title>Tickets</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style_ticket.css">
</head>
<body>
	<table>
		<tr id="header">
			<th>Company</th>
			<th>From</th>
			<th>To</th>
			<th>Date</th>
			<th>Price</th>
			<th>Flight ID</th>
			<th>Seat no</th>
   			<th>Purchase</th>
		</tr>

	<?php
	include "config.php";
	$id = $_SESSION['account_id'];

	$sql_command = "SELECT account.mail,account.account_id,ticket.flight_time,buy.purchase_date,DATEDIFF(ticket.flight_time,buy.purchase_date) AS date_difference					
					FROM account
					JOIN buy ON buy.account_id = $id
					JOIN ticket ON ticket.ticket_id = buy.ticket_id
					WHERE DATEDIFF(ticket.flight_time,buy.purchase_date) < 365;";
	$myresult = mysqli_query($db, $sql_command);
	if (mysqli_num_rows($myresult)==0)
	{
		echo "You are not a loyal customer :(((( try again later";
	}
	else
	{
		$sql_statement = "SELECT DISTINCT C.percentage, T.company_id, T.startpoint,T.destination,T.ticket_price,T.flight_time,T.flight_id,T.seat_no,Co.company_name,T.ticket_id,T.seat_no
						  FROM ticket T, campaign C, company Co
						  WHERE T.flight_id = C.flight_id and T.company_id = C.company_id and Co.company_id = T.company_id";

		$sql_statement6 = "SELECT T.destination, T.startpoint, T.flight_time,T.company_id, Ca.percentage,T.ticket_id,T.seat_no,T.company_name,T.ticket_price,T.flight_id
                           FROM (SELECT *
                                FROM (SELECT Ti.ticket_id,Ti.flight_id, Ti.destination, Ti.startpoint,C.company_name, Ti.ticket_price, Ti.flight_time,Ti.company_id,Ti.seat_no
                                      FROM ticket Ti, company C
                                      WHERE Ti.company_id = C.company_id) as K
                                WHERE K.ticket_id NOT IN (SELECT ticket.ticket_id
                                                          FROM  ticket , shopping_history S, buy B
                                                          WHERE ticket.ticket_id = S.ticket_id AND B.purchase_date = S.purchase_date)) as T
                           JOIN campaign Ca
                           ON T.flight_id = Ca.flight_id and T.company_id = Ca.company_id;";
		$result = mysqli_query($db, $sql_statement6);

		while($row = mysqli_fetch_assoc($result))
		{
			$company_id = $row['company_id'];
			$from = $row['startpoint'];
			$to = $row['destination'];
			$date = $row['flight_time'];
			$price = $row['ticket_price'];
			$price = $price - ($price*$row['percentage']/100);
			$price = $price*0.97;

			$seat_no = $row['seat_no'];
			$company_name = $row['company_name'];
			$ticket_id = $row['ticket_id'];
			$flight_id = $row['flight_id'];
			$account_id = $_SESSION['account_id'];

			$_SESSION['account_id'] = $account_id;


        	$_SESSION['flight_id'] = $flight_id;
            $_SESSION['ticket_id'] = $ticket_id;
           //$_SESSION['account_id'] = $account_id;

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
			echo "</th>" . "<th>" . $from . "</th>" . "<th>" . $to . "</th>" . "<th>" . $date . "</th>" ."<th>" . $price . "</th>". "<th>" . $flight_id . "</th>"."<th>" .$seat_no ."</th>"." <td><a href=\"buy.php?id=".$flight_id."&status=app\">Buy</a> </td>.</tr>";
		}
	}



	?>



	</table>


<form action="buy.php" method="POST">
	<input type="number" name="flight_id" placeholder="Type your flight_id"><br>
	<input type="number" name="seat_no" placeholder="Type your seat_no"><br>
	<button>SEND</button>
</form>

</body>
</html>
<?php endif; ?>