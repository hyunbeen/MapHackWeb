$(function() {

//select box 코드
//	$(document).on('change', 'select.nav', function() {
//		var $this = this;
//		var target = $this.value;
//		$('div.select-pane').hide();
//		$('div[id="' + target + '"]').show();
//	});
//
//	$(document).on('click', '.series-select', function() {
//		var $this = this;
//		var txt = $this.text + '<span class="caret"></span>';
//		$($this).closest('li.dropdown').find('a.dropdown-toggle').html(txt);
//
//	});
	

	
	//지역코드(예 : 서울) 선택시 시군구 정보 가져오는 코드
	$('.area').change(function(){
		var area = $(this).val();
//		alert(area);
		$.ajax({
			type : 'post',
			url : 'areaCode.mh',
			data : {'areaCode' : area},
			dataType : 'json',
			contentType : ' application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data){
//				alert(data);			
				for(var i = 0; i < data.length; i++){
					console.log(data[i]);
					var op = $("<option value=" + data[i].code + ">" + data[i].name + "</option>");
					$('.sigungu').append(op);
//					alert($('.sigungu'));
				}
				
			},
			error : function(err){
				alert('예외발생' + err);
			}
			
		});
	});
	
	//지역별 정보검색
	$('.areaCode').click(function(){
		$('#aSearch').attr('action', 'infoList.mh');
		$('#aSearch').submit();
	});
	
	//키워드별 정보검색
	$('.searchKeyword').click(function(){
		$('#kSearch').attr('action', 'searchKeyword.mh');
		$('#kSearch').submit();
	});
	//키워드 검색 시 엔터키 적용
	$(document).on("keypress", "#kSearch", function(evt){
		if(evt.keyCode == 13){
			$('.searchKeyword').click();
		}
	});
	
	
	
	$('#pageNum li').each(function(){
		//alert("1>"+ $('#pageNo').val()  + " = " + $(this).text());
		if($('#pageNo').val() == ''){ 
			if($(this).find('a').text() == '1'){
				$(this).attr('class', 'active');
				//alert($(this).attr('class'));
			}
		}else {
			//$('#pageNum li').attr('class', '');
			if($(this).text() == $('#pageNo').val()){
				//alert(typeof($(this).text()));
				//alert(typeof($('#pageNo').val()));
//				$(this).addClass('active');
				$(this).attr('class', 'active');
				//alert("2>" + $(this).attr('class'));
			}else{
				//$('#pageNum li').attr('class', '');
				//alert("1>"+ $('#pageNo').val()  + " = " + $(this).text());
			}
		}
		
		//페이지번호 클릭시
		$(this).click(function(){
//			alert($('#pageNo').val());
//			alert($(this).find('a').text());
			if($(this).text() == '1'){
				$(this).attr('class', '');
			}
			$(this).attr('class', 'active');
		});
	});
	

	
	

});
