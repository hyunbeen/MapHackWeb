<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

    
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 <style type="text/css">
 
 #demoTitle {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  position: absolute;
  top: 0;
  left: 0;
    height: 159%;
    width: 40%;
}
#demoTitle span {
  font-size: 3vw;
  font-weight: 400;
}
.color-1 {
  color: #ff6347;
}
.color-2 {
  color: #bada55;
}
.color-3 {
  color: #ff1493;
}
.color-4 {
  color: #09a;
}
 
/*  /####### */




.containerListTitle {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}

.neonTitle {
  font-family: neon;
  color: #FB4264;
  font-size: 3vw;
  line-height: 9vw;
  text-shadow: 0 0 3vw #F40A35;
}

.neonTitle {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
}

@keyframes neon {
  0%,
  100% {
    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    color: #FED128;
  }
  50% {
    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    color: #806914;
  }
}

 </style>
</head>
<body>
  
<div class="page">
  
<jsp:include page="/WEB-INF/view/include/header.jsp"/>


 <section class="section section-variant-1 bg-white" >

<div id="demoTitle" style="  font-family: 'Bungee Inline', sans-serif; height: ">
<span class="color-1">이</span>
<span class="color-2">달</span>
<span class="color-3">의</span>
<span class="color-2">&nbsp</span>
<span class="color-4">B</span>
<span class="color-1">E</span>
<span class="color-2">S</span>
<span class="color-3">T</span>
<span class="color-2">&nbsp</span>
<span class="color-4">후</span>
<span class="color-1">기</span></div>

<div class="containerListTitle">
  <div class="neonTitle">Neon </div>
</div>

</section>



      <!-- section Title-->
      <!-- 헤더 바로 아래있음. 페이지 title및 이미지 나타내는 section부분-->
      <section class="section section-xl bg-gray-lighter" style="padding-bottom: 80px;">
        <!-- section wave-->
        
        <div class="containerListTitle" >
  			<div class="neonTitle" style="padding-left: 32%">이 달의 BEST 후기 </div>
		</div>
<!--         <div class="section-wave"> -->
<!--           <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none"> -->
<!--             <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path> -->
<!--           </svg> -->
<!--         </div> -->
        <div class="shell shell-bigger">
          <div class="range range-ten range-50 range-sm-90 range-sm-center range-lg-justify">
            <div class="cell-sm-12 cell-md-12 cell-lg-12 text-center">
              <div class="range range-30">
              
              
              
                
              	 <% int selectsize = 3; %>
          <% for(int i=0; i<selectsize; i++ ) { %>
          
<!--           <div class="cell-sm-4 info"> -->
          
                <div class="cell-sm-4 info" style="padding-top: 25px; padding-bottom: 25px; padding-left: 30px; padding-right: 30px; background-color: #5bc0de; position: static; z-index: 1;">
<!--                   <div style="position: absolute; z-index: 100;"> -->
<!-- 						<img src="/MapHack/resource/community/images/crown2.png"> -->
<!-- 					</div> -->
                 
                 <form>
                  <article class="post-blog"><a class="post-blog-image" href=""><img src="/MapHack/resource/include/images/01.jpg" alt="" width="420" height="305"/></a>
                    <div class="post-blog-caption">
                      <div class="post-blog-caption-header">
                        <ul class="post-blog-tags">
                          <li><a class="button-tags" href="">제목test</a></li>
                        </ul>
                          <ul class="post-blog-meta">
                          <li><span>by</span>&nbsp;<a href="about-me.html">닉네임</a></li>
                        </ul>
                      </div>
                      <div class="post-blog-caption-body">
                        <h5><a class="post-blog-title" href="">제목2</a></h5>
                      </div>
                      <div class="post-blog-caption-footer">
                        <time datetime="2017">등록일</time><a class="post-comment" href=""><span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
                      </div>
                    </div>
                  </article>
                </form>
                </div>
<!--                  </div> -->
                <%} %>  
                
               
                </div>
                </div>
                </div>
                </div>
              </section>
              
              
               <section class="section section-xl bg-gray-lighter">
               
              
               
               
               
               
               
<!--                <p style="padding-left: 11%; padding-bottom: 2%;">전체후기</p> -->
<!--                <div class="section-wave"> -->
<!--           <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none"> -->
<!--             <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path> -->
<!--           </svg> -->
<!--         </div> -->
                  <div class="shell shell-bigger">
          <div class="range range-ten range-50 range-sm-90 range-sm-center range-lg-justify">
            <div class="cell-sm-12 cell-md-12 cell-lg-12 text-center">
              <div class="range range-30">
              
               
               <div class="cell-sm-4"></div>
                     <div class="cell-sm-4"></div>
                     <div class="input-group cell-sm-4" style="margin-top: 20px">
                        <div class="input-group-btn search-panel">
                           <button type="button" class="btn btn-default dropdown-toggle"
                              data-toggle="dropdown">
                              <span id="search_concept">전체</span> <span class="caret"></span>
                           </button>
                           
                           <ul class="dropdown-menu" role="menu">
                              <li><a href="#id"><i class="fa fa-angle-double-right"></i>
                                    작성자</a></li>
                              <li><a href="#name"><i
                                    class="fa fa-angle-double-right"></i> 제목</a></li>
                              <li><a href="#description"><i
                                    class="fa fa-angle-double-right"></i> 내용</a></li>
                           </ul>
                        </div>
                        <input type="hidden" name="search_param" value="name"
                           id="search_param"> <input type="text"
                           class="form-control" name="q" placeholder="입력하세요"
                           id="search_key" value="" style="height: 41px;"> <span
                           class="input-group-btn">
                           <button class="btn btn-info" type="submit"> 검색  </button>
                        </span>
                     </div>
              
              
              
              	 <% int selectsize2 = 12; %>
          <% for(int i=0; i<selectsize2; i++ ) { %>
              	
                <div class="cell-sm-3 info">
                 <form>
                  <article class="post-blog"><a class="post-blog-image" href=""><img src="/MapHack/resource/include/images/01.jpg" alt="" width="420" height="305"/></a>
                    <div class="post-blog-caption">
                      <div class="post-blog-caption-header">
                        <ul class="post-blog-tags">
                          <li><a class="button-tags" href="">제목</a></li>
                        </ul>
                          <ul class="post-blog-meta">
                          <li><span>by</span>&nbsp;<a href="about-me.html">닉네임</a></li>
                        </ul>
                      </div>
                      <div class="post-blog-caption-body">
                        <h5><a class="post-blog-title" href="">제목2</a></h5>
                      </div>
                      <div class="post-blog-caption-footer">
                        <time datetime="2017">등록일</time><a class="post-comment" href=""><span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
                      </div>
                    </div>
                  </article>
                </form>
                </div>
                
                
                <%} %>  
        
                
              </div>
              
              <ul class="pagination-custom">
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
              </ul>
           <div  class="button button-xs button-secondary button-nina button-ellipse-md button-shadow" 
           style="float: right;"  onclick="location.href='afterBoard.mh' ">새 여행정보 공유 작성</div>
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