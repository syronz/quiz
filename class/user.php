<?php
require_once realpath(__DIR__ . '/database.php');
require_once realpath(__DIR__ . '/valid.php');


/*------------------------------------------------------
	user Explain:
	used for show and login
	-------------------------------------------------------*/

	class user extends database{
		private $table = 'user';
		private $struct = ['self'=>['id','id_perm','name','username','password','phone','email','detail'],
		'perm'=>['source'=>'id_perm','target'=>'id','column'=>'name','search'=>['name']]
		];
		function add($v){
			$valid = new valid();

			if(!$this->perm($this->table,'add'))
				return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_userission_To_Add','extra'=>'']]]);

			if($valid->isDuplicate('user','username',"{$v['username']}"))
				return ['result'=>false,'message'=>'username_exist_please_use_another_one'];

			if($valid->isDuplicate('user','email',"{$v['email']}"))
				return ['result'=>false,'message'=>'email_exist_please_use_another_one'];

			$v['password'] = password_hash($v['newPass'], PASSWORD_BCRYPT);

			unset($v['newPass']);
			
			$required = $this->isRequired($v,['name'=>'name']);
			if(!$required['result'])
				return json_encode($required);



			$this->addDefault($this->table,$v);
			return json_encode(['result'=>true]);
		}

		function edit($v){
			if(!$this->perm($this->table,'edit'))
				return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_userission_To_Edit','extra'=>'']]]);

			$old = $this->getRow($this->table,$v['id']);

			if($v['username'] != $old['username'])
				$vCheck1 = $this->valid($v['username'],['isUnique','maxLength200','isName'],$this->table,'username');
			else
				$vCheck1 = $this->valid($v['username'],['maxLength200','isName'],$this->table,'username');
			if(!$vCheck1['result'])
				return json_encode($vCheck1);

			if($v['email'] != $old['email'])
				$vCheck2 = $this->valid($v['email'],['isUnique','maxLength200','isName'],$this->table,'email');
			else
				$vCheck2 = $this->valid($v['email'],['maxLength200','isName'],$this->table,'email');
			if(!$vCheck2['result'])
				return json_encode($vCheck2);

			if(!empty($v['newPass']))
				$v['password'] = password_hash($v['newPass'], PASSWORD_BCRYPT);

			unset($v['newPass']);

			$required = $this->isRequired($v,['name'=>'name']);
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
		// $valid = new valid();
		// dsh($valid->isuser('1111'));
			if(!$this->perm($this->table,'view'))
				return json_encode(['result'=>false,'message'=>[['field'=>'','content'=>'You_Havent_userission_To_View','extra'=>'']]]);
			return $this->listDefault($this->table,$v,$this->struct);
		}

		function userList(){
			return $this->listAllDefault($this->table,['id','name']);
		}

		function login($username,$password){
			try{
				$sql = "SELECT * FROM `user` WHERE username = '$username';";
				$result = $this->pdo->query($sql);
				$rows = $result->fetch(PDO::FETCH_ASSOC);
				if($rows){
					if(password_verify($password,$rows['password'])){
						setcookie('id', $rows['id'], time() + (86400 * 60), "/");
						return true;
					}
					else
						return false;

				}
				else
					return false;
			}
			catch(PDOException $e){
				dsh($e);
			}
		}

		function sighnUp($data){
			try{
				$valid = new valid();
				if($valid->isDuplicate('user','username',"{$data['username']}"))
					return ['result'=>false,'message'=>'username_exist_please_use_another_one'];

				if($valid->isDuplicate('user','email',"{$data['email']}"))
					return ['result'=>false,'message'=>'email_exist_please_use_another_one'];

				$data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);

				$sql = "INSERT INTO user(name,username,password,email,id_perm) VALUES('{$data['name']}','{$data['username']}','{$data['password']}','{$data['email']}','3');";
				$this->pdo->query($sql);
				return ['result'=>true];
			}
			catch(PDOException $e){
				dsh($e);
			}
		}

		public function logout(){
			unset($_COOKIE['id']);
			setcookie('id', null, -1, "/");
			return true;
		}


	}
	$user = new user();

// dsh($user->checkuser('department','view',1));


	?>