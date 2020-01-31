<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/MapHack/resource/community/css/afterFileUpload.css">



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/froala_editor.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/froala_style.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/code_view.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/colors.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/emoticons.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/image_manager.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/image.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/line_breaker.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/quick_insert.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/table.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/file.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/char_counter.css">
<!--   <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/video.css"> -->
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/emoticons.css">
  <link rel="stylesheet" href="/MapHack/resource/afterboard/editcss/plugins/fullscreen.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">





<script src="https://maps.google.com/maps/api/js"></script>
      <script src="//maps.google.com/maps/api/js?key=AIzaSyApDcQnETxUruySJObu-Y9nYEIoHS6Fa7s&callback=initialize"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
     
<style type="text/css">

html, body, * {
  box-sizing: border-box;
  font-size: 16px;
}

html, body {
  height: 100%;
  text-align: center;
}

body {
  padding: 2rem;
  background: #f8f8f8;
}

h2 {
  font-family: "Roboto", sans-serif;
  font-size: 26px;
  line-height: 1;
  color: #454cad;
  margin-bottom: 0;
}

p {
  font-family: "Roboto", sans-serif;
  font-size: 18px;
  color: #5f6982;
}
</style>
  
<style type="text/css">

#content { background: salmon; display: none; }

#divMap0, #divMap1, #divMap2, #divMap3, #divMap4, #divMap5 { 

padding-left: 20%; padding-right: 20%;}


</style>




</head>
<body>


  <!-- Page-->
    <div class="page">
      <!-- Page Header-->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		
		   <!-- Default Image Background-->
      <section class="section section-lg bg-white" style="background: linear-gradient(-32deg, #8b0fe4 -2%, rgb(41, 41, 58) 26%); padding-bottom: 0px; padding-top: 0px; height:250px;">
        <!-- section wave-->
           <h4 style="color:white; padding-top: 192px; padding-right: 880px;">여행정보공유 글작성 페이지</h4>
      
      </section>
<section class="section section-lg bg-gray-lighter text-center" style="padding-top: 54px; padding-bottom: 0px;  background-color: #f1eef5;
    fill: #f1eef5;">
        <!-- section wave-->
<!--         <div class="section-wave" style=""> -->
<!--           <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none"> -->
<!--             <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path> -->
<!--           </svg> -->
<!--         </div> -->
	<div>
		<!-- divArea: 자동생성되는 div 담는 공간 -->
		<div id="divArea">
			<div id='divImgView' ></div>
		</div>
		<!-- 버튼들 나열 -->
		<div class="row" style="padding-top: 70px; ">
			<!-- 메인버튼 -->
			 <button id="mainBtn" type="button" class="btn btn-danger btn-circle btn-xl col-sm-2" 
			 style="max-width: 71px;max-height: 100px;margin-left: 350px; border-radius: 200px;">
			 <i class="glyphicon glyphicon-plus-sign faa-tada animated" style="font-size:40px"></i></button>
			<!-- 버튼들 -->
			<div id="btnGruop" class="col-sm-4" style="padding-top: 13px;padding-left: 300px;">
				<button id="mapBtn" type="button" class="btn btn-primary btn-circle btn-lg" style="margin-right: 13px;"><i class="fa fa-file-picture-o faa-pulse animated"></i></button>
				<button id="imgBtn" type="button" data-toggle="modal"
					data-target="#myModal" class="btn btn-success btn-circle btn-lg"
					 style="margin-right: 13px;"><i class="glyphicon glyphicon-pencil faa-shake animated"></i></button>
				<button id="txtEditBtn" type="button" class="btn btn-warning btn-circle btn-lg"><i class="fa fa-fw fa-map-marker faa-bounce animated"></i></button>
			
			</div>
			<div class="col-sm-6"></div>
		</div>
	</div>
	
	
	<div style="padding-top: 266px;">
   
   </div>
<!--    <div class="row"> -->
<!--    <input type="button" id="insert"  class="btn btn-magick btn-sm btn3d" value="저장합니다"/> -->
<!-- 	</div> -->
	<div class="row" style="padding-bottom: 10px;">
<a href="#" id="insert" class="btn btn-block btn-primary btn-success" style="margin-left: 120px; margin-right: 120px;">등록</a>
	</div>

</section>

<!-- 텍스므 에디터  -->

				<div class="edit0" style="display: none">
					<div id='edit0' class="content" style="margin-top: 30px;">
						<h1>제목</h1>
						<p>내용</p>
					</div>

					<input type="button" id="attach0" class="attach0"
						data-dismiss="modal" value="클릭" />
				</div>
				
				<div class="edit1" style="display: none">
					<div id='edit1' class="content" style="margin-top: 30px;">
						<h1>제목</h1>
						<p>내용</p>
					</div>

					<input type="button" id="attach1" class="attach1"
						data-dismiss="modal" value="클릭" />
				</div>
				
				<div class="edit2" style="display: none">
					<div id='edit2' class="content" style="margin-top: 30px;">
						<h1>제목</h1>
						<p>내용</p>
					</div>

					<input type="button" id="attach3" class="attach3"
						data-dismiss="modal" value="클릭" />
				</div>
				
				<div class="edit3" style="display: none">
					<div id='edit3' class="content" style="margin-top: 30px;">
						<h1>제목</h1>
						<p>내용</p>
					</div>

					<input type="button" id="attach3" class="attach3"
						data-dismiss="modal" value="클릭" />
				</div>
				
				<div class="edit4" style="display: none">
					<div id='edit4' class="content" style="margin-top: 30px;">
						<h1>제목</h1>
						<p>내용</p>
					</div>

					<input type="button" id="attach4" class="attach4"
						data-dismiss="modal" value="클릭" />
				</div>
<!-- text관련 div 끝 -->











 <form id="fileForm" method="post" enctype="multipart/form-data">
<!-- 모달1 -->
	<div class="modal fade" id="myModal0" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">


				<div id="file-upload-form0" class="uploader">
					<input id="file-upload0" type="file" name="fileUpload0"
						accept="image/*" /> 
					<label for="file-upload0" id="file-drag0">
						<img id="file-image0" src="#" alt="Preview0" class="hidden content" style="height: 523px;">
						<div id="start0">
							<i class="fa fa-download" aria-hidden="true"></i>
							<div>이미지를 드래그하여 올려놓으세요</div>
							<div id="notimage0" class="hidden">Please select an image</div>
							<span id="file-upload0-btn" class="btn btn-primary">Select
								a file</span>
						</div>
						<div id="response0" class="hidden">
							<div id="messages0"></div>
							<progress class="progress" id="file-progress0" value="0">
							<span>0</span>% </progress>
						</div>


						<button type="button" class="btn btn-info btn-md create0"
							data-dismiss="modal">
							<span aria-hidden="true">그림삽입</span> <i
								class="fa fa-map-marker ml-1"></i>
						</button>


					</label>
				</div>

			</div>
		</div>
	</div>



	<!--  모달2 -->
		<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">


				<div id="file-upload-form1" class="uploader">
					<input id="file-upload1" type="file" name="fileUpload1"
						accept="image/*" /> 
					<label for="file-upload1" id="file-drag1">
						<img id="file-image1" src="#" alt="Preview1" class="hidden content" style="height: 523px;">
						<div id="start1">
							<i class="fa fa-download" aria-hidden="true"></i>
							<div>이미지를 드래그하여 올려놓으세요</div>
							<div id="notimage1" class="hidden">Please select an image</div>
							<span id="file-upload1-btn" class="btn btn-primary">Select
								a file</span>
						</div>
						<div id="response1" class="hidden">
							<div id="messages1"></div>
							<progress class="progress" id="file-progress1" value="0">
							<span>0</span>% </progress>
						</div>


						<button type="button" class="btn btn-info btn-md create1"
							data-dismiss="modal">
							<span aria-hidden="true">그림삽입</span> <i
								class="fa fa-map-marker ml-1"></i>
						</button>


					</label>
				</div>

			</div>
		</div>
	</div>








	<!--  모달3 -->
		<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content -->
			<div class="modal-content">


				<div id="file-upload-form2" class="uploader">
					<input id="file-upload2" type="file" name="fileUpload2"
						accept="image/*" /> 
					<label for="file-upload2" id="file-drag2">
						<img id="file-image2" src="#" alt="Preview2" class="hidden content" style="height: 523px;">
						<div id="start2">
							<i class="fa fa-download" aria-hidden="true"></i>
							<div>이미지를 드래그하여 올려놓으세요</div>
							<div id="notimage2" class="hidden">Please select an image</div>
							<span id="file-upload2-btn" class="btn btn-primary">Select
								a file</span>
						</div>
						<div id="response2" class="hidden">
							<div id="messages2"></div>
							<progress class="progress" id="file-progress2" value="0">
							<span>0</span>% </progress>
						</div>


						<button type="button" class="btn btn-info btn-md create2"
							data-dismiss="modal">
							<span aria-hidden="true">그림삽입</span> <i
								class="fa fa-map-marker ml-1"></i>
						</button>


					</label>
				</div>

			</div>
		</div>
	</div>






