<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
<!-- Site Title-->
<title>Blog Grid</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- Stylesheets -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
<link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
<link rel="stylesheet"
	href="/MapHack/resource/main/css/fl-bigmug-line.css">


<link rel="stylesheet"
	href="/MapHack/resource/infodetail/css/infoList.css">





<!--[if lt IE 10]>
    <div style="background: #212121; padding: 10px 0; box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3); clear: both; text-align:center; position: relative; z-index:1;"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <script src="js/html5shiv.min.js"></script>
		<![endif]-->



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/MapHack/resource/infodetail/js/infoList.js"></script>
<script type="text/javascript">
	$(function() {
		$('.info').click(function() {
			$(this).find('a').removeAttr('href');
			$(this).find('form').submit();
		});
		
		
		
	});
</script>


</head>
<body>
	<div class="page">
		<!-- Page Header-->
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>


		<!-- Blog-->
		<section class="section section-xl bg-gray-lighter">
			<!-- section wave-->
			<div class="section-wave">
				<svg x="0px" y="0px" width="1920px" height="45px"
					viewbox="0 0 1920 45" preserveAspectRatio="none">
            <path
						d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path>
          </svg>
			</div>



			<div class="shell text-center">
				<p class="heading-1 breadcrumbs-custom-title">여행정보</p>
			</div>


			<div class="shell shell-bigger">
				<div
					class="range range-ten range-50 range-sm-90 range-sm-center range-lg-justify">
					<div class="cell-sm-12 cell-md-12 cell-lg-12 text-center">
						<div class="range range-30">

							
							<div class="cell-lg-4 cell-md3"></div>
							<!-- 							<div class="cell-sm-2"></div> -->
							<!-- 							<div class="cell-sm-2"></div> -->
							<div class="cell-lg-4 cell-md-3"></div>
							
							
							<div class="input-group cell-lg-4 cell-md-6 cell-sm-12"
								style="margin-top: 20px">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span id="search_concept">통합검색</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#id"><i class="fa fa-angle-double-right"></i>
												ID</a></li>
										<li><a href="#name"><i
												class="fa fa-angle-double-right"></i> 통합검색</a></li>
										<li><a href="#description"><i
												class="fa fa-angle-double-right"></i> Description</a></li>
									</ul>
								</div>
								
								
								
								<input type="hidden" name="search_param" value="name"
									id="search_param"> 
								<form action="" method="post" id="kSearch">
								<input type="text"
									class="form-control" name="keyword" placeholder="Search.."
									id="keyword" value="" style="height: 41px;">
								</form>
								<span
									class="input-group-btn">
									<button class="btn btn-info searchKeyword" type="button">  Search  </button>
								</span>
							</div>
							


							<div class="container">







								<div class="col-md-12 col-xs-12">
									<div id="accordion" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab" id="headingOne">
												<h5 class="mb-0">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapseOne2" aria-expanded="true"
														aria-controls="collapseOne2">지역별 검색 </a>
												</h5>
											</div>

											<div id="collapseOne2" class="collapse" role="tabpanel"
												aria-labelledby="headingOne">





												<!-- Hover Row Table-->

												<div class="table-novi table-custom-responsive">


													<form id="aSearch" action="" method="post">


														<table class="table-custom table-hover">
															<tbody>
																<tr>
																	<td class="td1">관광타입</td>
																	<td class="td2"><select name="contentTypeId"
																		class="js-example-basic-hide-search">
																			<option value="12">관광지</option>
																			<option value="14">문화시설</option>
																			<option value="15">축제공연행사</option>
																			<option value="25">여행코스</option>
																			<option value="28">레포츠</option>
																			<option value="32">숙박</option>
																			<option value="38">쇼핑</option>
																			<option value="39">음식점</option>
																			
																	</select></td>
																</tr>
																<tr>
																	<td class="td1">지역선택</td>
																	<td class="td2"><select name="areaCode"
																		class="js-example-basic-hide-search area">
																			<option value="default">지역선택</option>
																			<option value="1">서울</option>
																			<option value="2">인천</option>
																			<option value="3">대전</option>
																			<option value="4">대구</option>
																			<option value="5">광주</option>
																			<option value="6">부산</option>
																			<option value="7">서울</option>
																			<option value="8">세종</option>
																			<option value="31">경기도</option>
																			<option value="32">강원도</option>
																			<option value="33">충청북도</option>
																			<option value="34">충청남도</option>
																			<option value="35">경상북도</option>
																			<option value="36">경상남도</option>
																			<option value="37">전라북도</option>
																			<option value="38">전라남도</option>
																			<option value="39">제주도</option>
																			
																	</select> <select name="sigunguCode"
																		class="js-example-basic-hide-search sigungu">
																			<option value="">시군구코드</option>
																	</select></td>
																</tr>
																<tr>
																	<td class="td1">검색</td>
																	<td class="td2">

																		<div class="input-group cell-sm-4">

																			<button class="btn btn-info areaCode" type="button">검색</button>

																		</div>


																	</td>
																</tr>
															</tbody>
														</table>

													</form>


												</div>


											</div>
										</div>
									</div>
								</div>








