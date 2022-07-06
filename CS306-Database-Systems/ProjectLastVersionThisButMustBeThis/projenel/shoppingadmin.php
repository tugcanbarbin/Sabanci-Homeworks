<?php

include "config.php";

?>

<form action = "sendshoppingadmin.php" method = "POST">
<select name = "ids">

<?php


$sql_command = "SELECT ticket_id FROM shopping_history";

$myresult = mysqli_query($db, $sql_command);

while ($rows = mysqli_fetch_assoc($myresult)) 
{
	$ticket = $rows['ticket_id'];
	echo "<option value = $ticket>".$ticket."</option>";


}

?>
</select>
<button> DELETE</button>



