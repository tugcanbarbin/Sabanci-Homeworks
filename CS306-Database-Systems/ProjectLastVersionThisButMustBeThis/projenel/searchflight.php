<!DOCTYPE html>
<html>
<head>
	<title>FLIGHTS</title>
	<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<table id = "myTable">
  <tr>
    <th>From</th>
    <th>To</th>
    <th>Price without Cookies</th>
    <th>Company</th>
    <th>Date</th>
    <th>Flight ID</th>
    <th>Purchase</th>
    <th>Popularity</th>
  </tr>
 
  


<?php

include "config.php";
session_start();




if (isset($_POST['startpoint'])) 
{

	$startpoint = $_POST['startpoint'];
	$destination = $_POST['endpoint'];
	$minprice = $_POST['min_price'];
	$maxprice = $_POST['max_price'];
	$date_start = $_POST['date_start'];
	$date_end = $_POST['date_end'];

	if (isset($_POST['startpoint'])) 
{

	$startpoint = $_POST['startpoint'];
	$destination = $_POST['endpoint'];
	$minprice = $_POST['min_price'];
	$maxprice = $_POST['max_price'];
	$date_start = $_POST['date_start'];
	$date_end = $_POST['date_end'];

	if(isset($_POST['asc'])) 
	{
		$sql_statement = "SELECT DISTINCT T.startpoint,T.destination,C.company_name,T.ticket_price,T.flight_time,T.flight_id,T.frequency,COUNT(*) AS occupied_seat 
					  FROM ticket T,company C
					  WHERE T.startpoint = '$startpoint' and T.destination = '$destination' and T.ticket_price >= $minprice 
					  and T.ticket_price <= $maxprice and T.company_id = C.company_id and T.flight_time >'$date_start' and T.flight_time <'$date_end'
					  GROUP BY T.flight_id,T.startpoint,T.destination
					  ORDER BY ticket_price ASC;";
	}

	elseif(isset($_POST['desc'])) 
	{
		$sql_statement = "SELECT DISTINCT T.startpoint,T.destination,C.company_name,T.ticket_price,T.flight_time,T.flight_id,T.frequency,COUNT(*) AS occupied_seat 
					  FROM ticket T,company C
					  WHERE T.startpoint = '$startpoint' and T.destination = '$destination' and T.ticket_price >= $minprice 
					  and T.ticket_price <= $maxprice and T.company_id = C.company_id and T.flight_time >'$date_start' and T.flight_time <'$date_end'
					  GROUP BY T.flight_id,T.startpoint,T.destination
					  ORDER BY ticket_price DESC;";
	}

	elseif(isset($_POST['recent'])) #bu satilan biletleri donuyor
	{
		$sql_statement = "SELECT DISTINCT T.startpoint,T.destination,C.company_name,T.ticket_price,T.flight_time,T.flight_id,T.frequency,COUNT(*) AS occupied_seat 
					  FROM ticket T,company C
					  WHERE T.startpoint = '$startpoint' and T.destination = '$destination' and T.ticket_price >= $minprice 
					  and T.ticket_price <= $maxprice and T.company_id = C.company_id and T.flight_time >'$date_start' and T.flight_time <'$date_end'
					  GROUP BY T.flight_id,T.startpoint,T.destination
					  ORDER BY flight_time ASC;";	

	}


	else
	{
		$sql_statement = "SELECT T.startpoint,T.destination,C.company_name,T.ticket_price,T.flight_time,T.flight_id,T.frequency,COUNT(*) AS occupied_seat 
					  FROM ticket T,company C
					  WHERE T.startpoint = '$startpoint' and T.destination = '$destination' and T.ticket_price >= $minprice 
					  and T.ticket_price <= $maxprice and T.company_id = C.company_id and T.flight_time >'$date_start' and T.flight_time <'$date_end'
					  GROUP BY T.flight_id,T.startpoint,T.destination;";	
	}
	
	$result = mysqli_query($db,$sql_statement);
	
	while ($row = mysqli_fetch_assoc($result)) 
	{
		$new_start = $row['startpoint'];
		$new_dest = $row['destination'];
		$company = $row['company_name'];
		$price = $row['ticket_price'];
		$date = $row['flight_time'];
		$flight_id = $row['flight_id'];
		$frequency = $row['frequency'];
		$occ_seat = $row['occupied_seat'];
       // $account_id = $row['account_id'];
        //$ticket_id = $row['ticket_id'];
        //$seat_no = $row['seat_no'];
        if ($occ_seat > 2) 
        {
        	$price2 = $price + $price*0.1;
		
        	
        	echo "<tr>"."<th>".$new_start."</th>"."<th>".$new_dest."</th>"."<th>".$price."</th>"."<th>".$company."</th>"."<th>".$date."</th>"."<th>".$flight_id."</th>"."<td><a href=\"searchbuy.php?id=".$row['flight_id']."&status=app\">Search</a>"."</td>"."<th>"."This ticket is popular new price is $price2"."</th>"."</tr>";
        }
        else
        {
        	$price2 = $price - $price*0.1;
		
        
        	echo "<tr>"."<th>".$new_start."</th>"."<th>".$new_dest."</th>"."<th>".$price."</th>"."<th>".$company."</th>"."<th>".$date."</th>"."<th>".$flight_id."</th>"."<td><a href=\"searchbuy.php?id=".$row['flight_id']."&status=app\">Search</a>"."</td>"."<th>"."This ticket is not popular new price is $price2"."</th>"."</tr>";
        }
	}


}
}
else
{
	echo "The form is not set";
	/*<button class='btn' > Buy </button> */
}
?>


<form action="searchbuy.php" method="POST">
	<input type="number" name="flight_id" placeholder="Type flight_id to buy ticket"><br>
	<button>BUY</button>
</form>


</table>
</body>
</html>