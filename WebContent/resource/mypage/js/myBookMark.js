
$(function () {
    $('.button2-my-checkbox').each(function () {

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




$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall2").click(function(){
        //클릭되었으면
        if($("#checkall2").next().prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name='chk2']").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name='chk2']").prop("checked",false);
        }
    });
});





$(function () {
    $('.my-button2-checkbox').each(function () {

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
var model = [];
var contenttypeid = [];
var contentid = [];
var firstimage = [];
var title = [];
var addr1 = [];
var addr2 = [];
var modifiedtime = [];
var contentlength = document.getElementsByName("contentTypeId").length;


function btnsearch(){
	$.ajax({
		url:"/MapHack/myBookMarkList.mh",
		dataType:"json",
		success(data){
			model = data.detaillist;
			var searchname = document.getElementById("search_concept").innerHTML;
			var search = [];
			var searchdiv = document.getElementById("searchdiv");
			searchdiv.innerHTML = "";
			var searchkey = document.getElementById("search_key").value;
			
			if(searchname == "관광지"){
				for(var i=0; i<model.length; i++){
					if(model[i].contenttypeid == "12" && model[i].title.indexOf(searchkey, 0) >= 0){
						var select = {
							contentid : model[i].contentid,
							contenttypeid : model[i].contenttypeid,
							firstimage : model[i].firstimage,
							title : model[i].title,
							addr1 : model[i].addr1,
							addr2 : model[i].addr2,
							modifiedtime : model[i].modifiedtime
						};
						search.push(select);
					}
				}
				
			}else if(searchname =="숙박"){
				for(var i=0; i<model.length; i++){
					if(model[i].contenttypeid == "32" && model[i].title.indexOf(searchkey, 0) >= 0){
						var select = {
							contentid : model[i].contentid,
							contenttypeid : model[i].contenttypeid,
							firstimage : model[i].firstimage,
							title : model[i].title,
							addr1 : model[i].addr1,
							addr2 : model[i].addr2,
							modifiedtime : model[i].modifiedtime
						};
						search.push(select);
					}
				}
			}else if(searchname =="음식점"){
				for(var i=0; i<model.length; i++){
					if(model[i].contenttypeid == "39" && model[i].title.indexOf(searchkey, 0) >= 0){
						var select = {
							contentid : model[i].contentid,
							contenttypeid : model[i].contenttypeid,
							firstimage : model[i].firstimage,
							title : model[i].title,
							addr1 : model[i].addr1,
							addr2 : model[i].addr2,
							modifiedtime : model[i].modifiedtime
						};
						search.push(select);
					}
				}
			}else if(searchname =="전체"){
				for(var i=0; i<model.length; i++){
						var select = {
							contentid : model[i].contentid,
							contenttypeid : model[i].contenttypeid,
							firstimage : model[i].firstimage,
							title : model[i].title,
							addr1 : model[i].addr1,
							addr2 : model[i].addr2,
							modifiedtime : model[i].modifiedtime
						};
						search.push(select);
				}
			}
			for(var i=0; i<search.length; i++){
				if(search[i].firstimage == null){
					search[i].firstimage = "/MapHack/resource/infodetail/images/no_detail_img.gif";
				}
			}
			for(var i=0; i<search.length; i++){
				searchdiv.innerHTML += '<div class="cell-sm-4 info">'+
                '<form action="infoDetail.mh" method="post">'+
                  '<input type="hidden" name="contentId" value="'+search[i].contentid+'" />'+
                   '<input type="hidden" name="contentTypeId" value="'+search[i].contenttypeid+'" />'+
                   '<input type="hidden" name="firstImage" value="'+search[i].firstimage+'" />'+
                   '<article class="post-blog">'+ 
                   '<input type="checkbox" name="chk2" /> <a class="post-blog-image" href="">'+ 
                         '<img src="'+search[i].firstimage+'" alt="" width="420" height="305"/>'+
                   '</a>'+
                   '<div class="post-blog-caption" style="padding-top: 5px;">'+
                      '<div class="post-blog-caption-header" style="padding-left: 6%; padding-right: 1.66%">' +
                         '<ul class="post-blog-tags">' +
                            '<li><a class="button-tags" href="" name="title">'+search[i].title+'</a></li>' +
                         '</ul>'+
                      '</div>'+
                      '<div class="post-blog-caption-body" style="padding-left: 6%; padding-right: 1.66%">'+
                         '<h7>'+ 
                         '<a class="post-blog-title" href="" name="addr1">'+search[i].addr1+'</a>'+
                         '<a class="post-blog-title" href="" name="addr2">'+search[i].addr2+'</a></h7>'+
                      '</div>'+
                      '<div class="post-blog-caption-footer" style="padding-left: 6%; padding-right: 1.66%">'+
                         '<time datetime="2017"> <span name = "modifiedTime" style="font-size: 13px;">'+search[i].modifiedtime+'</span></time>'+
                         '<a class="post-comment" href="">'+ 
							'<span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span>'+
                            '<span>3</span>'+
                         '</a>'+
                      '</div>'+
                   '</div>'+
                   '</article>'+
                '</form>'+
             '</div>';
			}
			
			
		},
		error:function(request,status,error){
			alert("에러");
			alert(error);
		}
	});
	
}


