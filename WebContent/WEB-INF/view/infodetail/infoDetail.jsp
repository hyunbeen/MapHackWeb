<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	
	
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
<!-- Site Title-->
<title>Blog Single Post</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- Stylesheets -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
<link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
<link rel="stylesheet"
	href="/MapHack/resource/main/css/fl-bigmug-line.css">
	
<!-- 별점 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/MapHack/resource/infodetail/css/infoDetail.css">

<!--[if lt IE 10]>
    <div style="background: #212121; padding: 10px 0; box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3); clear: both; text-align:center; position: relative; z-index:1;"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <script src="js/html5shiv.min.js"></script>
		<![endif]-->
<title>Insert title here</title>

</head>
<body>

<div class="page">
	<!-- Page Header-->
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>



	<!-- Single post-->
	<section class="section section-lg bg-white">
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
		
		
		
		<div class="shell-wide">
			<div class="range range-xs-center">




				<div class="cell-md-10 cell-lg-8 cell-xl-6 sections-collapsable">













					<article class="post-blog-article">
							<input type="hidden" class="irLocation" value="${common.contentid }"/>
							<p class="post-blog-article-title">
								${common.title }<br
									class="veil reveal-md-block">
							</p>
							<ul class="post-blog-article-meta group-xl">
								<li>
									<div class="box-inline">
										<span class="icon icon-md icon-primary mdi mdi-account"></span>by
										<div>
											<a href="#">Ronald Chen</a>
										</div>
									</div>
								</li>
								<li>
									<div class="box-inline">
										<span class="icon icon-md icon-primary mdi mdi-calendar-clock"></span>
										<time datetime="2017">${common.modifiedtime }</time>
									</div>
								</li>
							</ul>
							<p class="big">${common.overview }</p>
							<img src="${common.firstimage }" alt="" width="870"
								height="580" />
							<h5>관광지</h5>
							<p>${intro.infocenter }</p><br/>
							<h5>주차장</h5>
							<p>${intro.parking }</p><br/>
							<h5>쉬는날</h5>
							<p>${intro.restdate }</p><br/>
							<h5>이용시간</h5>
							<p>${intro.usetime }</p><br/>
							
							
							
							<c:if test="${info ne null}" >
							<c:forEach var="a" items="${info}">
							<h5>${a.infoname }</h5>
							<p>${a.infotext }</p><br/>
							</c:forEach>
							</c:if>
							
							<c:if test="${image ne null}" >
							<c:forEach var="a" items="${image }">
							<img src="${a.originimgurl }" alt="" />
<%-- 							<img src="${a.smallimageurl }" alt="" width="870" --%>
<!-- 								height="580" /> -->
							</c:forEach>
							</c:if>








							<div class="section-md">
						<p class="h3-alternate">리뷰</p>
						<div class="comment-group">
						
							
							
