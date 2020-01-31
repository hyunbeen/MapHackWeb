<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- <link rel="stylesheet" href="/MapHack/resource/main/css/style.css"> -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>






<!-- 적용할 경우 부트스트랩 아이콘 적용이 안됨 -->
<!-- Latest compiled and minified JavaScript -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->





<style type="text/css">

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #999;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
}

.glyphicon-picture{
   display: inline-block;
   padding: .5em .75em;
   color: #999;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
}


</style>


</head>
<body>


<div class="page">
 <!-- Page Header-->
      <jsp:include page="/WEB-INF/view/include/header.jsp"/>

    <section class="section section-lg bg-white text-center" style="background-color:#57cbcc;">
       
       
      <p> 작성페이지 test </p>
       




   </section>
   
   <section class="section section-lg bg-white text-center" style="border:solid;">
       
       
       
       	<div class="container">
			<form name="fileForm" action="/MapHack/requestupload.mh"
				method="post" enctype="multipart/form-data">

				<div class="row">
					
					<div class="filebox bs3-primary preview-image">
						<input type="hidden" class="upload-name" disabled="disabled" name="src" id="src">
						<label for="input-file" class="glyphicon glyphicon-picture"></label>
						<input type="file" accept="image/png, image/jpeg, image/gif"
							id="input-file" name="file" class="upload-hidden" />
					</div>
					<div class="" data-toggle="modal" data-target="#show-modal">
						<label class="glyphicon glyphicon-picture"></label>
					</div>
					<div class="">
						<img src="" id="img1" alt="">
					</div>
				</div>
			</form>

		</div>
       
       <div>
       
<!--                       <button class="button button-secondary button-nina" type="button" data-toggle="modal" data-target="#show-modal">show modal</button> -->
       </div>
       
       </section>
       
       
       
      <!-- Modal-->
      <div class="modal modal-custom fade" id="show-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
              <h4 class="modal-title">지도</h4>
            </div>
            <div class="modal-body">
            
            <script src="//maps.google.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s"></script>
            
            <script type="text/javascript">
            	$(function(){
            		function initialize1() {

            			mapProp = {
            				center : new google.maps.LatLng(37.567835, 126.986357),
            				zoom : 13,
            				mapTypeId : google.maps.MapTypeId.ROADMAP
            			};

            			map = new google.maps.Map(document.getElementById("modal_map"),
            					mapProp);
            			
            			google.maps.event.trigger(map, 'resize');
//             			foodMarker();
//             			addMarker();
//             			homeMarker();
//             			return map;
            		}
            		
            		initialize1();
            		
            	});
         
            </script>
            
              <div id="modal_map" style="height: 500px; width: 100%">
              
              </div>
              
              
              
            </div>
          </div>
        </div>
      </div>
      
       

</div>



</body>



<script type="text/javascript">
	$(function() {
		
		
		
		
		
		
// 		function initialize1() {

// 			mapProp = {
// 				center : new google.maps.LatLng(37.567835, 126.986357),
// 				zoom : 13,
// 				mapTypeId : google.maps.MapTypeId.ROADMAP
// 			};

// 			map = new google.maps.Map(document.getElementById("modal_map"),
// 					mapProp);
			
// 			google.maps.event.trigger(map, 'resize');
// // 			foodMarker();
// // 			addMarker();
// // 			homeMarker();
// // 			return map;
// 		}
	
	
	
	
	
	
	
	
	
	
	
	

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
</script>


<script src="/MapHack/resource/main/js/core.min.js"></script>
<script src="/MapHack/resource/main/js/script.js"></script>

</html>