<?php

require_once 'class/user.php';



// print_r($_POST);



	if(!($user->login($_POST['username'],$_POST['password'])))
		header('Location:index.php');
	else
		header('Location:app.php');

dsh($_COOKIE);
?>

<h1>Welcome to quiz site!</h1>
<p>You are Login</p>


