<?php  
$username = "root";
$password = "";
$database = "restaurantFinder";

// Start XML file, create parent node

$dom = new DOMDocument("1.0");
$node = $dom->createElement("markers");
$parnode = $dom->appendChild($node); 

// Opens a connection to a MySQL server

$connection=mysql_connect (localhost, $username, $password);
if (!$connection) {  die('Not connected : ' . mysql_error());} 

// Set the active MySQL database

$db_selected = mysql_select_db($database, $connection);
if (!$db_selected) {
  die ('Can\'t use db : ' . mysql_error());
} 
$res = mysql_query("set names 'utf8';"); 
// Select all the rows in the markers table

/*$method = $_GET['method'];
$radius = $_GET['radius'];
if($method == 'city'){
	$query = "SELECT * FROM markers WHERE 1";
}
if($method == 'name'){
	$query = "SELECT * FROM markers WHERE 1";
}
if($method == 'radius'){
	$query = 'SELECT id, ( 6371 * acos( cos( radians(37) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(-122) ) + sin( radians(37) ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < "'.$radius.'" ORDER BY distance';
}*/

$query = "SELECT * FROM markers";
$result = mysql_query($query);
if (!$result) {  
  die('Invalid query: ' . mysql_error());
} 

header("Content-type: text/xml"); 

// Iterate through the rows, adding XML nodes for each

while ($row = @mysql_fetch_assoc($result)){  
  // ADD TO XML DOCUMENT NODE  
  $node = $dom->createElement("marker");  
  $newnode = $parnode->appendChild($node);  
 $newnode->setAttribute("id",$row['id']);
  $newnode->setAttribute("name",$row['name']);
$newnode->setAttribute("city", $row['city']); 
$newnode->setAttribute("street", $row['street']); 
$newnode->setAttribute("plz", $row['plz']); 
$newnode->setAttribute("country", $row['country']); 
  $newnode->setAttribute("address", $row['address']);  
  $newnode->setAttribute("lat", $row['lat']);  
  $newnode->setAttribute("lng", $row['lng']);  
  $newnode->setAttribute("official", $row['official']);
  $newnode->setAttribute("bemerkung", $row['bemerkung']);
} 

echo $dom->saveXML();

?>