<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="maphack.infodetail.common.InfoDetail" %>
<%@ page import="maphack.infodetail.common.InfoVO" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
 <link rel="stylesheet" href="/MapHack/resource/makemap/css/step2slider.css">
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//maps.google.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=initialize"></script>
<!-- 슬라이더전용 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript 슬라이더용 css -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="/MapHack/resource/makemap/js/step1.js"></script>

<script>
window.onload = function(){
   var mapTab = document.getElementById("mapTab");
   var mapTab2 = document.getElementById("mapTab2");
   var mapTab3 = document.getElementById("mapTab3");
   var step1 = document.getElementById("step1");
   var step2 = document.getElementById("step2");
   var step3 = document.getElementById("step3");
     
}
</script>



<!-- 스타일 적용 -->
<style type="text/css">


#teste {
  height:800px;
  width: 100%;
}
</style>

</head>


<body>  

    <div class="page" style="margin-top: -40px;">
    <jsp:include page="/WEB-INF/view/include/header.jsp"/>
<!--  섹션으로 구역 정해줌  -->
    <section class="section section-lg bg-white text-center">
        <div class="shell" style="margin-left: 0px;margin-right: 0px;">
              <div class="tabs-custom tabs-horizontal tabs-buttons" id="tabs-4">
             <!--  탭 타이틀 -->
                <ul id="tabs" class="nav nav-tabs" data-tabs="tabs" >
                  <li class="active" style="margin-left: 0px;"><a id="mapTab" class="button-nina" href="#step1" data-toggle="tab" style="border-radius: 6px;"><span style="font-size:9px; color: green;">step 1 : </span>지도정보검색</a></li>
                  <li style="margin-left: 0px;"><a id="mapTab2" class="button-nina" href="#step2" data-toggle="tab" style="border-radius: 6px;"><span style="font-size:9px; color: green;">step 2 : </span>여행짜기</a></li>
                  <li style="margin-left: 0px;"><a id="mapTab3" class="button-nina" href="#step3" data-toggle="tab" style="border-radius: 6px;"><span style="font-size:9px; color: green;">step 3 : </span>그룹방개설</a></li>
                </ul>
            
        <!--  탭 본문(contents) : step1.jsp/ step2.jsp/ step3.jsp에 분리되어있음 -->      
          <div id="my-tab-content" class="tab-content" style="padding-top: 0px;">
            <!--  탭1 -->
                  <div class="tab-pane fade in active" id="step1">
                   <jsp:include page="/step1.mh"/>
                  </div>
               <!--  탭2 -->          
                  <div class="tab-pane fade" id="step2">
                  <div class="row">
	                  <div id="iFrameDiv" style="width: 1695px;" class="row">
	<!--                   <iframe id="step2iframe" src="" framebolder="1" style=" width: 100%; height: 4880px; marginwidht:0; marginheight:0; border-top-width: 0px; border-bottom-width: 0px;  border-right-width: 0px; border-left-width: 0px;" scrolling="yes"></iframe> -->
	                  <iframe id="step2iframe" class="col-md-12" src="" framebolder="1" style="height: 20980px;  scrolling="yes"></iframe>
	
	<!--                   step2 동적 탭 아이프레임 -->
	                  </div>
                  </div>
                  
                  
                  </div>
               <!--  탭3 -->       
                  <div class="tab-pane fade" id="step3">
<%--                 <jsp:include page="/step3.mh"/> --%>
                  </div>
                </div>
              </div>
        </div>
      </section>
<!-- 섹션끝 -->
<!-- 해당페이지끝 -->
    </div>


<script src="/MapHack/resource/makemap/js/step1.js"></script>
<!-- <script src="/MapHack/resource/makemap/js/step2.js"></script> -->
<script type="text/javascript">
//맵 resize 함수
$(document).ready(function () {
   
   $('#mapTab2').trigger('click');
   
   $('#mapTab').trigger('click');

});


//step1 맵 초기화 함수
function initialize() {
   
     initialize1(); //step1
     step1(); //step1
     
}    
initialize();




</script>






<script src="/MapHack/resource/main/js/core.min.js"></script>
<script src="/MapHack/resource/main/js/script.js"></script>
    
<script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>


</body>
</html>