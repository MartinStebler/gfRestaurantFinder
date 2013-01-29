var map;
var elem;
var markerArray = new Array();
var geocoder;
var mouseInside = false;


function addMarkerToDb(name, street, plz, city, country, address, phone, bemerkung){
	geocoder = new google.maps.Geocoder();
	geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
			var lat = results[0].geometry.location.lat().toString().split('.');
			lat = lat[0] + "." + lat[1].substr(0,6);
			var lng = results[0].geometry.location.lng().toString().split('.');
			lng = lng[0] + "." + lng[1].substr(0,6);
			alert("lat: "+lat+" &lng: "+lng);
			$.ajax({
			  type: 'GET',
			  url: 'http://martinstebler.ch/restaurantFinderAPI',
			  data: {'action':'addMarker', 'name':name, 'street':street, 'plz':plz, 'city':city, 'country':country, 'lat':lat, 'lng':lng, 'phone':phone, 'address':address, 'bemerkung':bemerkung},
			  success: function(data) {
					var json = jQuery.parseJSON(data);
					if(json.addMarker != "false"){
						if(json.exists == 'true'){
							$('#state-error').html('Restaurant existiert bereits.').slideDown();
							setTimeout(function() { 
								$('#state-error').html('');
								$('#state-error').fadeOut(); 
							}, 3000);
						} else {
							var id = json.id;
							//codeAddress(address, id);
							load(map);
							$('#addMarker').dialog('close');
							$('#state-highlight').html(name+' wurde hinzugefügt');
							$('#state-highlight').slideDown();
							setTimeout(function() { 
								$('#state-highlight').html('');
								$('#state-highlight').fadeOut(); 
							}, 3000);
						}
					} else {
						$('#state-error').html('Beim Hinzufügen des Restaurants ist ein Fehler aufgetreten.');
						$('#state-error').slideDown();
						setTimeout(function() { 
							$('#state-error').html('');
							$('#state-error').fadeOut();
						}, 3000);
					}
				}
			});
	   } else {
        	$('#state-error').html('Ort konnte nicht gefunden werden.').slideDown();
			setTimeout(function() { 
				$('#state-error').html('');
				$('#state-error').fadeOut(); 
			}, 3000);
      }
    });
	
}

function codeAddress(address, id) {
	
	geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        //In this case it creates a marker, but you can get the lat and lng from the location.LatLng
         /*var map = new google.maps.Map(document.getElementById("map"), {
	        center: new google.maps.LatLng(46.95284,7.446327),
	        zoom: 10,
	        mapTypeId: 'roadmap'
	      });*/
		var icon = new google.maps.MarkerImage("images/orangeR.png", null, null, null);
		var marker = new google.maps.Marker({
            map: map, 
			icon: icon,
            position: results[0].geometry.location,
			id: id
        });
		markerArray.push(marker);
		//addMarkerToDb(name, street, plz, city, country, marker.position.lat(), marker.position.lng(), address, bemerkung);
		map.setCenter(results[0].geometry.location);
		map.setZoom(16);
      } else {

        alert("Ort konnte nicht gefunden werden.");
      }
    });
  }

