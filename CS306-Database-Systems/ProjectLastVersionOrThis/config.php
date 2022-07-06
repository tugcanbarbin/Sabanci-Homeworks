<?php

$db = mysqli_connect('localhost', 'root','', 'group14');

if($db->connect_errno > 0)
{
	die('Unable to connect database [' . $db->connect_error . ']');
}

?>