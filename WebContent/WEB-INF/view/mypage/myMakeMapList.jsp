<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="page">
		<div class="row">
			<div class="col-sm-4">
				<h2>여행짜기 목록</h2>
			</div>
			<div class="col-sm-4"></div>
			<!-- #### 새 여행짜기 버튼 #### -->			
			<div class="col-sm-4">
				<div class="button button-xs button-secondary button-nina button-ellipse-md button-shadow"
					style="float: right;">＋ 새 여행짜기 작성</div>
			</div>
			<!-- #### 새 여행짜기 버튼 END #### -->	
		</div>
		<hr>
		
		
		<div class="shell shell-bigger" style="padding-top: 2%">
			<div class="range range-ten range-50 range-sm-90 range-sm-center range-lg-justify">
				<div class="cell-sm-12 cell-md-12 cell-lg-12 text-center">
					<div class="range range-30">
				
						<!-- #### check box 영역 #### -->
						<div class="input-group cell-sm-4">
							<span class="button3-my-checkbox">
								<button type="button" class="btn" data-color="info" id="checkall3">전체선택</button> 
								<input type="checkbox" id="checkall3" class="hidden" />
							</span> 
							<span class="my-button3-checkbox">
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
						<!-- #### select box 영역 END #### -->
					</div>
				</div>
			</div>
		</div>

		<div class="section section-variant-1 bg-white" style="padding: 50px 0 10px; margin-top: 6%;">
			<div class="shell-wide">
				<div class="range range-50">

				<!-- #### 여행지도 목록 출력 #### -->
					
					 <c:forEach var="a" items="${travelList}">
					<div class="cell-sm-5 cell-lg-3">
						<input type="checkbox" name="chk3" />
						<article class="event-default-wrap">
						<div class="post-blog-caption">
							
							<div class="event-default">
								<figure class="event-default-image"> <img
									src=${a.map_fname}  alt=""
									width="570" height="370" /> </figure>
								<div class="event-default-date-wrap">
									<p>${a.map_mapnum}</p>
								</div>
								<div class="event-default-caption">
									<a class="button button-xs button-secondary button-nina"
										href="/MapHack/myMakeMapDetail.mh?id=${a.map_mapnum}">계획상세보기</a>
								</div>
							</div>

							<div class="event-default-inner">
								<div class="box-inline">
									<span
										class="icon icon-md-middle icon-secondary mdi mdi-account"></span><a
										class="event-default-link" href=""><lable>분류 : </lable>개인
								</div>
								<div class="box-inline">
									<span
										class="icon icon-md-middle icon-secondary mdi mdi-calendar-clock"></span><a
										class="event-default-link" href=""><lable>여행시작일 : </lable>${a.map_start_date}
								</div>
								<div class="box-inline">
									<span
										class="icon icon-md-middle icon-secondary mdi mdi-format-title"></span><a
										class="event-default-link" href=""><lable>여행타이틀 : </lable>${a.map_title}
								</div>
							</div>

						</div>
						</article>
					</div>


					</c:forEach>
					<!-- #### 즐겨찾기 목록 출력 END #### -->

				</div>
				<!-- #### range CSS END -->
				
				<!-- #### 페이징 시작 ####-->
				
				<div class="row">
				<div class="col-lg-2"></div>
					<ul class="pagination-custom col-sm-8 col-lg-8">
						<li><a href="#">◀◀</a></li>
						<li><a href="#">◀</a></li>
						<li class=""><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">▶</a></li>
						<li><a href="#">▶▶</a></li>
					</ul>
				</div>
				
				
			
				<!-- #### 페이징 END ####-->
			</div>
			<!-- #### shell-wide CSS END #### -->			
		</div>
		<!-- #### section END ####-->


	</div>
	<!-- #### 지도만들기 페이지 END #### -->



<!-- #### makeMap js (select box, check box) -->
	<script src="/MapHack/resource/mypage/js/myMakeMap.js"></script>
	
<script src="/MapHack/resource/main/js/core.min.js"></script>
<script src="/MapHack/resource/main/js/script.js"></script>
<script src="/MapHack/resource/mypage/js/acordianStyle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>


</body>
</html>