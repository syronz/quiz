<?php
require_once realpath(__DIR__ . '/database.php');
require_once realpath(__DIR__ . '/valid.php');

class quiz extends database{
	private $table = 'quiz';
	private $struct = ['self'=>['id','id_user','id_grade','id_lecture','result','duration','start','end','detail'],
	'user'=>['source'=>'id_user','target'=>'id','column'=>'name','search'=>['name']],
	'grade'=>['source'=>'id_grade','target'=>'id','column'=>'name','search'=>['name']],
	'lecture'=>['source'=>'id_lecture','target'=>'id','column'=>'name','search'=>['name']]
	];


	function generateQuiz($v){
		try{
			$valid = new valid();
			if(!$this->perm($this->table,'add'))
				return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_Permission','extra'=>'']]]);

			$required = $this->isRequired($v,['id_grade'=>'grade','id_lecture'=>'lecture']);
			if(!$required['result'])
				return json_encode($required);

			$idUser = @$_COOKIE['id'];
			$start = date('Y-m-d H:i:s',time());

			$sql = "INSERT INTO quiz(id_user,id_lecture,id_grade,duration,start) VALUES($idUser,'{$v['id_lecture']}','{$v['id_grade']}','60','$start')";
			$this->pdo->query($sql);

			$idQuiz = $this->pdo->lastInsertId();

			$sql = "SELECT * FROM question q WHERE q.id_lecture = '{$v['id_lecture']}' AND q.id_grade = '{$v['id_grade']}' ORDER BY RAND() LIMIT 20";
			$result = $this->pdo->query($sql); 
			$rowsQuestion = $result->fetchAll(PDO::FETCH_ASSOC);

			foreach ($rowsQuestion as $value) {
				$sql = "SELECT id,result FROM answer WHERE id_question = '{$value['id']}' AND result = 1";
				$result = $this->pdo->query($sql); 
				$rowTrueAnswer = $result->fetch(PDO::FETCH_ASSOC);

				$sql = "SELECT id,result FROM answer WHERE id_question = '{$value['id']}' AND result = 0 ORDER BY rand() LIMIT 3";
				$result = $this->pdo->query($sql); 
				$rowAnswers = $result->fetchAll(PDO::FETCH_ASSOC);

				array_push($rowAnswers, $rowTrueAnswer);
				shuffle($rowAnswers);

				$right_answer = 0;
				foreach ($rowAnswers as $key => $value2) {
					if($value2['result']){
						$right_answer = $key + 1;
						break;
					}
				}

				$id_a1 = @$rowAnswers[0]['id'] ? $rowAnswers[0]['id'] : 0;
				$id_a2 = @$rowAnswers[1]['id'] ? $rowAnswers[1]['id'] : 0;
				$id_a3 = @$rowAnswers[2]['id'] ? $rowAnswers[2]['id'] : 0;
				$id_a4 = @$rowAnswers[3]['id'] ? $rowAnswers[3]['id'] : 0;
				
				$sql = "INSERT INTO quiz_extra(id_quiz,id_question,right_answer,id_a1,id_a2,id_a3,id_a4) VALUES($idQuiz,'{$value['id']}','$right_answer','$id_a1','$id_a2','$id_a3','$id_a4')";
				$this->pdo->query($sql); 
			}
			
			return json_encode(['result'=>true,'idQuiz'=>$idQuiz]);

		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	
	function getQuiz($idQuiz){
		try{
			$idQuiz = $this->toSave($idQuiz);
			$valid = new valid();
			if(!$this->perm($this->table,'view'))
				return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_Permission','extra'=>'']]]);

			$sql = "SELECT q.id as idQuiz,q.duration,q.start,u.name as user,l.name as lecture,g.name as grade,q.end FROM quiz q inner join user u on u.id = q.id_user inner join lecture l on l.id = q.id_lecture inner join grade g on g.id = q.id_grade WHERE q.id = '$idQuiz'";
			$result = $this->pdo->query($sql); 
			$row['quizInfo'] = $result->fetch(PDO::FETCH_ASSOC);

			if(!empty($row['quizInfo']['end'])){
				return json_encode(['result'=>false,'data'=>$row]);
			}

			$sql = "SELECT qe.id,q.content,q.image,q.star,a1.content as a1,a2.content as a2,a3.content as a3,a4.content as a4 FROM quiz_extra qe inner join question q on qe.id_question = q.id left join answer a1 on a1.id = qe.id_a1 left join answer a2 on a2.id = qe.id_a2 left join answer a3 on a3.id = qe.id_a3 left join answer a4 on a4.id = qe.id_a4 WHERE qe.id_quiz = '$idQuiz'";
			$result = $this->pdo->query($sql); 
			$row['quizQuestion'] = $result->fetchAll(PDO::FETCH_ASSOC);

			$row = $this->entityDecode($row);

			// dsh($sql,$row);
			
			return json_encode(['result'=>true,'data'=>$row]);

		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	function getQuizResult($idQuiz){
		try{
			$idQuiz = $this->toSave($idQuiz);
			$valid = new valid();
			if(!$this->perm($this->table,'view'))
				return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_Permission','extra'=>'']]]);

			$sql = "SELECT q.id as idQuiz,q.duration,q.start,u.name as user,l.name as lecture,g.name as grade,q.result,TIMEDIFF(q.end,q.start) as sTime FROM quiz q inner join user u on u.id = q.id_user inner join lecture l on l.id = q.id_lecture inner join grade g on g.id = q.id_grade WHERE q.id = '$idQuiz'";
			$result = $this->pdo->query($sql); 
			$row['quizInfo'] = $result->fetch(PDO::FETCH_ASSOC);

			$sql = "SELECT qe.id,q.content,q.image,q.star,a1.content as a1,a2.content as a2,a3.content as a3,a4.content as a4,qe.selected,qe.right_answer FROM quiz_extra qe inner join question q on qe.id_question = q.id left join answer a1 on a1.id = qe.id_a1 left join answer a2 on a2.id = qe.id_a2 left join answer a3 on a3.id = qe.id_a3 left join answer a4 on a4.id = qe.id_a4 WHERE qe.id_quiz = '$idQuiz'";
			$result = $this->pdo->query($sql); 
			$row['quizQuestion'] = $result->fetchAll(PDO::FETCH_ASSOC);

			$row = $this->entityDecode($row);

			// dsh($sql,$row);
			
			return json_encode(['result'=>true,'data'=>$row]);

		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	

	function submitQuiz($v){
		try{
			
			$v = $v['data'];
			$v = $this->toSave($v);
			$info = $v['quizInfo'];
			$question = $v['quizQuestion'];
			$end = date('Y-m-d H:i:s',time());


			// dsh($info ,$question);

			$idQuiz = $info['idQuiz'];


			$count = 0;
			foreach ($question as $q) {
				$count++;
				if(!empty($q['result'])){
					$sql = "UPDATE quiz_extra SET selected = {$q['result']} WHERE id_quiz = '$idQuiz' AND id = '{$q['id']}'";
					$result = $this->pdo->query($sql);
				}
			}

			$sql = "SELECT count(*) as countRight FROM quiz_extra qe WHERE qe.id_quiz = $idQuiz AND selected = right_answer";
			$r = $this->pdo->query($sql);
			$countRight = $r->fetch(PDO::FETCH_ASSOC)['countRight'];

			$quizResult = ($countRight / $count) * 100;

			$sql = "UPDATE quiz SET end = '$end',result = '$quizResult' WHERE id = $idQuiz";
			$this->pdo->query($sql);



			return json_encode(['result'=>true,'idQuiz'=>$idQuiz]);

		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	function show($v){
		try{
		if(!$this->perm($this->table,'view'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_lectureission_To_View','extra'=>'']]]);
		$sql = "SELECT count(*) as count FROM quiz q inner join lecture l on l.id = q.id_lecture inner join grade g on g.id = q.id_grade WHERE id_user = '{$_COOKIE['id']}'";
		$r = $this->pdo->query($sql);
		$data['count'] = $r->fetch(PDO::FETCH_ASSOC)['count'];


		$sql = "SELECT q.id,l.name as lecture,g.name as grade, q.result,q.duration,q.start,TIMEDIFF(q.end,q.start) as end,q.detail FROM quiz q inner join lecture l on l.id = q.id_lecture inner join grade g on g.id = q.id_grade WHERE id_user = '{$_COOKIE['id']}' ORDER BY {$v['order']} LIMIT {$v['limit']}";
		$r = $this->pdo->query($sql);
		$data['rows'] = $r->fetchAll(PDO::FETCH_ASSOC);

		return json_encode($data);
		}
		catch(PDOException $e){
			dsh($e);
		}
	}


}
$quiz = new quiz();


?>