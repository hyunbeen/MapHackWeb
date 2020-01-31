<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets -->
    
     
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/fl-bigmug-line.css">
    <link rel="stylesheet" href="//cdn.materialdesignicons.com/2.0.46/css/materialdesignicons.min.css">


	<%String sess = (String)session.getAttribute("id");
		System.out.print(sess);
	%>

</head>
<body>

 <!-- Page preloader-->
<!--     <div class="page-loader"> -->
<!--       <div class="page-loader-body"> -->
<!--         <div class="preloader-wrapper big active">  -->
<!--           <div class="spinner-layer spinner-blue"> -->
<!--             <div class="circle-clipper left"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--             <div class="gap-patch"> -->
<!--               <div class="circle"> </div> -->
<!--             </div> -->
<!--             <div class="circle-clipper right"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="spinner-layer spinner-red"> -->
<!--             <div class="circle-clipper left"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--             <div class="gap-patch"> -->
<!--               <div class="circle"> </div> -->
<!--             </div> -->
<!--             <div class="circle-clipper right"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="spinner-layer spinner-yellow">  -->
<!--             <div class="circle-clipper left"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--             <div class="gap-patch"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--             <div class="circle-clipper right"> -->
<!--               <div class="circle"> </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="spinner-layer spinner-green">  -->
<!--             <div class="circle-clipper left"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--             <div class="gap-patch"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--             <div class="circle-clipper right"> -->
<!--               <div class="circle"></div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
    <!-- Page-->

   <!-- Page Header-->
      <header class="section page-header breadcrumbs-custom-wrap bg-gradient bg-secondary-2">
        <!-- RD Navbar-->
        <div class="rd-navbar-wrap rd-navbar-default">
          <nav class="rd-navbar" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fullwidth" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-static" data-md-stick-up-offset="2px" data-lg-stick-up-offset="2px" data-stick-up="true" data-sm-stick-up="true" data-md-stick-up="true" data-lg-stick-up="true">
            <div class="rd-navbar-inner" style="background: linear-gradient(-52deg, #8b0fe4 -3%, rgb(41, 41, 58) 12%)">
              <!-- RD Navbar Panel-->
              <div class="rd-navbar-panel">
                <!-- RD Navbar Toggle-->
                <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                <!-- RD Navbar Brand-->
                <div class="rd-navbar-brand"><a class="brand-name" href="main.mh"><img class="logo-default" src="/MapHack/resource/main/images/mainCustom/logoM.png" alt="" width="128" height="52"/><img class="logo-inverse" src="/MapHack/resource/main/images/mainCustom/logoM.png" alt="" width="128" height="52"/></a></div>
              </div>
              <div class="rd-navbar-aside-right">
                <div class="rd-navbar-nav-wrap">
                  <!-- RD Navbar Nav-->
                  <ul class="rd-navbar-nav">

                 <li><a href="main.mh">메인으로</a> </li>

                       <li><a href="makeMap.mh">지도정보검색</a></li>
                    <li><a href="infoList.mh">정보제공</a></li>
                    <li><a href="afterBoardList.mh">커뮤니티</a>
             			<ul class="rd-navbar-dropdown">
                            <li><a href="afterBoardList.mh">여행정보공유</a></li>
                            <li><a href="freeBoardList.mh">자유게시판</a></li>
                    	</ul> 
                    </li>
                    <li><a href="myPageMain.mh?tab=1">마이페이지</a>
                      <ul class="rd-navbar-dropdown">
                           <li><a href="myPageMain.mh?tab=1">즐겨찾기</a></li>
                            <li><a href="myPageMain.mh?tab=2">여행짜기 목록</a></li>
                            <li><a href="myPageMain.mh?tab=3">여행후기 목록</a></li>
                            <li><a href="myPageMain.mh?tab=4">친구관리</a></li>
                            <li><a href="myPageMain.mh?tab=5">회원정보수정</a></li>
                      </ul>
                    </li>

                    <li><a href="notice.mh">공지사항</a> </li>
                    <li><a href="join.mh">회원가입</a></li>
                    <% if(sess == null){ %>
                     <li><a href="/MapHack/login.mh" id="login">로그인</a> </li>
                     <%} else{%>
                     <li><a href="/MapHack/logout.mh" id="logout">로그아웃</a></li>
					<%} %>
                     
                  </ul>
                </div>
                <div class="rd-navbar-collapse-toggle" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div>
              </div>
            </div>
          </nav>
        </div>
          </header>
  <!-- Javascript-->
    <script src="/MapHack/resource/main/js/core.min.js"></script>
    <script src="/MapHack/resource/main/js/script.js"></script>   

</body>
</html>