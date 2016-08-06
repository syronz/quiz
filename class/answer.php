<?php
require_once realpath(__DIR__ . '/database.php');
require_once realpath(__DIR__ . '/valid.php');


/*------------------------------------------------------
	answer Explain:
	for level of difficulty
-------------------------------------------------------*/

class answer extends database{
	private $table = 'answer';
	private $struct = ['self'=>['id','id_question','content','result'],
	'question'=>['source'=>'id_question','target'=>'id','column'=>'content','search'=>['content']],
	];
	function add($v){
		$valid = new valid();
		if(!$this->perm($this->table,'add'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_answerission_To_Add','extra'=>'']]]);

		$required = $this->isRequired($v,['id_question'=>'question','content'=>'content','result'=>'result']);
		if(!$required['result'])
			return json_encode($required);

		$this->addDefault($this->table,$v);
		return json_encode(['result'=>true]);
	}

	function edit($v){
		$valid = new valid();
		if(!$this->perm($this->table,'add'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_answerission_To_Add','extra'=>'']]]);

		$required = $this->isRequired($v,['id_question'=>'question','content'=>'content','result'=>'result']);
		if(!$required['result'])
			return json_encode($required);

		$this->editDefault($this->table,$v,$this->struct);

		return json_encode(['result'=>true]);
	}

	function delete($v){
		try{
			$old = $this->getRow($this->table,$v['id']);

			$sql = "DELETE FROM {$this->table} WHERE id = '{$v['id']}'";
			$this->pdo->query($sql);

			return json_encode(['result'=>true]);
		}
		catch(PDOEXCEPTION $e){
			// dsh($e);
			return json_encode(['result'=>false,'message'=>['Delete_Not_Available']]);
		}
	}

	function show($v){
		if(!$this->perm($this->table,'view'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_answerission_To_View','extra'=>'']]]);
		return $this->listDefault($this->table,$v,$this->struct);
	}

	function answerList(){
		return $this->listAllDefault($this->table,['id','name']);
	}

	
	function listByQuestion($idQuestion){
		try{
			// $idQuestion = $this->toSave($idQuestion);
			$sql = "SELECT * FROM answer WHERE id_question = '$idQuestion'";
			$result = $this->pdo->query($sql);
			$rows = $this->entityDecode($result->fetchAll(PDO::FETCH_ASSOC));

			return json_encode(['result'=>true,'rows'=>$rows]);
		}
		catch(PDOEXCEPTION $e){
			dsh($e);
		}
	}


}
$answer = new answer();

// dsh($answer->checkanswer('department','view',1));


?>