<!-- 								<div class="col-md-12 col-xs-12"> -->
<!-- 									<div id="accordion" role="tablist" aria-multiselectable="true"> -->
<!-- 										<div class="card"> -->
<!-- 											<div class="card-header" role="tab" id="headingOne"> -->
<!-- 												<h5 class="mb-0"> -->
<!-- 													<a data-toggle="collapse" data-parent="#accordion" -->
<!-- 														href="#collapseOne" aria-expanded="true" -->
<!-- 														aria-controls="collapseOne">[행사] 날짜검색 </a> -->
<!-- 												</h5> -->
<!-- 											</div> -->

<!-- 											<div id="collapseOne" class="collapse" role="tabpanel" -->
<!-- 												aria-labelledby="headingOne"> -->





<!-- 												Hover Row Table -->

<!-- 												<div class="table-novi table-custom-responsive"> -->
<!-- 													<table class="table-custom table-hover"> -->
<!-- 														<tbody> -->
<!-- 															<tr> -->
<!-- 																<td class="td1">지역선택</td> -->
<!-- 																<td class="td2"><select name="tag_id" -->
<!-- 																	class="js-example-basic-hide-search"> -->
<!-- 																		<option value="default">지역선택</option> -->
<!-- 																		<option value="1">서울</option> -->
<!-- 																		<option value="danger">In Trash</option> -->
<!-- 																		<option value="info">All</option> -->
<!-- 																</select> <select name="tag_id" -->
<!-- 																	class="js-example-basic-hide-search"> -->
<!-- 																		<option value="default">시군구선택</option> -->
<!-- 																		<option value="warning">강남구</option> -->
<!-- 																		<option value="danger">강동구</option> -->
<!-- 																		<option value="info">All</option> -->
<!-- 																</select></td> -->
<!-- 															</tr> -->
<!-- 															<tr> -->
<!-- 																<td class="td1">시작일</td> -->
<!-- 																<td class="td2"></td> -->

<!-- 															</tr> -->

<!-- 															<tr> -->
<!-- 																<td class="td1">종료일</td> -->
<!-- 																<td class="td2"> -->

<!-- 																	<div class="input-group cell-sm-4"> -->

<!-- 																		<button class="btn btn-info" type="submit">검색</button> -->

<!-- 																	</div> -->


<!-- 																</td> -->
<!-- 															</tr> -->
<!-- 														</tbody> -->
<!-- 													</table> -->
<!-- 												</div> -->


