function initialize1() {
	mapProp = {
		    center: new google.maps.LatLng(51.508742,-0.120850),
		    zoom: 14,
		      draggable: false,
		      scrollwheel: false,
		      mapTypeId: google.maps.MapTypeId.ROADMAP
		  };
	
	 map = new google.maps.Map(document.getElementById("map-canvas"), mapProp);

	return map;
	}

function a(){
$("#mapTab").on('shown.bs.tab', function() {

  	/* Trigger fmap resize event */
	google.maps.event.trigger(map, 'resize');
});
}