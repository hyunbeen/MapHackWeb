<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/fl-bigmug-line.css">
    <script src="/MapHack/resource/main/js/core.min.js"></script>
    <script src="/MapHack/resource/main/js/script.js"></script>
<script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=initTabMap" type="text/javascript"> </script>
<script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=init" type="text/javascript"> </script>
<style>
[type="checkbox"].filled-in.tabbed:checked:focus + label:after {
    border-radius: 2px;
    background-color: #ff6f00;
    border-color: #e65100;
}

[type="checkbox"].filled-in:checked + label:after {
    top: 0;
    width: 20px;
    height: 20px;
    border: 2px solid #ff6f00;
    background-color:  #e65100;
    z-index: 0;
}

/* Map inside tab */
#map_1 {
    height: 438px;
    width: 100%;
    box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}


/* Map outside tab */
#map_2 {
    height: 438px;
    width: 80%;
  margin-left: 10%;
    box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}


.section {
  margin-top: 50px;
  background: lightblue;
}
</style>
<script>
/* Google Map inside of tab */
function initTabMap() {
  // Google Map Options
  var mapOptions1 = {
    // How zoomed in you want the map to start at (always required)
    zoom: 10,

    // The latitude and longitude to center the map (always required)
    center: new google.maps.LatLng(41.82399, -71.41283), // Providence, RI

    // Map Styling
    styles: [{
      "featureType": "administrative.country",
      "elementType": "geometry",
      "stylers": [{
        "visibility": "simplified"
      }, {
        "hue": "#ff0000"
      }]
    }]
  };

  // Get the HTML DOM element that will contain your map
  //  div id="map_2"
  var mapElement1 = document.getElementById('map_1');

  // Create the Google Map using our element and options defined above
  var map1 = new google.maps.Map(mapElement1, mapOptions1); /* Tab Map */

  /* Providence Marker */
  var marker1 = new google.maps.Marker({
    position: new google.maps.LatLng(41.82399, -71.41283),
    map: map1,
    title: 'Somewhere around here!'
  });

}

/* Google Map outside of tabs */
function init() {
  // Google Map Options
  var mapOptions = {
    // How zoomed in you want the map to start at (always required)
    zoom: 10,

    // The latitude and longitude to center the map (always required)
    center: new google.maps.LatLng(41.82399, -71.41283), // New York

    // How you would like to style the map.
    // This is where you would paste any style found on Snazzy Maps.
    styles: [{
      "featureType": "administrative.country",
      "elementType": "geometry",
      "stylers": [{
        "visibility": "simplified"
      }, {
        "hue": "#ff0000"
      }]
    }]
  };

  // Get the HTML DOM element that will contain your map
  // div id="map" 
  var mapElement2 = document.getElementById('map_2');

  // Create the Google Map using our element and options defined above
  var map = new google.maps.Map(mapElement2, mapOptions);

  /* Providence Marker */
  var marker1 = new google.maps.Marker({
    position: new google.maps.LatLng(41.82399, -71.41283),
    map: map,
    title: 'Somewhere around here!'
  });

}

function waitForMap() {
  setTimeout(function() {
    if ($('#google-map-tab').is(':visible')) {
      initTabMap();
    } else {
      waitForMap();
    }
  }, 100);
}

waitForMap(); // Intialize google map inside tab

// When the window has finished loading create our google map below
google.maps.event.addDomListener(window, 'load', init);
//google.maps.event.addDomListener(window, 'load', initTabMap);
</script>
</head>
<body>
<div class="row">
  <div class="col s12 railwayBold">
    <ul class="tabs scrollable">
      <li class="tab col s3"><a href="#test1">Test 1</a></li>
      <li class="tab col s3"><a href="#test2" class="active">Test 2</a></li>
      <li class="tab col s3"><a href="#google-map-tab">Google Map</a></li>
    </ul>
  </div>
</div>
<div class="row">
  <div id="test1" class="col s12">
    <h3 class="center-align">Test 1</h3>


    <div class="row">
      <p class="center-align">
        <input type="checkbox" class="filled-in mic" id="filled-in-box" checked="checked" />

        <label for="filled-in-box">
      </p>
    </div>
  </div>
  <div id="test2" class="col s12">
    <h3 class="center-align">Test 2</h3></div>
  <div id="google-map-tab" class="col s12">
    <!-- GOOGLE MAP -->
    <div class="col s8 offset-s2">
      <div id="map_1"></div>
    </div>

  </div>
</div>


<div class="section center-align">
  <div class="center-align">
    <div id="map_2"></div>
  </div>
</div>
</body>
</html>