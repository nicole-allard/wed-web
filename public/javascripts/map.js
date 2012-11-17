$(function() {
	var mapOptions = {
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
	var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        var size = [500, 600]
	
	var homeMarker = new google.maps.Marker({
   		'map': map, 
   		'position': new google.maps.LatLng(37.79083, -122.409154),
   		'title': 'Our Appartment',
   		'icon': new google.maps.MarkerImage(
   			'/images/map-pin-home.png',
			null,
			null,
			null,
			new google.maps.Size(33, 40)
   		)
   	});

	var venuMarker = new google.maps.Marker({
   		'map': map,
   		'position': new google.maps.LatLng(37.761836, -122.422917),
   		'title': 'Farina Focaccia & Cucina Italiana',
   		'icon': new google.maps.MarkerImage(
   			'/images/map-pin-venue.png',
			null,
			null,
			null,
			new google.maps.Size(33, 40)
   		)
   	});
   	
   	var hotelMayFlower = new google.maps.Marker({
   		'map': map,
   		'position': new google.maps.LatLng(37.789308, -122.413283),
   		'title': 'The Hotel Mayflower',
   		'icon': new google.maps.MarkerImage(
   			'/images/map-pin-hotel.png',
			null,
			null,
			null,
			new google.maps.Size(33, 40)
   		)
   	})
   	
   	var bounds = 
   		(new google.maps.LatLngBounds(homeMarker.getPosition(), homeMarker.getPosition()))
   		.union(new google.maps.LatLngBounds(venuMarker.getPosition(), venuMarker.getPosition()));
   			
   	map.fitBounds(bounds);
});
