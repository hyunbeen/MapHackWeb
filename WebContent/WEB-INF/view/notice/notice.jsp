<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="page">

		<jsp:include page="/WEB-INF/view/include/header.jsp" />

  
         <!-- Breadcrumbs-->
<!--         <section class="breadcrumbs-custom breadcrumbs-custom-svg" style="background-color: #6d0eb1"> -->
<!--           <div class="shell"> -->
<!--             <p class="breadcrumbs-custom-subtitle" style="color: #6d0eb1">Inside Title</p> -->
<!--             <p class="heading-1" style="color: white">자유게시판</p> -->
<!--             <ul class="breadcrumbs-custom-path"> -->
<!--               <li><a href="index.html">Home</a></li> -->
<!--               <li><a href="#">Gallery</a></li> -->
<!-- <!--               <li class="active">Grid Gallery Inside Title</li> --> -->
<!--             </ul> -->
<!--           </div> -->
<!--           <div class="parallax-scene-js parallax-scene" data-scalar-x="5" data-scalar-y="10"> -->
<!--             <div class="layer-01"> -->
<!--               <div class="layer" data-depth="0.25"><img src="/MapHack/resource/main/images/parallax-scene-01-132x133.png" alt="" width="132" height="133"/> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="layer-02"> -->
<!--               <div class="layer" data-depth=".55"><img src="/MapHack/resource/main/images/parallax-scene-02-186x208.png" alt="" width="186" height="208"/> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="layer-03"> -->
<!--               <div class="layer" data-depth="0.1"><img src="/MapHack/resource/main/images/parallax-scene-03-108x120.png" alt="" width="108" height="120"/> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="layer-04"> -->
<!--               <div class="layer" data-depth="0.25"><img src="/MapHack/resource/main/images/parallax-scene-04-124x145.png" alt="" width="124" height="145"/> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="layer-05"> -->
<!--               <div class="layer" data-depth="0.15"><img src="/MapHack/resource/main/images/parallax-scene-05-100x101.png" alt="" width="100" height="101"/> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="layer-06"> -->
<!--               <div class="layer" data-depth="0.65"><img src="/MapHack/resource/main/images/parallax-scene-06-240x243.png" alt="" width="240" height="243"/> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </section> -->

 <!-- Default Image Background-->
   <section class="section section-lg bg-white" style="background: linear-gradient(-32deg, #8b0fe4 -2%, rgb(41, 41, 58) 26%); padding-bottom: 0px; padding-top: 0px; height:250px;">
        <!-- section wave-->
           <h4 style="color:white; padding-top: 192px; padding-right: 880px;padding-left: 165px;">자유게시판</h4>
      
      </section>
    
    
     <section class="section section-xl bg-white">
<!--        <div class="section-wave"> -->
<!--           <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none"> -->
<!--             <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path> -->
<!--           </svg> -->
<!--         </div> -->
	
       <div class="range range-50">
		   <div class="input-group cell-sm-4" style="margin-left: 880px;padding-top: 45px;">
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
              </div>
      
      
      
      
      
      
      
                     <div class="row" style="line-height: 14px;">
        <div class="shell-wide" >
        
		
		<div class="row" style="padding-top: 2%; margin-top: 20px; margin-bottom: 28px;">
		  <div class="esconde" id="opdRetro">
             <table class="table table-striped table-hover">
            <thead>
                <tr class="bg-primary">
                    <th>No.</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody> <!-- para abrir em outra aba adicionar target="_blank" -->


	<c:if test="${freeBoardList ne null}" >
			<c:forEach var="freeBoard" items="${freeBoardList}">
          	
                <tr onclick="javascript:location.href='/MapHack/freeView.mh?id=${freeBoard.bNum}'">
            	   	<td ><p>${freeBoard.bNum}</p></td>
                    <td>${freeBoard.bTitle}</td>
                    <td>${freeBoard.bMid}</a></td> 
                    <td>${freeBoard.bDate}</td>
                    <td>${freeBoard.bCnt}</td>

                </tr>
           </c:forEach>
          </c:if>  
            
                </tbody>
                </table>
                </div>
	</div>
	
	
   <div class="cell-sm-6 cell-lg-6"></div>
						<ul class="pagination-custom cell-sm-3 cell-lg-3" id="pageNum">
							
							<li><a href="${free}.mh?pageNo=1">◀◀</a></li>
							<li><a href="${free}.mh?pageNo=${freePaging.prev}">◀</a></li>
							<c:forEach var="i" begin="${Integer.parseInt(freePaging.start)}" end="${Integer.parseInt(freePaging.end)}">
								<li><a href="${free}.mh?pageNo=${i}">${i}</a></li>
							</c:forEach>
							<li><a href="${free}.mh?pageNo=${freePaging.next}">▶</a></li>
							<li><a href="${free}.mh?pageNo=${freePaging.pageTotalCount}">▶▶</a></li>
						</ul>


           <div  class="button button-xs button-secondary button-nina button-ellipse-md button-shadowcell-sm-3 cell-lg-3" 
           style="float: right;"  onclick="location.href='freeBoard.mh' ">글쓰기</div>
            </div>
          </div>
      
        
        
      </section>
           <!-- Counters-->
      <section class="section section-md bg-gray-darker text-center" style="padding-bottom: 10px;">
        <div class="shell shell-wide">
          <div class="range range-50 range-xs-center">
            <div class="cell-xs-10 cell-sm-6 cell-md-3">
              <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-projector"></span>
                <div class="heading-3"><span class="counter" data-step="3000">132</span></div>
                <p>총 게시물수</p>
              </div>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-md-3">
              <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-account-multiple-outline"></span>
                <div class="heading-3"><span class="counter" data-step="3000">246000</span></div>
                <p>누적 조회수</p>
              </div>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-md-3">
              <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-star"></span>
                <div class="heading-3"><span class="counter" data-step="3000">5</span></div>
                <p>회원수</p>
              </div>
            </div>
<!--             <div class="cell-xs-10 cell-sm-6 cell-md-3"> -->
<!--               <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-spellcheck"></span> -->
<!--                 <div class="heading-3"><span class="counter" data-step="3000">459</span></div> -->
<!--                 <p></p> -->
<!--               </div> -->
<!--             </div> -->
          </div>
        </div>
      </section>
      
    
     <!-- Page Footer-->
    		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
    
    
    
    </div>
    	
    	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
</body>
</html>