<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<link rel="stylesheet" type="text/css" href="style_ticket.css">
<body>
  <table>
    
    <tr id="header">
      <th>Places to visit</th>
      <th>Places to eat</th>
      <th>Places to stay</th>
      <th>Transportation easiness</th>
    </tr>




<?php

		include "config.php";
        session_start();



        $flight_id = $_SESSION['flight_id'];
        $ticket_id = $_SESSION['ticket_id'];
        $account_id = $_SESSION['account_id'];
        $date = $_SESSION['flight_time'];
        $ticket_price = $_SESSION['price'];
        $new_start = $_SESSION['startpoint'];
        $new_dest =  $_SESSION['destination'];
        $seat_no = $_SESSION['seat_no'];
        $company =  $_SESSION['company_name'];
        $disc_po = $_SESSION['discount_points'];

        $new_price = $ticket_price -  $disc_po;

        echo "You had " . $disc_po ." discount points. The old ticket price was " . $ticket_price . ". New ticket price is " . $new_price . ".";

        $today = date("y-m-d");


        $sql_statement16 = "INSERT INTO buy(purchase_date,ticket_id,account_id)
                           VALUES('$today', $ticket_id,$account_id)";


        /*$sql_statement_new1 = "SELECT discount_points FROM account WHERE account.account_id = $account_id";
        $result_new1 = mysqli_query($db,$sql_statement_new1);
        while($row = mysqli_fetch_assoc($result_new1)){
          $old_disc_point = $row['discount_points'];
        }*/


        $sql_statement_new2 = "UPDATE account SET discount_points = ($ticket_price / 100) WHERE account.account_id = $account_id;";
        $result_new2 = mysqli_query($db, $sql_statement_new2);


        $result15 = mysqli_query($db,$sql_statement16);

        if($result15 != false)
		{

            $sql_statement17 = "INSERT INTO shopping_history(account_id,ticket_id,purchase_date,ticket_seat_no,company_name,ticket_price,ticket_from,ticket_to,ticket_date)
                                                           VALUES($account_id,$ticket_id, '$today' ,$seat_no, '$company', $ticket_price - $disc_po, '$new_start' , '$new_dest' , '$date');";
			 




            $result16 = mysqli_query($db,$sql_statement17);
            if($result15 != false)
          {
            $sql_statement18 = "SELECT P.place_to_visit, P.place_to_eat, P.place_to_stay,P.transportation_easiness
                                  FROM points_of_interest P
                                  WHERE P.ticket_id = $ticket_id;";

            $result18 = mysqli_query($db,$sql_statement18);

            while ($row = mysqli_fetch_assoc($result18)) 
            {
                $eat = $row['place_to_eat'];
                $visit = $row['place_to_visit'];
                $trans = $row['transportation_easiness'];
                $stay = $row['place_to_stay'];
                echo "<tr>"."<th>".$visit."</th>"."<th>".$eat."</th>"."<th>".$stay."</th>"."<th>".$trans."</th>"."</tr>";
            }
          }
          else
          {
            echo "Soplayamadik";
          }

            
		}
		else{
			echo "\n Try again";
		}
    ?>

  </table>

</body>
</html>