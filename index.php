<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>RestaurantFinder | Glutenfrei!</title>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script src=lib/jquery-1.7.2.min.js></script>
	<script src=lib/jquery-ui-1.8.20.custom.min.js></script>
	<script src=lib/map.js></script>
	<script src=lib/application.js></script>
	<link rel=stylesheet href=lib/jquery-ui-1.8.20.custom.css type=text/css>
	<link rel=stylesheet href=style.css type=text/css>
    <link href='http://fonts.googleapis.com/css?family=Coming+Soon' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Overlock:400,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Chau+Philomene+One' rel='stylesheet' type='text/css'>
</head>
 <body>
	<div id=headerbar>
		gfRestaurantFinder
		<span class=contact><a href="mailto:contact@martinstebler.ch"><img id=contactIcon src="images/mail.png"></img></a></span>
	</div>
	<p class="ui-state-error" id=state-error>
	<p class="ui-state-highlight" id=state-highlight>
	</p>
    <div id="map" ></div>
	<div id=search>
		<div id=add>
			<p id=addBar class=titleBar>Restaurant hinzufügen</p>
		</div>
		<div id=searchFormContainer>
			<p id=searchTitleBar class=titleBar>Suchen</p>
			<form id=searchForm method=post action="">
				<span class=formDesc>Ort: </span><input type=text id=key name=key/><br/>
				<span class=formDesc>Umkreis: </span>
					<select id=radius name=radius>
						<option>5</option>
						<option>10</option> 
						<option>25</option> 
						<option>50</option> 
						<option>75</option> 
						<option>100</option>
					</select>km
				<button type=button id=submitSearch class="ui-state-default button">Suchen</button>
			</form>
		</div>
		<div id=results>
			<p class=titleBar>Resultate</p>
			<div id=resultListContainer>
				<ul id=resultList>
				</ul>
			</div>
		</div>
		<div id=details>
			<p class=titleBar>Details</p>
			<div id=detailsContainer>
				<p class=addressP>
					<span id=dName></span><br/>
					<span id=dStreet></span><br/>
					<span id=dPlz></span> 
					<span id=dCity></span><br/>
				</p>
				<p id=dPhone></p>
				<p id=dRating></p>
				<p id=dOfficial></p>
				<p id=dState></p>
				<span id=dLat></span>
				<span id=dLng></span>
				<div id=dBemerkung></div><br/>
			</div>
		</div>
	</div>
	<div id="addMarker" title="Restaurant hinzufügen">
		<form id=addMarkerForm method=post action="">
			<input type=text id=name name=name value="Name des Restaurants*">
			<input type=text id=street name=street value="Strasse / Nr.">
			<input type=text id=plz name=plz value="PLZ*">
			<input type=text id=city name=city value="Ort*">
			<input type=text id=phone name=phone value="Telefonnummer">
			<input type=text id=country name=country value="Land*">
			<textarea id=bemerkung>Bemerkung..</textarea><br/>
			<button type=button class="ui-state-default button" id=submitMarker>Hinzufügen</button>
		</form>
	</div>
	<div id=welcome title="Willkommen!">
		<p id=welcomeText>
			Herzlichen Willkommen!<br/>
			<input type=checkbox id=welcomeBox /> Nicht mehr anzeigen
		</p>
	</div>
  </body>

</html>