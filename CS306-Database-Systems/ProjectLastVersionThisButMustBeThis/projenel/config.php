<?php

$db = mysqli_connect('localhost', 'root','', 'test');

if($db->connect_errno > 0)
{
	die('Unable to connect database [' . $db->connect_error . ']');
}

?>