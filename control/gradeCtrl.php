<?php

require_once realpath(__DIR__ . '/../class/grade.php');

// require_once realpath(__DIR__ . '/databaseClass.php');

// dsh(json_decode(file_get_contents("php://input"),TRUE),$_GET);

switch ($_GET['action']) {
	case 'add':
		echo $grade->add(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'list':
		echo $grade->show($_GET);
	break;
	case 'edit':
		echo $grade->edit(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'delete':
		echo $grade->delete(json_decode(file_get_contents("php://input"),TRUE));
	break;
	
	case 'gradeList':
		echo $grade->gradeList();
	break;

	default:
		# code...
		break;
}






?>