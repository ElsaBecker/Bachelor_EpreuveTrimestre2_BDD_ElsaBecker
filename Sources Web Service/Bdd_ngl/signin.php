<?php

require_once __DIR__ . '/db_config.php';

$dbaccess = new PDO(DB_CO, DB_USER, DB_PASS);


if(isset($_GET['Login']) && isset($_GET['Password']))
{
	$login = $_GET['Login'];
	$pass = $_GET['Password'];
	
	$result = $dbaccess->query('SELECT COUNT(*) as total from utilisateur WHERE Login = "'.$login.'" AND Password = "'.$pass.'"');
	$res = $result->fetch(PDO::FETCH_ASSOC);
	
	if ($res['total']==1){
		
		echo '{"query_result":"SUCCESS"}';
		
	}else{
	
		echo '{"query_result":"FAILURE"}';
	
	}
}

?>