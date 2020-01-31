<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<title>Insert title here</title>
</head>
<body>



    <div class="page">
       <h2>즐겨찾기 목록</h2>
       <hr>
      <div class="shell shell-bigger" style="padding-top: 2%">
         <div class="range range-ten range-50 range-sm-90 range-sm-center range-lg-justify">
            <div class="cell-sm-12 cell-md-12 cell-lg-12 text-center">
               <div class="range range-30">

                  <!-- #### check box 영역 #### -->
                  <div class="input-group cell-sm-4">
                     <span class="button2-my-checkbox">
                        <button type="button" class="btn" data-color="info" id="checkall2">전체선택</button> 
                        <input type="checkbox" id="checkall2" class="hidden" />
                     </span> 
                     <span class="my-button2-checkbox">
                        <button type="button" class="btn" data-color="danger">선택삭제</button>
                        <input type="checkbox" class="hidden" checked />
                     </span>
                  </div>
                  <!-- ####check box 영역 END ####-->


                  <!-- #### select box 영역 #### -->
                  <div class="input-group cell-sm-2"></div>
                  <div class="input-group cell-sm-6">
                     <div class="input-group-btn search-panel">
                        <button type="button" class="btn btn-default dropdown-toggle"
                           data-toggle="dropdown">
                           <span id="search_concept">전체</span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" id="search">
                           <li><a href="#all"><i class="fa fa-angle-double-right"></i>전체</a></li>
                           <li><a href="#id"><i class="fa fa-angle-double-right"></i>숙박</a></li>
                           <li><a href="#name"><i class="fa fa-angle-double-right"></i>관광지</a></li>
                           <li><a href="#description"><i class="fa fa-angle-double-right"></i>음식점</a></li>
                        </ul>
                     </div>
                     <input type="hidden" name="search_param" value="name" id="search_param"> 
                     <input type="text" class="form-control" name="q" placeholder="입력하세요" id="search_key" style="height: 41px;"> 
                     <span class="input-group-btn">
                        <button class="btn btn-info" onclick="btnsearch()">검색</button>
                     </span>
                  </div>
                  <!-- #### select box 영역 END #### -->

               </div>
            </div>
         </div>
      </div>



      <div class="section section-variant-1 bg-white" style="padding: 50px 0 10px; margin-top: 6%;">
         <div class="shell-wide">
            <div class="range range-50" id = "searchdiv">

               <!-- #### 즐겨찾기 목록 출력 #### -->
               <c:forEach var="a" items="${list}">
                  <div class="cell-sm-4 info">
                     <form action="infoDetail.mh" method="post">
                        <input type="hidden" name="contentId" value="${a.contentid }" />
                        <input type="hidden" name="contentTypeId" value="${a.contenttypeid }" />
                        <input type="hidden" name="firstImage" value="${a.firstimage}" />
                        <article class="post-blog"> 
                        <input type="checkbox" name="chk2" /> <a class="post-blog-image" href=""> 
                        	<c:if test="${a.firstimage ne null }">
                              <img src="${a.firstimage }" alt="" width="420" height="305"/>
                           </c:if> 
                           <c:if test="${a.firstimage eq null }">
                              <img
                                 src="/MapHack/resource/infodetail/images/no_detail_img.gif"
                                 alt="" width="420" height="305" />
                           </c:if>
                        </a>

                        <div class="post-blog-caption" style="padding-top: 5px;">
                           <div class="post-blog-caption-header"
                              style="padding-left: 6%; padding-right: 1.66%">
                              <ul class="post-blog-tags">
                                 <li><a class="button-tags" href="" name="title">${a.title }</a></li>
                              </ul>
                           </div>
                           <div class="post-blog-caption-body"
                              style="padding-left: 6%; padding-right: 1.66%">
                              <h7> 
                              <a class="post-blog-title" href="" name="addr1">${a.addr1}</a>
                              <a class="post-blog-title" href="" name="addr2">${a.addr2}</a></h7>
                           </div>
                           <div class="post-blog-caption-footer"
                              style="padding-left: 6%; padding-right: 1.66%">
                              <time datetime="2017"> <span name = "modifiedTime" style="font-size: 13px;">${a.modifiedtime }</span></time>
                              <a class="post-comment" href=""> <span
                                 class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span>
                                 <span>3</span>
                              </a>
                           </div>
                        </div>
                        </article>
                     </form>
                  </div>
               </c:forEach>
               <!-- #### 즐겨찾기 목록 출력 END #### -->

            </div>
            <!-- #### range CSS END -->

            <!-- #### 페이징 시작 ####-->
            <ul class="pagination-custom"
               style="padding-left: 36%; padding-bottom: 5%;">
               <li class="active"><a href="#"class="">1</a></li>
               <li><a href="#">2</a></li>
               <li><a href="#">3</a></li>
               <li><a href="#">4</a></li>
            </ul>
            <!-- #### 페이징 END ####-->
         </div>
         <!-- #### shell-wide CSS END #### -->
      </div>
      <!-- #### section END ####-->

   </div>
   <!-- #### 즐겨찾기 페이지 END #### -->
<script type="text/javascript">
	
</script>


<!-- #### 즐겨찾기 js (select box, check box) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>
<script src="/MapHack/resource/mypage/js/myBookMark.js"></script>

<script src="/MapHack/resource/main/js/core.min.js"></script>
<script src="/MapHack/resource/main/js/script.js"></script>
    
<script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> 

</body>
</html>