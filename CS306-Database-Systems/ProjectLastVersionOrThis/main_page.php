<!DOCTYPE html>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" type="text/css" href="style_main_page.css">
	<link rel="stylesheet" type="text/css" href="style_main_page2.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<div class="profile">
		<div class="left_side">
			<a href="account.php" class="btn_p"><i class="fa fa-user" aria-hidden="true"></i></a>
		</div>
		<div class="right_side">
			<p style="color:#283747"></p>
		</div>
	</div>

	<form action="searchflight.php" method = "POST">
		<div class="container">
		
			<div class="box">
				<div class="icon">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div>
				<div class="content">		
					<p style="color:#283747">FROM:</p>
					<select name = "startpoint">

					<?php
					include "config.php";

					$sql_command = "SELECT DISTINCT ticket.startpoint FROM ticket";
					$myresult = mysqli_query($db, $sql_command);

					while ($start_row = $myresult->fetch_assoc())
					{
						$startpoint = $start_row['startpoint'];
						echo "<option value =$startpoint>".$startpoint."</option>";
					}

					?>
					</select>
					<p style="color:#283747">To:</p>
					<select name = "endpoint">

						<?php

    					include "config.php";
						$sql_command2 = "SELECT DISTINCT ticket.destination FROM ticket";
						$myresult2 = mysqli_query($db, $sql_command2);

						while ($end_row = $myresult2->fetch_assoc())
						{
							$destination = $end_row['destination'];
							echo "<option value =$destination>".$destination."</option>";
						}
	
						?>
					</select>
				</div>
			</div>
			<div class="box">
				<div class="icon">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div>
				<div class="content">					
					
					<p style="color:#283747">PRICE INTERVAL:</p>
					<input type="number" name="min_price" min="0" placeholder="Min" required>
					<br><br><br><br>
					<input type="number" name="max_price" min="0" placeholder="Max" required>
					<br><br>
					
					
					<input type="radio" id="asc" name="order" value="ASC" checked>
					<label for="asc"><strong>ASC</strong></label>
					<br>	
					<input type="radio" id="desc" name="order" value="DESC">
					<label for="desc"class="ordered"><strong>DESC</strong></label>					

					<br>
					
				</div>
			</div>
			<div class="box">
				<div class="icon">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div>
				<div class="content">
					<p style="color:#283747	">Date INTERVAL:</p>
					<input type="date" name="date_start" required>
					<br><br><br><br>
					<input type="date" name="date_end" required>
				</div>
			</div>
		</div>
		<div>
			<button class="btn btn1"> Submit </button>
		</div>
	</form>
</body>
</html>