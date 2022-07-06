<?php

include "config.php";

?>

<form action = "deleteticketadmin.php" method = "POST">
<select name = "ids">

<?php


$sql_command = "SELECT ticket_id FROM ticket";

$myresult = mysqli_query($db, $sql_command);

while ($rows = mysqli_fetch_assoc($myresult)) 
{
	$ticket = $rows['ticket_id'];
	echo "<option value = $ticket>".$ticket."</option>";


}

?>
</select>
<button> DELETE</button>

</form>


<form action = "editticketadmin.php" method = "POST">
<select name = "ticket_id">

<?php


$sql_command = "SELECT ticket_id FROM ticket";

$myresult = mysqli_query($db, $sql_command);

while ($rows = mysqli_fetch_assoc($myresult)) 
{
	$ticket = $rows['ticket_id'];

	echo "<option value = $ticket>".$ticket."</option>";




}

?>
</select>
<button> EDIT</button><br><br>

</form>
<form action="addticketadmin.php">
	<button>Add New Ticket</button>
</form>	