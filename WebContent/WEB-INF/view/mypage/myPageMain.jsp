<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 	String pjName = "myPageMain";
	
	String tabNum = request.getParameter("tab");
	
	String class1 = "1";
	String class2 = "2";
	String class3 = "3";
	String class4 = "4";
	String class5 = "5";
	
	if (tabNum == null) {
		tabNum = "1";
	}
	switch (tabNum) {
		case "1" :
			class1 = "active";
			break;
		case "2" :
			class2 = "active";
			break;
		case "3" :
			class3 = "active";
			break;
		case "4" :
			class4 = "active";
			break;
		case "5" :
			class5 = "active";
			break;
	}
	
%>


<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
 <link rel="stylesheet" href="/MapHack/resource/mypage/css/styleMyPage.css">
 <link rel="stylesheet" href="/MapHack/resource/mypage/css/styleMyPage2.css">
 
 <style type="text/css">
 
 .tabbable-line > .nav-tabs > li.active {
  border-bottom: 4px solid #81BA7B;
  position: relative;
}
.tabbable-line > .nav-tabs > li.active > a {
  border: 0;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.active > a > i {
  color: #404040;
}
 
 </style>
</head>
<body>
  
    <div class="page">
  
<jsp:include page="/WEB-INF/view/include/header.jsp"/>



      <!-- section Title-->
      <!-- 헤더 바로 아래있음. 페이지 title및 이미지 나타내는 section부분-->
      <section class="section-lg bg-white" >
        <!-- Style switcher-->
        
        
        
        
        <div class="style-switcher" data-container="">
          <div class="style-switcher-container">
            <div class="style-switcher-toggle-wrap"> 
            </div>
            <section class="section section-lg bg-gray-lighter text-left">
              <div class="shell-wide">
                <div class="range range-lg-right range-30">
                  <div class="cell-lg-10 cell-xl-11">
                    <div class="parallax-text-wrap">
                      <h3>마이페이지</h3><span class="parallax-text">my page</span>
                    </div>
                    <hr class="divider divider-default">
                  </div>
                </div>
              </div>
            </section>
          </div>
        </div>
      </section>

      
      <section class="section section-lg bg-white" >
<div class="container"> <!-- style="overflow:hidden" -->
    <nav id="myMainNav" class="hidden navbar navbar-default navbar-fixed-top navbar-custom affix-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>                
                <!-- <img class="navbar-brand" src="#"/> -->
                <a class="navbar-brand" href="#page-top">Connect Your Care</a>
            </div>
    
            <!-- Menu options -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#">Option 1</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#">Option 2</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#">Option 3</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
   <div class="clearfix"></div>
   <div class="row">
       <div class="col-md-12" style="overflow:auto">
            <div id="MyAccountsTab" class="tabbable tabs-left ">
          
           
           <div class="tabs-vertical tabs-line">
            <ul class="nav nav-tabs">
<!--                   <li class="active"><a href="#bookMarkList" data-toggle="tab">즐겨찾기 목록</a></li> -->
<!--                   <li><a href="#" data-toggle="tab">여행짜기 목록</a></li> -->
<!--                   <li><a href="#afterList" data-toggle="tab">여행정보공유 목록</a></li> -->
<!--                   <li><a href="#friendList" data-toggle="tab">친구관리</a></li> -->
<!--                   <li><a href="#editPage" data-toggle="tab">회원정보 수정</a></li> -->
                
                <li class="<%=class1%>"><a href="#bookMarkList" data-toggle="tab"> 즐겨찾기 목록 </a></li>
				<li class="<%=class2%>"><a href="#mapMakeList" data-toggle="tab"> 여행짜기 목록 </a></li>
				<li class="<%=class3%>"><a href="#afterList" data-toggle="tab"> 여행정보공유 목록 </a></li>
				<li class="<%=class4%>"><a href="#friendList" data-toggle="tab"> 친구관리 </a></li>
                <li class="<%=class5%>"><a href="#editPage" data-toggle="tab"> 회원정보 수정 </a></li>
                
                
                
                </ul>
               
                
                
           <div class="tab-content col-md-12" style=x"float: left; width: 100%;">
              
              <!-- tab_1 : bookMarkList 즐겨찾기 목록-->
              <div class="tab-pane <%=class1%>" id="bookMarkList">
					<jsp:include page="/WEB-INF/view/mypage/myBookMarkList.jsp"/>
              </div>
              
              <!-- tab_2 : makeMyMap 여행짜기 목록 -->
              <div class="tab-pane <%=class2%>" id="mapMakeList">
					<jsp:include page="/WEB-INF/view/mypage/myMakeMapList.jsp"/>
              </div>
              
              <!-- tab_3 : afterList 여행정보공유 목록 -->
              <div class="tab-pane <%=class3%>" id="afterList">
                     <jsp:include page="/WEB-INF/view/mypage/myAfterList.jsp"/>
              </div>
              
              <!-- tab_4 : 친구리스트 목록 -->
              <div class="tab-pane  <%=class4%>" id="friendList">
                      <jsp:include page="/WEB-INF/view/mypage/myFrinedList.jsp"/>
              </div>
              
              <!-- tab_5 : 회원 정보수정 -->
              <div class="tab-pane  <%=class5%>" id="editPage">
                      <jsp:include page="/WEB-INF/view/mypage/myModify.jsp"/>
              </div>
              
              

              
              
           </div>
<!--            Account selection for desktop - F -->
        </div>
        </div>
   </div>
</div>
       </div>
      </section>
      
      
      
      
     
</div>

 <script src="/MapHack/resource/main/js/core.min.js"></script>
    <script src="/MapHack/resource/main/js/script.js"></script>
    
    <script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>


    
</body>
</html>