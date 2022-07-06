<!DOCTYPE html>
<html>
<head>
	<title>SALE FIGURE</title>
</head>
<body>
<div align="center"></div>
	<table>
			
			<tr id="header">
				<th>Company Name</th>
				<th>Company id</th>
				<th>Sold tickets  </th>
			</tr>
			
	<?php
	include "config.php";
	$sql_statement = "SELECT company.company_name, ticket.company_id, COUNT(*) AS Number_of_tickets FROM ticket JOIN company ON ticket.company_id = company.company_id GROUP BY company.company_id";
    $result=mysqli_query($db, $sql_statement);
    while ($row = mysqli_fetch_assoc($result)) 
	{
		$company_name = $row['company_name'];
		$company_id = $row['company_id'];
		$Number_of_tickets = $row['Number_of_tickets'];
		
		
        	
        	echo "<tr>"."<th>".$company_name."</th>"."<th>".$company_id."</th>"."<th>".$Number_of_tickets."</th>"."</tr>";
    }    
	?>
	</table>
<form action="admin.php">
	<button>Back</button>
</form>			
</body>
</html>