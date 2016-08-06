<?php

require_once realpath(__DIR__ . '/../class/lecture.php');

// require_once realpath(__DIR__ . '/databaseClass.php');

// dsh(json_decode(file_get_contents("php://input"),TRUE),$_GET);

switch ($_GET['action']) {
	case 'add':
		echo $lecture->add(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'list':
		echo $lecture->show($_GET);
	break;
	case 'edit':
		echo $lecture->edit(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'delete':
		echo $lecture->delete(json_decode(file_get_contents("php://input"),TRUE));
	break;
	
	case 'lectureList':
		echo $lecture->lectureList();
	break;

	default:
		# code...
		break;
}






?>