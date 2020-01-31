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

  <section class="section section-xl bg-gray-lighter">
	
<!--           <select name="selectValue" onchange="mostra(this.value)"> -->
<!--             <option value=""></option> -->
<!--              <option value="santos">Santos</option> -->
<!--              <option value="retroPorto">Retro Porto</option> -->
<!--              <option value="itajai">Itajai</option> -->
<!--              <option value="paranagua">Paranaguá</option> -->
<!--              <option value="curitiba">Curitiba</option> -->

<!--              <option value="saoPaulo">Sao Paulo</option> -->

<!--           </select> -->
          <div class="tab-pane" id="starList">
                  <div class="col-md-offset-1">
                     <div class="row" style="line-height: 14px;">
        <div class="shell-wide" style="padding-top: 6%;">
          <div class="range range-50">
		   <div class="input-group cell-sm-4">
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
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div>		 -->
		
		<div class="row" style="padding-top: 2%;">
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
          	
                <tr>
            	   <td><p>${freeBoard.bContent}</p></td>
                    <td>${freeBoard.bTitle}</td>
                    <td><a href="#">${freeBoard.bMid}</a></td> 
                    <td>${freeBoard.bDate}</td>
                    <td>${freeBoard.bCnt}</td>

                </tr>
           </c:forEach>
          </c:if>  
            
                </tbody>
                </table>
                </div>
	</div>
	
	
<!-- 히히	 -->
<!-- <name= kosta  >  -->
<%--  <a href="${free}.mh?pageNo=1">  --%>
 
						<ul class="pagination-custom" id="pageNum">
							
							<li><a href="${free}.mh?pageNo=1">◀◀</a></li>
							<li><a href="${free}.mh?pageNo=${freePaging.prev}">◀</a></li>
							<c:forEach var="i" begin="${Integer.parseInt(freePaging.start)}" end="${Integer.parseInt(freePaging.end)}">
								<li><a href="${free}.mh?pageNo=${i}">${i}</a></li>
							</c:forEach>
							<li><a href="${free}.mh?pageNo=${freePaging.next}">▶</a></li>
							<li><a href="${free}.mh?pageNo=${freePaging.pageTotalCount}">▶▶</a></li>

						</ul>






           <div  class="button button-xs button-secondary button-nina button-ellipse-md button-shadow" 
           style="float: right;"  onclick="location.href='freeBoard.mh' ">글쓰기</div>
            </div>
          </div>
      
<!--         </div> -->
        
        </div>
        </div>
      </section>
    
    
    </div>
    	
    	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
</body>
</html>