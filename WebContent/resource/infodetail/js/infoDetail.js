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
		
		alert(irNum + " / " + irLocation + " / " + irMid + " / " + irStar + " / " + irContent);
		
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
				alert('수정완료');
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