<!--  모달4 -->
		<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content -->
			<div class="modal-content">


				<div id="file-upload-form3" class="uploader">
					<input id="file-upload3" type="file" name="fileUpload3"
						accept="image/*" /> 
					<label for="file-upload3" id="file-drag3">
						<img id="file-image3" src="#" alt="Preview3" class="hidden content" style="height: 523px;">
						<div id="start3">
							<i class="fa fa-download" aria-hidden="true"></i>
							<div>이미지를 드래그하여 올려놓으세요</div>
							<div id="notimage3" class="hidden">Please select an image</div>
							<span id="file-upload3-btn" class="btn btn-primary">Select
								a file</span>
						</div>
						<div id="response3" class="hidden">
							<div id="messages3"></div>
							<progress class="progress" id="file-progress3" value="0">
							<span>0</span>% </progress>
						</div>


						<button type="button" class="btn btn-info btn-md create3"
							data-dismiss="modal">
							<span aria-hidden="true">그림삽입</span> <i
								class="fa fa-map-marker ml-1"></i>
						</button>


					</label>
				</div>

			</div>
		</div>
	</div>








<!--  모달5 -->
	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">


				<div id="file-upload-form4" class="uploader">
					<input id="file-upload4" type="file" name="fileUpload4"
						accept="image/*" /> 
					<label for="file-upload4" id="file-drag4">
						<img id="file-image4" src="#" alt="Preview4" class="hidden content" style="height: 523px;">
						<div id="start4">
							<i class="fa fa-download" aria-hidden="true"></i>
							<div>이미지를 드래그하여 올려놓으세요</div>
							<div id="notimage4" class="hidden">Please select an image</div>
							<span id="file-upload4-btn" class="btn btn-primary">Select
								a file</span>
						</div>
						<div id="response4" class="hidden">
							<div id="messages4"></div>
							<progress class="progress" id="file-progress4" value="0">
							<span>0</span>% </progress>
						</div>


						<button type="button" class="btn btn-info btn-md create4"
							data-dismiss="modal">
							<span aria-hidden="true">그림삽입</span> <i
								class="fa fa-map-marker ml-1"></i>
						</button>


					</label>
				</div>

			</div>
		</div>
	</div>
	
	
	</form>




   <!--첫번째 지도 담은 모달 Modal: Name-->
   <div class="modal fade" id="myMapModal0" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">

         <!--Content-->
         <div class="modal-content">

            <!--Body-->

               <!--Google map-->

                  <div clss="row" style="padding-top: 3%;">
                     <div class="col-md-7">
                        <div id="map-canvas0" class="z-depth-1-half content"
                           style="height: 400px;">
                        </div>
                     </div>
                     <div id="listDiv" class="col-md-5"></div>
                  </div>

                  <!--Footer-->
            <div class="modal-footer justify-content-center">

               <button type="button" class="btn btn-info btn-md createMap0"
                  data-dismiss="modal" onclick="view()">
                  <span aria-hidden="true">지도확인</span> <i
                     class="fa fa-map-marker ml-1"></i>
               </button>
               <button type="button" class="btn btn-outline-info btn-md"
                  data-dismiss="modal">
                  <span aria-hidden="true">취소</span> <i class="fa fa-times ml-1"></i>
               </button>
            </div>
         <!--/.Content-->
      </div>
   </div>
   </div>
   <!--Modal: Name-->

  
   <!--두번째 지도 담은 모달 Modal: Name-->
   <div class="modal fade" id="myMapModal1" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">

         <!--Content-->
         <div class="modal-content">

            <!--Body-->

               <!--Google map-->

                  <div clss="row" style="padding-top: 3%;">
                     <div class="col-md-7">
                        <div id="map-canvas1" class="z-depth-1-half content"
                           style="height: 400px;">
                        </div>
                     </div>
                     <div id="listDiv" class="col-md-5"></div>
                  </div>

                  <!--Footer-->
            <div class="modal-footer justify-content-center">

               <button type="button" class="btn btn-info btn-md createMap1"
                  data-dismiss="modal" onclick="view()">
                  <span aria-hidden="true">지도확인</span> <i
                     class="fa fa-map-marker ml-1"></i>
               </button>
               <button type="button" class="btn btn-outline-info btn-md"
                  data-dismiss="modal">
                  <span aria-hidden="true">취소</span> <i class="fa fa-times ml-1"></i>
               </button>
            </div>
         <!--/.Content-->
      </div>
   </div>
   </div>
   <!--Modal: Name-->

   
   
   <!--Modal: Name-->
  
   <!--세번째 지도 담은 모달 Modal: Name-->
   <div class="modal fade" id="myMapModal2" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">

         <!--Content-->
         <div class="modal-content">

            <!--Body-->

               <!--Google map-->

                  <div clss="row" style="padding-top: 3%;">
                     <div class="col-md-7">
                        <div id="map-canvas2" class="z-depth-1-half content"
                           style="height: 400px;">
                        </div>
                     </div>
                     <div id="listDiv" class="col-md-5"></div>
                  </div>

                  <!--Footer-->
            <div class="modal-footer justify-content-center">

               <button type="button" class="btn btn-info btn-md createMap2"
                  data-dismiss="modal" onclick="view()">
                  <span aria-hidden="true">지도확인</span> <i
                     class="fa fa-map-marker ml-1"></i>
               </button>
               <button type="button" class="btn btn-outline-info btn-md"
                  data-dismiss="modal">
                  <span aria-hidden="true">취소</span> <i class="fa fa-times ml-1"></i>
               </button>
            </div>
         <!--/.Content-->
      </div>
   </div>
   </div>
   <!--Modal: Name-->

   

