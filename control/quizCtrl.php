<?php

require_once realpath(__DIR__ . '/../class/quiz.php');

switch ($_GET['action']) {
	case 'add':
		echo $quiz->add(json_decode(file_get_contents("php://input"),TRUE));
	break;

	case 'generateQuiz':
		echo $quiz->generateQuiz(json_decode(file_get_contents("php://input"),TRUE));
	break;

	case 'getQuiz':
		echo $quiz->getQuiz($_GET['idQuiz']);
	break;

	case 'submitQuiz':
		echo $quiz->submitQuiz(json_decode(file_get_contents("php://input"),TRUE));
	break;

	case 'getQuizResult':
		echo $quiz->getQuizResult($_GET['idQuiz']);
	break;

	case 'list':
		echo $quiz->show($_GET);
	break;
	

	default:
		# code...
		break;
}






?>