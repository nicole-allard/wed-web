$(function() {
	var mapOptions = {
      center: new google.maps.LatLng(37.7837486, -122.4077904),
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
	var map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
            
	var homeMarker = new google.maps.Marker({
   		'map': map, 
   		'position': new google.maps.LatLng(37.79083, -122.409154),
   		'title': 'Our Appartment'
   	});

	var venuMarker = new google.maps.Marker({
   		'map': map,
   		'position': new google.maps.LatLng(37.761836, -122.422917),
   		'title': 'Farina Focaccia & Cucina Italiana'
   	});
});
