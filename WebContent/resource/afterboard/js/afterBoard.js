

	$(function() {

		//이미지 저장
		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change',
				function() {
					if (window.FileReader) {
						if ($(this)[0].files[0] == null
								|| $(this)[0].files[0] == undefined)
							return;
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}

					$(this).siblings('.upload-name').val(filename);

					//              alert($(this).siblings('.upload-name').val(filename));
				});

		//preview image 
		var imgTarget = $('.preview-image .upload-hidden');
		imgTarget
				.on(
						'change',
						function() {
							var parent = $(this).parent();
							parent.children('.upload-display').remove();
							if (window.FileReader) { //image 파일만 
								if ($(this)[0].files[0] == null
										|| $(this)[0].files[0] == undefined)
									return;
								if (!$(this)[0].files[0].type.match(/image\//))
									return;

								var reader = new FileReader();
								reader.onload = function(e) {

									var src = e.target.result;
									//                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
									var img1 = document.getElementById("img1")
									img1.src = src;

								}

								reader.readAsDataURL($(this)[0].files[0]);
							} else {
								$(this)[0].select();
								$(this)[0].blur();
								var imgSrc = document.selection.createRange().text;
								parent
										.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

								var img = $(this).siblings('.upload-display')
										.find('img');
								img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
										+ imgSrc + "\")";
							}
						});
	});



	
	
	
	
	
	
/*지도*/
	
$(function(){
	
	//모달창에 지도 및 여행 정보 리스트 띄우기
	$('.modal-map').click(function(){
		$.ajax({
			type : 'post',
			url : 'modelMapList.mh',
			dataType : 'json',
			success : function(data){

				var map_mark = $('<div class="col-md-7"><div class="map-canvas"></div></div>');

//				$('.info-list').find('div.col-md-5').remove();
				$('.info-list').children().remove();
//				alert("성공 : " + data[0].pageTotalCount);
				var list = $('<div class="col-md-5"><div class="input-group"><input type="text" id="search"/><input type="button" class="btn btn-primary" id="mSearch" value="검색"/></div></div>');
				var list2 = $('<div class="mList" style="height: 400px; overflow: auto;"></div>');
				var table = $('<table class="table table-hover"></table>');

				for(var i = 0; i < data.length; i++){
					var tr = $('<tr></tr>');
					var td = $('<td class="map-info"><h5>' + data[i].title + '</h5><input type="hidden" class="contentid" value="' 
							+ data[i].contentid + '"/><input type="hidden" class="mapx" value="' 
							+ data[i].mapx + '"/><input type="hidden" class="mapy" value="' 
							+ data[i].mapy + '"/></td>');
					tr.append(td);
					table.append(tr);
				}

				list2.append(table);
				list.append(list2);
				$('.info-list').append(map_mark);
				$('.info-list').append(list);
			},
			error:function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
		
		
		
		
		
	});
	
	//모달창에서 정보 리스트 클릭시 지도에 마커 표시
	$(document).on("click", ".map-info", function() {

//		var test = $('h5', this);
//		alert(test.text());

		marker.setMap(null);
		var info = $(this).find('.contentid').val();
//		alert(info);
		var icon = 'info-i_maps.png';
		var mapx = $(this).find('.mapx').val();
		var mapy = $(this).find('.mapy').val();

		mapProp.center = new google.maps.LatLng(mapy, mapx);

		marker = new google.maps.Marker({
			position : new google.maps.LatLng(mapy, mapx),
		});

		map = new google.maps.Map(document.getElementById("map-canvas"),
				mapProp);

		marker.setMap(map);

	});
	
	
	
	
	
	//검색버튼 클릭시 조건에 맞는 리스트 출력
	$(document).on("click", "#mSearch", function(){
		var keyword = $('#search').val();
		$.ajax({
			type : 'post', 
			url : 'modelSearchKeyword.mh',
			data : {
				keyword : keyword
			},
			dataType : 'json',
			success : function(data){
// 				alert("입력성공 : " + data[0].title);
				$('.info-list').find('div.col-md-5').remove();
// 				alert("성공 : " + data[0].pageTotalCount);
				var list = $('<div class="col-md-5"><div class="input-group"><input type="text" id="search"/><input type="button" class="btn btn-primary" id="mSearch" value="검색"/></div></div>');
				var list2 = $('<div class="mList" style="height: 400px; overflow: auto;"></div>');
				var table = $('<table class="table table-hover"></table>');
				
				for(var i = 0; i < data.length; i++){
					var tr = $('<tr></tr>');
					var td = $('<td class="map-info"><h5>' + data[i].title + '</h5><input type="hidden" class="contentid" value="' 
							+ data[i].contentid + '"/><input type="hidden" class="mapx" value="' 
							+ data[i].mapx + '"/><input type="hidden" class="mapy" value="' 
							+ data[i].mapy + '"/></td>');
					tr.append(td);
					table.append(tr);
				}
				
				list2.append(table);
				list.append(list2);
				$('.info-list').append(list);
			},
			error : function(request, status, error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	});
	
	
	//검색창에 엔터키 적용
	$('#search').key
	$(document).on("keypress", "#search", function(event){
		if(event.keyCode == 13){
			$('#mSearch').click();
		}
	});
	
	
// 	등록버튼 클릭시 좌표정보를 가지고 화면에 지도 띄우기
	$(document).on("click", "#create", function(){
		var canvas = $('#map-canvas');
		alert(canvas);
// 		$('#map-canvas').remove();
		$('form').find('.row').append(canvas);
		google.maps.event.trigger(map, "resize");
		
		
		
		
		var row2 = $('<div class="row "><div class="filebox bs3-primary preview-image">'
				+ '<input type="hidden" class="upload-name" disabled="disabled" name="src" id="src">'
				+ '<label for="input-file" class="glyphicon glyphicon-picture"></label>'
				+ '<input type="file" accept="image/png, image/jpeg, image/gif"	id="input-file" name="file" class="upload-hidden" /></div>'
				+ '<div class="modal-map" data-toggle="modal" data-target="#show-modal" data-center="">'
				+ '<label class="glyphicon glyphicon-picture"></label></div>'
				+ '<div class=""><img src="" id="img1" alt=""></div></div>');
		
		$('form').append(row2);
		
	});
	
	
	
		var mapProp;
      	var marker;
		var map;
		var myCenter = new google.maps.LatLng(37.567835,126.986357);
		var marker = new google.maps.Marker({
			position : myCenter
		});

		function initialize() {
			mapProp = {
				center : myCenter,
				zoom : 13,
				draggable : true,
				scrollwheel : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};

			map = new google.maps.Map(document.getElementById("map-canvas"),
					mapProp);
// 			marker.setMap(map);

// 			google.maps.event.addListener(marker, 'click', function() {

// 				infowindow.setContent(contentString);
// 				infowindow.open(map, marker);

// 			});
		}
		;
		google.maps.event.addDomListener(window, 'load', initialize);

		google.maps.event.addDomListener(window, "resize", resizeMap(myCenter));

		$('#show-modal').on('shown.bs.modal', function(e) {

			resizeMap($(e.relatedTarget).data('center'));
		});

		function resizeMap(center) {
			if (typeof map == "undefined")
				return;
			google.maps.event.trigger(map, "resize");
			map.setCenter(center);
		}
		;

	});

