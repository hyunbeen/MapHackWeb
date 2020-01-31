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
	int lastday = (Integer) session.getAttribute("dayindex"); //마지막일자 더미데이터
	String startdate = (String) session.getAttribute("startdate"); //시작일
	String thisDay = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String maptitle = String.valueOf(session.getAttribute("traveldaytitle"));
	System.out.println("시작일" + startdate);
	int j = 1;
	int realday = lastday; //원래 선택 날짜 
	lastday = realday + 5; //예비추가일자 5개 생성
	List<Mark> dragList[] = new ArrayList[lastday + 1];
	List<JSONObject> bmList[] = new ArrayList[lastday + 1];
	if (dragList != null) {
		System.out.println("데이터 있음");

		//드래그리스트 받는곳
		for (int i = 1; i <= lastday; i++) {
			dragList[i] = new ArrayList<Mark>();

			String day = "list";
			day += String.valueOf(i);
			dragList[i] = (List<Mark>) session.getAttribute(day);
			System.out.println("드래그리스트" + i + "일자" + dragList[i]);
		}

		//북마크리스트받는곳
		for (int i = 1; i <= lastday; i++) {

			bmList[i] = new ArrayList<JSONObject>();

			String day2 = "bmlist";
			day2 += String.valueOf(i);
			bmList[i] = (List<JSONObject>) session.getAttribute(day2);
			System.out.println("북마크리스트" + i + "일자" + bmList[i]);
		}

	}
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

	<section class="section section-lg bg-white text-center" >
		<div class="tabs-custom tabs-horizontal tabs-buttons">
			<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
				<li class="active"><a id="dayTab1" href="#day1"
					data-toggle="tab" style="visibility: visible; border-radius: 6px;"><span
						style="font-size: 9px; color: green;">여헁계획 : </span>1일차</a></li>
				<c:forEach begin="2" varStatus="status" end="${lastday}">
					<!--  탭 타이틀 -->
					<c:set var="lastday" value="${lastday}" />
					<c:set var="realday" value="${realday}" />
					<c:choose>

						<c:when test="${status.index<=realday}">
							<li><a id="dayTab${status.index}" href="#day${status.index}"
								data-toggle="tab"
								style="visibility: visible; border-radius: 6px;"><span
									style="font-size: 9px; color: green;">여헁계획 : </span>${status.index}일차
							</a></li>



						</c:when>

						<c:otherwise>
							<li><a id="dayTab${status.index}" href="#day${status.index}"
								data-toggle="tab"
								style="visibility: hidden; border-radius: 6px;"><span
									style="font-size: 9px; color: green;">여헁계획 : </span>${status.index}일차</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>









			</ul>
			<div>
				<img src="/MapHack/resource/makemap/images/dayplus.png" id='dayplus'
					width=40px height=40px />일자추가 <img
					src="/MapHack/resource/makemap/images/dayminus.png" id='dayminus'
					width=36px height=36px />일자삭제
			</div>
			<div id=addscript></div>


			<!-- 일자추가 -->
			<script type="text/javascript">
		var daycnt=0; //일자추가 카운트
		
		
	$(document).on("click","#dayplus",function(){
		
		 
		if(daycnt<5){	
		$('#tabs').find('a[style="visibility: hidden; border-radius: 6px;"]').first().css("visibility","visible");
		}else{
		alert("일자를 5일이상 추가할 수 없습니다.");
		}
		daycnt++;
        

	});
	$(document).on("click","#dayminus",function(){
		
		 
// 		alert("비지블 길이"+$('#tabs').find('a[style="visibility: visible; border-radius: 6px;"]').length);	
		$('#tabs').find('a[style="visibility: visible; border-radius: 6px;"]').last().css("visibility","hidden");
		
		
		
		daycnt--;
        

	});
		
	
	 function uploadsubmit(){
	
	//   top.location.href="/MapHack/main.mh";
	
	
	var formdata = new FormData($("#uploadform")[0]);
// 	var mainimage = $('.upload-name').val();
	$.ajax({ 
		url: "requestupload.mh", 
		data: formdata,
		dataType: 'text', 
		processData: false, 
		contentType: false, 
		type: 'POST',
		success: function (response) { 
		alert("업로드 success"); 
		console.log(response); 
		},
		error: function (jqXHR) { 
			alert(jqXHR.responseText); 
		} 
	});

	
	
	savedata();
	}	
		
	 function savedata(){
		
		 alert("들어왔나 savedata");

		var map_travel = [];
		
		
							
		var dayindex = ${dayindex}+5-$('#tabs').find('a[style="visibility: hidden; border-radius: 6px;"]').length;//비지블된 데이숫자 
		var maintitle = $('#maintitle').val();
		var mainimage = $('.upload-name').val();
		var mid = "omy";
		

		alert("데이인덱스" + dayindex);
		
		for(var i=0; i<dayindex; i++){
		var k = i+1;
		var md= {};
		var map_day = [];
			
		var str = ".schedule"+k;
		var schedule = $(str);
		
		var str2 = ".schedulecol"+k;
		var schedulecol = $(str2)
		
		var schedulecnt = schedule.find(schedulecol).length;
		
		
// 		alert("일정갯수:"+schedulecnt );
		
 	
			
 		for(var j=0; j<schedulecnt; j++){
 		var list = {};
		list.firstimage = $(schedule).children().eq(j).find("img").attr("src");
		list.title = $(schedule).children().eq(j).find("p[name='title']").text();
		list.contentid = $(schedule).children().eq(j).find("input[name='contentid']").val();
		list.contenttypeid = $(schedule).children().eq(j).find("input[name='contenttypeid']").val();
		list.mapx = $(schedule).children().eq(j).find("input[name='mapx']").val();
		list.mapy = $(schedule).children().eq(j).find("input[name='mapy']").val();
		list.content = $(schedule).children().eq(j).find("input[name='content']").val();
		list.time = $(schedule).children().eq(j).find("input[name='time']").val();
		list.alramtime = $(schedule).children().eq(j).find("select[name='alramtime']").val();
		
// 		alert(schedulecol + "이미지경로 : " + $(schedule).children().eq(j).find("img").attr("src"));
// 		alert(schedulecol + "이름 : " + $(schedule).children().eq(j).find("p[name='title']").text());
// 		alert(schedulecol + "콘텐트아이디 :"+ $(schedule).children().eq(j).find("input[name='contentid']").val());
// 		alert(schedulecol + "콘텐트타입아이디 :"+$(schedule).children().eq(j).find("input[name='contenttypeid']").val());
// 		alert(schedulecol + "맵x :"+ $(schedule).children().eq(j).find("input[name='mapx']").val());
// 		alert(schedulecol + "맵y :"+ $(schedule).children().eq(j).find("input[name='mapy']").val());
// 		alert(schedulecol + "콘텐트 :"+ $(schedule).children().eq(j).find("input[name='content']").val());
// 		alert(schedulecol + "일정시간 :"+ $(schedule).children().eq(j).find("input[name='time']").val());
// 		alert(schedulecol + "알람시간 : "+ $(schedule).children().eq(j).find("select[name='alramtime']").val());
		map_day.push(list);
			 
// 			 $( '.schedule1 div:nth-child(2)' ).remove();

				
// 		$(this).find("img").attr("src");
// 	     var title_choice = $(this).find("input[name='title']").val();


			
 		} //end of j for(schedule)
 		
 		md.map_date = map_day;
 		map_travel.push(md)
 		} // end of i for(day)
 		
 		console.log(map_travel);
 		
 		var travelmap = {};
 		
 		travelmap.map_title = maintitle;
 		travelmap.map_fname = mainimage;
 		travelmap.map_day_list = map_travel;
 		//console.log(travelmap);
 		
//  		var md = {}
//  		md.map_day= map_day;
 		
 		
 
 		
 		alert(">"+JSON.stringify(travelmap));
 		
 		$.ajax({
            url: "inserttravel.mh",
            type: "POST",
            dataType : "JSON",
            data : JSON.stringify(travelmap),
            contentType : "application/json",
            success: function(data){
            	alert("완료"+data);
//             	window.parent.location.href="/MapHack/main.mh"
            },
 			error: function(err){
 				
             	window.parent.location.href="/MapHack/main.mh"

 			}
		
 	});
};

	  
	  
	
	  

	 
</script>





			<!--  탭 본문(contents) : step1.jsp/ step2.jsp/ step3.jsp에 분리되어있음 -->
			<div id="day-tab-content" class="tab-content">
				<!--             <div class="tab-pane active" id="day1" style="visibility:hidden;">       -->

				<!--              </div>  -->

				<c:forEach begin="1" varStatus="status" end="${lastday}">



					<!-- 탭 -->
					<div class="tab-pane active daynum" id="day${status.index}"
						style="visibility: visible; display: none;">
						<%--                      지도 탭${status.index} --%>





						<!-- ajax 드래거블 관련 -->
						<div id='js${status.index}'>
							<script src="/MapHack/resource/makemap/js/jquery-1.10.2.min.js"></script>
							<script src="/MapHack/resource/makemap/js/jquery-ui.js"></script>
						</div>




						<section>
							<div data-layout="_r">
								<div data-layout="al16">
									<h1>여행일 , 지도만들기</h1>
								</div>
							</div>
						</section>

						<section class="section section-lg bg-white text-center">
							<div class="shell" style="margin-left: 0px; margin-right: 0px;">
								<div class="tabs-custom tabs-horizontal tabs-buttons"
									id="tabs-4">

									<ul id="tabs2" class="nav nav-tabs" data-tabs="tabs">
										<li class="active"><a id="dayTabMapDrag${status.index}"
											class="button-nina" href="#dayTabMapContent${status.index}" data-toggle="tab"
											style="border-radius: 6px;"><span
												style="font-size: 9px; color: green;">드래그목록 : </span>지도검색</a></li>
										<li><a id="dayTabLikeDrag${status.index}"
											class="button-nina" href="#dayTabLikeContent${status.index}" data-toggle="tab"
											style="border-radius: 6px;"><span
												style="font-size: 9px; color: green;">드래그목록 : </span>즐겨찾기</a></li>
									</ul>


									<div id="my-drag-content${status.index}" class="tab-content">
										<!--  지도 검색 드래그 -->
										<div class="tab-pane fade in active" id="dayTabMapContent${status.index}">
											<!-- step2 드래그목록 -->
							<div class="container" id="container${status.index}">
								<div class="row">
									<h2>드래그 목록</h2>
								</div>


								<div class='row'>
									<div class='col-md-8' id="colmd8${status.index}">
										<div class="carousel slide media-carousel"
											id="draglist${status.index}">
											<div class="carousel-inner" id='drag-inner${status.index}'>


												<div class="item active">
													<div class="row">

														<%
															for (int i = 0; i < dragList[j].size(); i++) {
														%>
														<%
															if (i != 0 && i % 4 == 0) {
														%>
													</div>
												</div>
												<div class="item">
													<div class="row">
														<%
															}
														%>

														<div class="col-md-3 col-xs-3 drag${status.index}">
															<%
																if (dragList[j].get(i).getFirstimage() != null) {
															%>
															<a class="thumbnail" href="#"><img
																src="<%=dragList[j].get(i).getFirstimage()%>"></a>
															<%
																}
															%>
															<%
																if (dragList[j].get(i).getFirstimage() == null) {
															%>
															<a class="thumbnail" href="#"><img
																src="/MapHack/resource/infodetail/images/no_detail_img.gif"></a>

															<%
																}
															%>



															<input type="hidden"
																value="<%=dragList[j].get(i).getTitle()%>" name="title" />
															<input type="hidden"
																value="<%=String.valueOf(dragList[j].get(i).getContentid())%>"
																name="contentid" /> <input type="hidden"
																value="<%=String.valueOf(dragList[j].get(i).getContenttypeid())%>"
																name="contenttypeid" /> <input type="hidden"
																value="<%=String.valueOf(dragList[j].get(i).getMapx())%>"
																name="mapx" /> <input type="hidden"
																value="<%=String.valueOf(dragList[j].get(i).getMapy())%>"
																name="mapy" /> <input type="hidden" value="<%=i%>"
																name="index" /> <input type="hidden" value="1"
																name="listtype" />

														</div>

														<%
															}
														%>

													</div>
												</div>

											</div>
											<a data-slide="prev" href="#draglist${status.index}"
												class="left carousel-control">‹</a> <a data-slide="next"
												href="#draglist${status.index}"
												class="right carousel-control">›</a>
										</div>
									</div>
								</div>
							</div>
										</div>
										<!-- 즐겨 찾기 드래그 -->
										<div class="tab-pane fade" id="dayTabLikeContent${status.index}">
											
							<!-- 						step2 즐찾 목록 -->
							<div class="container" id="container${status.index}">
								<div class="row">
									<h2>즐찾목록</h2>
								</div>


								<div class='row'>
									<div class='col-md-8' id="colmd8${status.index}">
										<div class="carousel slide media-carousel"
											id="bmlist${status.index}">
											<div class="carousel-inner" id='bm-inner${status.index}'>


												<div class="item active">
													<div class="row">

														<%
															for (int i = 0; i < bmList[j].size(); i++) {
														%>
														<%
															if (i != 0 && i % 4 == 0) {
														%>
													</div>
												</div>
												<div class="item">
													<div class="row">
														<%
															}
														%>

														<div class="col-md-3 col-xs-3 bm${status.index}">
															<%
																if (bmList[j].get(i).get("firstimage") != null) {
															%>
															<a class="thumbnail" href="#"><img
																src="<%=bmList[j].get(i).get("firstimage")%>"></a>
															<%
																}
															%>
															<%
																if (bmList[j].get(i).get("firstimage") == null) {
															%>
															<a class="thumbnail" href="#"><img
																src="/MapHack/resource/infodetail/images/no_detail_img.gif"></a>

															<%
																}
															%>



															<input type="hidden"
																value="<%=bmList[j].get(i).get("title")%>" name="title" />
															<input type="hidden"
																value="<%=String.valueOf(bmList[j].get(i).get("contentid"))%>"
																name="contentid" /> <input type="hidden"
																value="<%=String.valueOf(bmList[j].get(i).get("contenttypeid"))%>"
																name="contenttypeid" /> <input type="hidden"
																value="<%=String.valueOf(bmList[j].get(i).get("mapx"))%>"
																name="mapx" /> <input type="hidden"
																value="<%=String.valueOf(bmList[j].get(i).get("mapy"))%>"
																name="mapy" /> <input type="hidden" value="<%=i%>"
																name="index" /> <input type="hidden" value="2"
																name="listtype" />

														</div>

														<%
															}
														%>

													</div>
												</div>

											</div>
											<a data-slide="prev" href="#bmlist${status.index}"
												class="left carousel-control">‹</a> <a data-slide="next"
												href="#bmlist${status.index}" class="right carousel-control">›</a>
										</div>
									</div>
								</div>
							</div>

										</div>
									</div>
								</div>
							</div>
						</section>

						
						<!-- 리스트 end -->


						<!-- 구글맵시작 -->
						<h3>${status.index}일차 지도</h3>
						<div id="map-area${status.index}"
							style="width: 100%; height: 800px;">
							<div id="map-canvas${status.index}"
								style="width: 100%; height: 800px;"></div>
						</div>
						<!-- 구글맵end -->


						<!-- 	일정시작 -->
						<section>
							<div data-layout="_r">
								<div data-layout="al16">
									<h1>일정만들기</h1>
								</div>
							</div>
						</section>

						<section class="MOD_FEATURE">
							<div data-layout="_r" class="schedule${status.index}">
								<!--                                  <div data-layout="ch8 ec4"> -->
								<!--                                     <a class="MOD_FEATURE_Container"> <img -->
								<!--                                        class="MOD_FEATURE_Picture" -->
								<!--                                        src="https://unsplash.it/400/300/?random" alt=""> -->
								<!--                                        <div class="MOD_FEATURE_TextContainer"> -->
								<!--                                           <p class="MOD_FEATURE_Title" data-theme="_ts2">장소명</p> -->
								<!--                                           <p id="MOD_FEATURE_Description">일정컨텐츠</p> -->
								<!--                                           <hr /> -->
								<!--                                           <div class="alram"> -->
								<!--                                              <input type="time" id="time" /> -->
								<!--                                              <hr /> -->

								<!--                                              <select name="alramtime"> -->
								<!--                                                 <option value="">알람시간 선택</option> -->
								<!--                                                 <option value="30">30분 전</option> -->
								<!--                                                 <option value="60">한시간 전</option> -->
								<!--                                                 <option value="90">한시간 반 전</option> -->
								<!--                                                 <option value="120">두시간 전</option> -->
								<!--                                              </select> -->
								<!--                                              <hr /> -->
								<!--                                           </div> -->

								<!--                                        </div> -->
								<!--                                     </a> -->
								<!--                                  </div> -->

							</div>
						</section>

						<!-- 				일정end			 -->



						<script type="text/javascript">
   var saveMap = []; //지도 경로 저장
   var saveTitle = []; //제목 저장
   var saveMapx = []; //x값저장
   var saveMapy = []; //y값저장
   var saveContentId = [];
   var saveContentTypeId = [];
   var saveCnt = 0; //들어간 지도숫자 카운트

   doDraggable${status.index}();  
 bmDraggable${status.index}();





