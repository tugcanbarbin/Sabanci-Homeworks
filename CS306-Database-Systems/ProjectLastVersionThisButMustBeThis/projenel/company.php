<?php include "config.php"; ?>
<?php session_start() ?>
<?php if(isset($_SESSION['mail'])):?>
<?php echo $_SESSION['mail']; ?>
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
</head>
<body>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <title>profile</title>
</head>
<body>
<style>
body {
  background: url('img/ucak.jpg') no-repeat center fixed;
  background-size: cover;
}
</style>
<div align="center">
<p style = "font-family:georgia,garamond,serif;font-size:32px;font-style:italic;color:RED;">
         PROFILE
      </p>
<br><br><br><br><br><br><br>
<form action= "shoppinghistory.php">
  <button class="button button1">Shopping History</button>
  <br><br>
  <br><br>
  <br><br>
  <br>
  <br>
</form>
<a href="delete_acc.php">
<button class="button button1">Delete Account</button>
</a>
<br><br>
<a href="changepassword.php">
  <button class="button button1">Change Password</button>
</a>
  <br><br><br><br><br><br>
  <br><br><br><br><br><br>
  <br><br><br><br><br><br>
  <br><br><br><br><br><br><br>
<a href="log_out.php">
  <button class="button button1">Log Out</button>
</a>
</div>
</body>
</html>
<?php
else:
  echo "The form is not set!";
?>
<?php endif; ?>