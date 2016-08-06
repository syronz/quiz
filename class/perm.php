<?php
require_once realpath(__DIR__ . '/database.php');
require_once realpath(__DIR__ . '/valid.php');


/*------------------------------------------------------
	permission Explain:
	INPUT for checkPerm($table,$action,$idUser):
		$table : name of table that transaction affect on it
		$action: enum [view,add,edit,delete] pattern:[0,1]{4} 0 equal to null and 1 equal to true (have pemission)
		$idUser: get from $_SESSION

	this class active tochange because after any edit we need update this class especially struct
-------------------------------------------------------*/

class perm extends database{
	private $table = 'perm';
	private $struct = ['self'=>['id','name','perm','user','grade','lecture','question','quiz','detail']
	];
	function add($v){
		$valid = new valid();
		$required = $this->isRequired($v,['name'=>'name']);
		if(!$required['result'])
			return json_encode($required);

		if(!$this->perm($this->table,'add'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_Permission_To_Add','extra'=>'']]]);

		$vCheck1 = $this->valid($v['name'],['isUnique','maxLength200','isName'],$this->table,'name');
		if(!$vCheck1['result'])
			return json_encode($vCheck1);

		foreach ($v as $key => $value) {
			if($key != 'id' && $key != 'name' && $key != 'detail')
				if(!$valid->isPerm($value))
					return json_encode(['result'=>false,'message'=>[['field'=>$key,'content'=>'Not_Perm_Pattern','extra'=>$value]]]);
		}
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

		$valid = new valid();
		foreach ($v as $key => $value) {
			if($key != 'id' && $key != 'name' && $key != 'detail')
				if(!$valid->isPerm($value))
					return json_encode(['result'=>false,'message'=>[['field'=>$key,'content'=>'Not_Perm_Pattern','extra'=>$value]]]);
		}

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
		// $valid = new valid();
		// dsh($valid->isPerm('1111'));
		if(!$this->perm($this->table,'view'))
			return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_Permission_To_View','extra'=>'']]]);
		return $this->listDefault($this->table,$v,$this->struct);
	}

	function permList(){
		return $this->listAllDefault($this->table,['id','name']);
	}

	function checkPerm($table,$action,$idUser){
		$idPerm = $this->getRow('user',$idUser)['id_perm'];
		$permInfo = $this->getRow('perm',$idPerm)[$table];
		switch ($action) {
			case 'view':
			return $permInfo[0];
			break;

			case 'add':
			return $permInfo[1];
			break;

			case 'edit':
			return $permInfo[2];
			break;

			case 'delete':
			return $permInfo[3];
			break;
			
			default:
				return false;
			break;
		}
	}
}
$perm = new perm();

// dsh($perm->checkPerm('department','view',1));


?>