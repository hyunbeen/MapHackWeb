<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="maphack.infodetail.common.InfoDetail"%>
<%@ page import="maphack.infodetail.common.InfoVO"%>
<%@ page import="java.util.*"%>
<%@ page import="maphack.travelmap.dto.Mark"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>









<%
	int day=1;
	List<Mark> markList = null;
	String alarm = "";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- 버튼전용 -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
<link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
<link rel="stylesheet"
	href="/MapHack/resource/main/css/fl-bigmug-line.css">


<!-- 스텝2 전용 css -->
<link rel="stylesheet"
	href="/MapHack/resource/makemap/css/maketravelstyle.min.css">
<link rel="stylesheet"
	href="/MapHack/resource/makemap/css/maketravel.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme 슬라이더용 css-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript 슬라이더용 css -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script
	src="//maps.google.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=initialize"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>
window.onload = function(){
   

    var day1 = document.getElementById("day1");
   
       day1.style.display = "block";
       initialize1();
       
     
   };
   
  

</script>



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

.col-md-3 col-xs-3 {
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

<!-- 스텝2 파일업로드 css -->
<style>
.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>



<!-- 스타일 적용 -->
<style type="text/css">
#teste {
	height: 800px;
	width: 100%;
}
</style>

</head>


<body>



	<!--  섹션으로 구역 정해줌  -->
	<script>  
         
//            function visibleTab(){
//                   for(var i=2;i<=lastday;i++){
//                      var day = document.getElementById("day"+i);
//                      day.style.visibility = "visible";
//                   }
                  
                  
//                }
         </script>
         
         
         
         
         

<jsp:include page="/WEB-INF/view/include/header.jsp" />
         

	<section class="section section-lg bg-white text-center">
		<div class="tabs-custom tabs-horizontal tabs-buttons">
			<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
				<li class="active"><a id="dayTab1" href="#day1"
					data-toggle="tab" style="visibility: visible; border-radius: 6px;"><span
						style="font-size: 9px; color: green;">여헁계획 : </span>1일차</a></li>
				<c:forEach begin="2" varStatus="status" end="${traveldaynum}">

					<li><a id="dayTab${status.index}" href="#day${status.index}"
						data-toggle="tab" style="visibility: visible; border-radius: 6px;"><span
							style="font-size: 9px; color: green;">여헁계획 : </span>${status.index}일차
					</a></li>




				</c:forEach>

			</ul>

			<div id=addscript></div>


			<!--  탭 본문(contents) : step1.jsp/ step2.jsp/ step3.jsp에 분리되어있음 -->
			<div id="day-tab-content" class="tab-content">
				<!--             <div class="tab-pane active" id="day1" style="visibility:hidden;">       -->

				<!--              </div>  -->

				<c:forEach begin="1" varStatus="status" end="${traveldaynum}">
<script type="text/javascript">
 
 
  var test = 1;
  var mapday${status.index};
  var markerList${status.index} = [];
  var contentIdList${status.index} = [];
  
function initialize${status.index}() {
	  
   
  	 dayinitialize${status.index}(); //step2
     daystep${status.index}();//step2
     
} 





function dayinitialize${status.index}() {
        
	mapProp = {
	          center: new google.maps.LatLng(37.567835,126.986357),
	          zoom: 13,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };

        mapday${status.index} = new google.maps.Map(document.getElementById("map-canvas${status.index}"), mapProp);
       	alert("ajax실험");
        $.ajax({
        	  url:"/MapHack/addDetailTravel.mh",
        	  data:{dayindex :'${status.index}'},
        	  dataType:'JSON', 
        	  success:function(data){
        		  console.log(data.markList);
        		  var locationList = [];
        		  locationList = data.markList;
        		  alert(locationList);
        		  for(var i=0;locationList.length;i++){
        			  var mapx = locationList[i].mapx;
        			  var mapy = locationList[i].mapy;
        			  var title = locationList[i].title;
        			  var contenttypeid = locationList[i].contenttypeid;
        			     
        	    	
        	    	    var selecttype;
        	    	   switch(contenttypeid){
        	    	    case 32 : selecttype='/MapHack/resource/makemap/images/homeon.png';break;
        	    	    case 39 : selecttype='/MapHack/resource/makemap/images/foodon.png';break;
        	    	    case 12 : selecttype='/MapHack/resource/makemap/images/addon.png';break;
        	    	   }
        	    	   alert(contenttypeid);
        			  marker = new google.maps.Marker({
        				    position: new google.maps.LatLng(mapy,mapx), 
        				    icon: new google.maps.MarkerImage(selecttype, null, null, null, new google.maps.Size(48,48)),
        				    map: mapday${status.index} 
        				})
        			  
        			  var contentString = '<div id="content">'+
  	    	        '<h3>'+title+'</h3>'+
  	    	        '</div>';// 다이얼 로그 내용 등록
  	    	        var infowindow = new google.maps.InfoWindow({
  	    	            content: contentString
  	    	         });
  	    	        //마커에 다이얼로그 이벤트 등록
  	    	        marker.addListener('click', function() {
  	    	            infowindow.open(mapday${status.index}, marker);
  	    	         }); 
  	    	        
  	    	        
        		  }
        	  }
        	  
        });
        
  
}  
      

 
function daystep${status.index}(){
$("#dayTab${status.index}").on('shown.bs.tab', function() {
   google.maps.event.addDomListener(window, "resize", function() {
       var center = mapday${status.index}.getCenter();
     /* Trigger map resize event */
   google.maps.event.trigger(mapday${status.index}, 'resize');
     mapday${status.index}.setCenter(center);
     
   });
     
   
});  
}