//일정취소시
$(document).on("click",".dragcancel${status.index}",function(){  
    var contentid =$(this).siblings("input[name='contentid']").val();
    var contenttypeid =$(this).siblings("input[name='contenttypeid']").val();
    var mapx =$(this).siblings("input[name='mapx']").val();
    var mapy =$(this).siblings("input[name='mapy']").val();
    
    deleteMark${status.index}(mapx,mapy,contentid, contenttypeid);
 	
    $(this).parents('.schedulecol${status.index}').remove();
}); 

//일자탭클릭시 화면조정
$(document).on("click","#dayTab${status.index}",function(){  
// 		for(var i=${lastday}-4; i<=${lastday}; i++){
// 			$("#dayTab[i]").css("display","none");
// 		}
// 	   $("daytab")
	
		   $(".daynum").css("display","none");   
	   $("#day${status.index}").css("display","block");  
	   initialize${status.index}();
});




  var isRevert = true;
  var z_idx = 2;


	
//드래그리스트 드래그이벤트
 function doDraggable${status.index}(){
//    alert("드래거블 이벤트");
     $(".drag${status.index}").draggable({

     
//     	 .drag${status.index}
     revert:function(event,ui){
       
        if(event==false){
                isRevert=false;
         
        }else{
                isRevert=true;
            }
     },
	

      //드래그되는 모양이 복제로 됨
       helper: "clone",
       opacity:"0.7", //투명도
      
         appendTo: "body",
      //드래그가 시작됬을때 발생
     start:function(event,ui){
    	
    		 { ui.helper.css('width', '270px'); ui.helper.css('height', '159.99px');}
            
            z_idx++;

        },		 

        //드래그 도중 발생

        drag:function(event,ui){

        },
        
      //드래그가 중지됬을때 발생
        stop:function(event,ui){
           var img_choice = $(this).find("img").attr("src");
           var title_choice = $(this).find("input[name='title']").val();
          var img_choice_id = $(this).attr("id");
          var mapx = $(this).find("input[name='mapx']").val();
          var mapy = $(this).find("input[name='mapy']").val();
          var contentid = $(this).find("input[name='contentid']").val();
          var contenttypeid = $(this).find("input[name='contenttypeid']").val();
 		  var listtype = $(this).find("input[name='listtype']").val();
 		  
 		  alert(listtype +"___"+ ${status.index});
            //제대로 droppable 객체 안에 들어갔을때
            if(isRevert){
            

            	//마커 호출 메소드
            	inputMark${status.index}(mapx,mapy,contentid, contenttypeid);

                //이동한 객체는 종료 후 삭제
                saveMap[saveCnt]= img_choice;
                saveTitle[saveCnt]=title_choice;
                saveMapx[saveCnt] = mapx;
                saveMapy[saveCnt] = mapy;
                saveContentId[saveCnt] = contentid;
                saveContentTypeId[saveCnt] = contenttypeid;
              
                        
                $(".schedule${status.index}").append(
                   "<div data-layout='ch8 ec4' class='schedulecol${status.index}'>"+
                    "<a class='MOD_FEATURE_Container'>"+
                    "<img class='MOD_FEATURE_Picture' src='"+saveMap[saveCnt]+"' width =270px height=202.5px alt=''>"+
                    "<div class='MOD_FEATURE_TextContainer'>"+
                      "<p class='MOD_FEATURE_Title' data-theme='_ts2' name='title'>"+saveTitle[saveCnt]+"</p>"+
                      "<p class='MOD_FEATURE_Description' >일정컨텐츠 </p> "+
                      "<input type='textarea' class='textarea' name='content'/> <hr/>"+
                      "<p class='MOD_FEATURE_Description'>일정시간선택</p> "+
                      "<div class='time'> <input type='time' id ='time' name='time'/></div> <hr/>"+
                      "<select name='alramtime'>"+
                "<option value=''>알람시간 선택</option>"+
              "<option value='30'>30분 전</option>"+
              "<option value='60'>한시간 전 </option>"+
              "<option value='90'>한시간 반 전</option>"+
              "<option value='120'>두시간 전</option>"+
          "</select> <hr/>" +
          " <input type=button class='dragcancel${status.index}' value='취소' />"+
          " <input type=hidden value='"+saveMapx[saveCnt]+"' name='mapx'/>" +
          " <input type=hidden value='"+saveMapy[saveCnt]+"' name='mapy'/>" +
          " <input type=hidden value='"+saveContentId[saveCnt]+"' name='contentid'/>" +
          " <input type=hidden value='"+saveContentTypeId[saveCnt]+"' name='contenttypeid'/>" +
          "</div>"+
                    "</div>"+
                  "</a>"+
                "</div>"
                
                
                
                );
                
                var index = $(this).find("input[name='index']").val();
                
                
               
                     
                saveCnt ++;
                $.ajax({
                    url: "dragEvent.mh",
                    type: "GET",
                    dataType : "JSON",
                    data : {
                     index:index,
                     listtype:listtype,
                      day:${status.index}},
                    success: function(data){
                    	
                     	
                    	$("#js${status.index}").empty;
                    	
                    	minjs = "<script src='"+"/MapHack/resource/makemap/js/jquery-1.10.2.min.js'"+"><"+"/script>";
                    	var uijs ="<script src='"+"/MapHack/resource/makemap/js/jquery-ui.js'"+"><"+"/script>";
                    	
                    	
                    	$("#js${status.index}").append(minjs);
                    	$("#js${status.index}").append(uijs);
                      	
                       var arr = data.dragList;
                      
                       var slide_inner = $('#drag-inner${status.index}');
                       slide_inner.empty();
                       
                       var arr_index = arr.length;
                       //나머지 변수 var ? = arr_index % 4
                       var img_index = 0;
                     
                       var itemactive = $("<div class='item active'></div>");
//                        alert(Math.ceil(arr_index/4));
//                        alert("나머지"+ arr_index%4);
						var iteration;
						if(arr_index % 4 > 0){
							iteration= Math.ceil(arr_index/4)-1;
						}else{
							iteration= Math.ceil(arr_index/4);
						}
                       for(var i=0 ; i<iteration;i++){
                         //i==0
                         //a태그묵는것 시작  붙이고
                         
                        var item = $("<div class='item'></div>");
                   var row = $("<div class='row'></div>");
                        
                         for(var j=0;j<4;j++){
                            //a태그 하나씩
                            if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                              alert("["+img_index+"]"+arr[img_index].firstimage);
                            
                           
            
                       var colmd3 = $("<div class='col-md-3 col-xs-3 drag${status.index}'></div>");
                       var thumbnail =$("<a class='thumbnail' href='#''></a>");
                       var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
                       var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
                      var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
                       var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
                       var listtype = $("<input type='hidden' value='1' name= 'listtype'></input>");


                     var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
  					var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
                     var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
                     var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

                      
                      
                  
                            
                           if(arr[img_index].firstimage!='no'){   
                           thumbnail.append(img);
                          }else{
                          thumbnail.append(imgnull);
                          }
                          colmd3.append(thumbnail);
                          colmd3.append(title);
                        colmd3.append(index);
                        colmd3.append(contentid);
                        colmd3.append(contenttypeid);
                        colmd3.append(mapx);
                        colmd3.append(mapy);
                        colmd3.append(listtype);
                        row.append(colmd3);    
                        
                            img_index++;
                         }
                        //item 넣주기
                        if(i==0){
                        itemactive.append(row);
                        }else{
                        item.append(row);
                        }
                        
                        

                         //a태그 묵는것 닫는것 붙여
                      }
                   

					if(iteration==0){
						
					}else if(iteration == 1){
						 slide_inner.append(itemactive);
					}else{
						 slide_inner.append(itemactive);
						 slide_inner.append(item); 
					}
                    
                    
                  
                    
                      
                     //나머지에대한 처리
                     
                       //i==0
                       //a태그묵는것 시작  붙이고
                       
                       if((arr_index%4!=0)&&(iteration!=0)){
                    	   var item = $("<div class='item'></div>");
                           var row = $("<div class='row'></div>");
                                
                           
                                 for(var j=0;j<arr_index%4;j++){
                                    //a태그 하나씩
                                    if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                                      alert("["+img_index+"]"+arr[img_index].firstimage);
                                    
                                   
                    
                               var colmd3 = $("<div class='col-md-3 col-xs-3 drag${status.index}'></div>");
                               var thumbnail =$("<a class='thumbnail' href='#''></a>");
                               var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
                               var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
                              var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
                               var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
                               var listtype = $("<input type='hidden' value='1' name= 'listtype'></input>");

                             var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
          					var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
                             var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
                             var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

                              
                              
                          
                                    
                                   if(arr[img_index].firstimage!='no'){   
                                   thumbnail.append(img);
                                  }else{
                                  thumbnail.append(imgnull);
                                  }
                                  colmd3.append(thumbnail);
                                  colmd3.append(title);
                                colmd3.append(index);
                                colmd3.append(contentid);
                                colmd3.append(contenttypeid);
                                colmd3.append(mapx);
                                colmd3.append(mapy);
                                colmd3.append(listtype);
                                row.append(colmd3);    
                                
                                    img_index++;
                                 }
                                //item 넣주기
                             		
                                item.append(row);
                                slide_inner.append(item); 
                       
                       }else if((arr_index%4!=0)&&(iteration==0)){
                    	   
                    	   var itemactive = $("<div class='item active'></div>");
                           var row = $("<div class='row'></div>");
                                
                           
                                 for(var j=0;j<arr_index%4;j++){
                                    //a태그 하나씩
                                    if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                                      alert("["+img_index+"]"+arr[img_index].firstimage);
                                    
                                   
                    
                               var colmd3 = $("<div class='col-md-3 col-xs-3 drag${status.index}'></div>");
                               var thumbnail =$("<a class='thumbnail' href='#''></a>");
                               var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
                               var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
                              var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
                               var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
                               var listtype = $("<input type='hidden' value='1' name= 'listtype'></input>");

                             var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
          					var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
                             var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
                             var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

                              
                              
                          
                                    
                                   if(arr[img_index].firstimage!='no'){   
                                   thumbnail.append(img);
                                  }else{
                                  thumbnail.append(imgnull);
                                  }
                                  colmd3.append(thumbnail);
                                  colmd3.append(title);
                                colmd3.append(index);
                                colmd3.append(contentid);
                                colmd3.append(contenttypeid);
                                colmd3.append(mapx);
                                colmd3.append(mapy);
                                colmd3.append(listtype);
                                row.append(colmd3);    
                                
                                    img_index++;
                                 }
                                //item 넣주기
                             		
                                itemactive.append(row);
                                slide_inner.append(itemactive); 
                    	   
                       
                    	   
                       }
                       
                     
                      
                      

                       //a태그 묵는것 닫는것 붙여

                      
                      
   						
                    doDraggable${status.index}();   //드래거블 이벤트 다시생성
                    $(this).remove();  
                 } ,  
                error : function(err){
                	alert("에러"+err);
                }   
                
                 

                });     
               
                
            }
            else{
           
            }
        }
     
        
  });
 

  
     $('#map-area${status.index}').droppable({
    	    accept: ".drag${status.index}", // 드롭시킬 대상 요소   
    	    drop: function(event, ui) {
    	    }
    	});
} //드래그리스트 드래그 & 드랍 end





