<?php


include "config.php";


if(isset($_POST['ids']))

	{
     

    echo "deneme";

	$selection_id = $_POST['ids'];


	$sql_statement = "DELETE FROM shopping_history WHERE ticket_id = $selection_id";

	$result = mysqli_query($db,$sql_statement);

	

    header("Location: admin.php");
     }
else
{
	echo "The form is not set.";
}


?>