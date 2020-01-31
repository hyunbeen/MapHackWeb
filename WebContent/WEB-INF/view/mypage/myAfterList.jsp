<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



    <div class="page">
    <div class="row">
    	<div class="col-sm-5">
     		<h2>여행정보공유 목록</h2>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-4">
         <div  class="button button-xs button-secondary button-nina button-ellipse-md button-shadow" 
           style="float: right;"> ＋ 새 여행정보공유 작성</div> 
         </div>
    </div>
             
       <hr>
          <div class="shell shell-bigger" style="padding-top: 2%">
          <div class="range range-ten range-50 range-sm-90 range-sm-center range-lg-justify">
            <div class="cell-sm-12 cell-md-12 cell-lg-12 text-center">
              <div class="range range-30">


						<div class="input-group cell-sm-4">
							<span class="button-my-checkbox">
								<button type="button" class="btn" data-color="info" id="checkall">전체선택</button>
								<input type="checkbox" id="checkall" class="hidden"  />
							</span> <span class="my2-button-checkbox">
								<button type="button" class="btn" data-color="danger">선택삭제</button>
								<input type="checkbox" class="hidden" checked />
							</span>
						</div>
						
						
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
      </div>  </div>  </div>  </div>               
               <div class="section section-variant-1 bg-white" style="padding: 50px 0 10px; margin-top: 6%;">
        <div class="shell-wide">
          
          
          <div class="range range-50" >
                        
              
              
              	 <% int selectsize2 = 12; %>
          <% for(int i=0; i<selectsize2; i++ ) { %>
              	
              	
                <div class="cell-sm-4 info">
                   
                 <form>
                  <article class="post-blog">
                  
                  <a class="post-blog-image" href="">
                  <input type="checkbox" name="chk6" />
                  <img src="/MapHack/resource/include/images/01.jpg" alt="" width="420" height="305"/></a>
                    <div class="post-blog-caption">
                      <div class="post-blog-caption-header">
                        <ul class="post-blog-tags">
                          <li><a class="button-tags" href="">제목</a></li>
                        </ul>
                          <ul class="post-blog-meta">
                          <li><span>by</span>&nbsp;<a href="about-me.html">닉네임</a></li>
                        </ul>
                      </div>
                      <div class="post-blog-caption-body">
                        <h5><a class="post-blog-title" href="">제목2</a></h5>
                      </div>
                      <div class="post-blog-caption-footer">
                        <time datetime="2017">등록일</time><a class="post-comment" href=""><span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
                      </div>
                    </div>
                  </article>
                </form>
                </div>
                
                
                <%} %>  
        
                
              </div>
              
              <ul class="pagination-custom">
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
              </ul>
            </div>
        </div>
      
      
      </div>
      

<script type="text/javascript">

$(function () {
    $('.button-my6-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });
});


</script>

<script type="text/javascript">

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall6").click(function(){
        //클릭되었으면
        if($("#checkall6").next().prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name='chk6']").prop("checked",true);
            
            
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name='chk6']").prop("checked",false);
            
            
        }
    });
});



</script>

<script type="text/javascript">


$(function () {
    $('.my6-button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend( settings[$button.data('state')]);
            }
        }
        init();
    });
});



</script>
                        
          <script src="/MapHack/resource/main/js/core.min.js"></script>
    <script src="/MapHack/resource/main/js/script.js"></script>
    
    <script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>

                        
                    
                        

</body>
</html>