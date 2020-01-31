function initialize3() {
		  
	mapProp3 = {
		    center: new google.maps.LatLng(51.508742,-0.120850),
		    zoom: 14,
		      draggable: false,
		      scrollwheel: false,
		      mapTypeId: google.maps.MapTypeId.SATELLITE

		  };

		  map3 = new google.maps.Map(document.getElementById("map-canvas3"), mapProp3);
		
		  return map3;
		  
		}
		
		
function c(){
$("#mapTab3").on('shown.bs.tab', function() {

  	/* Trigger map resize event */
	google.maps.event.trigger(map3, 'resize');
});

}