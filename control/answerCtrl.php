<?php

require_once realpath(__DIR__ . '/../class/answer.php');

// require_once realpath(__DIR__ . '/databaseClass.php');

// dsh(json_decode(file_get_contents("php://input"),TRUE),$_GET);

switch ($_GET['action']) {
	case 'add':
		echo $answer->add(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'list':
		echo $answer->show($_GET);
	break;
	case 'edit':
		echo $answer->edit(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'delete':
		echo $answer->delete(json_decode(file_get_contents("php://input"),TRUE));
	break;
	
	case 'answerList':
		echo $answer->answerList();
	break;

	case 'listByQuestion':
		echo $answer->listByQuestion($_GET['idQuestion']);
	break;

	default:
		# code...
		break;
}






?>