<%-- 							<input type="text" value="${rList[0].irLocation}"/> --%>
<%-- 							<input type="text" value="${common.contentid}"/> --%>
							<c:if test="${rList[0].irLocation eq common.contentid}">
							<c:forEach var="a" items="${rList }">
								
							
							<!-- Comment-->
							<article class="comment">
								<div class="comment-avatar">
									<img src="images/user-1-80x80.jpg" alt="" width="80"
										height="80" />
								</div>
								<div class="comment-body">
									<div class="comment-header">
										<input type="hidden" class="num" value="${a.irNum }"/>
										<input type="hidden" class="location" value="${a.irLocation }"/>
										<p class="comment-title mid">${a.irMid } </p> 
										<time class="comment-time date" datetime="2017">${a.irDate }</time>
										<p class="comment-text star">${a.irStar }</p>
										<input type="hidden" value="" id="star"/>
										<c:if test="${a.irMid eq sessionScope.id}">
											<button class="btn btn-primary updateBtn"	type="button">수정</button>
											<button class="btn btn-primary deleteBtn"	type="button">삭제</button>
										</c:if>
									</div>
									<div class="comment-text">
										<p class="content">${a.irContent }</p>
									</div>
									
								</div>
							</article>
							
							
							</c:forEach>
							




								<ul class="pagination-custom cell-sm-3 cell-lg-3" id="pageNum">

									<li><a href="${infoDetail}.mh?contentTypeId=${rPaging.contentTypeId}&contentId=${rPaging.contentId}&pageNo=1">◀◀</a></li>
									<li><a href="${infoDetail}.mh?contentTypeId=${rPaging.contentTypeId}&contentId=${rPaging.contentId}&pageNo=${rPaging.prev}">◀</a></li>
									<c:forEach var="i"
										begin="${Integer.parseInt(rPaging.start)}"
										end="${Integer.parseInt(rPaging.end)}">
										<li><a href="${infoDetail}.mh?contentTypeId=${rPaging.contentTypeId}&contentId=${rPaging.contentId}&pageNo=${i}">${i}</a></li>
									</c:forEach>
									<li><a href="${infoDetail}.mh?contentTypeId=${rPaging.contentTypeId}&contentId=${rPaging.contentId}&pageNo=${rPaging.next}">▶</a></li>
									<li><a
										href="${infoDetail}.mh?contentTypeId=${rPaging.contentTypeId}&contentId=${rPaging.contentId}&pageNo=${rPaging.pageTotalCount}">▶▶</a></li>
								</ul>


							</c:if>








							</div>
					</div>
					<div class="section-lg">
						<p class="h3-alternate">리뷰작성</p>
						<!-- RD Mailform-->
						<form class="rd-mailform" data-form-output="form-output-global"
							data-form-type="contact" method="post"
							action="bat/rd-mailform.php">
							<div class="range range-20">
								
								<div class="cell-sm-6">
									<div class="form-wrap form-wrap-validation">
										<label class="form-label-outside">작성자</label>
										<input class="form-input irMid" id="form-comment-email" type="text"
											name="irMid">
									</div>
								</div>
								<div class="cell-sm-6">
									<div class="form-wrap form-wrap-validation">
										<label class="form-label-outside">별점</label>
										<input class="form-input irStar" id="form-comment-email" type="hidden"
											name="irStar">


<!-- ######################## -->
											<section class='rating-widget'>
												<!-- Rating Stars Box -->
												<div class='rating-stars text-center'>
													<ul id='stars'>
														<li class='star' title='Poor' data-value='1'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' title='Fair' data-value='2'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' title='Good' data-value='3'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' title='Excellent' data-value='4'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' title='WOW!!!' data-value='5'><i
															class='fa fa-star fa-fw'></i></li>
													</ul>
												</div>
												<div class='success-box'>
													<div class='text-message'></div>
													<div class='clearfix'></div>
												</div>
											</section>

<!-- ######################## -->



										</div>
								</div>
								<div class="cell-xs-12">
									<div class="form-wrap form-wrap-validation">
										<label class="form-label-outside" for="form-comment-message">댓글내용</label>
										<textarea class="form-input irContent" id="form-comment-message"
											name="irContent" data-constraints="@Required"></textarea>
									</div>
								</div>
								<div class="cell-xs-12 offset-custom-1">
									<div class="row">
										<div class="col-xs-4">
											<button
												class="button button-secondary button-nina reviewBtn"
												type="button">리뷰작성</button>
										</div>
									</div>
									
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Page Footer-->
	<!-- Footer Extended-->
	<footer
		class="section page-footer page-footer-extended text-center text-md-left bg-gray-darker">
		
		<div class="shell shell-wide">
			<div
				class="range range-xs-center range-md-justify range-lg-right range-135">
				<div class="cell-sm-8 cell-md-6 cell-lg-5">
					
				</div>
				
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
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
<!-- 	<script src="/MapHack/resource/infodetail/js/infoDetail.js"></script> -->
</body>



</body>




