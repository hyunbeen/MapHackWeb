<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="maphack.freeboard.dto.*"%>
<%
	FreeBoard freeboard = (FreeBoard)session.getAttribute("detailView");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	
<style type="text/css">

/* Demo css after plugin css */

/* = ICONS
------------------- */
@import
	url('https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css')
	;

/* = PLUGIN
------------------- */
@import url(http://fonts.googleapis.com/css?family=Roboto);

* {
	font-family: 'Roboto', sans-serif;
}

/* form starting stylings ------------------------------- */
.free-input-group {
	position: relative;
	margin-bottom: 25px;
	margin-left: 25%
}

.freeinput {
	/*   font-size:18px; */
	/*   font-size:78px; */
	font-size: 35px;
	padding: 10px 10px 10px 5px;
	display: block;
	/*   width:300px; */
	/*     width:88.5%;   */
	width: 66.4%;
	height: 64px;
	border: none;
	border-bottom: 1px solid #00BFFF;
}

.freeinput:focus {
	outline: none;
}
/* LABEL ======================================= */
.freelabel {
	color: #999;
	/*   font-size:18px; */
	font-size: 28px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: 0.2s ease all;
}

/* active state */
.freeinput:focus ~ .freelabel, .freeinput:valid ~ .freelabel {
	top: -25px;
	font-size: 14px;
	color: #000;
}

/* BOTTOM BARS ================================= */
.freebar {
	position: relative;
	display: block;
	width: 300px;
}

.freebar:before, .freebar:after {
	content: '';
	height: 2px;
	width: 0;
	bottom: .5px;
	position: absolute;
	background: #00BFFF;
	transition: 0.2s ease all;
}

.freebar:before {
	left: 50%;
}

.freebar:after {
	right: 50%;
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
	width: 50%;
}
</style>
<link rel="stylesheet"
	href="/MapHack/resource/freeboard/css/freeboard.css">
</head>
<body>

	<div class="page">

		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<section class="section section-lg bg-white text-center"
			style="background-color: #57cbcc;">


<!-- 			<p>디테일</p> -->

		</section>
		
		<section class="section section-xl bg-gray-lighter"
			style="padding-bottom: 80px;">
		<div class="section-wave">
				<svg x="0px" y="0px" width="1920px" height="45px"
					viewbox="0 0 1920 45" preserveAspectRatio="none">
            <path
						d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path>
          </svg>
			</div>
		<div>
			<!-- <h1>자유게시판 작성페이지 </h1> -->
		</div>
		</section>
		<section class="section section-xl bg-gray-lighter"> <!-- 		<div class="freeboardStart" style="border: solid; border-color: red;"> -->



<form id='insertForm' method="post" action="insertFree.mh" >
		<div>
				<div class="free-input-group">
					<input class="freeinput" name="bTitle" value='제목 : <%=freeboard.getbTitle() %>' type="text" required readonly/>
					</div>
		</div>

		<!-- <div class="mainText" style="border: solid; border-color: red;"> -->
		<div class="main">
			<!--- call editor -->

			
			
						<div style="overflow:scroll;height:700px;background-color:#ffffff">
    						<%=freeboard.getbContent() %>
  						</div>
		
</form>	


		<div class="input-group"
			style="width: 100%; height: 50px; padding-right: 25.3%; padding-top: 2%;">

			<!-- 		</div> -->
			<div
				class="button button-xs button-secondary button-nina button-ellipse-md button-shadow btnInsert" 
				onclick="javascript:location.href='/MapHack/freeModifyView.mh?id=<%=freeboard.getbNum() %>'"
				style="float: right;" >수정하기</div>
			<div
				class="button button-xs button-secondary button-nina button-ellipse-md button-shadow"
				style="float: right;margin-top: -0.1%;">취소</div>
			</div>
		</div>
	</section>


	</div>

	<script src="/MapHack/resource/freeboard/js/freeboard.js"></script>
	<script src="/MapHack/resource/freeboard/js/freeboardEditor.js"></script>
	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>


</body>
</html>