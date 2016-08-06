<?php
require_once realpath(__DIR__ . '/database.php');
require_once realpath(__DIR__ . '/valid.php');


/*------------------------------------------------------
	grade Explain:
	for level of difficulty
-------------------------------------------------------*/

class grade extends database{
	private $table = 'grade';
	private $struct = ['self'=>['id','name','detail']
	];
	function add($v){
		$valid = new valid();
		$required = $this->isRequired($v,['name'=>'name']);
		if(!$required['result'])
			return json_encode($required);

		if(!$this->perm($this->table,'add'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_gradeission_To_Add','extra'=>'']]]);

		$vCheck1 = $this->valid($v['name'],['isUnique','maxLength200','isName'],$this->table,'name');
		if(!$vCheck1['result'])
			return json_encode($vCheck1);

		$this->addDefault($this->table,$v);
		return json_encode(['result'=>true]);
	}

	function edit($v){
		$required = $this->isRequired($v,['name'=>'name']);
		if(!$required['result'])
			return json_encode($required);

		$old = $this->getRow($this->table,$v['id']);

		if($v['name'] != $old['name'])
			$vCheck1 = $this->valid($v['name'],['isUnique','maxLength200','isName'],$this->table,'name');
		else
			$vCheck1 = $this->valid($v['name'],['maxLength200','isName'],$this->table,'name');

		if(!$vCheck1['result'])
			return json_encode($vCheck1);


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
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_gradeission_To_View','extra'=>'']]]);
		return $this->listDefault($this->table,$v,$this->struct);
	}

	function gradeList(){
		return $this->listAllDefault($this->table,['id','name']);
	}


}
$grade = new grade();

// dsh($grade->checkgrade('department','view',1));


?>