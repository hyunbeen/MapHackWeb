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


<style>

/* 스탭 2 슬라이더용 css */
.media-carousel {
   margin-bottom: 0;
   padding: 0 40px 30px 40px;
   margin-top: 30px;
}
/* Previous button  */
.media-carousel .carousel-control.left {
   left: -12px;
   background-image: none;
   background: none repeat scroll 0 0 #222222;
   border: 4px solid #FFFFFF;
   border-radius: 23px 23px 23px 23px;
   height: 40px;
   width: 40px;
   margin-top: 30px
}
/* Next button  */
.media-carousel .carousel-control.right {
   right: -12px !important;
   background-image: none;
   background: none repeat scroll 0 0 #222222;
   border: 4px solid #FFFFFF;
   border-radius: 23px 23px 23px 23px;
   height: 40px;
   width: 40px;
   margin-top: 30px
}
/* Changes the position of the indicators */
.media-carousel .carousel-indicators {
   right: 50%;
   top: auto;
   bottom: 0px;
   margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li {
   background: #c0c0c0;
}

.media-carousel .carousel-indicators .active {
   background: #333333;
}

.media-carousel img {
   width: 250px;
   height: 100px
}

.col-md-3 {
   width: 25%;
}

.thumbnail>img, .thumbnail a>img {
   display: block;
   max-width: 100%;
   height: 160px !important;
   margin-left: auto;
   margin-right: auto;
}

.col-md-8 {
   width: 97% !important;
}

/* End carousel */
</style>

 <script src="/MapHack/resource/makemap/js/step1.js"></script>



<script>
window.onload = function(){
   var mapTab = document.getElementById("mapTab");
   var mapTab2 = document.getElementById("mapTab2");
   var mapTab3 = document.getElementById("mapTab3");
   var step1 = document.getElementById("step1");
   var step2 = document.getElementById("step2");
   var step3 = document.getElementById("step3");
   
//    mapTab2.onclick = function(){
      
//       $.ajax({
//              url: "createvalue.mh",
//              type: "GET",
//              data : {
//              },
//              success: function(data){
//                alert("세션생성?");
//              }
//             });
   
//   };

   
   
   
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
                <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                  <li class="active"><a id="mapTab" class="button-nina" href="#step1" data-toggle="tab" style="border-radius: 6px;"><span style="font-size:9px; color: green;">step 1 : </span>지도정보검색</a></li>
                  <li><a id="mapTab2" class="button-nina" href="#step2" data-toggle="tab" style="border-radius: 6px;"><span style="font-size:9px; color: green;">step 2 : </span>여행짜기</a></li>
                  <li><a id="mapTab3" class="button-nina" href="#step3" data-toggle="tab" style="border-radius: 6px;"><span style="font-size:9px; color: green;">step 3 : </span>그룹방개설</a></li>
                </ul>
            
        <!--  탭 본문(contents) : step1.jsp/ step2.jsp/ step3.jsp에 분리되어있음 -->      
          <div id="my-tab-content" class="tab-content">
            <!--  탭1 -->
                  <div class="tab-pane fade in active" id="step1">
                   <jsp:include page="/step1.mh"/>
                  </div>
               <!--  탭2 -->          
                  <div class="tab-pane fade" id="step2">
<!--                   <iframe id="step2iframe" src="" framebolder="1" width= "100%" height= "1000px"  -->
<!--                   marginwidht="0" marginheight="0" scrolling="yes"></iframe> -->
<!--                   step2 동적 탭 아이프레임 -->
                  <jsp:include page="/WEB-INF/view/mytravel/step2.jsp"/>
                  
                  
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

$(document).ready(function () {
   
   $('#mapTab2').trigger('click');
   
   $('#mapTab').trigger('click');

});



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