<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="maphack.infodetail.common.InfoDetail"%>
<%@ page import="maphack.infodetail.common.InfoVO"%>
<%@ page import="java.util.*"%>
<%@ page import="maphack.travelmap.dto.Mark"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>





<%
	int lastday = (Integer) session.getAttribute("dayindex"); //마지막일자 더미데이터
	String startdate = (String) session.getAttribute("startdate"); //시작일
	
	String enddate = (String) session.getAttribute("enddate"); //종료일
	
	
// 	System.out.println("마지막 서브스트링"+enddate.substring(8,10));
	SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd");
	
	int startday = Integer.parseInt(startdate.substring(8,10)) ;
	int endday= Integer.parseInt(enddate.substring(8,10)) ;
	
	int sleepday = endday-startday; //박수

	
	int j = 1;
	int realday = lastday; //선택한 기본 날짜 길이 생성 
	lastday = realday + 5; //예비추가일자 5개 생성
	List<Mark> dragList[] = new ArrayList[lastday + 1]; //드래그목록 배열 생성
	List<JSONObject> bmList[] = new ArrayList[lastday + 1]; //즐겨찾기 목록 배열생성
	if (dragList != null) {
	

		//드래그리스트 담는 for문
		for (int i = 1; i <= lastday; i++) {
			dragList[i] = new ArrayList<Mark>(); 

			String day = "list";
			day += String.valueOf(i);
			dragList[i] = (List<Mark>) session.getAttribute(day);
		}

		//북마크리스트 담는 for문
		for (int i = 1; i <= lastday; i++) {

			bmList[i] = new ArrayList<JSONObject>();

			String day2 = "bmlist";
			day2 += String.valueOf(i);
			bmList[i] = (List<JSONObject>) session.getAttribute(day2);
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
<link rel="stylesheet"
	href="//cdn.materialdesignicons.com/1.9.32/css/materialdesignicons.min.css">


<!-- 하은 추가 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>

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
   
   //1일차 에대한 뷰와  맵생성 
    var day1 = document.getElementById("day1");
   
       day1.style.display = "block";
       initialize1();
       
     
   };
   
  

</script>


<!-- 하은 css -->
<style type="text/css">
body {
	margin: 40px;
}

/* +-버튼 */
.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 12px;
	line-height: 1.428571429;
	border-radius: 15px;
}

.btn-circle.btn-lg {
	width: 50px;
	height: 50px;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.33;
	border-radius: 25px;
}

.btn-circle.btn-xl {
	width: 70px;
	height: 70px;
	padding: 10px 16px;
	font-size: 24px;
	line-height: 1.33;
	border-radius: 35px;
}

/* 아코디언 */
.card {
	margin-bottom: 4px;
	background: rgb(95, 176, 228);
}

.card-header {
	border: solid 1px grey;
	border-radius: 4px;
	padding-left: 5px;
	background: rgb(51, 122, 183);
}

.card-header a {
	color: white;
}

.card-block {
	color: white;
	padding: 12px;
}

a:focus {
	outline: none;
}

/* 즐찾 tab *?

.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
/********************************************************************/
/*** PANEL DEFAULT ***/
.with-nav-tabs.panel-default .nav-tabs>li>a, .with-nav-tabs.panel-default .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-default .nav-tabs>li>a:focus {
	color: #777;
}

.with-nav-tabs.panel-default .nav-tabs>.open>a, .with-nav-tabs.panel-default .nav-tabs>.open>a:hover,
	.with-nav-tabs.panel-default .nav-tabs>.open>a:focus, .with-nav-tabs.panel-default .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-default .nav-tabs>li>a:focus {
	color: #777;
	background-color: #ddd;
	border-color: transparent;
}

.with-nav-tabs.panel-default .nav-tabs>li.active>a, .with-nav-tabs.panel-default .nav-tabs>li.active>a:hover,
	.with-nav-tabs.panel-default .nav-tabs>li.active>a:focus {
	color: #555;
	background-color: #fff;
	border-color: #ddd;
	border-bottom-color: transparent;
}

.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu {
	background-color: #f5f5f5;
	border-color: #ddd;
}

.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu>li>a {
	color: #777;
}

.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu>li>a:hover,
	.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu>li>a:focus
	{
	background-color: #ddd;
}

.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu>.active>a,
	.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu>.active>a:hover,
	.with-nav-tabs.panel-default .nav-tabs>li.dropdown .dropdown-menu>.active>a:focus
	{
	color: #fff;
	background-color: #555;
}
/********************************************************************/
</style>


