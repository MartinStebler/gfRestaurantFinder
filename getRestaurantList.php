<?php
include("dbconnect.php");

$radius = $_GET['radius'];
$lat = $_GET['lat'];
$lng = $_GET['lng'];
$key = $_GET['key'];
//$query = 'SELECT id, rating, official, lat, phone, lng, city, name, plz, street, country, bemerkung, ( 6371 * acos( cos( radians('.$lat.') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('.$lng.') ) + sin( radians('.$lat.') ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < '.$radius.' ORDER BY distance';
$query = 'SELECT id, name, ( 6371 * acos( cos( radians('.$lat.') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('.$lng.') ) + sin( radians('.$lat.') ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < '.$radius.' ORDER BY distance';
$result = mysql_query($query);
if(mysql_num_rows($result)>0){
	$response = array();
	while ($row = @mysql_fetch_assoc($result)){
		$code = "";
		$official = handleOfficial($row['official']);
		$sameCity = handleCity($row['city']);
		$distance = handleDistance($row['distance']);
		$entry =  array (
			"id"=>$row['id'],
			"name"=>$row['name'],
			"distance"=>$row['distance']
			/*'name'=>$row['name'], 
			'lat'=>$row['lat'], 
			'lng'=>$row['lng'], 
			'street'=>$row['street'], 
			'city'=>$row['city'], 
			'plz'=>$row['plz'],
			'country'=>$row['country'];
			'bemerkung'=>$row['bemerkung'];
			'phone'=>$row['phone'];
			'rating'=>$row['rating'],
			'official'=>$official, 
			'distance'=>$distance,
			'sameCity'=>$sameCity*/
		);
		array_push($response, $entry);
	}
	echo json_encode($response);
		/*if(strtolower($key) == strtolower($row['city'])){
			$code = '<li class=resultListItem>'.$row['name'].'<span class=latValue>'.$row['lat'].'</span><span class=lngValue>'.$row['lng'].'</span><span class=name>'.$row['name'].'</span><span class=street>'.$row['street'].'</span><span class=city>'.$row['city'].'</span><span class=country>'.$row['country'].'</span><span class=plz>'.$row['plz'].'</span><span class=bemerkung>'.$row['bemerkung'].'</span><p class=phone>'.$row['phone'].'</p><span class=rating>'.$row['rating'].'</span><span class=official>'.$official.'</span></li>';
		} else {
		
			$code = '<li class=resultListItem>'.$row['name'].' <span class=latValue>'.$row['lat'].'</span><span class=lngValue>'.$row['lng'].'</span><span class=distance>('.$distance.' km)</span><span class=name>'.$row['name'].'</span><span class=street>'.$row['street'].'</span><span class=city>'.$row['city'].'</span><span class=country>'.$row['country'].'</span><span class=plz>'.$row['plz'].'</span><span class=bemerkung>'.$row['bemerkung'].'</span><p class=phone>'.$row['phone'].'</p><span class=rating>'.$row['rating'].'</span><span class=official>'.$official.'</span></li>';
		}*/
} else {
	echo 'false';
}

function handleDistance($distance){
	return round($distance, 1);
}

function handleCity($city){
	if(strtolower($key) == strtolower($city)){
		return true;
	} else {
		return false;
	}
}

function handleOfficial($official){
	if($official==0){
		//$official = 'Keine offizielles Restaurant.';
		$official = false;
	}
	if($official==1){
		//$official = 'Offizielles Restaurant <img class=tickIcon src=images/tick.png></img>';
		$official = true;
}
	return $official;
}
?>