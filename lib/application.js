$(document).ready(function() {
	
	
	map = new google.maps.Map(document.getElementById("map"), {
	    center: new google.maps.LatLng(46.95284,7.446327),
	    zoom: 7,
	    mapTypeId: 'roadmap'
	  });
	  
	load(map);

	$(window).resize(function() {
		if($('#bemerkung').html()!=""){
			calcHeight();
		}
	});

	
	$('#detailsContainer').hover(function(){ 
	        mouseInside=true; 
	    }, function(){ 
	        mouseInside=false; 
	    });

	    $("body").mouseup(function(){ 
	        if(! mouseInside) {
				$('#dName').html('');
				$('#dStreet').html('');
				$('#dPlz').html('');
				$('#dCity').html('');
				$('#dBemerkung').html('');
				$('#dPhone').html('');
				$('#dRating').html('');
				$('#dOfficial').html('');
				$('#dState').html('');
				$('.addressP, #dOfficial, #dRating, #dPhone, #dState').css('border-bottom', 'none');
				$('.resultListItem').css('background-color', '');
			}
	    });
		
	$('#thumbIcon').live('click', function(){
		var lat = $('#dLat').html();
		var lng = $('#dLng').html();
		//get cookie
			$.ajax({
			  type: 'GET',
			  url: 'http://martinstebler.ch/restaurantFinderAPI',
			  data: {'action':'getData', lat:lat, lng:lng, method:'coordinates'},
			  success: function(data) {
				var json = jQuery.parseJSON(data);
				if(json.getData != 'false'){
					var id = json.id;
					var cookie = readCookie(id);
					if(cookie!='rated'){
						$.ajax({
						  type: 'GET',
						  url: 'http://martinstebler.ch/restaurantFinderAPI',
						  data: {'action':'rate', 'id':id},
						  success: function(data) {
							var response = jQuery.parseJSON(data);
							if(response.rate != 'false'){
								var rating = response.rating;
								var id = response.id;
								if(data!='false'){
									setRating(rating);
									setCookie(id, 'rated');
								}
							} else {
								$('#state-error').html('Beim Rating ist ein Fehler aufgetreten.');
								$('#state-error').slideDown();
								setTimeout(function() { 
									$('#state-error').html('');
									$('#state-error').fadeOut();
								}, 3000);
							}
						  }	
						});
					}
				} else {
					$('#state-error').html('Beim Rating ist ein Fehler aufgetreten.');
					$('#state-error').slideDown();
					setTimeout(function() { 
						$('#state-error').html('');
						$('#state-error').fadeOut();
					}, 3000);
				}
			}
		
			});
	});	
	
	$('.clockIcon').live('click', function(){
		var lat = $('#dLat').html();
		var lng = $('#dLng').html();
		//get cookie
			$.ajax({
			  type: 'GET',
			  url: 'http://martinstebler.ch/restaurantFinderAPI',
			  data: {'action':'getData', lat:lat, lng:lng, method:'coordinates'},
			  success: function(data) {
				var json = jQuery.parseJSON(data);
				if(json.getData != 'false'){
					var id = json.id;
					var cookie = readCookie(id);
					if(cookie!='rated'){
						$.ajax({
						  type: 'GET',
						  url: 'http://martinstebler.ch/restaurantFinderAPI',
						  data: {'action':'updateState', 'id':id},
						  success: function(data) {
							var response = jQuery.parseJSON(data);
							if(response.rate != 'false'){
								if(data!='false'){
									setStateDate(response.date);
								}
							} else {
								$('#state-error').html('Beim Aktualisieren des Datums ist ein Fehler aufgetreten.');
								$('#state-error').slideDown();
								setTimeout(function() { 
									$('#state-error').html('');
									$('#state-error').fadeOut();
								}, 3000);
							}
						  }	
						});
					}
				} else {
					$('#state-error').html('Beim Aktualisieren des Datums ist ein Fehler aufgetreten.');
					$('#state-error').slideDown();
					setTimeout(function() { 
						$('#state-error').html('');
						$('#state-error').fadeOut();
					}, 3000);
				}
			}
		
			});
	});	
		
	$('.resultListItem').live('click', function(){
		var id = $(this).attr('id');
		if(elem !== undefined){
			$(elem).css('background-color', ''); 
		}
		$(this).css('background-color', '#CB842E');
		for(var i = 0;i<markerArray.length;i++){
			if(markerArray[i].id == id){
				google.maps.event.trigger(markerArray[i], 'click');
				map.setCenter(markerArray[i].position);
			}
		}
		elem = $(this);
		getRestaurantData(id);
	});
	
	$('#addMarker input').click(function() {
		$(this).val('');
	});
	
	$('#addMarker textarea').click(function() {
		$(this).val('');
	});
	
	$('#addMarker input').blur(function() {
		var id = $(this).attr('id');
		if($(this).val()==''){
			if(id=='name'){
				$(this).val('Name des Restaurants*');
			}
			if(id=='plz'){
				$(this).val('PLZ*');
			}
			if(id=='city'){
				$(this).val('Telefonnummer');
			}
			if(id=='phone'){
				$(this).val('Ort*');
			}
			if(id=='country'){
				$(this).val('Land*');
			}
		}
	});
	
	$('#addMarker').dialog({
		height: "310",
		modal: true,
		resizable: false, 
		autoOpen: false
	});
	
	$('#welcome').dialog({
		height: "500",
		modal: true,
		resizable: false,
		autoOpen: false,
		close: function(){
			if($('#welcomeBox').val()=='on'){
				setCookie('welcome', '1');
			}
		}
	});
	
	var cookie = readCookie('welcome');
	if(cookie!=1){
		//$('#welcome').dialog('open');
	}
	
	$('#submitSearch').click(function(){
		$('#searchForm').submit();
	});
	
	$('#submitMarker').click(function(){
		var name = $('#name').val();
		var plz = $('#plz').val();
		var ort = $('#city').val();
		var country = $('#country').val();
		var street = $('#street').val();
		var bemerkung = $('#bemerkung').html();
		var phone = $('#phone').html();
		var error = false;
		if(name == '' || name == 'Name des Restaurants*' || plz == '' || plz == 'PLZ*' || ort == '' || ort == 'Ort*' || country == '' || country == 'Land*'){
			error = true;
		}
		if(street == 'Strasse/Nr.' || bemerkung == 'Bemerkung'){
			error = true;
		}
		if(error){
			$('#state-error').html('Bitte alle obligatorischen Felder ausfüllen!');
			$('#state-error').slideDown();
			setTimeout(function() { 
				$('#state-error').html('');
				$('#state-error').fadeOut(); 
			}, 3000);
			//return false;
		} else {
			
			$('#addMarkerForm').submit();
		}
		
	});
	
	$('#addBar').click(function(){
		$('#addMarker').dialog('open');
	});
	
	$('#addMarkerForm').submit(function(){
		var name = $('#name').val();
		var street = $('#street').val();
		var plz = $('#plz').val();
		var city = $('#city').val();
		var bemerkung = $('#bemerkung').val();
		var country = $('#country').val();
		var phone = $('#phone').val();
		var address = street + " " + plz + " " + city + " " + country;

		//codeAddress(name, street, plz, city, country, address, bemerkung); 
		addMarkerToDb(name, street, plz, city, country, address, phone, bemerkung);
		//$(this).children('input').val('');
		
		return false;
	});
	
	$('#searchForm').submit(function(){
		var key = $('#key').val();
		var radius = $('#radius').val();
		var method = 1;
		if(method == 1){
			geocoder = new google.maps.Geocoder();
			    geocoder.geocode( { 'address': key}, function(results, status) {
			      if (status == google.maps.GeocoderStatus.OK) {
			        //In this case it creates a marker, but you can get the lat and lng from the location.LatLng
			        map.setCenter(results[0].geometry.location);
					map.setZoom(15);
					var html = '';
					$.ajax({
					  type: 'GET',
					  url: 'http://martinstebler.ch/restaurantFinderAPI',
					  data: {'action':'getList', method:'city', key:key, lat:results[0].geometry.location.lat(), lng:results[0].geometry.location.lng(), radius:radius},
					  success: function(data) {
						var json = jQuery.parseJSON(data);
						if(json.getList === 'false'){
							html = '<li class=liNone>Keine Ergebnisse.</li>';
						} else {
							$.each(json, function(key, entry) { 
								entryHtml = '<li id='+entry.id+' class=resultListItem>'+entry.name;
								if(entry.sameCity){
									entryHtml += '<span class=distance>('+entry.distance+' km)</span>';
								}
								entryHtml += '</li>';
								html  = html + entryHtml;								
							});
						}
						$('#resultList').html(html);
						$('#resultList').slideDown();
					  }
					
					});
			      } else {
					$('#state-error').html('Ort konnte nicht gefunden werden').slideDown();
					setTimeout(function() { 
						$('#state-error').html('');
						$('#state-error').fadeOut(); 
					}, 3000);
			        //alert("Ort konnte nicht gefunden werden.");
			      }
			    });

		}
		if(method == 2){
			$.ajax({
			  type: 'GET',
			  url: 'http://martinstebler.ch/restaurantFinderAPI',
			  data: {'action':'getList', method:'name', key:key},
			  success: function(data) {
			    alert(data);
			  }
		
			});
			//setCenter
		}
		return false;
	});
});