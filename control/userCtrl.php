<?php
require_once realpath(__DIR__ . '/../class/user.php');


// require_once realpath(__DIR__ . '/databaseClass.php');

// dsh(json_decode(file_get_contents("php://input"),TRUE),$_GET);

switch ($_GET['action']) {
	case 'signUp':
	echo json_encode($user->sighnUp(json_decode(file_get_contents("php://input"),TRUE)));
	break;

	case 'add':
	echo $user->add(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'list':
	echo $user->show($_GET);
	break;
	case 'edit':
	echo $user->edit(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'delete':
	echo $user->delete(json_decode(file_get_contents("php://input"),TRUE));
	break;
	
	default:
		# code...
	break;
}






?>