// // //즐찾드래그 이벤트!!!!!!!!!!!
function bmDraggable${status.index}(){
//  alert("드래거블 이벤트");
   $(".bm${status.index}").draggable({

   
//   	 .drag${status.index}
   revert:function(event,ui){
      
      if(event==false){
    	  alert("맵에안들어감");
              isRevert=false;
      }else{
    	  alert("맵에들어감");
              isRevert=true;
          }
   },
	

    //드래그되는 모양이 복제로 됨
     helper: "clone",
     opacity:"0.7", //투명도
    
       appendTo: "body",
    //드래그가 시작됬을때 발생
   start:function(event,ui){
  	
  		 { ui.helper.css('width', '270px'); ui.helper.css('height', '159.99px');}
          
          z_idx++;

      },		 

      //드래그 도중 발생

      drag:function(event,ui){

      },
      
      stop:function(event,ui){
      	alert("즐찾리스트꺼"+ $(this).find("input[name='title']").val());
         var img_choice = $(this).find("img").attr("src");
         var title_choice = $(this).find("input[name='title']").val();
        var img_choice_id = $(this).attr("id");
        var mapx = $(this).find("input[name='mapx']").val();
        var mapy = $(this).find("input[name='mapy']").val();
        var contentid = $(this).find("input[name='contentid']").val();
        var contenttypeid = $(this).find("input[name='contenttypeid']").val();
		  var listtype = $(this).find("input[name='listtype']").val();
		  
		  alert(listtype +"___"+ ${status.index});
          //제대로 droppable 객체 안에 들어갔을때
          if(isRevert){
          

          	//마커 호출 메소드
          	inputMark${status.index}(mapx,mapy,contentid, contenttypeid);

              //이동한 객체는 종료 후 삭제
              saveMap[saveCnt]= img_choice;
              saveTitle[saveCnt]=title_choice;
              saveMapx[saveCnt] = mapx;
              saveMapy[saveCnt] = mapy;
              saveContentId[saveCnt] = contentid;
              saveContentTypeId[saveCnt] = contenttypeid;
            
          
              $(".schedule${status.index}").append(
                 "<div data-layout='ch8 ec4' class='schedulecol${status.index}'>"+
                  "<a class='MOD_FEATURE_Container'>"+
                  "<img class='MOD_FEATURE_Picture' src='"+saveMap[saveCnt]+"' width =270px height=202.5px alt=''>"+
                  "<div class='MOD_FEATURE_TextContainer'>"+
                    "<p class='MOD_FEATURE_Title' data-theme='_ts2' name='title'>"+saveTitle[saveCnt]+"</p>"+
                    "<p class='MOD_FEATURE_Description'>일정컨텐츠 </p> "+
                    "<input type='textarea' class='textarea' name='content'/> <hr/>"+
                    "<p class='MOD_FEATURE_Description'>알람설정</p> "+
                    "<div class='time'> <input type='time' id ='time' name='time'/> </div><hr/>"+
                    "<select name='alramtime'>"+
              "<option value=''>알람시간 선택</option>"+
            "<option value='30'>30분 전</option>"+
            "<option value='60'>한시간 전 </option>"+
            "<option value='90'>한시간 반 전</option>"+
            "<option value='120'>두시간 전</option>"+
        "</select> <hr/>" +
        " <input type=button class='dragcancel${status.index}' value='취소' />"+
        " <input type=hidden value='"+saveMapx[saveCnt]+"' name='mapx'/>" +
        " <input type=hidden value='"+saveMapy[saveCnt]+"' name='mapy'/>" +
        " <input type=hidden value='"+saveContentId[saveCnt]+"' name='contentid'/>" +
        " <input type=hidden value='"+saveContentTypeId[saveCnt]+"' name='contenttypeid'/>" +
        "</div>"+
                  "</div>"+
                "</a>"+
              "</div>"
              
              
              
              );
              
              var index = $(this).find("input[name='index']").val();
              
              
             
                   
              saveCnt ++;
              $.ajax({
                  url: "dragEvent.mh",
                  type: "GET",
                  dataType : "JSON",
                  data : {
                   index:index,
                   listtype:listtype,
                    day:${status.index}},
                  success: function(data){
                  	
                   	
                  	$("#js${status.index}").empty;
                  	
                  	minjs = "<script src='"+"/MapHack/resource/makemap/js/jquery-1.10.2.min.js'"+"><"+"/script>";
                  	var uijs ="<script src='"+"/MapHack/resource/makemap/js/jquery-ui.js'"+"><"+"/script>";
                  	
                  	
                  	$("#js${status.index}").append(minjs);
                  	$("#js${status.index}").append(uijs);
                    	
                     var arr = data.bmList;
                    
                     var slide_inner = $('#bm-inner${status.index}');
                     slide_inner.empty();
                     
                     var arr_index = arr.length;
                     //나머지 변수 var ? = arr_index % 4
                     var img_index = 0;
                   
                     var itemactive = $("<div class='item active'></div>");
//                      alert(Math.ceil(arr_index/4));
//                      alert("나머지"+ arr_index%4);
						var iteration;
						if(arr_index % 4 > 0){
							iteration= Math.ceil(arr_index/4)-1;
						}else{
							iteration= Math.ceil(arr_index/4);
						}
                     for(var i=0 ; i<iteration;i++){
                       //i==0
                       //a태그묵는것 시작  붙이고
                       
                      var item = $("<div class='item'></div>");
                 var row = $("<div class='row'></div>");
                      
                       for(var j=0;j<4;j++){
                          //a태그 하나씩
                          if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                            alert("["+img_index+"]"+arr[img_index].firstimage);
                          
                         
          
                     var colmd3 = $("<div class='col-md-3 col-xs-3 bm${status.index}'></div>");
                     var thumbnail =$("<a class='thumbnail' href='#''></a>");
                     var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
                     var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
                    var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
                     var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
                     var listtype = $("<input type='hidden' value='2' name= 'listtype'></input>");


                   var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
					var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
                   var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
                   var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

                    
                    
                
                          
                         if(arr[img_index].firstimage!='no'){   
                         thumbnail.append(img);
                        }else{
                        thumbnail.append(imgnull);
                        }
                        colmd3.append(thumbnail);
                        colmd3.append(title);
                      colmd3.append(index);
                      colmd3.append(contentid);
                      colmd3.append(contenttypeid);
                      colmd3.append(mapx);
                      colmd3.append(mapy);
                      colmd3.append(listtype);
                      row.append(colmd3);    
                      
                          img_index++;
                       }
                      //item 넣주기
                      if(i==0){
                      itemactive.append(row);
                      }else{
                      item.append(row);
                      }
                      
                      

                       //a태그 묵는것 닫는것 붙여
                    }
                 

					if(iteration==0){
						
					}else if(iteration == 1){
						 slide_inner.append(itemactive);
					}else{
						 slide_inner.append(itemactive);
						 slide_inner.append(item); 
					}
                  
                  
                
                  
                    
                   //나머지에대한 처리
                   
                     //i==0
                     //a태그묵는것 시작  붙이고
                     
                     if((arr_index%4!=0)&&(iteration!=0)){
                  	   var item = $("<div class='item'></div>");
                         var row = $("<div class='row'></div>");
                              
                         
                               for(var j=0;j<arr_index%4;j++){
                                  //a태그 하나씩
                                  if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                                    alert("["+img_index+"]"+arr[img_index].firstimage);
                                  
                                 
                  
                             var colmd3 = $("<div class='col-md-3 col-xs-3 bm${status.index}'></div>");
                             var thumbnail =$("<a class='thumbnail' href='#''></a>");
                             var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
                             var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
                            var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
                             var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
                             var listtype = $("<input type='hidden' value='2' name= 'listtype'></input>");

                           var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
        					var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
                           var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
                           var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

                            
                            
                        
                                  
                                 if(arr[img_index].firstimage!='no'){   
                                 thumbnail.append(img);
                                }else{
                                thumbnail.append(imgnull);
                                }
                                colmd3.append(thumbnail);
                                colmd3.append(title);
                              colmd3.append(index);
                              colmd3.append(contentid);
                              colmd3.append(contenttypeid);
                              colmd3.append(mapx);
                              colmd3.append(mapy);
                              colmd3.append(listtype);
                              row.append(colmd3);    
                              
                                  img_index++;
                               }
                              //item 넣주기
                           		
                              item.append(row);
                              slide_inner.append(item); 
                     
                     }else if((arr_index%4!=0)&&(iteration==0)){
                  	   
                  	   var itemactive = $("<div class='item active'></div>");
                         var row = $("<div class='row'></div>");
                              
                         
                               for(var j=0;j<arr_index%4;j++){
                                  //a태그 하나씩
                                  if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                                    alert("["+img_index+"]"+arr[img_index].firstimage);
                                  
                                 
                  
                             var colmd3 = $("<div class='col-md-3 col-xs-3 bm${status.index}'></div>");
                             var thumbnail =$("<a class='thumbnail' href='#''></a>");
                             var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
                             var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
                            var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
                             var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
                             var listtype = $("<input type='hidden' value='2' name= 'listtype'></input>");

                           var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
        					var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
                           var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
                           var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

                            
                            
                        
                                  
                                 if(arr[img_index].firstimage!='no'){   
                                 thumbnail.append(img);
                                }else{
                                thumbnail.append(imgnull);
                                }
                                colmd3.append(thumbnail);
                                colmd3.append(title);
                              colmd3.append(index);
                              colmd3.append(contentid);
                              colmd3.append(contenttypeid);
                              colmd3.append(mapx);
                              colmd3.append(mapy);
                              colmd3.append(listtype);
                              row.append(colmd3);    
                              
                                  img_index++;
                               }
                              //item 넣주기
                           		
                              itemactive.append(row);
                              slide_inner.append(itemactive); 
                  	   
                     
                  	   
                     }
                     
                   
                    
                    

                     //a태그 묵는것 닫는것 붙여

                    
                    
                  bmDraggable${status.index}();   //드래거블 이벤트 다시생성
                  $(this).remove();  
               } ,  
              error : function(err){
              	alert("에러"+err);
              }   
              
               

              });     
             
              
          }
          else{
         
          }
      }
   
      
});



$('#map-canvas${status.index}').droppable({
    accept: ".bm${status.index}", // 드롭시킬 대상 요소   
    drop: function(event, ui) {
//         alert("맵에드랍됨");
    }
});
} //즐찾 리스트드래그 & 드랍 end




 
 
      //이미지 저장
       $(document).ready(function(){
           var fileTarget = $('.filebox, .upload-hidden');
     
             fileTarget.on('change', function(){
                 if(window.FileReader){
                    if($(this)[0].files[0] == null || $(this)[0].files[0] == undefined || $(this)[0].files[0] == 0 ) return;
                     var filename = $(this)[0].files[0].name;
                 } else {
                     var filename = $(this).val().split('/').pop().split('\\').pop();
                 }

                 $('.upload-name').val(filename);
                 
//                  alert($(this).siblings('.upload-name').val(filename));
             });
             
           //preview image  
             var imgTarget = $('.preview-image .upload-hidden'); 
             imgTarget.on('change', function(){     
                var parent = $(this).parent();  
                parent.children('.upload-display').remove(); 
                if(window.FileReader){ //image 파일만 
                   if($(this)[0].files[0] == null || $(this)[0].files[0] == undefined ) return;
                   if (!$(this)[0].files[0].type.match(/image\//)) return; 
                   
                   var reader = new FileReader(); 
                   reader.onload = function(e){   
                      

                   var src = e.target.result; 
//                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
                   var img1= document.getElementById("img1");
                   img1.src= src;
                   
                   } 
                       
                    
                   reader.readAsDataURL($(this)[0].files[0]); 
                   }   
                else {  
                   $(this)[0].select(); 
                    $(this)[0].blur(); 
                    var imgSrc = document.selection.createRange().text; 
                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
                    
                    var img = $(this).siblings('.upload-display').find('img'); img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
                    } 
                });
             
             
         }); 
      
	


</script>







					</div>
					<!--                본문 end -->

					<script type="text/javascript">
 
 
  
  var mapday${status.index};
  var markerList${status.index} = [];
  var contentIdList${status.index} = [];
  
function initialize${status.index}() {
	  
  
  	 dayinitialize${status.index}(); //step2
     daystep${status.index}();//step2
     
} 


// initialize${status.index}();


function dayinitialize${status.index}() {
        
	mapProp = {
	          center: new google.maps.LatLng(37.567835,126.986357),
	          zoom: 13,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };

        mapday${status.index} = new google.maps.Map(document.getElementById("map-canvas${status.index}"), mapProp);
      
  
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

function inputMark${status.index}(mapx, mapy,contentid, contenttypeid){

	var icon ;
	
	switch(contenttypeid){ 
	case '12': icon = 'info-i_maps.png';  break;
	
	case '32': icon = 'library_maps.png'; break;
	
	case '39': icon = 'parking_lot_maps.png';  break;
		
	}
		
	
//    // 구글 마커 아이콘        
//    var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
//    var icons = {
//      parking: {
//        icon: iconBase + 'parking_lot_maps.png' //p
//      },
//      library: {
//        icon: iconBase + 'library_maps.png' //이상
//      },
//      info: {
//        icon: iconBase + 'info-i_maps.png'  //i
//      }
//    };

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(mapy , mapx ),
          
          icon: 'https://maps.google.com/mapfiles/kml/shapes/'+ icon,
          map: mapday${status.index}
        });
       contentIdList${status.index}.push(contentid);
       markerList${status.index}.push(marker);

}

function deleteMark${status.index}(mapx, mapy,contentid, contenttypeid){
	var deleteMarker;
	alert("콘텐트아이디"+contentid);

	for(var i=0;i<contentIdList${status.index}.length;i++){
		if(contentIdList${status.index}[i]==contentid){
			markerList${status.index}[i].setMap(null);
		
		}
		
	}
	
}


</script>







					<%
						j = j + 1;
					%>
				</c:forEach>
				<!--             본문 for문 end -->




			</div>
		</div>
	</section>




	<section>
		<div data-layout="_r">
			<div data-layout="ch8 ec-third">
				<img src="https://unsplash.it/400/300/?random" id="img1" alt="">
			</div>


			<div data-layout="ch8 ec-third" class="filebox preview-image">
				<h3>Title</h3>
				<input type="text" id='maintitle' value='<%=maptitle%>'/></br>

				<h3>메인이미지 선택</h3>
				<form name="fileForm" action="/MapHack/requestupload.mh"
					class="uploadform" id="uploadform" method="post"
					enctype="multipart/form-data">
					<div class="filebox bs3-primary preview-image">


						<input class="upload-name" value="파일선택" disabled="disabled"
							name="src" id="src"> <label for="input-file">업로드</label>
						<input type="file" id="input-file" name="file"
							class="upload-hidden"> <input type="button"
							class="button button-secondary button-nina savedata" value="수정하기"
							onclick="" />


						<!-- 						<input type="file" id="input-file" name="file" -->
						<!-- 							class="upload-hidden"> <input type="submit" value="전송테스트" /> -->
					</div>
				</form>


				<!--          <form name="fileForm" action="/MapHack/requestupload1.mh" method="post" enctype="multipart/form-data"> -->
				<!--            <input type="text" name="src" /> -->
				<!--            <input type="file" name="file" /> -->
				<!--            <input type="submit" value="전송테스트" /> -->

				<!--           </form> -->



			</div>


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







	<script type="text/javascript">



$(document).ready(function (){  
	
	window.parent.$('#mapTab2').trigger('click');
	
	
	 
	
	

});  

// function trigger(){
	
// 	alert("클릭해라 트리거");
// 	$("#dayTab2").trigger('click');
// };
 

</script>






	<!-- 	<script src="/MapHack/resource/main/js/core.min.js"></script> -->
	<!-- 	<script src="/MapHack/resource/main/js/script.js"></script> -->

	<!-- 	<script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> -->
	<!-- 	<script -->
	<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script> -->


</body>
</html>