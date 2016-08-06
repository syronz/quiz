<?php

require_once realpath(__DIR__ . '/../class/question.php');

// require_once realpath(__DIR__ . '/databaseClass.php');

// dsh(json_decode(file_get_contents("php://input"),TRUE),$_GET);

switch ($_GET['action']) {
	case 'add':
		echo $question->add(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'list':
		echo $question->show($_GET);
	break;
	case 'edit':
		echo $question->edit(json_decode(file_get_contents("php://input"),TRUE));
	break;
	case 'delete':
		echo $question->delete(json_decode(file_get_contents("php://input"),TRUE));
	break;
	
	case 'questionList':
		echo $question->questionList();
	break;

	case 'addImage':
		echo $question->addImage($_GET['idQuestion']);
	break;

	case 'getQuestion':
		echo $question->getQuestion($_GET['id']);
	break;

	case 'deleteImage':
		echo $question->deleteImage(json_decode(file_get_contents("php://input"),TRUE));
	break;

	default:
		# code...
		break;
}






?>