<style type="text/css">
.buttonCross {
	background-image: -webkit-linear-gradient(top, #f4f1ee, #fff);
	background-image: linear-gradient(top, #f4f1ee, #fff);
	border-radius: 50%;
	box-shadow: 0px 8px 10px 0px rgba(0, 0, 0, .3), inset 0px 4px 1px 1px
		white, inset 0px -3px 1px 1px rgba(204, 198, 197, .5);
	float: left;
	height: 30px;
	margin: 0 40px 10px 0;
	position: relative;
	width: 30px;
	-webkit-transition: all .1s linear;
	transition: all .1s linear;
}

.buttonCross:after {
	color: #e9e6e4;
	content: "";
	display: block;
	font-size: 10px;
	height: 10px;
	text-decoration: none;
	text-shadow: 0px -1px 1px #bdb5b4, 1px 1px 1px white;
	position: absolute;
	width: 10px;
}

.crossCss:after {
	content: "✖";
	left: 24px;
	top: 15px;
	margin-top: 5px;
}

.buttonCross:hover {
	background-image: -webkit-linear-gradient(top, #fff, #f4f1ee);
	background-image: linear-gradient(top, #fff, #f4f1ee);
	color: #0088cc;
}

.crossCss:hover:after {
	color: #eb2f2f;
	text-shadow: 0px 0px 6px #eb2f2f;
}

.buttonCross:active {
	background-image: -webkit-linear-gradient(top, #efedec, #f7f4f4);
	background-image: linear-gradient(top, #efedec, #f7f4f4);
	box-shadow: 0 3px 5px 0 rgba(0, 0, 0, .4), inset 0px -3px 1px 1px
		rgba(204, 198, 197, .5);
}

.buttonCross:active:after {
	color: #dbd2d2;
	text-shadow: 0px -1px 1px #bdb5b4, 0px 1px 1px white;
}
</style>





<style type="text/css">
/* iFrame 스크롤 안보이게 css*/
body {
	overflow-Y: hidden;
}
</style>

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







	<!-- 		여행시작일 및 박수  -->
	<section class="section section-lg bg-white text-center"
		style="padding-bottom: 40px; padding-top: 10px;">
		<div class="shell">
			<h5
				style="color: rgb(22, 160, 133); font-weight: 20; padding-right: 24px;">여행시작일</h5>
			<h1>${startdate }</h1>
			<div class=bak>
				<h1>
					<%=sleepday %>박
					<%= sleepday+1 %>일
				</h1>
			</div>
			<div class="divider divider-default"></div>




			<!-- 날짜 +,-버튼 -->
			<button type="button"
				class="btn btn-primary btn-circle tooltip-custom"
				data-toggle="tooltip" data-placement="top" title="여행이 하루 늘어납니다"
				id='dayplus'>
				<i class="glyphicon glyphicon-plus"></i>
			</button>
			<button type="button"
				class="btn btn-danger btn-circle tooltip-custom"
				data-toggle="tooltip" data-placement="top" title="여행이 하루 줄어듭니다"
				id='dayminus'>
				<i class="glyphicon glyphicon-minus"></i>
			</button>

			<div class="range range-sm-center"></div>
		</div>
	</section>






	<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
		<li class="active"><a id="dayTab1" href="#day1" data-toggle="tab"
			style="visibility: visible; border-radius: 6px;"><span
				style="font-size: 9px; color: green;">여헁계획 : </span>1일차</a></li>
		<c:forEach begin="2" varStatus="status" end="${lastday}">
			<!--  탭 타이틀 -->
			<c:set var="lastday" value="${lastday}" /> <%-- 실제 입력받은날짜 + 추가날짜 5--%>
			<c:set var="realday" value="${realday}" /> <%-- 실제 입력받은 일자 --%>
			<c:choose>

				<c:when test="${status.index<=realday}">  <%-- 실제 입력받은 일자까지 visible --%>
					<li><a id="dayTab${status.index}" href="#day${status.index}"
						data-toggle="tab" style="visibility: visible; border-radius: 6px;"><span
							style="font-size: 9px; color: green;">여헁계획 : </span>${status.index}일차
					</a></li>



				</c:when>

				<c:otherwise>  <%-- 그외 일자 hidden --%>
					<li><a id="dayTab${status.index}" href="#day${status.index}"
						data-toggle="tab" style="visibility: hidden; border-radius: 6px;"><span
							style="font-size: 9px; color: green;">여헁계획 : </span>${status.index}일차</a></li>
				</c:otherwise>
			</c:choose>

		</c:forEach>

	</ul>

	<div id=addscript></div>


	<!-- 일자추가 -->
	<script type="text/javascript">
		var daycnt=0; // 일자추가 카운트 변수
		var sleepday = <%=sleepday%> //박수 담을 변수
		
		
		//일자 추가 함수
	$(document).on("click","#dayplus",function(){
		
		 
		if(daycnt<5){	//데이 추가 제한 5
		$('#tabs').find('a[style="visibility: hidden; border-radius: 6px;"]').first().css("visibility","visible");
		
		$(".bak").empty();
		sleepday = sleepday+1
		sleepdaynext = sleepday+1
		
		$(".bak").append( "<h1>"+sleepday+"박 "+sleepdaynext+"일</h1>");
		}else{
		alert("일자를 5일이상 추가할 수 없습니다.");
		}
		
		
		
		    
		daycnt++;
        

	});
		
		//일자 삭제 함수
	$(document).on("click","#dayminus",function(){
		
		 
		$('#tabs').find('a[style="visibility: visible; border-radius: 6px;"]').last().css("visibility","hidden");
		
		$(".bak").empty();
		sleepday = sleepday-1
		sleepdaynext = sleepday+1
		$(".bak").append( "<h1>"+sleepday+"박 "+sleepdaynext+"일</h1>");
		
		daycnt--;
        

	});
		
	
	//완료버튼시 파일업로드 함수
	 function uploadsubmit(){
	
	
	//폼데이터 저장
	var formdata = new FormData($("#uploadform")[0]);
	
	//AJAX로 폼데이터 전송
	$.ajax({ 
		url: "requestupload.mh", 
		data: formdata,
		dataType: 'text', 
		processData: false, 
		contentType: false, 
		type: 'POST',
		success: function (response) { 
// 		alert("업로드 success"); 
		console.log(response); 
		},
		error: function (jqXHR) { 
			alert(jqXHR.responseText); 
		} 
	});

	
	//여행짜기 INSERT 함수 호출
	savedata();
	}	
	
	
	//여행짜기 INSERT 함수
	 function savedata(){
		

		//최종정보 담을 배열		
		var map_travel = [];
		
		
		//현재 선언된 일자 길이				
		var dayindex = ${dayindex}+5-$('#tabs').find('a[style="visibility: hidden; border-radius: 6px;"]').length;//비지블된 데이숫자 
		
		//지정한 메인타이틀정보
		var maintitle = $('#maintitle').val();
		
		//지정한 메인이미지 정보
		var mainimage = $('.upload-name').val();
		
		

		
		for(var i=0; i<dayindex; i++){
		var k = i+1;
		
		//map_day를 담을 객체
		var md= {};
		
		//일정 객체를 담을 배열 
		var map_day = [];
		
		
		//일자별 일정공간
		var str = ".schedule"+k;
		var schedule = $(str);
		
		//일자별 일정
		var str2 = ".schedulecol"+k;
		var schedulecol = $(str2)
		
		var schedulecnt = schedule.find(schedulecol).length;
		
	
// 		alert("일정갯수:"+schedulecnt );
		
 	
		//일정 하나에대한 정보를 담는 for문	
 		for(var j=0; j<schedulecnt; j++){
 		var list = {};
		list.firstimage = $(schedule).children().eq(j).find("img").attr("src");
		list.title = $(schedule).children().eq(j).find("span[name='title']").text();
		list.contentid = $(schedule).children().eq(j).find("input[name='contentid']").val();
		list.contenttypeid = $(schedule).children().eq(j).find("input[name='contenttypeid']").val();
		list.mapx = $(schedule).children().eq(j).find("input[name='mapx']").val();
		list.mapy = $(schedule).children().eq(j).find("input[name='mapy']").val();
		list.content = $(schedule).children().eq(j).find("textarea[name='content']").val();
		list.time = $(schedule).children().eq(j).find("ul[name='time']").find("li[class='active']").find("div").attr("data-value");
		list.alramtime = $(schedule).children().eq(j).find("ul[name='alramtime']").find("li[class='active']").find("div").attr("data-value");
		
		
// 		alert(schedulecol + "이미지경로 : " + $(schedule).children().eq(j).find("img").attr("src"));
// 		alert(schedulecol + "이름 : " + $(schedule).children().eq(j).find("span[name='title']").text());
// 		alert(schedulecol + "콘텐트아이디 :"+ $(schedule).children().eq(j).find("input[name='contentid']").val());
// 		alert(schedulecol + "콘텐트타입아이디 :"+$(schedule).children().eq(j).find("input[name='contenttypeid']").val());
// 		alert(schedulecol + "맵x :"+ $(schedule).children().eq(j).find("input[name='mapx']").val());
// 		alert(schedulecol + "맵y :"+ $(schedule).children().eq(j).find("input[name='mapy']").val());
// 		alert(schedulecol + "콘텐트 :"+ $(schedule).children().eq(j).find("textarea[name='content']").val());
// 		alert(schedulecol + "일정시간 :"+ $(schedule).children().eq(j).find("ul[name='time']").find("li[class='active']").find("div").attr("data-value"));
// 		alert(schedulecol + "알람시간 : "+ $(schedule).children().eq(j).find("ul[name='alramtime']").find("li[class='active']").find("div").attr("data-value"));
// 		alert("메인타이틀 "+ maintitle);
// 		alert("메인이미지 "+ mainimage);
		map_day.push(list);
			 
		



			
 		} //end of j for(schedule)
 		
 			
 		
 		md.map_date = map_day;
 		map_travel.push(md)
 		} // end of i for(day)
 		
 		console.log(map_travel);
 		
 		//최종 일정을 담을 객체
 		var travelmap = {};
 		
 		travelmap.map_title = maintitle;
 		travelmap.map_fname = mainimage;
 	
 		travelmap.map_day_list = map_travel;
 		

 		
 
 		
 		//정보 insert ajax
 		$.ajax({
            url: "inserttravel.mh",
            type: "POST",
            dataType : "JSON",
            data : JSON.stringify(travelmap),
            contentType : "application/json",
            success: function(data){
             	
            },
 			error: function(err){
 				
             	window.parent.location.href="/MapHack/main.mh"

 			}
		
 	});
};

	  
	  
	
	  

	 
</script>





	<!--  일자탭 생성 -->
	<div id="day-tab-content" class="tab-content">


		<c:forEach begin="1" varStatus="status" end="${lastday}">



			<!-- 탭 -->

			<div class="tab-pane active daynum" id="day${status.index}"
				style="visibility: visible; display: none;">
				<%--                      지도 탭${status.index} --%>





				<!-- ajax 드래거블 관련 js -->
				<div id='js${status.index}'>
					<script src="/MapHack/resource/makemap/js/jquery-1.10.2.min.js"></script>
					<script src="/MapHack/resource/makemap/js/jquery-ui.js"></script>
				</div>



				<!--        드래그, 즐겨찾기 슬라이더 생성 -->
				<div class="row">
					<div class="col-sm-7">
						<div class="panel-heading">
							<ul class="nav nav-tabs" id="tabs2">
								<li class="active"><a
									href="#dayTabMapContent${status.index}" data-toggle="tab"
									id="dayTabMapDrag${status.index}">드래그 목록</a></li>
								<li><a href="#dayTabLikeContent${status.index}"
									data-toggle="tab" id="dayTabLikeDrag${status.index}">즐겨찾기
										목록</a></li>
							</ul>
						</div>
						<div class="tab-content">

							<!-- 탭1 드래그목록 -->
							<div class="tab-pane fade in active"
								id="dayTabMapContent${status.index}">

								<div class='row'>
									<div class='col-md-12' id="colmd12${status.index}"
										style="margin-bottom: -30%; z-index: 200;">
										<div class="carousel slide media-carousel"
											id="draglist${status.index}">
											<div class="carousel-inner" id='drag-inner${status.index}'>


												<div class="item active">
													<div class="row">
														<!-- 	슬라이더 col 4개씩 생성 -->
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

							<!--탭2 즐겨찾기 목록 -->
							<div class="tab-pane fade" id="dayTabLikeContent${status.index}">

								<div class='row'>
									<div class='col-md-12' id="colmd12${status.index}"
										style="margin-bottom: -30%; z-index: 200;">
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

						<div
							style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">

							<%-- 					<h3>${status.index}일차지도</h3> --%>

							<div id="map-area${status.index}"
								style="width: 100%; height: 800px;">
								<div id="map-canvas${status.index}"
									style="width: 100%; height: 800px;"></div>
							</div>


						</div>

					</div>


					<div class="col-md-4 schedule${status.index}"
						style="float: left; padding-top: 50px;">


						<!-- 일정1 -->

						<!-- 이부분 수정했음 : padding-left: 12px; 추가 padding-right: 10px; -->
						<!--                 		<div class="box-classic box-shadow box-novi" style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px;  -->
						<!--                 		margin-top: 10px; padding-top: 10px; padding-bottom: 10px;"> -->
						<!-- 						<div class="row"> -->
						<!-- 										<div -->
						<!-- 											style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;"> -->
						<!-- 											<p><span style="font-size: 20; font-weight: 30; color: red;">감로암</span></p> -->
						<!-- 											이미지 -->
						<!-- 											<div class="flickr-item" data-type="flickr-item" -->
						<!-- 												style="border: solid;'"> -->
						<!-- 												<div class="thumb-default"> -->
						<!-- 													<a class="flickr-link" href="#" data-image_b="href" -->
						<!-- 														data-lightgallery="group-item"><img -->
						<!-- 														class="flickr-image" -->
						<!-- 														src="https://unsplash.it/400/300/?random" -->
						<!-- 														data-image_b="src" data-title="alt" alt=""> -->
						<!-- 														<div class="thumb-default-overlay"></div></a> -->
						<!-- 												</div> -->
						<!-- 											</div> -->
						<!-- 										</div> -->


						<!-- 										일정컨텐츠 입력칸 -->
						<!-- 										<div class="form-wrap form-wrap-validation" -->
						<!-- 											style="float: left !important; width: 70%"> -->

						<!-- 											<div class="row" style="margin-right: 0px;"> -->
						<!-- 											<div class="col-sm-4" > -->
						<!-- 											<p><span style="font-size: 20; font-weight: 30; color: red;">일정입력</span></p> -->
						<!-- 											</div> -->

						<!-- 											<div class="col-sm-6"></div> -->
						<!-- 											x버튼 추가 -->
						<!-- 											<div class="col-sm-2"> -->
						<!-- 											  <div  class=" crossCss"></div> -->
						<!-- 											</div> -->
						<!-- 											</div> -->

						<!-- 											<textarea class="form-input" id="form-1-message" -->
						<!-- 												name="message" style="min-width: 95%; max-height: 15px;"></textarea> -->
						<!-- 										</div> -->
						<!-- </div> -->

						<!-- 									알람 -->
						<!-- 									<div class="row"  > -->
						<!-- 									알람 col-부분 수정했음 -->
						<!-- 									<div class="col-md-3"></div> -->
						<!-- 									<div class="col-md-4" style="padding-right: 0px; margin-right: -60px; margin-left: 16px;"> -->
						<!-- 									<p><span style="font-size: 20; font-weight: 30; color: blue;">메모 알림설정</span></p> -->
						<!-- 									</div> -->

						<!-- 									알림버튼 timepicker추가 -->
						<!-- 							<div class="col-md-2" style="margin-right: 31px;"> -->
						<!-- 								<div class="btn-group timepickercontainer dropdown focus-active" -->
						<!-- 									id="atimepicker" data-value="11:45AM"> -->
						<!-- 									<button type="button" data-onClick="ScrollToActive(this);" -->
						<!-- 										class="btn btn-default dropdown-toggle" data-toggle="dropdown" -->
						<!-- 										aria-haspopup="true" aria-expanded="false"> -->
						<!-- 										11:45AM <i class="caret"></i> -->
						<!-- 									</button> -->
						<!-- 									<ul class="dropdown-menu" onLoad="SetScrollValue(this);"> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="8:00AM">8:00AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="8:15AM">8:15AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="8:30AM">8:30AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="8:45AM">8:45AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="9:00AM">9:00AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="9:15AM">9:15AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="9:30AM">9:30AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="9:45AM">9:45AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="10:00AM">10:00AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="10:15AM">10:15AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="10:30AM">10:30AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="10:45AM">10:45AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="11:00AM">11:00AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="11:15AM">11:15AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="11:30AM">11:30AM</a></li> -->

						<!-- 										<li class="active"><a href="#" -->
						<!-- 											onclick="HandleTimeSelect(this);" data-value="11:45AM">11:45AM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="12:00PM">12:00PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="12:15PM">12:15PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="12:30PM">12:30PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="12:45PM">12:45PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="1:00PM">1:00PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="1:15PM">1:15PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="1:30PM">1:30PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="1:45PM">1:45PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="2:00PM">2:00PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="2:15PM">2:15PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="2:30PM">2:30PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="2:45PM">2:45PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="3:00PM">3:00PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="3:15PM">3:15PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="3:30PM">3:30PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="3:45PM">3:45PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="4:00PM">4:00PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="4:15PM">4:15PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="4:30PM">4:30PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="4:45PM">4:45PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="5:00PM">5:00PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="5:15PM">5:15PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="5:30PM">5:30PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="5:45PM">5:45PM</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="6:00PM">6:00PM</a></li> -->

						<!-- 									</ul> -->
						<!-- 									<script> $(".dropdown.focus-active").on("shown.bs.dropdown", function() {$(this).find(".dropdown-menu li.active a").focus();});</script> -->
						<!-- 								</div> -->
						<!-- 							알림버튼 추가 끝 -->

						<!-- 										</div> -->



						<!-- 										몇분전 시간 정하기 추가 -->
						<!-- 										<div class="col-md-2" style="padding-left: 0px;"> -->

						<!-- 								<div class="btn-group timepickercontainer dropdown focus-active" -->
						<!-- 									id="atimepicker" data-value="11:45AM"> -->
						<!-- 									<button type="button" data-onClick="ScrollToActive(this);" -->
						<!-- 										class="btn btn-default dropdown-toggle" data-toggle="dropdown" -->
						<!-- 										aria-haspopup="true" aria-expanded="false"> -->
						<!-- 										알람띄우기 <i class="caret"></i> -->
						<!-- 									</button> -->
						<!-- 									<ul class="dropdown-menu" onLoad="SetScrollValue(this);"> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="">설정 안함</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="0">해당시간 즉시</a></li> -->


						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="10">10분 전</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="30">30분 전</a></li>	 -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="60">1시간 전</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="120">2시간 전</a></li> -->

						<!-- 										<li><a href="#" onclick="HandleTimeSelect(this);" -->
						<!-- 											data-value="360">하루 반 전</a></li> -->


						<!-- 									</ul> -->
						<!-- 									<script> $(".dropdown.focus-active").on("shown.bs.dropdown", function() {$(this).find(".dropdown-menu li.active a").focus();});</script> -->
						<!-- 								</div> -->
						<!-- 							알림버튼 추가 끝 -->

						<!-- 										</div> -->

						<!-- 										시간정하기 끝 -->
						<!-- 										<div class="col-md-3"></div> -->




						<!-- 									</div> -->
						<!-- 								</div> -->

					</div>

				</div>

				<!-- 구글맵시작 -->





				<!-- Shadow box-->









				<!-- 	일정시작 -->

				<!-- 								                                    <a class="MOD_FEATURE_Container"> <img -->
				<!-- 								                                       class="MOD_FEATURE_Picture" -->
				<!-- 								                                       src="https://unsplash.it/400/300/?random" alt=""> -->
				<!-- 								                                       <div class="MOD_FEATURE_TextContainer"> -->
				<!-- 								                                          <p class="MOD_FEATURE_Title" data-theme="_ts2">장소명</p> -->
				<!-- 								                                          <p id="MOD_FEATURE_Description">일정컨텐츠</p> -->
				<!-- 								                                          <hr /> -->
				<!-- 								                                          <div class="alram"> -->
				<!-- 								                                             <input type="time" id="time" /> -->
				<!-- 								                                             <hr /> -->

				<!-- 								                                             <select name="alramtime"> -->
				<!-- 								                                                <option value="">알람시간 선택</option> -->
				<!-- 								                                                <option value="30">30분 전</option> -->
				<!-- 								                                                <option value="60">한시간 전</option> -->
				<!-- 								                                                <option value="90">한시간 반 전</option> -->
				<!-- 								                                                <option value="120">두시간 전</option> -->
				<!-- 								                                             </select> -->
				<!-- 								                                             <hr /> -->
				<!-- 								                                          </div> -->

				<!-- 								                                       </div> -->
				<!-- 								                                    </a> -->


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
     $(".drag${status.index}").draggable({
    	 revert:function(event,ui){
        if(event==false){
                isRevert=false;        
        }else{
                isRevert=true;
            }
     	},
      //드래그되는 모양 복제
       helper: "clone",
       opacity:"0.7", //투명도
       appendTo: "body",
      //드래그가 시작됬을때 발생
    	start:function(event,ui){
    		 { 
    		ui.helper.css('width', '270px'); ui.helper.css('height', '159.99px');}
            z_idx++;
        	},		 
        //드래그 도중 발생
        drag:function(event,ui){
        },
      //드래그가 중지됬을때 발생
        stop:function(event,ui){
          var img_choice = $(this).find("img").attr("src"); //이미지경로
          var title_choice = $(this).find("input[name='title']").val(); //이름
          var mapx = $(this).find("input[name='mapx']").val(); //x좌표
          var mapy = $(this).find("input[name='mapy']").val(); //y좌표
          var contentid = $(this).find("input[name='contentid']").val(); //정보기본키
          var contenttypeid = $(this).find("input[name='contenttypeid']").val(); //정보타입
 		  var listtype = $(this).find("input[name='listtype']").val(); //슬라이더타입
            //제대로 droppable 객체 안에 들어갔을때 
            if(isRevert){

            	//마커 호출 메소드
            	inputMark${status.index}(mapx,mapy,contentid, contenttypeid);

                //맵에 들어간 순서대로 배열저장
                saveMap[saveCnt]= img_choice;
                saveTitle[saveCnt]=title_choice;
                saveMapx[saveCnt] = mapx;
                saveMapy[saveCnt] = mapy;
                saveContentId[saveCnt] = contentid;
                saveContentTypeId[saveCnt] = contenttypeid;
                var check = 1; //일정추가 중복 체크
        
              for(var i=0; i<$(".schedule${status.index}").children().length; i++){
                if(saveTitle[saveCnt]== $(".schedule${status.index}").children().eq(i).find("span[name='title']").text()){
					alert("이미 일정 목록에 있습니다.");
                	check =2;
             		
                }
              }  
           		if(check== 1){ //중복이 없다면
                $(".schedule${status.index}").append(
                		
                		"<div class='box-classic box-shadow box-novi schedulecol${status.index}' "+
                		 "style='margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px;"+
                    		"margin-top: 10px; padding-top: 10px; padding-bottom: 10px;'>"+
    						"<div class='row'>"+
    										"<div style='float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;'>"+
    											"<p><span style='font-size: 20; font-weight: 30; color: red;' name ='title'>"+saveTitle[saveCnt]+"</span></p>"+
    											
    					 						"<div class='flickr-item' data-type='flickr-item' style='border: solid;'>"+
    												"<div class='thumb-default'>"+
    													"<a class='flickr-link' href='#' data-image_b='href' data-lightgallery='group-item'>"+
    												"<img class='flickr-image' src='"+saveMap[saveCnt]+"' data-image_b='src' data-title='alt' alt=''>"+
    														"<div class='thumb-default-overlay'></div></a>"+
    												"</div>"+
    											"</div>"+
    									   "</div>"+
    										"<div class='form-wrap form-wrap-validation' style='float: left !important; width: 70%'>"+
    											
    											"<div class='row' style='margin-right: 0px;'>"+
    											"<div class='col-sm-4' >"+
    											"<p><span style='font-size: 20; font-weight: 30; color: red;'>일정입력</span></p>"+
    											"</div>"+
    										
    											"<div class='col-sm-6'></div>"+
    											
    											"<div class='col-sm-2 dragcancel${status.index}'>"+
    											 "<div  class='crossCss'></div>"+
    											"</div>"+
    											"</div>"+
    											
    											"<textarea class='form-input' id='form-1-message' name='content' style='min-width: 95%; max-height: 15px;'></textarea>"+
    										"</div>"+
    							"</div>"+

    								
    									"<div class='row'>"+
    									
    									"<div class='col-md-3'></div>"+
    									"<div class='col-md-4' style='padding-right: 0px; margin-right: -60px; margin-left: 16px;'>"+
    									"<p><span style='font-size: 20; font-weight: 30; color: blue;'>메모 알림설정</span></p>"+
    									"</div>"+
    										
    							"<div class='col-md-2' style='margin-right: 31px;'>"+
    								"<div class='btn-group timepickercontainer dropdown focus-active' id='atimepicker' data-value=''>"+
    									"<button type='button' data-onClick='ScrollToActive(this);'  class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
    										"일정시간 "+
    									"</button>"+
    									"<ul class='dropdown-menu' name = 'time' onLoad='SetScrollValue(this);'>"+

    							
    										
    										
    									"<li><div onclick='HandleTimeSelect(this);' data-value='05:00'>5:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='06:00'>6:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='07:00'>7:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='08:00'>8:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='09:00'>9:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='10:00'>10:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='11:00'>11:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='12:00'>12:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='13:00'>1:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='14:00'>2:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='15:00'>3:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='16:00'>4:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='17:00'>5:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='18:00'>6:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='19:00'>7:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='20:00'>8:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='21:00'>9:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='22:00'>10:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='23:00'>11:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='00:00'>00:00AM</div></li>"+
    									"</ul>"+
    								"</div>"+

    										"</div>"+
    										
    										
    										
    										"<div class='col-md-2' style='padding-left: 0px;'>"+
    											
    								"<div class='btn-group timepickercontainer dropdown focus-active' id='atimepicker' data-value=''>"+
    									"<button type='button' data-onClick='ScrollToActive(this);'  class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
    										"알람띄우기"+
    										
    									"</button>"+
    									"<ul class='dropdown-menu'  name ='alramtime' onLoad='SetScrollValue(this);'>"+

    									"<li><div onclick='HandleTimeSelect(this);' data-value=''>설정 안함</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='0'>해당일정즉시</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='10'>10분 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='30'>30분 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='60'>1시간 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='120'>2시간 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='360'>하루 전</div></li>"+
    										


    									"</ul>"+
    								"</div>"+
    						
    										"</div>"+
    										"<div class='col-md-3'></div>"+
    										
    										
    										
    									"</div>"+
    									 " <input type=hidden value='"+saveMapx[saveCnt]+"' name='mapx'/>" +
    				                     " <input type=hidden value='"+saveMapy[saveCnt]+"' name='mapy'/>" +
    				                     " <input type=hidden value='"+saveContentId[saveCnt]+"' name='contentid'/>" +
    				                     " <input type=hidden value='"+saveContentTypeId[saveCnt]+"' name='contenttypeid'/>" +
    								"</div>"
                		
                		
                		
                		
                		

                		
                		
                		
                		
                		
                		
                		
//                    "<div data-layout='ch8 ec4' class='schedulecol${status.index}'>"+
//                     "<a class='MOD_FEATURE_Container'>"+
//                     "<img class='MOD_FEATURE_Picture' src='"+saveMap[saveCnt]+"' width =270px height=202.5px alt=''>"+
//                     "<div class='MOD_FEATURE_TextContainer'>"+
//                       "<p class='MOD_FEATURE_Title' data-theme='_ts2' name='title'>"+saveTitle[saveCnt]+"</p>"+
//                       "<p class='MOD_FEATURE_Description' >일정컨텐츠 </p> "+
//                       "<input type='textarea' class='textarea' name='content'/> <hr/>"+
//                       "<p class='MOD_FEATURE_Description'>일정시간선택</p> "+
//                       "<div class='time'> <input type='time' id ='time' name='time'/></div> <hr/>"+
//                       "<select name='alramtime'>"+
//                 "<option value=''>알람시간 선택</option>"+
//               "<option value='30'>30분 전</option>"+
//               "<option value='60'>한시간 전 </option>"+
//               "<option value='90'>한시간 반 전</option>"+
//               "<option value='120'>두시간 전</option>"+
//           "</select> <hr/>" +
//           " <input type=button class='dragcancel${status.index}' value='취소' />"+
//           " <input type=hidden value='"+saveMapx[saveCnt]+"' name='mapx'/>" +
//           " <input type=hidden value='"+saveMapy[saveCnt]+"' name='mapy'/>" +
//           " <input type=hidden value='"+saveContentId[saveCnt]+"' name='contentid'/>" +
//           " <input type=hidden value='"+saveContentTypeId[saveCnt]+"' name='contenttypeid'/>" +
//           "</div>"+
//                     "</div>"+
//                   "</a>"+
//                 "</div>"
                
                
                
                );
           		}
           		check=2;
                
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
      
      stop:function(event,ui){
         var img_choice = $(this).find("img").attr("src");
         var title_choice = $(this).find("input[name='title']").val();
        var mapx = $(this).find("input[name='mapx']").val();
        var mapy = $(this).find("input[name='mapy']").val();
        var contentid = $(this).find("input[name='contentid']").val();
        var contenttypeid = $(this).find("input[name='contenttypeid']").val();
		  var listtype = $(this).find("input[name='listtype']").val();
		  
// 		  alert(listtype +"___"+ ${status.index});
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
            
          
              var check = 1;
              
              for(var i=0; i<$(".schedule${status.index}").children().length; i++){
                if(saveTitle[saveCnt]== $(".schedule${status.index}").children().eq(i).find("span[name='title']").text()){
					alert("이미 일정 목록에 있습니다.");
                	check =2;
             		
                }
              }
           		if(check== 1){
                $(".schedule${status.index}").append(
                		
                		"<div class='box-classic box-shadow box-novi schedulecol${status.index}' style='margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px;"+
                    		"margin-top: 10px; padding-top: 10px; padding-bottom: 10px;'>"+
    						"<div class='row'>"+
    										"<div style='float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;'>"+
    											"<p><span style='font-size: 20; font-weight: 30; color: red;' name ='title'>"+saveTitle[saveCnt]+"</span></p>"+
    											
    					 						"<div class='flickr-item' data-type='flickr-item' style='border: solid;'>"+
    												"<div class='thumb-default'>"+
    													"<a class='flickr-link' href='#' data-image_b='href' data-lightgallery='group-item'>"+
    												"<img class='flickr-image' src='"+saveMap[saveCnt]+"' data-image_b='src' data-title='alt' alt=''>"+
    														"<div class='thumb-default-overlay'></div></a>"+
    												"</div>"+
    											"</div>"+
    									   "</div>"+
    										"<div class='form-wrap form-wrap-validation' style='float: left !important; width: 70%'>"+
    											
    											"<div class='row' style='margin-right: 0px;'>"+
    											"<div class='col-sm-4' >"+
    											"<p><span style='font-size: 20; font-weight: 30; color: red;'>일정입력</span></p>"+
    											"</div>"+
    										
    											"<div class='col-sm-6'></div>"+
    											
    											"<div class='col-sm-2 dragcancel${status.index}'>"+
    											 "<div  class='crossCss'></div>"+
    											"</div>"+
    											"</div>"+
    											
    											"<textarea class='form-input' id='form-1-message' name='content' style='min-width: 95%; max-height: 15px;'></textarea>"+
    										"</div>"+
    							"</div>"+

    								
    									"<div class='row'>"+
    									
    									"<div class='col-md-3'></div>"+
    									"<div class='col-md-4' style='padding-right: 0px; margin-right: -60px; margin-left: 16px;'>"+
    									"<p><span style='font-size: 20; font-weight: 30; color: blue;'>메모 알림설정</span></p>"+
    									"</div>"+
    										
    							"<div class='col-md-2' style='margin-right: 31px;'>"+
    								"<div class='btn-group timepickercontainer dropdown focus-active' id='atimepicker' data-value=''>"+
    									"<button type='button' data-onClick='ScrollToActive(this);'  class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
    										"일정시간 "+
    									"</button>"+
    									"<ul class='dropdown-menu' name = 'time' onLoad='SetScrollValue(this);'>"+

    							
    										
    										
    									"<li><div onclick='HandleTimeSelect(this);' data-value='05:00'>5:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='06:00'>6:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='07:00'>7:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='08:00'>8:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='09:00'>9:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='10:00'>10:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='11:00'>11:00AM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='12:00'>12:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='13:00'>1:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='14:00'>2:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='15:00'>3:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='16:00'>4:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='17:00'>5:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='18:00'>6:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='19:00'>7:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='20:00'>8:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='21:00'>9:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='22:00'>10:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='23:00'>11:00PM</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='00:00'>00:00AM</div></li>"+
    									"</ul>"+
    								"</div>"+

    										"</div>"+
    										
    										
    										
    										"<div class='col-md-2' style='padding-left: 0px;'>"+
    											
    								"<div class='btn-group timepickercontainer dropdown focus-active' id='atimepicker' data-value=''>"+
    									"<button type='button' data-onClick='ScrollToActive(this);'  class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
    										"알람띄우기"+
    										
    									"</button>"+
    									"<ul class='dropdown-menu'  name ='alramtime' onLoad='SetScrollValue(this);'>"+

    									"<li><div onclick='HandleTimeSelect(this);' data-value=''>설정 안함</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='0'>해당일정즉시</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='10'>10분 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='30'>30분 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='60'>1시간 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='120'>2시간 전</div></li>"+
										"<li><div onclick='HandleTimeSelect(this);' data-value='360'>하루 전</div></li>"+
    										


    									"</ul>"+
    								"</div>"+
    						
    										"</div>"+
    										"<div class='col-md-3'></div>"+
    										
    										
    										
    									"</div>"+
    									 " <input type=hidden value='"+saveMapx[saveCnt]+"' name='mapx'/>" +
    				                     " <input type=hidden value='"+saveMapy[saveCnt]+"' name='mapy'/>" +
    				                     " <input type=hidden value='"+saveContentId[saveCnt]+"' name='contentid'/>" +
    				                     " <input type=hidden value='"+saveContentTypeId[saveCnt]+"' name='contenttypeid'/>" +
    								"</div>"
                		
                
                
                
                );
           		}
           		check=2;
              
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
                    
                  	//변경된 드래그리스트 값저장
                     var arr = data.bmList;
                    
                  	
                     var slide_inner = $('#bm-inner${status.index}');
                   //슬라이더 내부 비우기
                     slide_inner.empty();
                     
                   
                   
                     var arr_index = arr.length;
                     var img_index = 0;
                   
                     var itemactive = $("<div class='item active'></div>");

//                       4개짜리 슬라이더(몫) 값 계산
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
                     
                     //전체리스트가 4개 미만일시
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
                     
                   
                    
                    

                    

                    
                    
                  bmDraggable${status.index}();   //드래거블 이벤트 다시호출
                  $(this).remove();  //해당 값 삭제
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


//드랍메소드 (맵에 슬라이더항목이 들어가도록)
$('#map-canvas${status.index}').droppable({
    accept: ".bm${status.index}", // 드롭시킬 대상 요소   
    drop: function(event, ui) {
//         alert("맵에드랍됨");
    }
});
} //즐찾 리스트드래그 & 드랍 end




 
 
      //메인 이미지 이름 저장 용
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
                 
             });
             
         //메인 이미지 픠뷰
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

			<script type="text/javascript">
 
 
  
  var mapday${status.index};
  
  //일자별 마커리스트 배열
  var markerList${status.index} = [];
  //일자별 마커타입리스트 배열
  var contentIdList${status.index} = [];
  
  //각 일자별 지도로딩 메소드
function initialize${status.index}() {
	  
  	
  	 dayinitialize${status.index}(); //step2
     daystep${status.index}();//step2
     
} 




	//맵에대한 포커싱및  구글맵 설정 메소드
function dayinitialize${status.index}() {
        
	mapProp = {
	          center: new google.maps.LatLng(37.567835,126.986357),
	          zoom: 13,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };

        mapday${status.index} = new google.maps.Map(document.getElementById("map-canvas${status.index}"), mapProp);
      
  
}  
      
	//맵에대한 리사이즈 설정 메소드
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

//마크생성
function inputMark${status.index}(mapx, mapy,contentid, contenttypeid){

	var icon ; //타입별 이미지 부여
	
	switch(contenttypeid){ 
	case '12': icon = 'info-i_maps.png';  break;
	
	case '32': icon = 'library_maps.png'; break;
	
	case '39': icon = 'parking_lot_maps.png';  break;
		
	}
		


        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(mapy , mapx ),
          
          icon: 'https://maps.google.com/mapfiles/kml/shapes/'+ icon,
          map: mapday${status.index}
        });
       contentIdList${status.index}.push(contentid);
       markerList${status.index}.push(marker);

}

// 마커삭제 메소드
function deleteMark${status.index}(mapx, mapy,contentid, contenttypeid){
	var deleteMarker;

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

		<!--  메인이미지, 타이틀, 완료 폼 -->

		<div class="container">
			<div class="col-md-12 col-xs-12" style="margin-top: 4%;">
				<div id="accordion" role="tablist" aria-multiselectable="true">
					<div class="card">
						<div class="card-header" role="tab" id="headingOne">
							<h5 class="mb-0">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne" aria-expanded="true"
									aria-controls="collapseOne">
									<h2 style="text-align: center;">등록하기</h2>
								</a>
							</h5>
						</div>

						<div id="collapseOne" class="collapse" role="tabpanel"
							aria-labelledby="headingOne">
							<div class="card-block">

								<div data-layout="_r">
									<div data-layout="ch8 ec-third">
										<img src="https://unsplash.it/400/300/?random" id="img1"
											alt="">
									</div>

									<div data-layout="ch8 ec-third" class="filebox preview-image">



										<form name="fileForm" action="/MapHack/requestupload.mh"
											class="uploadform" id="uploadform" method="post"
											enctype="multipart/form-data">


											<div class="range range-sm-center">
												메인제목 설정
												<div class="cell-sm-8 cell-lg-6">
													<div class="form-wrap box-width-1">
														<input type="text" style="color: black;" id='maintitle' /></br>

													</div>
												</div>
											</div>
											<!--메인사진설정 -->
											<div class="range range-sm-center">
												메인사진 설정
												<div class="cell-sm-8 cell-lg-6">
													<div
														class="form-wrap box-width-1 filebox bs3-primary preview-image">
														<input class="upload-name" value="파일선택"
															disabled="disabled" name="src" id="src"
															style="color: black;"> <label for="input-file">업로드</label>
													</div>
												</div>
											</div>
											<!-- 	업로드&완료  버튼-->
											<input type="file" id="input-file" name="file"
												class="upload-hidden"> <input type="button"
												class="button button-secondary button-nina savedata"
												value="완료" onclick="uploadsubmit();" />

										</form>
									</div>


								</div>
							</div>






						</div>
					</div>
				</div>

			</div>
		</div>
		</div>











	</section>


	<!--                            두번째탭 끝 -->

	<!-- 섹션끝 -->





	<!-- 해당페이지끝 -->







	<script type="text/javascript">


//부모창에서 step2 로 전환 트리거 메소드
$(document).ready(function (){  
	
	window.parent.$('#mapTab2').trigger('click');
	
	
	 
	
	

});  


 

</script>


	<script type="text/javascript">

 //시계_하은
    function HandleTimeSelect(a){
        $(a).closest(".timepickercontainer").attr("data-value", $(a).text());
        $(a).closest(".timepickercontainer").find("button").first().html($(a).text() );
        $(a).closest(".timepickercontainer").find("li.active").each(function() {$(this).removeClass("active");});
        $(a).parent().addClass("active");
    }
    function ScrollToActive(btn){
        //console.log("scrolling down "+  $(btn).closest(".timepickercontainer").find(".dropdown-menu").first());
        //$(btn).closest(".timepickercontainer").find(".dropdown-menu").first().scrollTop(600);
        $(btn).closest(".timepickercontainer").find(".dropdown-menu").first().on('show.bs.dropdown', function () {
            $(btn).closest(".timepickercontainer").find(".dropdown-menu").first().scrollTop(600);
            console.log("performing");
            
        });
    }
    function SetScrollValue(ul){
        $(ul).scrollTop(600);
        console.log("setting scroll");
    }
    function SetScrollValues(){
       $(".dropdown.focus-active").on("shown.bs.dropdown", function() {$(this).find(".dropdown-menu li.active a").focus();});
    };

    </script>




	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>

	<!-- 	<script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> -->
	<!-- 	<script -->
	<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script> -->





</body>
</html>