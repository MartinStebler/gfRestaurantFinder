<?php
include("dbconnect.php");

$id = $_POST['id'];


$query = 'SELECT id, rating FROM markers WHERE id = '.$id.' LIMIT 1';
$result = mysql_query($query);
$id = 0;
$rating = 0;
if(mysql_num_rows($result)==1){
	while ($row = @mysql_fetch_assoc($result)){
		$id = $row['id'];
		$rating = $row['rating'];
	}
	$rating = $rating + 1;
	$query = 'UPDATE markers SET rating = '.$rating.' WHERE id = '.$id;
	$result = mysql_query($query);
	if($result){
		$response = array('id'=>$id, 'rating'=>$rating);
		echo json_encode($response);
	} else {
		echo "false";
	}
}

?>