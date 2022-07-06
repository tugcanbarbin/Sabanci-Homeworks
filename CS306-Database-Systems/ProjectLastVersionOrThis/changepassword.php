<!DOCTYPE html>
<html>
<head>
<title>Password Change</title>

</head>
<body>
<h3 align="center">CHANGE PASSWORD</h3>
<div><?php if(isset($message)) { echo $message; } ?></div>
<div align="center">
<form action="changepasswords.php" method="POST">
	<input type="password" name="password" placeholder="Type your password"><br>
	<input type="password" name="confirmPassword" placeholder="Type your new password"><br>
	<input type="password" name="newPassword" placeholder="Type your  new password"><br>
	<button>SEND</button>

<br>=
<br>

</div>
</body>
</html>