function load(map) {
	var infoWindow = new google.maps.InfoWindow;
	$.ajax({
		type: 'GET',
		  url: 'http://martinstebler.ch/restaurantFinderAPI/',
		  data: {'action':'getDataAll'},
		  success: function(data) {	
			var json = jQuery.parseJSON(data);
			if(json.getDataAll === 'false'){
				$('#state-error').html('Beim Laden der Restaurants ist ein Fehler aufgetreten.');
				$('#state-error').slideDown();
				setTimeout(function() { 
					$('#state-error').html('');
					$('#state-error').fadeOut();
				});
			} else {
				$.each(json, function(key, entry) { 
					var point = new google.maps.LatLng(
						//parseFloat(entry.lat),
						//parseFloat(entry.lng);
						entry.lat, 
						entry.lng
					);
					var html = "<span class=bold>" + entry.name + "</span><br/>" + entry.street + "<br/>" + entry.plz + " " + entry.city;
					var icon = new google.maps.MarkerImage(getIcon(entry.official), null, null, null);
					var marker = new google.maps.Marker({
						map: map,
						position: point,
						icon: icon,
						shadow: icon.shadow, 
						id: entry.id
					});
					markerArray.push(marker);
					bindInfoWindow(marker, map, infoWindow, html);
				});
			}
			//$('#resultList').html(html);
			//$('#resultList').slideDown();
		  }
		});
    
 // });
  

	// Try W3C Geolocation (Preferred)
	  if(navigator.geolocation) {
	    browserSupportFlag = true;
	    navigator.geolocation.getCurrentPosition(function(position) {
	      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	      map.setCenter(initialLocation);
	    }, function() {
	      handleNoGeolocation(browserSupportFlag);
	    });
	  // Try Google Gears Geolocation
	  } else if (google.gears) {
	    browserSupportFlag = true;
	    var geo = google.gears.factory.create('beta.geolocation');
	    geo.getCurrentPosition(function(position) {
	      initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
	      map.setCenter(initialLocation);
	    }, function() {
	      handleNoGeoLocation(browserSupportFlag);
	    });
	  // Browser doesn't support Geolocation
	  } else {
	    browserSupportFlag = false;
	    handleNoGeolocation(browserSupportFlag);
	  }
}

function getIcon(official){
	if(official==1){
		return "images/orangeR.png";
	}
	if(official==0){
		return "images/blackR.png";
	}
}

function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      //alert("Geolocation service failed.");
      initialLocation = "newyork";
    } else {
      //alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = "siberia";
    }
    //map.setCenter(initialLocation);
  }

function bindInfoWindow(marker, map, infoWindow, html) {
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent('<div class=infoWindow>'+html+'</div>');
    infoWindow.open(map, marker);
	var lat = Number(this.position.lat()).toFixed(6);
	var lng = Number(this.position.lng()).toFixed(6);
	getRestaurantDataViaCoordinates(lat, lng);
	var latLng = marker.getPosition();
	map.setCenter(latLng);
	map.setZoom(15);
	});
}

function getRestaurantData(id){
	$.ajax({
		type: 'GET',
		url: 'http://martinstebler.ch/restaurantFinderAPI/',
		data: {'action':'getData', 'id':id},
		success: function(data) {
			var json = jQuery.parseJSON(data);
			if(json.getData!='false'){
				setRestaurantDetails(json);
			}
		}
	});
}

function getRestaurantDataViaCoordinates(lat, lng){
	$.ajax({
		type: 'GET',
		url: 'http://martinstebler.ch/restaurantFinderAPI/',
		data: {'action':'getData', 'lat':lat, 'lng':lng, 'method':'coordinates'},
		success: function(data) {
			var json = jQuery.parseJSON(data);
			if(json.data!='false'){
				setRestaurantDetails(json);
			}
		}
	});
}

function setRestaurantDetails(data){

	$('#dName').html(data.name);
	$('#dStreet').html(data.street);
	$('#dPlz').html(data.plz);
	$('#dCity').html(data.city);
	setOfficial(data.official);
	$('#dLat').html(data.lat);
	$('#dLng').html(data.lng);
	setStateDate(data.state);
	setPhone(data.phone);
	setRating(data.rating);
	setDetailBorders();
	calcHeight();
	$('#dBemerkung').html(data.bemerkung);
}


function setStateDate(state){
	var dateArray = state.split("-");
	var date = dateArray[2]+"."+dateArray[1]+"."+dateArray[0];
	$('#dState').html("Stand: "+date + " (<img class=clockIcon src=images/clock.png></img>)");
}

