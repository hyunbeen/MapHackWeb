<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Daum 지도 시작하기</title>
	//지도를 넣기 위해 발급키 불러오기
  <script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=initMap" type="text/javascript"> </script>
 
 
	<script>
 function initMap() {
     var uluru = {lat: 37.567835, lng: 126.986357};
     var uluru2 = {lat: 39.567835, lng: 128.986357};
     var map = new google.maps.Map(document.getElementById('map'), {
       zoom: 18,
       center: uluru
     });
     var marker = new google.maps.Marker({
       position: uluru,
       map: map
     });
      
      
     var map2 = new google.maps.Map(document.getElementById('map2'), {
         zoom: 18,
         center: uluru2
       });
     var marker2 = new google.maps.Marker({
         position: uluru2,
         map: map2
       });
      
     google.maps.event.addDomListener(window, "load", initMap);
   }
    </script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<div id="map2" style="width:500px;height:400px;"></div>
	
</body>
</html>