<!--Modal: Name-->
  
   <!--네번째 지도 담은 모달 Modal: Name-->
   <div class="modal fade" id="myMapModal3" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">

         <!--Content-->
         <div class="modal-content">

            <!--Body-->

               <!--Google map-->

                  <div clss="row" style="padding-top: 3%;">
                     <div class="col-md-7">
                        <div id="map-canvas3" class="z-depth-1-half content"
                           style="height: 400px;">
                        </div>
                     </div>
                     <div id="listDiv" class="col-md-5"></div>
                  </div>

                  <!--Footer-->
            <div class="modal-footer justify-content-center">

               <button type="button" class="btn btn-info btn-md createMap3"
                  data-dismiss="modal" onclick="view()">
                  <span aria-hidden="true">지도확인</span> <i
                     class="fa fa-map-marker ml-1"></i>
               </button>
               <button type="button" class="btn btn-outline-info btn-md"
                  data-dismiss="modal">
                  <span aria-hidden="true">취소</span> <i class="fa fa-times ml-1"></i>
               </button>
            </div>
         <!--/.Content-->
      </div>
   </div>
   </div>
   <!--Modal: Name-->




<!--Modal: Name-->
   
   <!--다섯번째 지도 담은 모달 Modal: Name-->
   <div class="modal fade" id="myMapModal4" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">

         <!--Content-->
         <div class="modal-content">

            <!--Body-->

               <!--Google map-->

                  <div clss="row" style="padding-top: 3%;">
                     <div class="col-md-7">
                        <div id="map-canvas4" class="z-depth-1-half content"
                           style="height: 400px;">
                        </div>
                     </div>
                     <div id="listDiv" class="col-md-5"></div>
                  </div>

                  <!--Footer-->
            <div class="modal-footer justify-content-center">

               <button type="button" class="btn btn-info btn-md createMap4"
                  data-dismiss="modal" onclick="view()">
                  <span aria-hidden="true">지도확인</span> <i
                     class="fa fa-map-marker ml-1"></i>
               </button>
               <button type="button" class="btn btn-outline-info btn-md"
                  data-dismiss="modal">
                  <span aria-hidden="true">취소</span> <i class="fa fa-times ml-1"></i>
               </button>
            </div>
         <!--/.Content-->
      </div>
   </div>
   </div>
   <!--Modal: Name-->

   
   
   
<!--Modal: Name-->
  
   <!--여섯번째 지도 담은 모달 Modal: Name-->
   <div class="modal fade" id="myMapModal5" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">

         <!--Content-->
         <div class="modal-content">

            <!--Body-->

               <!--Google map-->

                  <div clss="row" style="padding-top: 3%;">
                     <div class="col-md-7">
                        <div id="map-canvas5" class="z-depth-1-half content"
                           style="height: 400px;">
                        </div>
                     </div>
                     <div id="listDiv" class="col-md-5"></div>
                  </div>

                  <!--Footer-->
            <div class="modal-footer justify-content-center">

               <button type="button" class="btn btn-info btn-md createMap5"
                  data-dismiss="modal" onclick="view()">
                  <span aria-hidden="true">지도확인</span> <i
                     class="fa fa-map-marker ml-1"></i>
               </button>
               <button type="button" class="btn btn-outline-info btn-md"
                  data-dismiss="modal">
                  <span aria-hidden="true">취소</span> <i class="fa fa-times ml-1"></i>
               </button>
            </div>
         <!--/.Content-->
      </div>
   </div>
   </div>
   <!--Modal: Name-->

   <!--Modal: Name-->
   
   
   
    <!-- Page Footer-->
    		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>

   
   

</div>
	
	
	
	
	<script type="text/javascript">
		//ready: 컨텐츠 외 다른 곳 클릭시 content 사라지도록 하는 함수
		$(document).ready(function() {

			$('#mainBtn').click(function(e) {
				e.preventDefault();
				e.stopPropagation();
				$('#btnGruop').toggle();
			});
			$('#btnGruop').click(function(e) {

				e.stopPropagation(); //컨텐츠 외 다른 곳 클릭시 content 사라지도록
			});
			$('body').click(function() {
				document.getElementById("btnGruop").style.display = "none";
			});
		});

	

		//buttonClick() : div자동생성 
		var count = 0;
		function buttonClick() {
			var divName = "div" + count;
			$('#divArea').append($('<div/>', {
				id : divName,
				text : count
			}));
			count++;

		}
		
		
		//txtEdit 버튼
		$('#txtEditBtn').append($('<div/>', {
			id : "button",
			text : 'text버튼',
			onclick : "buttonText();"
		}));
		
		//동적생성
		function buttonText() {
			
// 			//txt 내용 버튼
			var btnCont = "btnCont" + count;
			$('#divArea').append($('<button/>', {
				id : btnCont,
				text : "내용" + count,
				onclick : 'contModal' + count + '()'
			}));

			var divEmpty = "divEmpty" + count;
			$("#divArea").append($('<div/>', {
				id : divEmpty,
// 				text : "텍스트 빈 공간" + count,
			}));

			count++;

		}

		//내용 관련 정적 모달 2개
		function contModal0() {
			var edit = $('.edit0');
			edit.attr('style', 'display: block')
			$('#divArea').append(edit);
		}
		
		
		function contModal1() {
			var edit = $('.edit1');
			edit.attr('style', 'display: block')
			$('#divArea').append(edit);
		}
		
		function contModal2() {
			var edit = $('.edit2');
			edit.attr('style', 'display: block')
			$('#divArea').append(edit);
		}
		
		
		function contModal3() {
			var edit = $('.edit3');
			edit.attr('style', 'display: block')
			$('#divArea').append(edit);
		}
		
		function contModal4() {
			var edit = $('.edit4');
			edit.attr('style', 'display: block')
			$('#divArea').append(edit);
		}
		
//########################

		//이미지파일 업로드 버튼
		$('#imgBtn').append($('<div/>', {
			id : "button",
			text : 'Img버튼',
			onclick : 'buttonModal();'

		}));

		//동적생성
		function buttonModal() {
			var btnImg = "btnImg" + count;
			$('#divArea').append($('<button/>', {
				id : btnImg,
				text : "이미지" + count,
				onclick : 'show' + count + '()'
			}));
			
			var divImg = "divImg" + count;
			$("#divArea").append($('<div/>', {
				id : divImg,
// 				text : "이미지공간" + count,
			}));
			
			count++;

		}

		function show0() {
			//modal을 띄워준다.  
			$("#myModal0").modal('show');
		}
		

		$('.create0').click(function() {
			var canvas = $("#file-image0");
			$('#divArea').append(canvas);

		});