<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->

















							</div>



















							<c:if test="${list ne null}" >
							<c:forEach var="a" items="${list}">


								<div class="cell-sm-3 info">
									<form action="infoDetail.mh" method="post">
										<input type="hidden" name="contentId" value="${a.contentid }" />
										<input type="hidden" name="contentTypeId"
											value="${a.contenttypeid }" />

										<article class="post-blog">
											<a class="post-blog-image" href=""> <c:if
													test="${a.firstimage ne null }">
													<img src="${a.firstimage }" alt="" width="420" height="305" />
												</c:if> <c:if test="${a.firstimage eq null }">
													<img
														src="/MapHack/resource/infodetail/images/no_detail_img.gif"
														alt="" width="420" height="305" />
												</c:if>
											</a>
											<div class="post-blog-caption">
												<div class="post-blog-caption-header">
													<ul class="post-blog-tags">
														<li><a class="button-tags" href="">${a.title }</a></li>
													</ul>
												</div>
												<div class="post-blog-caption-body">
													<h5>
														<a class="post-blog-title" href="">${a.addr1}
															${a.addr2}</a>
													</h5>
												</div>
												<div class="post-blog-caption-footer">
													<time datetime="2017">${a.modifiedtime }</time>
													<a class="post-comment" href=""><span
														class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
												</div>
											</div>
										</article>
									</form>
								</div>


							</c:forEach>
							</c:if>





						</div>
							<input type="hidden" value="${list.get(0).pageNo}" id="pageNo"/>
						<ul class="pagination-custom" id="pageNum">
							
<%-- 							<li class="active"><a href="${info}.mh?pageNo=1">1</a></li> --%>
							<li><a href="${info}.mh?keywork=${list.get(0).keyword}&pageNo=1">◀◀</a></li>
							<li><a href="${info}.mh?keywork=${list.get(0).keyword}&pageNo=${list.get(0).prev}">◀</a></li>
							<c:forEach var="i" begin="${Integer.parseInt(list.get(0).start) }" end="${Integer.parseInt(list.get(0).end)}">
								<li><a href="${info}.mh?keywork=${list.get(0).keyword}&pageNo=${i}">${i}</a></li>
							</c:forEach>
							<li><a href="${info}.mh?keywork=${list.get(0).keyword}&pageNo=${list.get(0).next}">▶</a></li>
							<li><a href="${info}.mh?keywork=${list.get(0).keyword}&pageNo=${list.get(0).pageTotalCount}">▶▶</a></li>
							




						</ul>
					</div>
				</div>
			</div>
		</section>

		<!-- Page Footer-->
		<!-- Footer Extended-->
		<footer
			class="section page-footer page-footer-extended text-center text-md-left bg-gray-darker">
			<div class="rd-google-map-wrap"></div>
			<div class="shell shell-wide">
				<div
					class="range range-xs-center range-md-justify range-lg-right range-135">


					<div class="cell-lg-8">
						<div
							class="range range-md-reverse range-xs-center range-md-middle range-135 range-lg-left">
							<div class="cell-sm-10 cell-md-5 cell-lg-5 cell-xl-5 text-center">
								<ul class="group-xs group-middle social-icons-list">
									<li><a
										class="icon icon-md-smaller icon-circle icon-secondary-5-filled mdi mdi-facebook"
										href="#"></a></li>
									<li><a
										class="icon icon-md-smaller icon-circle icon-secondary-5-filled mdi mdi-twitter"
										href="#"></a></li>
									<li><a
										class="icon icon-md-smaller icon-circle icon-secondary-5-filled mdi mdi-instagram"
										href="#"></a></li>
									<li><a
										class="icon icon-md-smaller icon-circle icon-secondary-5-filled mdi mdi-google"
										href="#"></a></li>
									<li><a
										class="icon icon-md-smaller icon-circle icon-secondary-5-filled mdi mdi-linkedin"
										href="#"></a></li>
								</ul>
							</div>
							<div class="cell-sm-10 cell-md-7 cell-lg-7 cell-xl-6">
								<p class="right">
									&#169;&nbsp;<span class="copyright-year"></span> All Rights
									Reserved&nbsp;<a href="#">Terms of Use</a>&nbsp;and&nbsp;<a
										href="privacy-policy.html">Privacy Policy</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- Global Mailform Output-->
	<div class="snackbars" id="form-output-global"></div>


	</div>



	<!-- Javascript-->
	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
</body>
</html>