<?php
require_once realpath(__DIR__ . '/database.php');
require_once realpath(__DIR__ . '/valid.php');


	// question Explain:
	// for level of difficulty


class question extends database{
	private $table = 'question';
	private $struct = ['self'=>['id','id_grade','id_lecture','difficulty','content','image','star','right','wrong'],
	'grade'=>['source'=>'id_grade','target'=>'id','column'=>'name','search'=>['name']],
	'lecture'=>['source'=>'id_lecture','target'=>'id','column'=>'name','search'=>['name']]
	];
	function add($v){
		$valid = new valid();
		if(!$this->perm($this->table,'add'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_questionission_To_Add','extra'=>'']]]);

		$required = $this->isRequired($v,['id_grade'=>'grade','id_lecture'=>'lecture','content'=>'content']);
		if(!$required['result'])
			return json_encode($required);


		$lastId = $this->addDefault($this->table,$v);
		return json_encode(['result'=>true,'id'=>$lastId]);
	}

	function edit($v){
		$valid = new valid();
		if(!$this->perm($this->table,'add'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_questionission_To_Add','extra'=>'']]]);

		$required = $this->isRequired($v,['id_grade'=>'grade','id_lecture'=>'lecture','content'=>'content']);
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
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_questionission_To_View','extra'=>'']]]);
		$data = json_decode($this->listDefault($this->table,$v,$this->struct),true);
		foreach ($data['rows'] as $key => &$value) {
			$value['content'] = substr($value['content'], 0,50).' ...';
			$value['difficulty'] = "D:{$value['difficulty']} ✔:{$value['right']}, ❌:{$value['wrong']}";
		}
		return json_encode($data);
	}

	function questionList(){
		return $this->listAllDefault($this->table,['id','name']);
	}

	function addImage($idQuestion){
		if ( !empty( $_FILES ) ) {
			$idQuestion = $this->toSave($idQuestion);
			$_FILES[ 'file' ][ 'name' ] = $idQuestion.'.png';
			$tempPath = $_FILES[ 'file' ][ 'tmp_name' ];
			$uploadPath = dirname(__DIR__).DIRECTORY_SEPARATOR.'dist'.DIRECTORY_SEPARATOR.'question'.DIRECTORY_SEPARATOR. $_FILES[ 'file' ][ 'name' ];
			move_uploaded_file( $tempPath, $uploadPath );

			$answer = array( 'result'=>true,'answer' => 'File transfer completed' );
			$json = json_encode( $answer );

			$sql = "UPDATE question SET image = '{$_FILES[ 'file' ][ 'name' ]}' WHERE id = '$idQuestion'";
			$this->pdo->query($sql);

			return  $json;

		} else {
			echo 'No files';
		}
	}

	function getQuestion($id){
		try{
			$question = $this->getRow($this->table,$id);
			$question = $this->entityDecode($question);
			return json_encode($question);
		}
		catch(PDOEXCEPTION $e){
			// dsh($e);
			return json_encode(['result'=>false,'message'=>['Delete_Not_Available']]);
		}
	}

	
	function deleteImage($v){
		try{
			$v = $this->toSave($v);

			$sql = "UPDATE question SET image = NULL WHERE id = '{$v['idQuestion']}'";
			$this->pdo->query($sql);

			unlink(dirname(__DIR__).DIRECTORY_SEPARATOR.'dist'.DIRECTORY_SEPARATOR.'question'.DIRECTORY_SEPARATOR.$v['idQuestion'].'.png');

			return json_encode(['result'=>true]);
		}
		catch(PDOEXCEPTION $e){
			// dsh($e);
			return json_encode(['result'=>false,'message'=>['Delete_Not_Available']]);
		}
	}

	


}
$question = new question();

// dsh($question->checkquestion('department','view',1));
// $question->addImage($idQuestion);

?>