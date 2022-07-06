<!DOCTYPE html>
<html>
<head>
	<style>
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white;
  color: black;
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.button2 {
  background-color: white;
  color: black;
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}

</style>
	<title>Shopping History</title>
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

<table>
  <tr>
    <th>Purchase Date</th>
    <th>Seat</th>
    <th>Company</th>
    <th>Price</th>
    <th>From</th>
    <th>To</th>
    <th>Flight Time</th>
  </tr>

<?php include "config.php";
 session_start();
 if(isset($_SESSION['mail']))
 {
	$mail = $_SESSION['mail'];
	$sql_statement = "SELECT 
    shopping_history.purchase_date,
     shopping_history.ticket_seat_no,
     shopping_history.company_name,
      shopping_history.ticket_price,
      shopping_history.ticket_from,
      shopping_history.ticket_to,
      shopping_history.ticket_date
FROM 
	shopping_history
JOIN (SELECT * FROM account WHERE mail = '$mail' ) as A ON shopping_history.account_id = A.account_id";
	$result = mysqli_query($db, $sql_statement);
	while($row= mysqli_fetch_assoc($result))
	{
		$mydate = $row['purchase_date'];
		$myseat = $row['ticket_seat_no'];
		$mycompany = $row['company_name'];
		$myprice = $row['ticket_price'];
		$myto = $row['ticket_to'];
		$myfrom = $row['ticket_from'];
		$myflighttime = $row['ticket_date'];
		echo "<tr>" .
		 "<th>" . $mydate . "</th>". "<th>" . $myseat . "</th>". "<th>" . $mycompany . "</th>". "<th>" . $myprice . "</th>". "<th>" . $myfrom . "</th>". "<th>" . $myto . "</th>". "<th>" . $myflighttime . "</th>"."</tr>";
	}
}
?>
</table>
<a href="account.php">
  <button class="button button1">Back</button>
</a>
</body>
</html>