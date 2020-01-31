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
<style type="text/css">
/* 하은하은 */

.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
/*** PANEL DANGER ***/
.with-nav-tabs.panel-danger .nav-tabs > li > a,
.with-nav-tabs.panel-danger .nav-tabs > li > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li > a:focus {
	color: #a94442;
}
.with-nav-tabs.panel-danger .nav-tabs > .open > a,
.with-nav-tabs.panel-danger .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-danger .nav-tabs > li > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li > a:focus {
	color: #a94442;
	background-color: #ebccd1;
	border-color: transparent;
}
.with-nav-tabs.panel-danger .nav-tabs > li.active > a,
.with-nav-tabs.panel-danger .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li.active > a:focus {
	color: #a94442;
	background-color: #fff;
	border-color: #ebccd1;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #f2dede; /* bg color */
    border-color: #ebccd1; /* border color */
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #a94442; /* normal text color */  
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #ebccd1; /* hover bg color */
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff; /* active text color */
    background-color: #a94442; /* active bg color */
}


/** 지도*/
.map {
    width: 100%;
   	height: 775px;
    float: left;
    margin: 10px;
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


<div class="page">


<jsp:include page="/WEB-INF/view/include/header.jsp" />

 <section class="section section-lg bg-white" style="background: linear-gradient(-32deg, #8b0fe4 -2%, rgb(41, 41, 58) 26%); padding-bottom: 0px; padding-top: 0px; height:250px;">
        <!-- section wave-->
           <h4 style="color:white; padding-left: 45px; padding-top: 192px; padding-right: 880px;"> 여행짜기 상세보기 </h4>
      
      </section>



		<section class="section section-lg bg-white text-center">
				<div style="    padding-top: 52px;">
					<h1><span style="font-size: 25px">title : </span>서울 문화여행</h1>
<%-- 					<h3>${traveldaytitle}</h3> --%>
						<div class="row" style="padding-top: 18px;padding-bottom: 18px;">
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<img src="/MapHack/resource/main/images/mainCustom/seoul.jpg">
							</div>
							<div class="col-md-4"></div>
						</div>
					
							<h5 style="color: rgb(22, 160, 133); font-weight: 20;padding-right: 24px;">여행기간</h5>
	<%-- 						<h1>${startdate }</h1> --%>
								<h4>2017.12.20 ~ 2017.12.24 </h4>
	<%-- 							<div class="" > <h4> 여행 ${status.index}일차</h4> </div> --%>

				
				</div>
		</section>



		<section class="section section-lg bg-white text-center">


			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-left: 60px; ">
					<div class="panel with-nav-tabs panel-danger">
						<div class="panel-heading">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#plan" data-toggle="tab">여행계획 : 전체</a></li>
								<li><a href="#plan1" data-toggle="tab">여행계획 : 1일 차</a></li>
								<li><a href="#plan2" data-toggle="tab">여행계획 : 2일 차</a></li>
								<li><a href="#plan3" data-toggle="tab">여행계획 : 3일 차</a></li>
<!-- 								<li><a href="#plan4" data-toggle="tab">여행계획 : 4일 차</a></li> -->
<!-- 								<li><a href="#plan5" data-toggle="tab">여행계획 : 5일 차</a></li> -->
							</ul>
						</div>
						<div class="panel-body" style="padding-bottom: 130px;">
							<div class="tab-content">
							<!-- 탭0 :전체 ############################################################ -->
								<div class="tab-pane fade in active" id="plan">

							<div class="tapRepeat">
								<div style="margin-top: 60px; margin-bottom: 60px;">
									<h5
										style="color: rgb(22, 160, 133); font-weight: 20; padding-right: 24px;">여행일</h5>
									<h1>2017-12-20</h1>
									<div>
										<h4>여행 첫째날</h4>
									</div>
									<div class="divider divider-default"></div>
								</div>
								
								
								
								<div class="row">
									
										<div class="col-md-7">
											<div id="map1" class="map"></div>	
										</div>
									
										<div class="col-md-3" style="width: 584px;">
										
										
										<!-- 일정1 -->
												<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">감로암</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample1.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>AM 11:30</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>10분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
											
											
									<!-- 일정2 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">세종로공원</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample2.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 1:00</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>15분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
									<!-- 일정3 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">청계관광특구</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample3.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 3:45</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>알람 설정안함</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
										<!-- 일정3끝 -->	
										
										
										
										
										
										</div>
									
									</div>
								
								
								
								
								
								
								
								
								
								
								
								

								</div>
								
								
								
								<div class="tapRepeat" style="margin-top: 190px;">
								<div style="margin-top: 60px; margin-bottom: 60px;">
									<h5
										style="color: rgb(22, 160, 133); font-weight: 20; padding-right: 24px;">여행일</h5>
									<h1>2017-12-21</h1>
									<div>
										<h4>여행 둘째날</h4>
									</div>
									<div class="divider divider-default"></div>
								</div>
								
								
								
								<div class="row">
									
										<div class="col-md-7">
											<div id="map2" class="map"></div>	
										</div>
									
										<div class="col-md-3" style="width: 584px;">
										
										
										<!-- 일정1 -->
												<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">강남 테헤란로</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample4.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 01:15</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>30분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
											
											
									<!-- 일정2 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">페스티벌 2017</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample5.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 7:30</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>60분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
										
										
										</div>
									
									</div>
								

								</div>
								
								
								
								
								
								<!-- 반복3 -->
								<div class="tapRepeat" style="margin-top: 190px;">
								<div style="margin-top: 60px; margin-bottom: 60px;">
									<h5
										style="color: rgb(22, 160, 133); font-weight: 20; padding-right: 24px;">여행일</h5>
									<h1>2017-12-22</h1>
									<div>
										<h4>여행 셋째날</h4>
									</div>
									<div class="divider divider-default"></div>
								</div>
								
								
								
								<div class="row">
									
										<div class="col-md-7">
											<div id="map3" class="map"></div>	
										</div>
									
										<div class="col-md-3" style="width: 584px;">
										
										
										<!-- 일정1 -->
												<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">갤러리 사진창고</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample6.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>AM 10:30</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>하루 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
											
											
									<!-- 일정2 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">갯마을</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample7.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 12:00</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>30분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
									<!-- 일정3 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">겸재정선미술관</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample8.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 3:00</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>60분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
										<!-- 일정3끝 -->	
										
										<!-- 일정4 시작 -->
										
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">경복궁</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample9.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 4:45</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>알람 설정안함</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
										<!-- 일정4 끝 -->
										
										
										</div>
									
									</div>
								
								
								
								
								
								
								
								
								
								
								
								

								</div>
								
								
				
								
								
								
								</div>

								<!-- 탭1 : 일정1############################################################ -->
								<div class="tab-pane fade" id="plan1">


									<div style="margin-top: 60px; margin-bottom: 60px;">
										<h5
											style="color: rgb(22, 160, 133); font-weight: 20; padding-right: 24px;">여행일</h5>
										<h1>2017-12-20</h1>
										<div>
											<h4>여행 첫째날</h4>
										</div>
										<div class="divider divider-default"></div>
									</div>


									<div class="row">
									
										<div class="col-md-7">
											<div id="map4" class="map"></div>	
										</div>
									
										<div class="col-md-3" style="width: 584px;">
										
										
										<!-- 일정1 -->
												<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">감로암</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample1.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>AM 11:30</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>10분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
											
											
									<!-- 일정2 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">세종로공원</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample2.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 1:00</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>15분 전 알람 띄우기</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
											
											
									<!-- 일정3 -->		
										<div class="box-classic box-shadow box-novi"
												style="margin-left: 0px; margin-right: 0px; padding-left: 12px; padding-right: 10px; 
												margin-top: 10px; padding-top: 10px; padding-bottom: 10px;">
												<div class="row">
													<!-- 일정칸 왼쪽부분 구조: 감로암(title)+이미지공간 -->
													<div style="float: left; width: 30%; padding-bottom: 15px; padding-left: 15px; padding-right: 17px;">
														<p style="margin-bottom: 10px;">
															<span style="font-size: 20; font-weight: 30; color: red;">청계관광특구</span>
														</p>
														<!-- 이미지공간 -->
														<div class="flickr-item" data-type="flickr-item"
															style="border: solid;'">
															<div class="thumb-default">
																<a class="flickr-link" href="#" data-image_b="href"
																	data-lightgallery="group-item"><img class="flickr-image"
																	src="/MapHack/resource/mypage/images/makeMap/sample3.png" data-image_b="src"
																	data-title="alt" alt="">
																	<div class="thumb-default-overlay"></div> </a>
															</div>
														</div>
													</div>
						
													<!--일정칸 오른쪽부분 구조 : 일정컨텐츠 입력부분 -->
													<div class="form-wrap form-wrap-validation"
														style="float: left !important; width: 70%">
														<div class="row" style="margin-right: 0px;">
															<div class="col-sm-4">
																<p style="margin-bottom: 10px;">
																	<span style="font-size: 20; font-weight: 30; color: red;">일정 메모</span>
																</p>
															</div>
						
															<div class="col-sm-6"></div>
															<div class="col-sm-2">
																<!-- 취소버튼 : crossCss -->
																<div class=" crossCss"></div>
															</div>
														</div>
														<!-- 일정컨텐츠 입력칸 textArea -->
														<textarea class="form-input" id="form-1-message" name="message"
															style="min-width: 95%;max-height: 137px;"></textarea>
													</div>
												</div>
												<!-- 알람 -->
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-4"
														style="padding-right: 0px; margin-right: -60px; margin-left: 16px;">
														<p style="margin-top: 6.5px;">
															<span style="font-size: 20; font-weight: 30; color: blue;">메모
																알림시간</span>
														</p>
													</div>
						
													<!-- 	알림버튼 timepicker추가 -->
													<div class="col-md-2"
														style="padding-right: 0px; padding-left: 15px;">
														<label>PM 3:45</label>
													</div>
													<!-- 알림버튼 추가 끝 -->
						
						
						
													<!--몇분전 시간 정하기 추가 -->
													<div class="col-md-3"
														style="padding-left: 0px; padding-right: 0px; margin-left: 10px;">
														<label>알람 설정안함</label>
													</div>
													<!-- 시간정하기 끝 -->
													<div class="col-md-2"></div>
												</div>
											</div>
										<!-- 일정3끝 -->	
										
										
										
										</div>
										
									
									</div>
										 
								</div>
								<div class="tab-pane fade" id="plan2">Danger 2</div>
								<div class="tab-pane fade" id="plan3">Danger 3</div>
								<div class="tab-pane fade" id="plan4">Danger 4</div>
								<div class="tab-pane fade" id="plan5">Danger 5</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>










		</section>




	<section class="section section-lg bg-white text-center">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-2" style="padding-right: 0px;">
							<input type="button" style="min-width: 180px;border-radius: 11px;"
								class="button button-secondary button-nina savedata" value="목록" />
						</div>
						<div class="col-md-2" style="padding-right: 0px;">
							<input type="button" style="min-width: 180px;border-radius: 11px;"
								class="button button-secondary button-nina savedata" value="수정"
								onclick="location.href='/MapHack/myMakeMapModify.mh'" />
						</div>
						<div class="col-md-2" style="padding-right: 0px;">
							<input type="button" style="min-width: 200px;border-radius: 11px;"
								class="button button-secondary button-nina savedata" value="새 계획 작성" />
						</div>
						<div class="col-md-3"></div>
					</div>
	</section>




    <jsp:include page="/WEB-INF/view/include/footer.jsp" />


	</div>
<script type="text/javascript">
$(document).ready(function() {
	 
    var pos1 = new google.maps.LatLng(52.4136863, -1.5499372),
        pos2 = new google.maps.LatLng(52.3461838, -1.5846928),
        pos3 = new google.maps.LatLng(52.2793876, -1.5978736),
        pos4 = new google.maps.LatLng(52.285422, -1.5447489),
        
        option1 = {
            zoom: 15,
            center: pos1,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        option2 = {
            zoom: 15,
            center: pos2,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        option3 = {
            zoom: 15,
            center: pos3,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        option4 = {
            zoom: 15,
            center: pos4,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        
        map1 = new google.maps.Map(document.getElementById("map1"), option1),
        map2 = new google.maps.Map(document.getElementById("map2"), option2),
        map3 = new google.maps.Map(document.getElementById("map3"), option3),
        map4 = new google.maps.Map(document.getElementById("map4"), option4),

        myMarker = new google.maps.Marker({
            position: pos1,
            map: map1,
            title: "Coventry"
        }),
        
        myMarker2 = new google.maps.Marker({
            position: pos2,
            map: map2,
            title: "Kenilworth"
        }),
        
        myMarker3 = new google.maps.Marker({
            position: pos3,
            map: map3,
            title: "Warwick"
        }),

        myMarker4 = new google.maps.Marker({
            position: pos4,
            map: map4,
            title: "Royal Leamington Spa"
        });

});
</script>

</body>
</html>