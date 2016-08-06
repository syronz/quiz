<?php
require_once realpath(__DIR__ . '/valid.php');
require_once realpath(__DIR__ . '/perm.php');
date_default_timezone_set("Asia/Baghdad");
function dsh(){
	$argList = func_get_args();
	// var_dump($argList);
	foreach($argList as $key => $v){
		echo '<pre style="color:red">';
		ob_start();
		var_dump($v);
		$result = ob_get_clean();
		$result = str_replace(">\n", '>', $result);
		echo $result;
		echo '</pre><hr>';
	}
}

class database{
	public $pdo;
	function __construct(){
		$this->pdo = new PDO('mysql:host=localhost;dbname=quiz', 'root', '787', [PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8']);
		$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}

	function isRequired($v,$arr){
		$valid = new valid();
		return $valid->required($v,$arr);
	}

	function valid($v,$arrCheck,$table = null, $field = null, $min = null, $max = null){
		$valid = new valid();
		return $valid->check($v,$arrCheck,$table,$field,$min,$max);
	}

	function addDefault($table,$data){
		try{
			$data = $this->toSave($data);
			$sql = "INSERT INTO `$table`";
			$midSql = '(';
			$endSql = ' VALUES(';

			foreach ($data as $key => $value) {
				$midSql .= $key.',';
				$endSql .= "'$value',";
			}
			$midSql = substr($midSql, 0,-1).')';
			$endSql = substr($endSql, 0,-1).');';
			$sql = $sql.$midSql.$endSql;
			$this->pdo->query($sql);

			$lastId = $this->pdo->lastInsertId();

			return $lastId;
		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	function toSave($data){
	if(is_array($data))
		foreach ($data as $key => &$value) {
			if(is_array($value))
				$value = $this->toSave($value);
			else
				$value = htmlentities($value,ENT_QUOTES);
		}
		else
			$data = htmlentities($data,ENT_QUOTES);
		return $data;
	}

		private function queryDesignerCount($table,$struct,$search = null){
		$sqlSelectors = 'SELECT COUNT(*) AS count';
		$sqlFrom = " FROM $table";
		if($search)
			$sqlWhere = ' WHERE ';
		else
			$sqlWhere = ' ';
		foreach ($struct as $key => $value) {
			if($key == 'self'){
				foreach ($value as $fields) {
					if($search){
						$sqlWhere .= " UPPER($fields) LIKE UPPER('%$search%') OR ";
					}
				}
				if($search){
					$sqlWhere = substr($sqlWhere, 0,-3);
				}
			}
		}
		return "$sqlSelectors $sqlFrom $sqlWhere";
	}

	private function queryDesignerSelect($table,$struct,$order,$limit,$search = null){
		// dsh($limit);
		// $sql = "SELECT ";
		$sqlSelectors = 'SELECT ';
		$sqlFrom = " FROM $table";
		if($search)
			$sqlWhere = ' WHERE ';
		else
			$sqlWhere = ' ';
		$sqlOrder = 'ORDER BY '.$order;
		foreach ($struct as $key => $value) {
			if($key == 'self'){
				foreach ($value as $fields) {
					$sqlSelectors .= "$table.$fields,";
					if($search){
						$sqlWhere .= " UPPER($table.$fields) LIKE UPPER('%$search%') OR ";
					}
				}
			}
			else{
				$sqlSelectors .= "$key.{$value['column']} AS $key,";
				$sqlFrom .= " INNER JOIN $key ON $key.{$value['target']} = $table.{$value['source']} ";
				if($search){
					foreach ($value['search'] as $searchField) {
						$sqlWhere .= " UPPER($key.$searchField) LIKE UPPER('%$search%') OR ";
					}
				}
			}
		}
		$sqlSelectors = substr($sqlSelectors, 0,-1);
		if($search){
			$sqlWhere = substr($sqlWhere, 0,-3);
		}
		// dsh("$sqlSelectors $sqlFrom $sqlWhere $sqlOrder LIMIT $limit");
		return "$sqlSelectors $sqlFrom $sqlWhere $sqlOrder LIMIT $limit";
	}

	function listDefault($table,$data,$struct){
		try{
			$data = $this->toSave($data);
			$sql = $this->queryDesignerSelect($table,$struct,$data['order'],$data['limit'],$data['search']);
			$result = $this->pdo->query($sql);
			$r['rows'] = $result->fetchAll(PDO::FETCH_ASSOC);
			$r['rows'] = $this->entityDecode($r['rows']);

			$sql = $this->queryDesignerCount($table,$struct,$data['search']);
			$result = $this->pdo->query($sql);
			$r['count'] = $result->fetch(PDO::FETCH_ASSOC)['count'];

			$action = $data['search']?'search':'view';

			return json_encode($r);
		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	function listAllDefault($table,$fields){
		try{
			$fields = $this->toSave($fields);
			$sql = "SELECT ";
			foreach ($fields as $value) {
				$sql .= $value.",";
			}
			$sql = substr($sql, 0,-1).' FROM '.$table." ORDER BY $fields[1] ASC";
			$result = $this->pdo->query($sql);
			$rows = $result->fetchAll(PDO::FETCH_ASSOC);

			// $arrList = [];
			// foreach ($rows as $value) {
			// 	$arrList[$value[$fields[0]]] = $value[$fields[1]];
			// }
			// return json_encode($arrList);

			return json_encode($rows);
		}
		catch(PDOException $e){
			dsh($e);
		}
	}

	function entityDecode($data){
		foreach ($data as $key => &$value) {
			if(is_array($value))
				$value = $this->entityDecode($value);
			else
				$value = html_entity_decode($value,ENT_QUOTES);
		}
		return $data;
	}

	function perm($table,$action){
		$perm = new perm();
		return $perm->checkPerm($table,$action,@$_COOKIE['id']);
	}

	function getRow($table,$id){
		try{
			$sql = "SELECT * FROM $table WHERE id = '$id'";
			$result = $this->pdo->query($sql);
			return $result->fetch(PDO::FETCH_ASSOC);
		}
		catch(exception $e){
			dsh($e);
			die();
		}
	}

	function getRowsByFiled($table,$field,$v){
		try{
			$sql = "SELECT * FROM $table WHERE $field = '$v'";
			$result = $this->pdo->query($sql);
			return $result->fetchAll(PDO::FETCH_ASSOC);
		}
		catch(exception $e){
			dsh($e);
			die();
		}
	}

	function editDefault($table,$data,$struct){
		try{
			$data = $this->toSave($data);
			$sql = "UPDATE `$table` SET ";
			$midSql = '';
			$endSql = " WHERE id = '{$data['id']}'";

			foreach ($data as $key => $value) {
				if($key != 'id' && in_array($key, $struct['self'])){
					$midSql .= "`$key` = '$value',";
				}
			}
			$midSql = substr($midSql, 0,-1);
			$sql = $sql.$midSql.$endSql;
			$this->pdo->query($sql);

			return true;
		}
		catch(PDOException $e){
			dsh($e);
		}
	}

}

$db = new database();

?>