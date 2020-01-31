function initialize2() {
		  
	mapProp2 = {
		    center: new google.maps.LatLng(51.508742,-0.120850),
		    zoom: 14,
		      draggable: false,
		      scrollwheel: false,
		      mapTypeId: google.maps.MapTypeId.TERRAIN
		  };

		  map2 = new google.maps.Map(document.getElementById("map-canvas2"), mapProp2);
		
		return map2;
		}
		
		
		

function b(){
$("#mapTab2").on('shown.bs.tab', function() {
	google.maps.event.addDomListener(window, "resize", function() {
	    var center = map2.getCenter();
  	/* Trigger map resize event */
	google.maps.event.trigger(map2, 'resize');
	  map2.setCenter(center); 
	});
});
}