function addtravelmarker${status.index}(){
	alert('${status.index}');	
	marker = new google.maps.Marker({
	    position: new google.maps.LatLng(37.567835,126.986357), 
	    icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/addon.png', null, null, null, new google.maps.Size(48,48)),
	    map: mapday${status.index} 
	})
}

$(document).on("click","#dayTab${status.index}",function(){  


	   $(".daynum").css("display","none");   
   $("#day${status.index}").css("display","block");  
   initialize${status.index}();
});

 
</script> 


					<!-- 탭 -->
					<div class="tab-pane active daynum" id="day${status.index}"
						style="visibility: visible; display: none;">
						<%--                      지도 탭${status.index} --%>





						<!-- ajax 드래거블 관련 -->
						<div id='js${status.index}'>
							<script src="/MapHack/resource/makemap/js/jquery-1.10.2.min.js"></script>
							<script src="/MapHack/resource/makemap/js/jquery-ui.js"></script>
						</div>



	<section class="section section-lg bg-white text-center"
					style="padding-bottom: 40px; padding-top: 10px;">
					<div class="shell">
						<h5 style="color: rgb(22, 160, 133); font-weight: 20;padding-right: 24px;">여행일</h5>
<%-- 						<h1>${startdate }</h1> --%>
							<h1>2017-12-20</h1>
<%-- 						<div class=bak > <h1> <%=sleepday %>박 <%= sleepday+1 %>일</h1> </div> --%>
							<div class=bak > <h4> 여행 ${status.index}일차</h4> </div>
						<div class="divider divider-default"></div>
					</div>
				</section>




						<!-- 리스트 end -->

<section>
						<!-- 구글맵시작 -->
						<div class="row">
						<div class="col-md-7" style="margin-left: 32px;">
						<div id="map-area${status.index}"
							style="width: 100%; height: 800px;">
							<div id="map-canvas${status.index}"
								style="width: 100%; height: 800px;"></div>
						</div>
						</div>
						<!-- 구글맵end -->


						<!-- 	일정시작 -->
<!-- 						<div class="col-md-6"> -->
<!-- 							<div data-layout="_r"> -->
<!-- 								<div data-layout="al16"> -->
<!-- 									<h1>일정만들기</h1> -->
<!-- 								</div> -->
<!-- 							</div> -->

<%-- 							<div data-layout="_r" class="schedule${status.index}"> --%>
<%-- 								<% markList = (List<Mark>)session.getAttribute("travelday"+String.valueOf(day));  --%>
<!-- // 									day = day+1; -->
<%-- 								%> --%>
<%-- 								<%for(int i=0;i<markList.size();i++){%> --%>
<!-- 								<script> -->
<%-- // 								addtravelmarker${status.index}(); --%>
<!-- 								</script> -->

								
								
<!-- 								<div data-layout="ch8 ec4"> -->
<!-- 									<a class="MOD_FEATURE_Container"> <img -->
<!-- 										class="MOD_FEATURE_Picture" -->
<%-- 										src="<%=markList.get(i).getFirstimage()%>" alt=""> --%>
<!-- 										<div class="MOD_FEATURE_TextContainer"> -->
<%-- 											<p class="MOD_FEATURE_Title" data-theme="_ts2"><%=markList.get(i).getTitle()%></p> --%>
<!-- 											<p id="MOD_FEATURE_Description">일정컨텐츠</p> -->
<!-- 											<hr /> -->
<!-- 											<div class="alram"> -->
<!-- 												<hr /> -->
<%-- 												<% --%>
<!-- // 													switch(markList.get(i).getAlramtime()){ -->
<!-- // 													case "30" : alarm = "30분전"; break; -->
<!-- // 													case "60" : alarm = "한시간 전"; break; -->
<!-- // 													case "90" : alarm = "한시간 반 전"; break; -->
<!-- // 													case "120" : alarm = "두시간 전"; break; -->
<!-- // 													} -->
<%-- 												%>		 --%>
<%-- 												<Label>알람시간</Label><input type="text" value="<%=alarm %>" readonly/> --%>
<!-- 												<hr /> -->
<!-- 											</div> -->

<!-- 										</div> -->
<!-- 									</a> -->
<!-- 								</div> -->
<%-- 								<%} %> --%>
								
								
<!-- 							</div> -->
<!-- 							</div> -->