//#####################


		function show1() {
			//modal을 띄워준다.  
			$("#myModal1").modal('show');
		}
		

		$('.create1').click(function() {
			var canvas1 = $("#file-image1");
			$('#divArea').append(canvas1);

		});
		
		

		function show2() {
			//modal을 띄워준다.  
			$("#myModal2").modal('show');
		}
		

		$('.create2').click(function() {
			var canvas2 = $("#file-image2");
			$('#divArea').append(canvas2);

		});
		
		

		function show3() {
			//modal을 띄워준다.  
			$("#myModal3").modal('show');
		}
		

		$('.create3').click(function() {
			var canvas3 = $("#file-image3");
			$('#divArea').append(canvas3);

		});
		
		
		
		function show4() {
			//modal을 띄워준다.  
			$("#myModal4").modal('show');
		}
		

		$('.create4').click(function() {
			var canvas4 = $("#file-image4");
			$('#divArea').append(canvas4);

		});
		
		
		
		
		
		
		//지도파일 업로드 버튼
		$('#mapBtn').append($('<div/>', {
			id : "button",
			text : '지도',
			onclick : "mapModal();"
		}));
		
		//동적생성
		function mapModal() {
			var btnMap = "btnMap" + count;
			$('#divArea').append($('<button/>', {
				id : btnMap,
				text : "지도" + count,
				onclick : 'showMap' + count + '(this)'
			}));
			
			var divMap = "divMap" + count;
			$("#divArea").append($('<div/>', {
				id : divMap,
// 				text : "지도공간" + count
			}));
			
			count++;

		}
		
		function showMap0(event) {
			//modal을 띄워준다.  
			$("#myMapModal0").modal('show');
			inputMap(event);
		}
		
		function showMap1(event) {
			//modal을 띄워준다.  
			$("#myMapModal1").modal('show');
			inputMap(event);
		}

		function showMap2(event) {
			//modal을 띄워준다.  
			$("#myMapModal2").modal('show');
			inputMap(event);
		}
		
		function showMap3(event) {
			//modal을 띄워준다.  
			$("#myMapModal3").modal('show');
			inputMap(event);
		}
	
		function showMap4(event) {
			//modal을 띄워준다.  
			$("#myMapModal4").modal('show');
			inputMap(event);
		}
	
		function showMap5(event) {
			//modal을 띄워준다.  
			$("#myMapModal5").modal('show');
			inputMap(event);
		}
	
		
	</script>
	
	
<script type="text/javascript">
var map1;
var map2;
var map3;
var map4;
var map5;
var map6;
var map = [];
var var_location = new google.maps.LatLng(37.567835, 126.986357);
var marker = [];
var var_mapoptions = {
        center: var_location,
        zoom: 14
    };

for(var i = 0; i < 6; i++){
	marker[i] = new google.maps.Marker({
		position : var_location,
	});
}




function initialize() {
   
    var_mapoptions = {
        center: var_location,
        zoom: 14
    };
//     map1 = new google.maps.Map(document.getElementById("map-canvas0"), var_mapoptions)
//     map2 = new google.maps.Map(document.getElementById("map-canvas1"), var_mapoptions)
//     map3 = new google.maps.Map(document.getElementById("map-canvas2"), var_mapoptions)
//     map4 = new google.maps.Map(document.getElementById("map-canvas3"), var_mapoptions)
//     map5 = new google.maps.Map(document.getElementById("map-canvas4"), var_mapoptions)
//     map6 = new google.maps.Map(document.getElementById("map-canvas5"), var_mapoptions)
    
    for(var i = 0; i < 6; i++){
    	map[i] = new google.maps.Map(document.getElementById("map-canvas" + i + ""), var_mapoptions)
    	marker[i].setMap(map[i]);
    }
   
//     marker[0].setMap(map1);
//     marker[1].setMap(map2);
//     marker[2].setMap(map3);
//     marker[3].setMap(map4);
//     marker[4].setMap(map5);
//     marker[5].setMap(map6);
    
};

google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, "resize", resizeMap());


$('#myMapModal0').on('shown.bs.modal', function(e) {

resizeMap($(e.relatedTarget).data('center'));
});


$('#myMapModal1').on('shown.bs.modal', function(e) {

   resizeMap($(e.relatedTarget).data('center'));
   });
   
$('#myMapModal2').on('shown.bs.modal', function(e) {

	   resizeMap($(e.relatedTarget).data('center'));
	   });

$('#myMapModal3').on('shown.bs.modal', function(e) {

	   resizeMap($(e.relatedTarget).data('center'));
	   });
	   
$('#myMapModal4').on('shown.bs.modal', function(e) {

	   resizeMap($(e.relatedTarget).data('center'));
	   });	 


$('#myMapModal5').on('shown.bs.modal', function(e) {

	   resizeMap($(e.relatedTarget).data('center'));
	   });	   


function resizeMap(center) {
   if(typeof map[0] =="undefined") return;
   google.maps.event.trigger(map[0], "resize");
   map[0].setCenter(center); 
   
   if(typeof map[1] =="undefined") return;
   google.maps.event.trigger(map[1], "resize");
   map[1].setCenter(center); 
   
   if(typeof map[2] =="undefined") return;
   google.maps.event.trigger(map[2], "resize");
   map[2].setCenter(center); 
   
   if(typeof map[3] =="undefined") return;
   google.maps.event.trigger(map[3], "resize");
   map[3].setCenter(center); 
   
   if(typeof map[4] =="undefined") return;
   google.maps.event.trigger(map[4], "resize");
   map[4].setCenter(center); 
   
   
   if(typeof map[5] =="undefined") return;
   google.maps.event.trigger(map[5], "resize");
   map[5].setCenter(center); 
   
   };


$('.createMap0').click(function(){
   var canvasM0 = $("#map-canvas0");
   $('#divMap0').append(canvasM0);
      google.maps.event.trigger(map[0], "resize");
});


$('.createMap1').click(function(){
   var canvasM1 = $("#map-canvas1");
   $('#divMap1').append(canvasM1);
      google.maps.event.trigger(map[1], "resize");
});

$('.createMap2').click(function(){
	   var canvasM2 = $("#map-canvas2");
	   $('#divMap2').append(canvasM2);
	      google.maps.event.trigger(map[2], "resize");
	});
	
$('.createMap3').click(function(){
	   var canvasM3 = $("#map-canvas3");
// 	   canvasM3.attr('style', "width:100%; height: 400px");
	   $('#divMap3').append(canvasM3);
	      google.maps.event.trigger(map[3], "resize");
	});

$('.createMap4').click(function(){
	   var canvasM4 = $("#map-canvas4");
	   $('#divMap4').append(canvasM4);
	      google.maps.event.trigger(map[4], "resize");
	});
	
$('.createMap5').click(function(){
	   var canvasM5 = $("#map-canvas5");
	   $('#divMap5').append(canvasM5);
	      google.maps.event.trigger(map[5], "resize");
	});	



</script>




