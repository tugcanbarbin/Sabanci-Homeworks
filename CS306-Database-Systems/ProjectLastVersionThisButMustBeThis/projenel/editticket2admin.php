
<?php


include "config.php";

session_start();
if(isset($_POST['price']))

	{
     
    $selected_price = $_POST['price'];
	
	$ticket_id = $_SESSION['ticketadmin'];

	$sql_statement = "UPDATE ticket SET ticket_price = $selected_price WHERE ticket.ticket_id = $ticket_id;";

	$result = mysqli_query($db,$sql_statement);


	





    //header("Location: admin.php");
     }


if(isset($_POST['start']))

	{
     

    

	$selected_start = $_POST['start'];
	
	$ticket_id = $_SESSION['ticketadmin'];

  
    if($selected_start != "")
    {
    	$sql_statement = "UPDATE ticket SET ticket.startpoint = '$selected_start' WHERE ticket.ticket_id = $ticket_id;";

	    $result = mysqli_query($db,$sql_statement);
    }
	





    //header("Location: admin.php");
     }

if(isset($_POST['end']))

	{
     

    

	$selected_end = $_POST['end'];
	
	$ticket_id = $_SESSION['ticketadmin'];

	if($selected_end != "")
    {
    	$sql_statement = "UPDATE ticket SET ticket.destination = '$selected_end' WHERE ticket.ticket_id = $ticket_id;";

	    $result = mysqli_query($db,$sql_statement);
    }

	

    //header("Location: admin.php");
     }



if(isset($_POST['flight_time']))

	{
     

    

	$selected_time = $_POST['flight_time'];
	
	$ticket_id = $_SESSION['ticketadmin'];

    

    if($selected_time != "")
    {
    	$sql_statement = "UPDATE ticket SET ticket.flight_time = '$selected_time' WHERE ticket.ticket_id = $ticket_id;";

	    $result = mysqli_query($db,$sql_statement);
    }


	

    header("Location: admin.php");
     }

?>