<!-- 하은 -->

<div class="col-md-3" style="width: 584px;">

            
            
                <div class="box-classic box-shadow box-novi" style="margin-left: 0px; margin-right: 0px; 
                   padding-left: 12px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;"> 
						<div class="row">
						
							<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
								<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
										<p style="margin-bottom: 10px;">
											<span style="font-size: 20; font-weight: 30; color: red;">감로암</span>
										</p>
											<!-- 이미지공간 -->
											<div class="flickr-item" data-type="flickr-item" style="border: solid;'">
												<div class="thumb-default">
													<a class="flickr-link" href="#" data-image_b="href"
														data-lightgallery="group-item"><img
														class="flickr-image"
														src="https://unsplash.it/400/300/?random"
														data-image_b="src" data-title="alt" alt="">
													    <div class="thumb-default-overlay"></div>
													 </a>
												</div>
											</div>
								 </div>

							<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
										<div class="form-wrap form-wrap-validation" style="float: left !important; width: 70%">
											<div class="row" style="margin-right: 0px;">
													<div class="col-sm-4" >
														<p style="margin-bottom: 10px;"><span style="font-size: 20; font-weight: 30; color: red;">일정입력</span></p>
													</div>
										
												<div class="col-sm-6"></div>
												<div class="col-sm-2">
											  		<!-- 취소버튼 : crossCss -->
											  		<div class=" crossCss"> </div>
												</div>
											</div>
											<!-- 일정컨텐츠 입력칸 textArea -->
											<textarea class="form-input" id="form-1-message"
												name="message" style="min-width: 95%; min-height: 140px;"></textarea>
										</div>
								</div>
							<!-- 알람 -->
									<div class="row"  >
										<div class="col-md-3"></div>
										<div class="col-md-4" style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
											<p style="margin-top: 6.5px;">
												<span style="font-size: 20; font-weight: 30; color: blue;">메모 알림시간</span>
											</p>
										</div>
										
							<!-- 	알림버튼 timepicker추가 -->
										<div class="col-md-2" style="padding-right: 0px; padding-left: 15px;">
											<label>PM 11:45</label>
										</div>
								<!-- 알림버튼 추가 끝 -->
										
										
										
							<!--몇분전 시간 정하기 추가 -->
										<div class="col-md-3" style="padding-left: 0px;padding-right: 0px; margin-left: 10px;">
											<label>10분 전  알람 띄우기</label>
										</div>	
							<!-- 시간정하기 끝 -->
										<div class="col-md-2"></div>
									</div>
							<!-- div row 끝 -->		
								</div>
		</div>
            

</div>


<!-- 하은END -->



							
							</div>
</section>
						<!-- 				일정end			 -->










					</div>











				</c:forEach>
				<!--             본문 for문 end -->




			</div>
		</div>
	</section>




	<section>
		<div data-layout="_r">
			<div data-layout="ch8 ec-third">
<%-- 				<img src="${traveldayimg}" id="img1" alt=""> --%>
					<img src="/MapHack/resource/main/images/mainCustom/11111.png">
			</div>


			<div data-layout="ch8 ec-third" class="filebox preview-image">
				<h1>Title</h1>
				<h3>${traveldaytitle}</h3>
				<input type="button" class="button button-secondary button-nina savedata"
					value="이전으로" /> 
				<input type="button"
					class="button button-secondary button-nina savedata" value="수정하기" onclick="location.href='/MapHack/myMakeMapModify.mh'" />

				<!-- 						<input type="file" id="input-file" name="file" -->
				<!-- 							class="upload-hidden"> <input type="submit" value="전송테스트" /> -->
			</div>



			<!--          <form name="fileForm" action="/MapHack/requestupload1.mh" method="post" enctype="multipart/form-data"> -->
			<!--            <input type="text" name="src" /> -->
			<!--            <input type="file" name="file" /> -->
			<!--            <input type="submit" value="전송테스트" /> -->

			<!--           </form> -->



		</div>



		<!-- 			<div class="cell-sm-6"> -->
		<!-- 							<div class="form-wrap form-wrap-validation"> -->
		<!-- 								<button class="button button-secondary button-nina savedata" -->
		<!-- 									type="button">완료</button> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
	</section>


	<!--                            두번째탭 끝 -->

	<!-- 섹션끝 -->





	<!-- 해당페이지끝 -->





        <jsp:include page="/WEB-INF/view/include/footer.jsp" />







	




</body>
</html>