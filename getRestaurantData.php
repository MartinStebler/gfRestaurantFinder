<?php
include("dbconnect.php");

$method = $_POST['method'];
$id = $_POST['id'];

if($method=='coordinates'){
	$lat = $_POST['lat'];
	$lng = $_POST['lng'];
	$query = 'SELECT * FROM markers WHERE lat = '.$lat.' and lng = '.$lng.' LIMIT 1';
} else {
	$query = 'SELECT * FROM markers WHERE id = '.$id.' LIMIT 1';
}

$result = mysql_query($query);
if(mysql_num_rows($result)==1){
	while ($row = @mysql_fetch_assoc($result)){
		$response = array (
			'id'=>$row['id'],
			'name'=>$row['name'],
			'street'=>$row['street'],
			'city'=>$row['city'], 
			'plz'=>$row['plz'],
			'phone'=>$row['phone'],
			'rating'=>$row['rating'],
			'official'=>$row['official'],
			'lat'=>$row['lat'], 
			'lng'=>$row['lng'],
			'country'=>$row['country'],
			'bemerkung'=>$row['bemerkung']
		);
	}
}

if($result){
	echo json_encode($response);
} else {
	echo "false";
}
?>