<script type="text/javascript">
$(function(){
	
	//리뷰 등록
	$('.reviewBtn').click(function(){
		alert($('.irContent').val());
		var irMid = $('.irMid').val();				//작성자
		var irContent = $('.irContent').val();		//내용
		var irStar = parseInt($('.irStar').val());	//별점
		var irLocation = $('.irLocation').val();	//콘텐츠id (장소코드)
		$.ajax({
			type : 'post',
			url : 'insertReview.mh',
			data : {
				'irMid' : irMid,	
				'irContent' : irContent,
				'irStar' : irStar,
				'irLocation' : irLocation
			},
			dataType : 'json',
			success : function(data){
				if(data != null){
					alert("입력성공");
					alert(data.length);
					$('.comment-group').children().remove();
					for(var a = 0; a < data.length; a++){
						var tag = '<article class="comment"> '
							+ '<div class="comment-avatar">'
							+ '<img src="images/user-1-80x80.jpg" alt="" width="80" height="80" />'
							+ '</div>'
							+ '<div class="comment-body">'
							+ '<div class="comment-header">'
							+ '<input type="hidden" class="num" value="' + data[a].irNum + '"/>'
							+ '<input type="hidden" class="location" value="' + data[a].irLocation + '"/>'
							+ '<p class="comment-title mid">' + data[a].irMid + '</p>' 
							+ '<time class="comment-time date" datetime="2017">' + data[a].irDate + '</time>'
							+ '<p class="comment-text star">' + data[a].irStar + '</p>'
							+ '<input type="hidden" value="" id="star"/>'
							+ '<c:if test="${' + data[a].irMid + ' eq sessionScope.id}">'
							+ '<button class="btn btn-primary updateBtn" type="button">수정</button>'
							+ '<button class="btn btn-primary deleteBtn" type="button">삭제</button>'
							+ '</c:if>'
							+ '</div>'
							+ '<div class="comment-text">'
							+ '<p class="content">' + data[a].irContent + '</p>'
							+ '</div>'
							+ '</div>'
							+ '</article>';
					$('.comment-group').append(tag);
					}
					
					
					var paging = $('<ul class="pagination-custom cell-sm-3 cell-lg-3" id="pageNum"></ul>');
					var li1 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=1">◀◀</a></li>');
					var li2 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + data[0].prev + '">◀</a></li>');
					paging.append(li1);
					paging.append(li2);
					for(var i = data[0].start; i < data[0].end; i++){
						var li3 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + i + '">' + i + '</a></li>');
						paging.append(li3);
					}
					var li4 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + data[0].next + '">▶</a></li>');
					var li5 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + data[0].pageTotalCount + '">▶▶</a></li>');
					paging.append(li4);
					paging.append(li5);
					$('.comment-group').append(paging);
					
					$('.irMid').val('');
					$('.irContent').val('');
					$('.irStar').val('');
					$('.irLocation').val('');
					$('#stars li').removeClass('selected');
					
				}
				
			},
			error : function(err){
				alert('예외발생' + err);
			}
			
		});
	});
	
	//리뷰 수정
	$(document).on('click', '.updateBtn', function(){
		
		
		
//		alert("수정클릭");
//		var irNum = $(this).siblings('.num').val();
//		var irLocation = $(this).siblings('.location').val();
//		var irMid = $(this).siblings('.mid').text();
//		var irDate = $(this).siblings('.date').text();
//		var irStar = $(this).siblings('.star').text();
		var irContent = $(this).parent().next().children('.content').text();
//		alert(irNum + irMid + irDate + irStar + irContent);
		alert(irContent);
		
		$(this).parent().next().children('.content').replaceWith('<textarea class="form-input irContent" id="form-comment-message" name="irContent" data-constraints="@Required">' + irContent + '</textarea>');
		
		
		var star = $('<section class="rating-widget">'
					+ '<!-- Rating Stars Box -->'
					+ '<div class="rating-stars text-center">'
					+ '<ul id="stars">'
					+ '<li class="star" title="Poor" data-value="1"><i class="fa fa-star fa-fw"></i></li>'
					+ '<li class="star" title="Fair" data-value="2"><i class="fa fa-star fa-fw"></i></li>'
					+ '<li class="star" title="Good" data-value="3"><i class="fa fa-star fa-fw"></i></li>'
					+ '<li class="star" title="Excellent" data-value="4"><i class="fa fa-star fa-fw"></i></li>'
					+ '<li class="star" title="WOW!!!" data-value="5"><i class="fa fa-star fa-fw"></i></li>'
					+ '</ul>'
					+ '</div>'
					+ '<div class="success-box">'
					+ '<div class="text-message"></div>'
					+ '<div class="clearfix"></div>'
					+ '</div>'
					+ '</section>');
		
		$(this).siblings('.star').replaceWith(star);
		$(this).text('완료');
		$(this).attr('class', 'btn btn-primary upBtn');
		
	});
	
	//수정 댓글 작성 후 완료버튼 클릭
	$(document).on('click', '.upBtn', function(){
		var irNum = $(this).siblings('.num').val();
		var irLocation = $(this).siblings('.location').val();
		var irMid = $(this).siblings('.mid').text();
		var irStar = $(this).siblings('#star').val();
		var irContent = $(this).parent().next().children('.irContent').val();
		
// 		alert(irNum + " / " + irLocation + " / " + irMid + " / " + irStar + " / " + irContent);
		
		$.ajax({
			type : 'post', 
			url : 'updateReview.mh',
			data : {
				'irNum' : irNum,
				'irLocation' : irLocation,
				'irMid' : irMid,
				'irStar' : irStar,
				'irContent' : irContent
			},
			dataType : 'json',
			success : function(data){
// 				alert('수정완료');
				$('.comment-group').children().remove();
				
				<c:if test="${rList[0].irLocation eq common.contentid}">
				
				for(var a = 0; a < data.length; a++){
					var tag = '<article class="comment"> '
						+ '<div class="comment-avatar">'
						+ '<img src="images/user-1-80x80.jpg" alt="" width="80" height="80" />'
						+ '</div>'
						+ '<div class="comment-body">'
						+ '<div class="comment-header">'
						+ '<input type="hidden" class="num" value="' + data[a].irNum + '"/>'
						+ '<input type="hidden" class="location" value="' + data[a].irLocation + '"/>'
						+ '<p class="comment-title mid">' + data[a].irMid + '</p>' 
						+ '<time class="comment-time date" datetime="2017">' + data[a].irDate + '</time>'
						+ '<p class="comment-text star">' + data[a].irStar + '</p>'
						+ '<input type="hidden" value="" id="star"/>'
						+ '<c:if test="${' + data[a].irMid + ' eq sessionScope.id}">'
						+ '<button class="btn btn-primary updateBtn" type="button">수정</button>'
						+ '<button class="btn btn-primary deleteBtn" type="button">삭제</button>'
						+ '</c:if>'
						+ '</div>'
						+ '<div class="comment-text">'
						+ '<p class="content">' + data[a].irContent + '</p>'
						+ '</div>'
						+ '</div>'
						+ '</article>';
				$('.comment-group').append(tag);
				}
				
				
				var paging = $('<ul class="pagination-custom cell-sm-3 cell-lg-3" id="pageNum"></ul>');
				var li1 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=1">◀◀</a></li>');
				var li2 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + data[0].prev + '">◀</a></li>');
				paging.append(li1);
				paging.append(li2);
				for(var i = data[0].start; i < data[0].end; i++){
					var li3 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + i + '">' + i + '</a></li>');
					paging.append(li3);
				}
				var li4 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + data[0].next + '">▶</a></li>');
				var li5 = $('<li><a href="infoDetail.mh?contentTypeId=' + data[0].contentTypeId + '&contentId=' + data[0].contentId + '&pageNo=' + data[0].pageTotalCount + '">▶▶</a></li>');
				paging.append(li4);
				paging.append(li5);
				$('.comment-group').append(paging);
				
				</c:if>
				
				$('.irMid').val('');
				$('.irContent').val('');
				$('.irStar').val('');
				$('.irLocation').val('');
				$('#stars li').removeClass('selected');
				
			},
			error : function(request,status,err){
				alert("예외발생 : " + request.status + "메시지 : " + request.responseText + "\n" + "에러 : " + err);
			}
		});
	});
	
	
	
	
	
	
	
	
	//=============================================================================
	
	
});




