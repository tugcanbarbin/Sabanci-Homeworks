<?php


include "config.php";


if(isset($_POST['ids']))

	{
     

    echo "deneme";

	$selection_id = $_POST['ids'];


	$sql_statement = "DELETE FROM ticket WHERE ticket_id = $selection_id";

	$result = mysqli_query($db,$sql_statement);


	/*$sql_statement2 = "DELETE FROM buy WHERE buy.ticket_id = $selection_id";

	$result2 = mysqli_query($db,$sql_statement2);*/


	if($result == FALSE)
	{
		echo "There is no such ticket";
	}





    //header("Location: admin.php");
     }
else
{
	echo "The form is not set.";
}


?>