<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="/MapHack/resource/main/images/favicon.ico"
	type="image/x-icon">
<!-- Stylesheets -->
<link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
<link rel="stylesheet"
	href="/MapHack/resource/main/css/fl-bigmug-line.css">
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/2.0.46/css/materialdesignicons.min.css"> -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<script src="https://maps.google.com/maps/api/js"></script>
      <script src="//maps.google.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=initialize"></script>

<style type="text/css">
.buttonHolder {
	margin: 80px auto;
	width: 400px;
}

.button {
	background-image: linear-gradient(top, #f4f1ee, #fff);
	border-radius: 50%;
	box-shadow: 0px 8px 10px 0px rgba(0, 0, 0, .3), inset 0px 4px 1px 1px
		white, inset 0px -3px 1px 1px rgba(204, 198, 197, .5);
	float: left;
	height: 70px;
	margin: 0 30px 30px 0;
	position: relative;
	width: 70px;
	-webkit-transition: all .1s linear;
	transition: all .1s linear;
}

.button:after {
	color: #e9e6e4;
	content: "";
	display: block;
	font-size: 30px;
	height: 30px;
	text-decoration: none;
	text-shadow: 0px -1px 1px #bdb5b4, 1px 1px 1px white;
	position: absolute;
	width: 30px;
}

.heart:after {
	content: "❤";
	left: 23px;
	top: 14px;
}

.button:hover {
	background-image: -webkit-linear-gradient(top, #fff, #f4f1ee);
	background-image: linear-gradient(top, #fff, #f4f1ee);
	color: #0088cc;
}

.heart:hover:after {
	color: #f94e66;
	text-shadow: 0px 0px 6px #f94e66;
}

.button:active {
	background-image: -webkit-linear-gradient(top, #efedec, #f7f4f4);
	background-image: linear-gradient(top, #efedec, #f7f4f4);
	box-shadow: 0 3px 5px 0 rgba(0, 0, 0, .4), inset 0px -3px 1px 1px
		rgba(204, 198, 197, .5);
}

.button:active:after {
	color: #dbd2d2;
	text-shadow: 0px -1px 1px #bdb5b4, 0px 1px 1px white;
}
</style>

<style type="text/css">
.galleryCategoryMenu {float;left;
	clear: both;
	width: 100%;
}

.galleryCategoryMenu ul {
	float: left;
	width: 100%;
	padding: 0 2%;
}

.galleryCategoryMenu ul li {
	background: #e4e4e4;
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIwLjIiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
	background: -moz-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba (
		228, 228, 228, 0.3)), color-stop(100%, rgba(228, 228, 228, 1)));
	background: -webkit-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -o-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -ms-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: linear-gradient(to bottom, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#33e4e4e4',
		endColorstr='#e4e4e4', GradientType=0);
	width: 290px;
	height: 80px;
	float: left;
	margin: 0 2% 10px 0;
	list-style-type: none;
	border-radius: 4px;
	-webkit-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	-moz-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	position: relative;
	/*box-shadow: 0 1px 5px rgba(0,0,0,0.25), 0 0 50px rgba(0,0,0,0.1) inset;
border-radius: 1%     1%     1%     1% /     1%     1%     1%     1%;*/
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li:after {
	position: absolute;
	width: 94%;
	height: 20%;
	left: 3%;
	border-radius: 50%;
	z-index: -1;
	bottom: 0%;
	content: "";
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li:hover:after {
	position: absolute;
	width: 94%;
	height: 20%;
	left: 3%;
	border-radius: 50%;
	z-index: -1;
	bottom: 0%;
	content: "";
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0);
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li:hover {
	transition: all 0.8s ease;
	-webkit-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	-moz-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIwLjciLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
	background: -moz-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(228,
		228, 228, 0.3)), color-stop(100%, rgba(228, 228, 228, 1)));
	background: -webkit-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -o-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -ms-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: linear-gradient(to bottom, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b3e4e4e4',
		endColorstr='#e4e4e4', GradientType=0);
}

.galleryCategoryMenu ul li:nth-child(4n) {
	clear: both;
}

.galleryCategoryMenu ul li a {
	float: left;
	width: 100%;
	padding: 24px 0 24px 20px;
	text-transform: uppercase;
	color: #4c4c4c !important;
	font-size: 20px;
	text-align: left;
	transition: all 0.5s ease;
	background:
		url('https://www.seanhartphotography.co.nz/wp-content/uploads/2014/09/menu-sprites2.png');
}

.galleryCategoryMenu ul li a span {
	font-size: 12px !important;
	margin-top: -10px;
	float: left;
	font-weight: bold;
	background:
		url('https://www.seanhartphotography.co.nz/wp-content/uploads/2014/09/menu-sprites2.png');
}

.galleryCategoryMenu ul li a:hover {
	text-decoration: none !important;
	color: #DB2B1E !important;
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li.portraits a {
	background-position: 179px -7px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.portraits a span {
	background-position: -20px -110px;
	background-repeat: no-repeat;
	width: 51px;
	height: 32px;
	position: relative;
	top: 9px;
	right: 40px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.sports a {
	background-position: -131px -7px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.sports a span {
	background-position: -330px -102px;
	background-repeat: no-repeat;
	width: 52px;
	height: 52px;
	position: relative;
	top: 1px;
	right: 39px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.weddings a {
	background-position: -484px -7px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.weddings a span {
	background-position: -685px -100px;
	background-repeat: no-repeat;
	width: 51px;
	height: 163px;
	position: relative;
	top: -1px;
	right: 38px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.celebrations a {
	background-position: 180px -193px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.celebrations a span {
	background-position: -19px -283px;
	background-repeat: no-repeat;
	width: 51px;
	height: 61px;
	position: relative;
	top: -4px;
	right: 40px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.animals a {
	background-position: -145px -191px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.animals a span {
	background-position: -298px -290px;
	background-repeat: no-repeat;
	width: 119px;
	height: 54px;
	position: relative;
	top: 5px;
	right: 19px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.personal a {
	background-position: -492px -196px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.personal a span {
	background-position: -643px -289px;
	background-repeat: no-repeat;
	width: 129px;
	height: 53px;
	position: relative;
	top: -1px;
	right: 10px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li a:hover span {
	transition: all 0.8s ease;
	opacity: 1;
}

@media all and (max-width: 941px) {
	.galleryCategoryMenu ul li:nth-child(4n) {
		clear: none;
	}
}
</style>
</head>
<body>


	<div class="page">
		<!-- Page Header-->
		<jsp:include page="/WEB-INF/view/include/header.jsp" />

		<section class="section section-lg bg-white text-center"
			style="background-color: #57cbcc;">


<!-- 			<p>디테일</p> -->

		</section>




		<section class="section section-lg bg-white text-center">
			<!-- section wave-->
			<div class="section-wave">
				<svg x="0px" y="0px" width="1920px" height="45px"
					viewbox="0 0 1920 45" preserveAspectRatio="none">
            <path
						d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path>
          </svg>
			</div>
			<div class="shell">
				<br>
				<br>
<!-- 				<h3>상세보기</h3> -->

<!-- 				<div class="box-classic box-bordered" -->
<!-- 					style="max-width: 1134px; margin-top: 120px;"> -->

					
				 <div class="shell-wide">
          <div class="range range-xs-center">
              <article class="post-blog-article">
                <p class="post-blog-article-title">${afterDetail.title }</p>
                <ul class="post-blog-article-meta group-xl">
                  <li>
                    <div class="box-inline"><span class="icon icon-md icon-primary mdi mdi-account"></span>by
                      <div><a href="#">${afterDetail.after_id }</a></div>
                    </div>
                  </li>
                  <li>
                    <div class="box-inline"><span class="icon icon-md icon-primary mdi mdi-calendar-clock"></span>
                      <time datetime="2017">${afterDetail.write_date }</time>
                    </div>
                  </li>
                </ul>
                
                
                
                <div class="container">
                <c:set var="idx" value="${afterDetail.mapList.size() + afterDetail.imageList.size() + afterDetail.textList.size() }"></c:set>
                <c:set var="num" value="0"></c:set>
               	<c:forEach var="i" begin="0" end="${idx }">
               		<c:forEach var="j" begin="0" end="${idx }">
	               		<c:choose>
	               			<c:when test="${i+1 eq afterDetail.mapList[j].order }">
	               				<div id="map-canvas${num}" class="z-depth-1-half" style="height: 400px;"></div><hr/>
	               				<c:set var="num" value="${num+1 }"></c:set>
	               			</c:when>
	               			<c:when test="${i+1 eq afterDetail.imageList[j].order }">
	               				<img src="/MapHack/upload2/${afterDetail.imageList[j].fileName }" alt="" width="870" height="580" /><hr/>
	               			</c:when>
	               			<c:when test="${i+1 eq afterDetail.textList[j].order }">
	               				<div>
	               					${afterDetail.textList[j].tag }<hr/>
	               				</div>
	               			</c:when>
	               		</c:choose>
               		</c:forEach>
               	</c:forEach>
               	</div>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
<!--                 <p class="big">Imagine almost any situation where two or more people are gathered—a wedding reception or a job interview. What do these situations have in common? Almost all of them involve people trying to talk with each other. But in these very moments where a conversation would enhance an encounter, we often fall short.</p> -->
<!--                 <img src="/MapHack/resource/main/images/mainCustom/seoul.jpg" alt="" width="870" height="580" /> -->
<!--                 <p>When small talk stalls out, it’s often due to a phenomenon we call “mirroring.” In our attempts to be polite, we often answer people’s questions directly, repeat their observations, or just blandly agree with whatever they say. Such an approach can kill your conversation in the beginning. When you “break the mirror”, you give your interlocutor a chance to move forward in your small talk.</p> -->
<!--                 <p>People also tend to do a passable job at talking. We stagger through our romantic, professional and social worlds with the goal merely of not crashing, never considering that we might soar. We go home sweaty and puffy without realizing that small talks are keys to opening greater conversations. In this post, we would like to show you how you can change this. For example, you can ask open-ended questions. Aim for questions that invite people to tell stories, rather than give bland, one-word answers.</p> -->
<!--                 <article class="quote-primary"> -->
<!--                   <svg class="quote-primary-mark" version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="35px" height="25px" viewbox="0 0 35 25"> -->
<!--                     <path d="M27.461,10.206h7.5v15h-15v-15L25,0.127h7.5L27.461,10.206z M7.539,10.206h7.5v15h-15v-15L4.961,0.127h7.5                            L7.539,10.206z"></path> -->
<!--                   </svg> -->
<!--                   <div class="quote-primary-text"> -->
<!--                     <p>If you mirror the opinion and language of your interlocutor, you follow the common social norm, but you also paralyze the discussion and miss a moment of fun. Instead, we recommend you to practice the art of disruption and move the dialogue forward using one of the methods described in this article.</p> -->
<!--                   </div> -->
<!--                   <p class="quote-primary-meta"><span>by</span><span class="cite">Ronald Chen</span></p> -->
<!--                 </article> -->
<!--                 <p>An even better way to break the boring conversation mirror is to skip over the expected response and go somewhere next-level. Even if your answer won’t concern the topic of the initial question, it will push the conversation forward. Don’t be afraid to go ahead and be bold. Upend the dinner table conversation! Turn small talk into big ideas at the next summer wedding reception you’re forced to attend! You never know which ideas will be worth spreading next and maybe breaking the ice of a small talk will end in amazing conversation.</p> -->
              </article>
              
              
              
              
              
              
              		<div class="shell" style="margin-top: 20%">
							<div class="range range-sm-center">
								<div class="cell-sm-4 cell-lg-4"></div>
								<div class="cell-sm-2 cell-lg-2">
									<img alt="User Pic"
										src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
										id="profile-image1" class="img-circle img-responsive">
									<p style="text-align: center;">닉네임</p>
								</div>
								<div class="cell-sm-2 cell-lg-2">
									<a href="#" class="button heart "
										style="min-width: 83px; min-height: 81px; border-radius: 258px; top: 54px;"></a>
								</div>
								<div class="cell-sm-4 cell-lg-4"></div>
							</div>
						</div>

	<br>
						<hr>
						<p>이 글을 어떤 여행테마에 추천하고 싶나요?</p>
							<div class="range range-sm-center" style="padding-top: 15px; margin-top: 15px;">
							<div class="cell-sm-3 cell-lg-3"></div>
										<div class="cell-sm-2 cell-lg-2">
										 <span class="button-checkbox">
										        <button type="button" class="btn" data-color="success">데이트 추천</button>
										        <input type="checkbox" class="hidden" checked />
   										 </span>
										</div>
									<div class="cell-sm-2 cell-lg-2" style="padding-left: 8px;">
										<span class="button-checkbox">
											<button type="button" class="btn" data-color="info">혼자일때
												추천</button> <input type="checkbox" class="hidden" checked />
										</span>
									</div>
									<div class="cell-sm-2 cell-lg-2">
										<span class="button-checkbox">
											<button type="button" class="btn" data-color="warning">가족여행
												추천</button> <input type="checkbox" class="hidden" checked />
										</span>
									</div>
									<div class="cell-sm-3 cell-lg-3">
							</div>
							</div>
							<br>

              
              <hr style="margin-top: 0px;">
              
              
              
           <div class="range range-sm-center" style="padding-top: 15px; margin-top: 15px;">
<!--                 <p class="h3-alternate">댓글</p> -->
                <div class="comment-group cell-sm-12 cell-lg-12">
                  <!-- Comment-->
                  <article class="comment">
                    <div class="comment-avatar"><img src="/MapHack/resource/main/images/user-1-80x80.jpg" alt="" width="80" height="80"/>
                    </div>
                    <div class="comment-body">
                      <div class="comment-header">
                        <p class="comment-title">Catherine Payne</p>
                        <time class="comment-time" datetime="2017">2 days ago</time>
                      </div>
                      <div class="comment-text">
                        <p>pe to see more of such posts here in the future.</p>
                      </div>
<!--                       <div class="comment-footer"><a class="comment-link-reply" href="#">Reply</a></div> -->
                    </div>
                  </article>
                  </div>
                  <div class="comment-group cell-sm-12 cell-lg-12"> 
                  	<div class="cell-sm-12 cell-lg-12">
                    <!-- Comment-->
                    <article class="comment">
                      <div class="comment-avatar"><img src="/MapHack/resource/main/images/user-2-80x80.jpg" alt="" width="80" height="80"/>
                      </div>
                      <div class="comment-body">
                        <div class="comment-header">
                          <p class="comment-title">Ronald Chen</p>
                          <time class="comment-time" datetime="2017">2 days ago</time><span class="comment-reply">Catherine Payne</span>
                        </div>
                        <div class="comment-text">
                          <p>pe to see more of such posts here in the future.</p>
                        </div>
<!--                         <div class="comment-footer"><a class="comment-link-reply" href="#">Reply</a></div> -->
                      </div>
                    </article>
                  </div>
                  <!-- Comment-->
                    <div class="comment-group cell-sm-12 cell-lg-12"> 
                  <article class="comment">
                    <div class="comment-avatar"><img src="/MapHack/resource/main/images/user-3-80x80.jpg" alt="" width="80" height="80"/>
                    </div>
                    <div class="comment-body">
                      <div class="comment-header">
                        <p class="comment-title">하은</p>
                        <time class="comment-time" datetime="2017">2 days ago</time>
                      </div>
                      <div class="comment-text">
                        <p>pe to see more of such posts here in the future.</p>
                      </div>
<!--                       <div class="comment-footer"><a class="comment-link-reply" href="#">Reply</a></div> -->
                    </div>
                  </article>
                  </div>
                </div>
                </div>
              
              <div class="section-lg" style="padding-top: 0px; padding-bottom: 0px;">
<!--                 <p class="h4-alternate">댓글작성하기</p> -->
                <!-- RD Mailform-->
                <form class="rd-mailform" data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php" style="    margin-top: 0px;">
                  <div class="range range-20">

                    <div class="cell-xs-12">
                      <div class="form-wrap form-wrap-validation">
                        <textarea class="form-input" id="form-comment-message" name="message" data-constraints="@Required"></textarea>
                      </div>
                    </div>
                    	<div class="range range-sm-center">
							<div class="cell-sm-9 cell-lg-9"></div>
                      <div class="form-button cell-sm-2 cell-lg-2">
                        <button class="button button-secondary " type="submit" style="height: 59%;">댓글 동록</button>
                      </div>
                      	<div class="cell-sm-1 cell-lg-1"></div>
                    </div>
                  </div>
                </form>
              </div>
              
        </div>


				</div>
			</div>
<!-- 			</div> -->
			


		</section>

<!-- 		<section class="section section-lg bg-white text-center"> -->
<!-- 			 <div class="shell-wide"> -->
<!--           <div class="range range-xs-center"> -->
		
<!--                 <p class="h3-alternate">XX님의 다른 게시글</p> -->
<!--                 <div class="range range-30 range-lg-50"> -->
<!--                   <div class="cell-xs-10 cell-sm-6 post-light-wrap" > -->
<!--                     <article class="post-light"> -->
<!--                       <div class="unit unit-horizontal"> -->
<!--                         <div class="unit-left"><a href="single-post.html"><img src="/MapHack/resource/main/images/post-light-1-120x80.jpg" alt="" width="120" height="80"/></a></div> -->
<!--                         <div class="unit-body"> -->
<!--                           <p class="post-light-title"><a href="single-post.html">The Top 5 Reasons Why ‘The Customer Is Always Right’ Is Wrong</a></p> -->
<!--                           <time class="post-light-time" datetime="2017">Feb 27, 2017 at 5:47 pm</time> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </article> -->
<!--                     <article class="post-light"> -->
<!--                       <div class="unit unit-horizontal"> -->
<!--                         <div class="unit-left"><a href="single-post.html"><img src="/MapHack/resource/main/images/post-light-3-120x80.jpg" alt="" width="120" height="80"/></a></div> -->
<!--                         <div class="unit-body"> -->
<!--                           <p class="post-light-title"><a href="single-post.html">7 Ways to Inspire Your Employees</a></p> -->
<!--                           <time class="post-light-time" datetime="2017">Feb 27, 2017 at 5:47 pm</time> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </article> -->
<!--                   </div> -->
<!--                   <div class="cell-xs-10 cell-sm-6 post-light-wrap"> -->
<!--                     <article class="post-light"> -->
<!--                       <div class="unit unit-horizontal"> -->
<!--                         <div class="unit-left"><a href="single-post.html"><img src="/MapHack/resource/main/images/post-light-2-120x80.jpg" alt="" width="120" height="80"/></a></div> -->
<!--                         <div class="unit-body"> -->
<!--                           <p class="post-light-title"><a href="single-post.html">How to Improve Performance of Your Sales Managers: an Essential Guide</a></p> -->
<!--                           <time class="post-light-time" datetime="2017">Feb 27, 2017 at 5:47 pm</time> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </article> -->
<!--                     <article class="post-light"> -->
<!--                       <div class="unit unit-horizontal"> -->
<!--                         <div class="unit-left"><a href="single-post.html"><img src="/MapHack/resource/main/images/post-light-4-120x80.jpg" alt="" width="120" height="80"/></a></div> -->
<!--                         <div class="unit-body"> -->
<!--                           <p class="post-light-title"><a href="single-post.html">Managing Your Time: Top 8 Tips</a></p> -->
<!--                           <time class="post-light-time" datetime="2017">Feb 27, 2017 at 5:47 pm</time> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </article> -->
<!--                   </div> -->
<!--                 </div> -->
<!-- 		</div> -->
<!-- 		</div> -->
		
<!-- 		</section> -->

















	</div>
	
	
	
	
	<!-- 지도 -->
	
	
	<script type="text/javascript">
	var map = [];
	var var_location = new google.maps.LatLng(37.567835, 126.986357);
	var var_location = [];
	var marker = [];
	var mapList = [];
	
		<c:forEach items="${afterDetail.mapList}" var="item">
			var mapInfo = {};
			mapInfo.mapy = "${item.mapy}";
			mapInfo.mapx = "${item.mapx}";
			mapList.push(mapInfo);
		</c:forEach>
	
	
	
	var var_mapoptions = {
	        center: var_location,
	        zoom: 14
	    };

	for(var i = 0; i < mapList.length; i++){
		var_location[i] = new google.maps.LatLng(mapList[i].mapy, mapList[i].mapx);
		marker[i] = new google.maps.Marker({
			position : var_location[i],
		});
	}

	function initialize() {
		
    	
	    
	    for(var i = 0; i < mapList.length; i++){
	    	var_mapoptions = {
	    	        center: var_location[i],
	    	        zoom: 14
	    	    };
	    	
	    	
	    	map[i] = new google.maps.Map(document.getElementById("map-canvas" + i + ""), var_mapoptions)
	    	marker[i].setMap(map[i]);
	    }
	   
	};

	google.maps.event.addDomListener(window, 'load', initialize);
	google.maps.event.addDomListener(window, "resize", resizeMap());
	
	function resizeMap(center) {
		   if(typeof map[0] =="undefined") return;
		   google.maps.event.trigger(map[0], "resize");
		   map[0].setCenter(center); 
		   
		   if(typeof map[1] =="undefined") return;
		   google.maps.event.trigger(map[1], "resize");
		   map[1].setCenter(center); 
		   
		   if(typeof map[2] =="undefined") return;
		   google.maps.event.trigger(map[2], "resize");
		   map[2].setCenter(center); 
		   
		   if(typeof map[3] =="undefined") return;
		   google.maps.event.trigger(map[3], "resize");
		   map[3].setCenter(center); 
		   
		   if(typeof map[4] =="undefined") return;
		   google.maps.event.trigger(map[4], "resize");
		   map[4].setCenter(center); 
		   
		   
		   if(typeof map[5] =="undefined") return;
		   google.maps.event.trigger(map[5], "resize");
		   map[5].setCenter(center); 
		   
		   };
	
	
	</script>
	
	
	<!-- 지도 -->
	
	
	
	
	<script type="text/javascript">
	
	$(function () {
	    $('.button-checkbox').each(function () {

	        // Settings
	        var $widget = $(this),
	            $button = $widget.find('button'),
	            $checkbox = $widget.find('input:checkbox'),
	            color = $button.data('color'),
	            settings = {
	                on: {
	                    icon: 'glyphicon glyphicon-check'
	                },
	                off: {
	                    icon: 'fa fa-square-o'
	                }
	            };

	        // Event Handlers
	        $button.on('click', function () {
	            $checkbox.prop('checked', !$checkbox.is(':checked'));
	            $checkbox.triggerHandler('change');
	            updateDisplay();
	        });
	        $checkbox.on('change', function () {
	            updateDisplay();
	        });

	        // Actions
	        function updateDisplay() {
	            var isChecked = $checkbox.is(':checked');

	            // Set the button's state
	            $button.data('state', (isChecked) ? "on" : "off");

	            // Set the button's icon
	            $button.find('.state-icon')
	                .removeClass()
	                .addClass('state-icon ' + settings[$button.data('state')].icon);

	            // Update the button's color
	            if (isChecked) {
	                $button
	                    .removeClass('btn-default')
	                    .addClass('btn-' + color + ' active');
	            }
	            else {
	                $button
	                    .removeClass('btn-' + color + ' active')
	                    .addClass('btn-default');
	            }
	        }

	        // Initialization
	        function init() {

	            updateDisplay();

	            // Inject the icon if applicable
	            if ($button.find('.state-icon').length == 0) {
	                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
	            }
	        }
	        init();
	    });
	});
	
	</script>

	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>

	<script src="/MapHack/resource/mypage/js/acordianStyle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>


</body>
</html>