$(document).ready(function(){
	  
	  /* 1. Visualizing things on Hover - See next part for action on click */
//	  $('#stars li').on('mouseover', function(){
	$(document).on('mouseover','#stars li', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
	   
	    // Now highlight all the stars that's not after the current hovered star
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', '#stars li', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  
	  /* 2. Action to perform on click */
//	  $('#stars li').on('click', function(){
	$(document).on('click','#stars li', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
	    var stars = $(this).parent().children('li.star');
	    
	    for (i = 0; i < stars.length; i++) {
	      $(stars[i]).removeClass('selected');
	    }
	    
	    for (i = 0; i < onStar; i++) {
	      $(stars[i]).addClass('selected');
	    }
	    
	    // JUST RESPONSE (Not needed)
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
	    var msg = "";
	    if (ratingValue > 1) {
//	        msg = "Thanks! You rated this " + ratingValue + " stars.";
	    	$('.irStar').val(ratingValue);
	    	$('#star').val(ratingValue);
	    }
	    else {
//	        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
	    	$('.irStar').val(ratingValue);
	    	$('#star').val(ratingValue);
	    }
	    responseMessage(msg);
	    
	  });
	  
	  
	});


	function responseMessage(msg) {
	  $('.success-box').fadeIn(200);  
	  $('.success-box div.text-message').html("<span>" + msg + "</span>");
	}













</script>



</html>