function downloadUrl(url, callback) {
  var request = window.ActiveXObject ?
      new ActiveXObject('Microsoft.XMLHTTP') :
      new XMLHttpRequest;

  request.onreadystatechange = function() {
    if (request.readyState == 4) {
      request.onreadystatechange = doNothing;
      callback(request.responseText, request.status);
    }
  };

  request.open('GET', url, true);
  request.send(null);
}

function parseXml(str) {
  if (window.ActiveXObject) {
    var doc = new ActiveXObject('Microsoft.XMLDOM');
    doc.loadXML(str);
    return doc;
  } else if (window.DOMParser) {
    return (new DOMParser).parseFromString(str, 'text/xml');
  }
}

function doNothing() {}

function setDetailBorders(){
	$('.addressP').css('border-bottom', '1px dashed #e0cfc2');
	$('#dOfficial, #dRating, #dPhone, #dState').css('border-bottom', '1px dashed #e0cfc2');
}

function calcHeight(){
	//var mapHeight = Number($('#map').css('height').replace('px', ''));
	var mapHeight = $(window).height();
	var addHeight = Number($('#add').css('height').replace('px', ''));
	var resultsHeight = Number($('#results').css('height').replace('px', ''));
	var barHeight = Number($('.titleBar').css('height').replace('px', ''));
	var searchFormContainerHeight = Number($('#searchFormContainer').css('height').replace('px', ''));
	var newDetailsHeight = mapHeight - resultsHeight - addHeight - searchFormContainerHeight - addHeight;
	$('#detailsContainer').css('height', newDetailsHeight+'px');
	var addressPHeight = Number($('#detailsContainer').children().first().css('height').replace('px', ''));
	var dPhoneHeight = Number($('#dPhone').css('height').replace('px', ''));
	var dRatingHeight = Number($('#dRating').css('height').replace('px', ''));
	var dOfficialHeight = Number($('#dOfficial').css('height').replace('px', ''));
	var dStateHeight = Number($('#dState').css('height').replace('px', ''));
	var defHeight = newDetailsHeight-(addressPHeight+dPhoneHeight+dRatingHeight+dOfficialHeight+dStateHeight+120);
	$('#dBemerkung').css('max-height', defHeight+'px');
}

function setPhone(phone){
	if(phone!='-'){
		$('#dPhone').html(phone);
		$('#dPhone').show();
	} else {
		$('#dPhone').hide();
	}
}

function setOfficial(official){
	if(official==0){
		$('#dOfficial').html('Kein offizielles Restaurant.');
	}
	if(official==1){
		$('#dOfficial').html('Offizielles Restaurant <img class=tickIcon src=images/tick.png></img>');
	}
}

function setRating(data){
	if(parseInt(data)==0){
		$('#dRating').html('Keine Empfehlungen (<img id=thumbIcon src=images/ThumbIcon.png></img>)');
	}
	if(parseInt(data)==1){
		$('#dRating').html('1 Empfehlung (<img id=thumbIcon src=images/ThumbIcon.png></img>)');
	}
	if(parseInt(data) > 1){
		$('#dRating').html(data+' Empfehlungen (<img id=thumbIcon src=images/ThumbIcon.png></img>)');
	}
}

function setCookie(cookieName,cookieValue) {
 var today = new Date();
 var expire = new Date();
 var nDays=365*20;
 expire.setTime(today.getTime() + 3600000*24*nDays);
 document.cookie = cookieName+"="+escape(cookieValue)
                 + ";expires="+expire.toGMTString();
}

function readCookie(cookieName) {
 var theCookie=" "+document.cookie;
 var ind=theCookie.indexOf(" "+cookieName+"=");
 if (ind==-1) ind=theCookie.indexOf(";"+cookieName+"=");
 if (ind==-1 || cookieName=="") return "";
 var ind1=theCookie.indexOf(";",ind+1);
 if (ind1==-1) ind1=theCookie.length; 
 return unescape(theCookie.substring(ind+cookieName.length+2,ind1));
}