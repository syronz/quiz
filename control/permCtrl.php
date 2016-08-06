<?php

require_once realpath(__DIR__ . '/../class/perm.php');

// require_once realpath(__DIR__ . '/databaseClass.php');

// dsh(json_decode(file_get_contents("php://input"),TRUE),$_GET);

switch ($_GET['action']) {
	case 'add':
		echo $perm->add(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'list':
		echo $perm->show($_GET);
	break;
	case 'edit':
		echo $perm->edit(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'delete':
		echo $perm->delete(json_decode(file_get_contents("php://input"),TRUE));
	break;
	
	case 'permList':
		echo $perm->permList();
	break;

	default:
		# code...
		break;
}






?>