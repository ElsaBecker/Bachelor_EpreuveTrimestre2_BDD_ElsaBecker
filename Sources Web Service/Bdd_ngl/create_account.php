<?php

require_once __DIR__ . '/db_config.php';

$dbaccess = new PDO(DB_CO, DB_USER, DB_PASS);

if(isset($_GET['Login']) && isset($_GET['Password']))
{
	$login = $_GET['Login'];
	$pass = $_GET['Password'];
	
	$result = $dbaccess->exec("INSERT INTO utilisateur (Login, Password) VALUES ('".$login."', '".$pass."')");
	
	
	if ($result == true ){
		
		echo '{"query_result":"SUCCESS"}';
		
	}else{
	
		echo '{"query_result":"FAILURE"}';
	
	}
}

?>