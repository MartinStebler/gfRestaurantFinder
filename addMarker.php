<?php  
include("dbconnect.php");

$name = $_POST['name'];
$street = $_POST['street'];
$country = $_POST['country'];
$plz = $_POST['plz'];
$city = $_POST['city'];
$lat = $_POST['lat'];
$lng = $_POST['lng'];
$address = $_POST['address'];
$bemerkung = $_POST['bemerkung'];

// get phone number
$wasArray = explode(" ", $name);
$was = "";
foreach ($wasArray as &$value) {
    $was = $was."+".$value;
}
$wo = $street."+".$plz."+".$city;
$wo = str_replace(" ", "+", $wo);
$params = 'was='.$was.'&wo='.$wo.'&key=f07304ab7eeb9e0cfa82366286d755e5';

$response = file_get_contents('http://tel.search.ch/api/?'.$params);

$phoneArray = explode("<tel:phone>", $response);

$phoneArray = explode("</tel:phone>", $phoneArray[1]);
$phone = $phoneArray[0];
$vorwahl = substr($phone, 0, 3);
$ortwahl = substr($phone, 4, -5);
$first = substr($phone, 7, -3);
$second = substr($phone, -2);
$phonenumber = $vorwahl." ".$ortwahl." ".$first." ".$second;
if(strlen($phonenumber) < 10){
	$phonenumber = '-';
}

$sql = 'SELECT id FROM markers WHERE lat='.$lat.' AND lng='.$lng;
$result = mysql_query($sql);
if(mysql_num_rows($result)>0){
	echo 'exists';
}
else {
	$sql = 'INSERT INTO markers (name, street, country, plz, city, lat, lng, address, bemerkung, phone) VALUES ("'.$name.'", 	"'.$street.'", "'.$country.'", "'.$plz.'", "'.$city.'", "'.$lat.'", "'.$lng.'", "'.$address.'", "'.$bemerkung.'", "'.$phonenumber.'")';
	$result = mysql_query($sql);
	if($result){
		$sql = 'SELECT id FROM markers WHERE lat = '.$lat.' AND lng = '.$lng;
		$result2 = mysql_query($sql);
		if($result2){
			$response = array('id'=>$result2);
		} else {
			$response = array('success'=>'false');
		}
	}	 else {
		$response = array('success'=>'false');
	}

	echo json_encode($response);
}


function toArray($xml) {
        $array = json_decode(json_encode($xml), TRUE);
        
        foreach ( array_slice($array, 0) as $key => $value ) {
            if ( empty($value) ) $array[$key] = NULL;
            elseif ( is_array($value) ) $array[$key] = toArray($value);
        }

        return $array;
    }
?>