<script type="text/javascript">
//File Upload0
//// File Upload0
// 
function ekUpload(){
  function Init() {

    console.log("Upload Initialised");

    var fileSelect    = document.getElementById('file-upload0'),
        fileDrag      = document.getElementById('file-drag0'),
        submitButton  = document.getElementById('submit-button');

    fileSelect.addEventListener('change', fileSelectHandler, false);

    // Is XHR2 available?
    var xhr = new XMLHttpRequest();
    if (xhr.upload) {
      // File Drop
      fileDrag.addEventListener('dragover', fileDragHover, false);
      fileDrag.addEventListener('dragleave', fileDragHover, false);
      fileDrag.addEventListener('drop', fileSelectHandler, false);
    }
  }

  function fileDragHover(e) {
    var fileDrag = document.getElementById('file-drag0');

    e.stopPropagation();
    e.preventDefault();

    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload0');
  }

  function fileSelectHandler(e) {
    // Fetch FileList object
    var files = e.target.files || e.dataTransfer.files;

    // Cancel event and hover styling
    fileDragHover(e);

    // Process all File objects
    for (var i = 0, f; f = files[i]; i++) {
      parseFile(f);
      uploadFile(f);
    }
  }

  // Output
  function output(msg) {
    // Response
    var m = document.getElementById('messages0');
    m.innerHTML = msg;
  }

  function parseFile(file) {

    console.log(file.name);
    output(
      '<strong>' + encodeURI(file.name) + '</strong>'
    );
    
    // var fileType = file.type;
    // console.log(fileType);
    var imageName = file.name;

    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
    if (isGood) {
      document.getElementById('start0').classList.add("hidden");
      document.getElementById('response0').classList.remove("hidden");
      document.getElementById('notimage0').classList.add("hidden");
      // Thumbnail Preview
      document.getElementById('file-image0').classList.remove("hidden");
      document.getElementById('file-image0').src = URL.createObjectURL(file);
      document.getElementById('file-image0').alt = imageName;
    }
    else {
      document.getElementById('file-image0').classList.add("hidden");
      document.getElementById('notimage0').classList.remove("hidden");
      document.getElementById('start0').classList.remove("hidden");
      document.getElementById('response0').classList.add("hidden");
      document.getElementById("file-upload-form0").reset();
    }
  }

  function setProgressMaxValue(e) {
    var pBar = document.getElementById('file-progress0');

    if (e.lengthComputable) {
      pBar.max = e.total;
    }
  }

  function updateFileProgress(e) {
    var pBar = document.getElementById('file-progress0');

    if (e.lengthComputable) {
      pBar.value = e.loaded;
    }
  }

  function uploadFile(file) {

    var xhr = new XMLHttpRequest(),
      fileInput = document.getElementById('class-roster-file'),
      pBar = document.getElementById('file-progress0'),
      fileSizeLimit = 1024; // In MB
    if (xhr.upload) {
      // Check if file is less than x MB
      if (file.size <= fileSizeLimit * 1024 * 1024) {
        // Progress bar
        pBar.style.display = 'inline';
        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
        xhr.upload.addEventListener('progress', updateFileProgress, false);

        // File received / failed
        xhr.onreadystatechange = function(e) {
          if (xhr.readyState == 4) {
            // Everything is good!

            // progress.className = (xhr.status == 200 ? "success" : "failure");
            // document.location.reload(true);
          }
        };

        // start2 upload
        xhr.open('POST', document.getElementById('file-upload-form0').action, true);
        xhr.setRequestHeader('X-File-Name', file.name);
        xhr.setRequestHeader('X-File-Size', file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(file);
      } else {
        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
      }
    }
  }

  // Check for the various File API support.
  if (window.File && window.FileList && window.FileReader) {
    Init();
  } else {
    document.getElementById('file-drag0').style.display = 'none';
  }
}
ekUpload();
</script>

<script type="text/javascript">
//File Upload0
//// File Upload0
// 
function ekUpload(){
  function Init() {

    console.log("Upload Initialised");

    var fileSelect    = document.getElementById('file-upload1'),
        fileDrag      = document.getElementById('file-drag1'),
        submitButton  = document.getElementById('submit-button');

    fileSelect.addEventListener('change', fileSelectHandler, false);

    // Is XHR2 available?
    var xhr = new XMLHttpRequest();
    if (xhr.upload) {
      // File Drop
      fileDrag.addEventListener('dragover', fileDragHover, false);
      fileDrag.addEventListener('dragleave', fileDragHover, false);
      fileDrag.addEventListener('drop', fileSelectHandler, false);
    }
  }

  function fileDragHover(e) {
    var fileDrag = document.getElementById('file-drag1');

    e.stopPropagation();
    e.preventDefault();

    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload1');
  }

  function fileSelectHandler(e) {
    // Fetch FileList object
    var files = e.target.files || e.dataTransfer.files;

    // Cancel event and hover styling
    fileDragHover(e);

    // Process all File objects
    for (var i = 0, f; f = files[i]; i++) {
      parseFile(f);
      uploadFile(f);
    }
  }

  // Output
  function output(msg) {
    // Response
    var m = document.getElementById('messages1');
    m.innerHTML = msg;
  }

  function parseFile(file) {

    console.log(file.name);
    output(
      '<strong>' + encodeURI(file.name) + '</strong>'
    );
    
    // var fileType = file.type;
    // console.log(fileType);
    var imageName = file.name;

    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
    if (isGood) {
      document.getElementById('start1').classList.add("hidden");
      document.getElementById('response1').classList.remove("hidden");
      document.getElementById('notimage1').classList.add("hidden");
      // Thumbnail Preview
      document.getElementById('file-image1').classList.remove("hidden");
      document.getElementById('file-image1').src = URL.createObjectURL(file);
      document.getElementById('file-image1').alt = imageName;
    }
    else {
      document.getElementById('file-image1').classList.add("hidden");
      document.getElementById('notimage1').classList.remove("hidden");
      document.getElementById('start1').classList.remove("hidden");
      document.getElementById('response1').classList.add("hidden");
      document.getElementById("file-upload-form1").reset();
    }
  }

  function setProgressMaxValue(e) {
    var pBar = document.getElementById('file-progress1');

    if (e.lengthComputable) {
      pBar.max = e.total;
    }
  }

  function updateFileProgress(e) {
    var pBar = document.getElementById('file-progress1');

    if (e.lengthComputable) {
      pBar.value = e.loaded;
    }
  }

  function uploadFile(file) {

    var xhr = new XMLHttpRequest(),
      fileInput = document.getElementById('class-roster-file'),
      pBar = document.getElementById('file-progress1'),
      fileSizeLimit = 1024; // In MB
    if (xhr.upload) {
      // Check if file is less than x MB
      if (file.size <= fileSizeLimit * 1024 * 1024) {
        // Progress bar
        pBar.style.display = 'inline';
        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
        xhr.upload.addEventListener('progress', updateFileProgress, false);

        // File received / failed
        xhr.onreadystatechange = function(e) {
          if (xhr.readyState == 4) {
            // Everything is good!

            // progress.className = (xhr.status == 200 ? "success" : "failure");
            // document.location.reload(true);
          }
        };

        // start2 upload
        xhr.open('POST', document.getElementById('file-upload-form1').action, true);
        xhr.setRequestHeader('X-File-Name', file.name);
        xhr.setRequestHeader('X-File-Size', file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(file);
      } else {
        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
      }
    }
  }

  // Check for the various File API support.
  if (window.File && window.FileList && window.FileReader) {
    Init();
  } else {
    document.getElementById('file-drag1').style.display = 'none';
  }
}
ekUpload();
</script>







<script type="text/javascript">
//File Upload1
// 
function ekUpload(){
  function Init() {

    console.log("Upload Initialised");

    var fileSelect    = document.getElementById('file-upload2'),
        fileDrag      = document.getElementById('file-drag2'),
        submitButton  = document.getElementById('submit-button');

    fileSelect.addEventListener('change', fileSelectHandler, false);

    // Is XHR2 available?
    var xhr = new XMLHttpRequest();
    if (xhr.upload) {
      // File Drop
      fileDrag.addEventListener('dragover', fileDragHover, false);
      fileDrag.addEventListener('dragleave', fileDragHover, false);
      fileDrag.addEventListener('drop', fileSelectHandler, false);
    }
  }

  function fileDragHover(e) {
    var fileDrag = document.getElementById('file-drag2');

    e.stopPropagation();
    e.preventDefault();

    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload2');
  }

  function fileSelectHandler(e) {
    // Fetch FileList object
    var files = e.target.files || e.dataTransfer.files;

    // Cancel event and hover styling
    fileDragHover(e);

    // Process all File objects
    for (var i = 0, f; f = files[i]; i++) {
      parseFile(f);
      uploadFile(f);
    }
  }

  // Output
  function output(msg) {
    // Response
    var m = document.getElementById('messages2');
    m.innerHTML = msg;
  }

  function parseFile(file) {

    console.log(file.name);
    output(
      '<strong>' + encodeURI(file.name) + '</strong>'
    );
    
    // var fileType = file.type;
    // console.log(fileType);
    var imageName = file.name;

    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
    if (isGood) {
      document.getElementById('start2').classList.add("hidden");
      document.getElementById('response2').classList.remove("hidden");
      document.getElementById('notimage2').classList.add("hidden");
      // Thumbnail Preview
      document.getElementById('file-image2').classList.remove("hidden");
      document.getElementById('file-image2').src = URL.createObjectURL(file);
      document.getElementById('file-image2').alt = imageName;
    }
    else {
      document.getElementById('file-image2').classList.add("hidden");
      document.getElementById('notimage2').classList.remove("hidden");
      document.getElementById('start2').classList.remove("hidden");
      document.getElementById('response2').classList.add("hidden");
      document.getElementById("file-upload-form2").reset();
    }
  }

  function setProgressMaxValue(e) {
    var pBar = document.getElementById('file-progress2');

    if (e.lengthComputable) {
      pBar.max = e.total;
    }
  }

  function updateFileProgress(e) {
    var pBar = document.getElementById('file-progress2');

    if (e.lengthComputable) {
      pBar.value = e.loaded;
    }
  }

  function uploadFile(file) {

    var xhr = new XMLHttpRequest(),
      fileInput = document.getElementById('class-roster-file'),
      pBar = document.getElementById('file-progress2'),
      fileSizeLimit = 1024; // In MB
    if (xhr.upload) {
      // Check if file is less than x MB
      if (file.size <= fileSizeLimit * 1024 * 1024) {
        // Progress bar
        pBar.style.display = 'inline';
        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
        xhr.upload.addEventListener('progress', updateFileProgress, false);

        // File received / failed
        xhr.onreadystatechange = function(e) {
          if (xhr.readyState == 4) {
            // Everything is good!

            // progress.className = (xhr.status == 200 ? "success" : "failure");
            // document.location.reload(true);
          }
        };

        // start2 upload
        xhr.open('POST', document.getElementById('file-upload-form2').action, true);
        xhr.setRequestHeader('X-File-Name', file.name);
        xhr.setRequestHeader('X-File-Size', file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(file);
      } else {
        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
      }
    }
  }

  // Check for the various File API support.
  if (window.File && window.FileList && window.FileReader) {
    Init();
  } else {
    document.getElementById('file-drag2').style.display = 'none';
  }
}
ekUpload();
</script>









<script type="text/javascript">
//File Upload33
//// File Upload333
// 
function ekUpload(){
  function Init() {

    console.log("Upload Initialised");

    var fileSelect    = document.getElementById('file-upload3'),
        fileDrag      = document.getElementById('file-drag3'),
        submitButton  = document.getElementById('submit-button');

    fileSelect.addEventListener('change', fileSelectHandler, false);

    // Is XHR3 available?
    var xhr = new XMLHttpRequest();
      // File Drop
    if (xhr.upload) {
      fileDrag.addEventListener('dragover', fileDragHover, false);
      fileDrag.addEventListener('dragleave', fileDragHover, false);
      fileDrag.addEventListener('drop', fileSelectHandler, false);
    }
  }

  function fileDragHover(e) {
    var fileDrag = document.getElementById('file-drag3');

    e.stopPropagation();
    e.preventDefault();

    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload3');
  }

  function fileSelectHandler(e) {
    // Fetch FileList object
    var files = e.target.files || e.dataTransfer.files;

    // Cancel event and hover styling
    fileDragHover(e);

    // Process all File objects
    for (var i = 0, f; f = files[i]; i++) {
      parseFile(f);
      uploadFile(f);
    }
  }

  // Output
  function output(msg) {
    // Response
    var m = document.getElementById('messages3');
    m.innerHTML = msg;
  }

  function parseFile(file) {

    console.log(file.name);
    output(
      '<strong>' + encodeURI(file.name) + '</strong>'
    );
    
    // var fileType = file.type;
    // console.log(fileType);
    var imageName = file.name;

    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
    if (isGood) {
      document.getElementById('start3').classList.add("hidden");
      document.getElementById('response3').classList.remove("hidden");
      document.getElementById('notimage3').classList.add("hidden");
      // Thumbnail Preview
      document.getElementById('file-image3').classList.remove("hidden");
      document.getElementById('file-image3').src = URL.createObjectURL(file);
      document.getElementById('file-image3').alt = imageName;
    }
    else {
      document.getElementById('file-image3').classList.add("hidden");
      document.getElementById('notimage3').classList.remove("hidden");
      document.getElementById('start3').classList.remove("hidden");
      document.getElementById('response3').classList.add("hidden");
      document.getElementById("file-upload-form3").reset();
    }
  }

  function setProgressMaxValue(e) {
    var pBar = document.getElementById('file-progress3');

    if (e.lengthComputable) {
      pBar.max = e.total;
    }
  }

  function updateFileProgress(e) {
    var pBar = document.getElementById('file-progress3');

    if (e.lengthComputable) {
      pBar.value = e.loaded;
    }
  }

  function uploadFile(file) {

    var xhr = new XMLHttpRequest(),
      fileInput = document.getElementById('class-roster-file'),
      pBar = document.getElementById('file-progress3'),
      fileSizeLimit = 1024; // In MB
    if (xhr.upload) {
      // Check if file is less than x MB
      if (file.size <= fileSizeLimit * 1024 * 1024) {
        // Progress bar
        pBar.style.display = 'inline';
        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
        xhr.upload.addEventListener('progress', updateFileProgress, false);

        // File received / failed
        xhr.onreadystatechange = function(e) {
          if (xhr.readyState == 4) {
            // Everything is good!

            // progress.className = (xhr.status == 200 ? "success" : "failure");
            // document.location.reload(true);
          }
        };

        // start3 upload
        xhr.open('POST', document.getElementById('file-upload-form3').action, true);
        xhr.setRequestHeader('X-File-Name', file.name);
        xhr.setRequestHeader('X-File-Size', file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(file);
      } else {
        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
      }
    }
  }

  // Check for the various File API support.
  if (window.File && window.FileList && window.FileReader) {
    Init();
  } else {
    document.getElementById('file-drag3').style.display = 'none';
  }
}
ekUpload();
</script>






<script type="text/javascript">
//File Upload24
//// File Upload444
// 
function ekUpload(){
  function Init() {

    console.log("Upload Initialised");

    var fileSelect    = document.getElementById('file-upload4'),
        fileDrag      = document.getElementById('file-drag4'),
        submitButton  = document.getElementById('submit-button');

    fileSelect.addEventListener('change', fileSelectHandler, false);

    // Is XHR4 available?
    var xhr = new XMLHttpRequest();
    if (xhr.upload) {
      // File Drop
      fileDrag.addEventListener('dragover', fileDragHover, false);
      fileDrag.addEventListener('dragleave', fileDragHover, false);
      fileDrag.addEventListener('drop', fileSelectHandler, false);
    }
  }

  function fileDragHover(e) {
    var fileDrag = document.getElementById('file-drag4');

    e.stopPropagation();
    e.preventDefault();

    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload4');
  }

  function fileSelectHandler(e) {
    // Fetch FileList object
    var files = e.target.files || e.dataTransfer.files;

    // Cancel event and hover styling
    fileDragHover(e);

    // Process all File objects
    for (var i = 0, f; f = files[i]; i++) {
      parseFile(f);
      uploadFile(f);
    }
  }

  // Output
  function output(msg) {
    // Response
    var m = document.getElementById('messages4');
    m.innerHTML = msg;
  }

  function parseFile(file) {

    console.log(file.name);
    output(
      '<strong>' + encodeURI(file.name) + '</strong>'
    );
    
    // var fileType = file.type;
    // console.log(fileType);
    var imageName = file.name;

    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
    if (isGood) {
      document.getElementById('start4').classList.add("hidden");
      document.getElementById('response4').classList.remove("hidden");
      document.getElementById('notimage4').classList.add("hidden");
      // Thumbnail Preview
      document.getElementById('file-image4').classList.remove("hidden");
      document.getElementById('file-image4').src = URL.createObjectURL(file);
      document.getElementById('file-image4').alt = imageName;
    }
    else {
      document.getElementById('file-image4').classList.add("hidden");
      document.getElementById('notimage4').classList.remove("hidden");
      document.getElementById('start4').classList.remove("hidden");
      document.getElementById('response4').classList.add("hidden");
      document.getElementById("file-upload-form4").reset();
    }
  }

  function setProgressMaxValue(e) {
    var pBar = document.getElementById('file-progress4');

    if (e.lengthComputable) {
      pBar.max = e.total;
    }
  }

  function updateFileProgress(e) {
    var pBar = document.getElementById('file-progress4');

    if (e.lengthComputable) {
      pBar.value = e.loaded;
    }
  }

  function uploadFile(file) {

    var xhr = new XMLHttpRequest(),
      fileInput = document.getElementById('class-roster-file'),
      pBar = document.getElementById('file-progress4'),
      fileSizeLimit = 1024; // In MB
    if (xhr.upload) {
      // Check if file is less than x MB
      if (file.size <= fileSizeLimit * 1024 * 1024) {
        // Progress bar
        pBar.style.display = 'inline';
        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
        xhr.upload.addEventListener('progress', updateFileProgress, false);

        // File received / failed
        xhr.onreadystatechange = function(e) {
          if (xhr.readyState == 4) {
            // Everything is good!

            // progress.className = (xhr.status == 200 ? "success" : "failure");
            // document.location.reload(true);
          }
        };

        // start4 upload
        xhr.open('POST', document.getElementById('file-upload-form4').action, true);
        xhr.setRequestHeader('X-File-Name', file.name);
        xhr.setRequestHeader('X-File-Size', file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(file);
      } else {
        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
      }
    }
  }

  // Check for the various File API support.
  if (window.File && window.FileList && window.FileReader) {
    Init();
  } else {
    document.getElementById('file-drag4').style.display = 'none';
  }
}
ekUpload();
</script>






<script type="text/javascript">
//File Upload4
//// File Upload4
// 
function ekUpload(){
  function Init() {

    console.log("Upload Initialised");

    var fileSelect    = document.getElementById('file-upload5'),
        fileDrag      = document.getElementById('file-drag5'),
        submitButton  = document.getElementById('submit-button');

    fileSelect.addEventListener('change', fileSelectHandler, false);

    // Is XHR2 available?
    var xhr = new XMLHttpRequest();
    if (xhr.upload) {
      // File Drop
      fileDrag.addEventListener('dragover', fileDragHover, false);
      fileDrag.addEventListener('dragleave', fileDragHover, false);
      fileDrag.addEventListener('drop', fileSelectHandler, false);
    }
  }

  function fileDragHover(e) {
    var fileDrag = document.getElementById('file-drag5');

    e.stopPropagation();
    e.preventDefault();

    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload5');
  }

  function fileSelectHandler(e) {
    // Fetch FileList object
    var files = e.target.files || e.dataTransfer.files;

    // Cancel event and hover styling
    fileDragHover(e);

    // Process all File objects
    for (var i = 0, f; f = files[i]; i++) {
      parseFile(f);
      uploadFile(f);
    }
  }

  // Output
  function output(msg) {
    // Response
    var m = document.getElementById('messages5');
    m.innerHTML = msg;
  }

  function parseFile(file) {

    console.log(file.name);
    output(
      '<strong>' + encodeURI(file.name) + '</strong>'
    );
    
    // var fileType = file.type;
    // console.log(fileType);
    var imageName = file.name;

    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
    if (isGood) {
      document.getElementById('start5').classList.add("hidden");
      document.getElementById('response5').classList.remove("hidden");
      document.getElementById('notimage5').classList.add("hidden");
      // Thumbnail Preview
      document.getElementById('file-image5').classList.remove("hidden");
      document.getElementById('file-image5').src = URL.createObjectURL(file);
      document.getElementById('file-image5').alt = imageName;
    }
    else {
      document.getElementById('file-image5').classList.add("hidden");
      document.getElementById('notimage5').classList.remove("hidden");
      document.getElementById('start5').classList.remove("hidden");
      document.getElementById('response5').classList.add("hidden");
      document.getElementById("file-upload-form5").reset();
    }
  }

  function setProgressMaxValue(e) {
    var pBar = document.getElementById('file-progress5');

    if (e.lengthComputable) {
      pBar.max = e.total;
    }
  }

  function updateFileProgress(e) {
    var pBar = document.getElementById('file-progress5');

    if (e.lengthComputable) {
      pBar.value = e.loaded;
    }
  }

  function uploadFile(file) {

    var xhr = new XMLHttpRequest(),
      fileInput = document.getElementById('class-roster-file'),
      pBar = document.getElementById('file-progress5'),
      fileSizeLimit = 1024; // In MB
    if (xhr.upload) {
      // Check if file is less than x MB
      if (file.size <= fileSizeLimit * 1024 * 1024) {
        // Progress bar
        pBar.style.display = 'inline';
        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
        xhr.upload.addEventListener('progress', updateFileProgress, false);

        // File received / failed
        xhr.onreadystatechange = function(e) {
          if (xhr.readyState == 4) {
            // Everything is good!

            // progress.className = (xhr.status == 200 ? "success" : "failure");
            // document.location.reload(true);
          }
        };

        // start4 upload
        xhr.open('POST', document.getElementById('file-upload-form5').action, true);
        xhr.setRequestHeader('X-File-Name', file.name);
        xhr.setRequestHeader('X-File-Size', file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        xhr.send(file);
      } else {
        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
      }
    }
  }

  // Check for the various File API support.
  if (window.File && window.FileList && window.FileReader) {
    Init();
  } else {
    document.getElementById('file-drag5').style.display = 'none';
  }
}
ekUpload();
</script>





<script type="text/javascript">
		
	//모달창에 지도 및 여행 정보 리스트 띄우기
	function inputMap(event){
		var evt = $(event).attr('id');
		var evt2 = evt.charAt(evt.length-1);
		$.ajax({
			type : 'post',
			url : 'modelMapList.mh',
			dataType : 'json',
			success : function(data){

// 				var map_mark = $('<div class="col-md-7"><div class="map-canvas"></div></div>');

//				$('.info-list').find('div.col-md-5').remove();
				var name = 'map-canvas' + evt2;
// 				alert($('#' + name + '').attr('id'));
				$('#' + name + '').parent().next().children().remove();
//				alert("성공 : " + data[0].pageTotalCount);
				var list = $('<div class="" style=""><div class="input-group"><input type="text" id="search"/><input type="button" class="btn btn-primary" id="mSearch" value="검색"/></div></div>');
				var list2 = $('<div class="mList" style="height: 400px; overflow: auto;"></div>');
				var table = $('<table class="table table-hover"></table>');

				for(var i = 0; i < data.length; i++){
					var tr = $('<tr></tr>');
					var td = $('<td class="map-info"><h5>' + data[i].title + '</h5><input type="hidden" class="contentid" value="' 
							+ data[i].contentid + '"/><input type="hidden" class="mapx" value="' 
							+ data[i].mapx + '"/><input type="hidden" class="mapy" value="' 
							+ data[i].mapy + '"/>'
							+ '<input type="hidden" class="contenttypeid" value="' + data[i].contenttypeid + '"/></td>');
					tr.append(td);
					table.append(tr);
				}

				list2.append(table);
				list.append(list2);
// 				$('.info-list').append(map_mark);
// 				$('#map-canvas').append(event);
				$('#' + name + '').parent().next().append(list);
			},
			error:function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
		
		
		
		//모달창에서 정보 리스트 클릭시 지도에 마커 표시
		$(document).on("click", ".map-info", function() {

//			var test = $('h5', this);
//			alert(test.text());

			
			var info = $(this).find('.contentid').val();
//			alert(info);
			var icon = 'info-i_maps.png';
			var mapx = $(this).find('.mapx').val();
			var mapy = $(this).find('.mapy').val();
			var contenttypeid = $(this).find('.contenttypeid').val();

			var_mapoptions.center = new google.maps.LatLng(mapy, mapx);

			var mod = $(this).parents('.modal').attr('id');
			var a = mod.charAt(mod.length-1) * 1;
			
			marker[a].setMap(null);
			marker[a] = new google.maps.Marker({
				position : new google.maps.LatLng(mapy, mapx),
			});
			map[a] = new google.maps.Map(document.getElementById("map-canvas" + a + ""),
						var_mapoptions);
			marker[a].setMap(map[a]);
			
			var inputMapx = $('<input type="hidden" class="mapx" name="mapx" value="' + mapx + '"/>');
			var inputMapy = $('<input type="hidden" class="mapy" name="mapy" value="' + mapy + '"/>');
			var contentTypeId = $('<input type="hidden" class="contenttypeid" name="contenttypeid" value="' + contenttypeid + '"/>');
			$('#map-canvas' + a + '').append(inputMapx);
			$('#map-canvas' + a + '').append(inputMapy);
			$('#map-canvas' + a + '').append(contentTypeId);
			

		});
	}
		
		
		
	
	
	
	
	
	//검색버튼 클릭시 조건에 맞는 리스트 출력
	$(document).on("click", "#mSearch", function(){
		var keyword = $(this).prev().val();
		var tag = $(this);
		var tag2 = tag.parent().parent().parent();
// 		alert(tag2.attr('id'));
// 		alert(keyword);
		$.ajax({
			type : 'post', 
			url : 'modelSearchKeyword.mh',
			data : {
				'keyword' : keyword
			},
			dataType : 'json',
			success : function(data){
// 				alert("입력성공 : " + data[0].title);
				tag.parent().parent().remove();
// 				alert("성공 : " + data[0].pageTotalCount);
				var list = $('<div class="" style=""><div class="input-group"><input type="text" id="search"/><input type="button" class="btn btn-primary" id="mSearch" value="검색"/></div></div>');
				var list2 = $('<div class="mList" style="height: 400px; overflow: auto;"></div>');
				var table = $('<table class="table table-hover"></table>');
				
				for(var i = 0; i < data.length; i++){
					var tr = $('<tr></tr>');
					var td = $('<td class="map-info"><h5>' + data[i].title + '</h5><input type="hidden" class="contentid" value="' 
							+ data[i].contentid + '"/><input type="hidden" class="mapx" value="' 
							+ data[i].mapx + '"/><input type="hidden" class="mapy" value="' 
							+ data[i].mapy + '"/>'
							+ '<input type="hidden" class="contenttypeid" value="' + data[i].contenttypeid + '"/></td>');
					tr.append(td);
					table.append(tr);
				}
				
				list2.append(table);
				list.append(list2);
				tag2.append(list);
			},
			error : function(request, status, error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	});
	
	
	//검색창에 엔터키 적용
	$(document).on("keypress", "#search", function(event){
// 		alert(event.keyCode);
		if(event.keyCode == 13){
			$(this).next().click();
		}
	});
	
	
	
	
	
	
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//에디터 데이터 가져오기
	$(document).on('click', 'input[id^="attach"]', function(){
		var htmlTag = $(this).parent().find('div[id^="edit"]').children().children().html();
		alert(htmlTag);
	});
	
	//이미지 정보 가져오기
	$(document).on('click', 'img[id^="file-image"]', function(){
		$(this).parent().append($('<img src="' + $(this).attr('src') + '">'));
		
	});
	
	
	
	//저장버튼 클릭 시 화면에 등록한 지도좌표, 이미지, 텍스트의 값을 가져와서 서버로 보냄
	$('#insert').click(function(){
		var formData = new FormData($("#fileForm")[0]);
		
		var content = {};
		
		var mapList = [];
		var imageList = [];
		var textList = [];
		
		var info = $('#divArea').find('.content');
		for(var i = 0; i < info.length; i++){
			var id = info.eq(i).attr('id');
			if(id.substring(0, id.length-1) == 'map-canvas'){
				alert("지도"	);
				var map = {};
				map.type = 'map';
				map.mapx = info.eq(i).find('.mapx').val();
				map.mapy = info.eq(i).find('.mapy').val();
				map.contentTypeId = info.eq(i).find('.contenttypeid').val();
				map.order = i+1;
				mapList.push(map);
			}else if(id.substring(0, id.length-1) == 'file-image'){
				alert("이미지");
				var image = {};
				image.type = 'image';
				image.fileName = info.eq(i).attr('alt');
				image.order = i+1;
				imageList.push(image);
				alert(image.filename + '/' + image.order);
			}else if(id.substring(0, id.length-1) == 'edit'){
				alert("텍스트");
				var text = {};
				text.type = 'text';
				text.tag = info.eq(i).children().children().html();
				text.order = i+1;
				textList.push(text);
				alert(text.tag + '/' + text.order);
			}
			
			content.mapList = mapList;
			content.imageList = imageList;
			content.textList = textList;
			content.title = '제목';
		}
		
		//파일 업로드
	     $.ajax({
	         type : 'post',
	         url : 'afterFileUpload.mh',
	         data : formData,
	         processData : false,
	         contentType : false,
	         success : function(data) {
	             alert("파일 업로드가 완료되었습니다.");
	         },
	         error : function(request, status, error){
					alert("파일 업로드에 실패하였습니다. " + "code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
	     });
	     
	     //화면 데이터 서버로 전송
	     $.ajax({
	         type : 'post',
	         url : 'afterBoardInsert.mh',
	         data : JSON.stringify(content),
	         contentType : 'application/json',
	         success : function(data) {
	             alert("저장이 완료되었습니다.");
	         },
	         error : function(request, status, error){
					alert("저장에 실패하였습니다. " + "code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			 }
	     });
	     
	});
	
	
	

	
	</script>








<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/froala_editor.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/align.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/code_beautifier.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/code_view.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/colors.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/emoticons.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/draggable.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/font_size.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/font_family.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/image.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/image_manager.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/line_breaker.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/quick_insert.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/link.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/lists.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/paragraph_format.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/paragraph_style.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/video.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/table.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/url.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/emoticons.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/file.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/entities.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/inline_style.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/save.min.js"></script>
  <script type="text/javascript" src="/MapHack/resource/afterboard/editjs/plugins/fullscreen.min.js"></script>









<!-- edit기능 -->
	<script src="/MapHack/resource/afterboard/editjs/edit.js"></script>



</body>
</html>