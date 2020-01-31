function initialize3() {
        
	mapProp3 = {
	          center: new google.maps.LatLng(37.567835,126.986357),
	          zoom: 13,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };

        map3 = new google.maps.Map(document.getElementById("map-canvas3"), mapProp3);
      
        return map3;
        
      }
      
      
function step3(){
$("#mapTab3").on('shown.bs.tab', function() {

     /* Trigger map resize event */
   google.maps.event.trigger(map3, 'resize');
});

}