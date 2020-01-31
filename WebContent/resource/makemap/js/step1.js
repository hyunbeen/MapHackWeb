
var model = [];
var model2 = [];

var model1 = [];
var model3 = [];

var model4 = [];
var model5 = [];

var model7 = [];
var markers = [];
var features = [];
var map;

var foodmarkers = [];
var foodfeatures = [];

var homemarkers = [];
var homefeatures = [];

var detail = [];
var step1list = [];
var selectdetail;

var start;
var end;
var waypts = [];
var  directionsDisplay = new google.maps.DirectionsRenderer();
var directionsService = new google.maps.DirectionsService();
var map;
var alldistance = 0;
function initialize1() {
   
   mapProp = {
             center: new google.maps.LatLng(37.567835,126.986357),
             zoom: 13,
               mapTypeId: google.maps.MapTypeId.ROADMAP
           };
   
    map = new google.maps.Map(document.getElementById("map-canvas"), mapProp);
    foodMarker();
    addMarker();
    homeMarker();
   return map;
   }

function step1(){
$("#mapTab").on('shown.bs.tab', function() {

     /* Trigger fmap resize event */
   google.maps.event.trigger(map, 'resize');
});

}

//음식점 마커 생성
function foodMarker(){
   $.ajax({
      url:"/MapHack/mapFoodData.mh",
      dataType:"json",
      success(data){
            
          model7 = data.favoritelist;
          model1 = data.list1;
           model3 = data.detaillist1;
         
        
      
           // 구글 마커 아이콘        
          
           var icons = {
             parking: {
               icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/foodon.png', null, null, null, new google.maps.Size(48,48))
             },
             library: {
               icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/homeon.png', null, null, null, new google.maps.Size(48,48))
             },
             info: {
               icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/addon.png', null, null, null, new google.maps.Size(48,48))
             }
           };
      //여행정보 가져오기
          
      //여행정보 마커에 등록        
          
          
           for(var i=0;i<model1.length;i++){
        	   if(model3[i].overview.length>150){
        		   model3[i].overview = model3[i].overview.substr(0,150)+"...";
	    	    }
             var infomation = {
                   position: new google.maps.LatLng(model1[i].mapy , model1[i].mapx ),
                   type: 'parking',
                   image: model1[i].firstimage,
                   title: model1[i].title,
                   contenttypeid : model1[i].contenttypeid,
                   mapx : model1[i].mapx,
                   mapy : model1[i].mapy,
                   contentid: model1[i].contentid,
                   detail: model3[i].overview
               };
             foodfeatures.push(infomation);
             
          }
           
           var valuename = [];
           if(model7.length <= 0){
              for(var j=0; j<model1.length; j++){
                 valuename[j] = "즐겨찾기추가";
              }
           }else{
              for(var i=0; i<model7.length; i++){
                  for(var j=0; j<model1.length; j++){
                     if(model7[i].favoriteLocation == model1[j].contentid){
                        valuename[j] = "즐겨찾기삭제";
                     }else{
                        valuename[j] = "즐겨찾기추가";
                     }
                  }
               }
           }             
           
         var index = 0;//마커 이벤트 등록할 index
         // 마커에 이벤트 등록하고 맵에 넣기
             foodfeatures.forEach(function(feature) {
               var marker = new google.maps.Marker({
                 position: feature.position,
                 icon: icons[feature.type].icon,
                 map: map
               });
               
               foodmarkers.push(marker);
               
               var image;
               var noimage = foodfeatures[index].image;
               if(noimage ==null){
                  image = '<img src="/MapHack/resource/infodetail/images/no_detail_img.gif" width=100% height=300/>';
                  foodfeatures[index].image = "/MapHack/resource/infodetail/images/no_detail_img.gif";
               }else{
                  image = '<img src="'+foodfeatures[index].image+'" width=100% height=300px/>';
               }
               var likeimage = "";
               if(valuename[index]=='즐겨찾기추가'){
            	   likeimage = "/MapHack/resource/makemap/images/likeon.png";
               }else{
            	   likeimage = "/MapHack/resource/makemap/images/likeoff.png";
               }
               var contentString = '<div id="content">'+
               '<h6 id="firstHeading" class="firstHeading" style="text-align:center;"><img name="'+foodfeatures[index].contentid+'" src="/MapHack/resource/makemap/images/liston.png" id="listbtn" value="리스트추가" onclick="listbtnadd(this,'+"'"+
               foodfeatures[index].contentid+"','"+valuename[index]+"','"+foodfeatures[index].title+
               "','"+foodfeatures[index].image+"','"+foodfeatures[index].mapx+"','"+foodfeatures[index].mapy+
               "','"+foodfeatures[index].contenttypeid+
               "'"+')" style="float:left;width:7%">'+foodfeatures[index].title+'<img name="'+foodfeatures[index].contentid+'" src="'+likeimage+'" id="favoritebtn" value="'+valuename[index]+'" onclick="btnadd(this,'+foodfeatures[index].contentid+','+"'"+valuename[index]+"'"+')" style="float:right;width:7%"></h6>'+
               '</div>'+
               '<div id="siteNotice" style="float:left; width:30%;">'+
               
               '<img src="'+foodfeatures[index].image+'"width=100% height=300/>'+
               
               '</div>'+
               
               '<div id="bodyContent" style="float:right; width:60%;">'+
               '<p>'+foodfeatures[index].detail+'</p>' +
               '</div>'+
               '<div style="clear:both;">' +
               '</div>';// 다이얼 로그 내용 등록
               var infowindow = new google.maps.InfoWindow({
                   content: contentString
                });
               //마커에 다이얼로그 이벤트 등록
               marker.addListener('click', function() {
                   infowindow.open(map, marker);
                });
               index++;
             });
         foodclearMarkers();

      }
      
      
   });
     
      
}
//관광지 마커 등록
function addMarker(){
   $.ajax({
      url:"/MapHack/mapAddData.mh",
      dataType:"json",
      success(data){
         model = data.list;
         model2 = data.detaillist;
         model7 = data.favoritelist;
            // 구글 마커 아이콘        
         var icons = {
                 parking: {
                   icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/foodon.png', null, null, null, new google.maps.Size(48,48))
                 },
                 library: {
                   icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/homeon.png', null, null, null, new google.maps.Size(48,48))
                 },
                 info: {
                   icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/addon.png', null, null, null, new google.maps.Size(48,48))
                 }
               };
           
           
         
      //여행정보 가져오기

          
          
           

      //여행정보 마커에 등록        
           //var contentid = [];
           for(var i=0;i<model.length;i++){
        	   if(model2[i].overview.length>150){
        		   model2[i].overview = model2[i].overview.substr(0,150)+"...";
	    	    }
             var infomation = {
                   position: new google.maps.LatLng(model[i].mapy , model[i].mapx ),
                    type: 'info',
                    image: model[i].firstimage,
                    title: model[i].title,
                    contenttypeid : model[i].contenttypeid,
                    mapx : model[i].mapx,
                    mapy : model[i].mapy,
                    contentid: model[i].contentid,
                     detail: model2[i].overview
               };
             
             features.push(infomation);
             
             //contentid.push(model[i].contentid);
             
          }
           var valuename = [];
           if(model7.length <= 0){
              for(var j=0; j<model.length; j++){
                 valuename[j] = "즐겨찾기추가";
              }
           }else{
              for(var i=0; i<model7.length; i++){
                  for(var j=0; j<model.length; j++){
                     if(model7[i].favoriteLocation == model[j].contentid){
                        valuename[j] = "즐겨찾기삭제";
                     }else{
                        valuename[j] = "즐겨찾기추가";
                     }
                  }
               }
           }
           

           
         var index = 0;//마커 이벤트 등록할 index
         // 마커에 이벤트 등록하고 맵에 넣기
             features.forEach(function(feature) {
               var marker = new google.maps.Marker({
                 position: feature.position,
                 icon: icons[feature.type].icon,
                 map: map
               });
               
               markers.push(marker);
               
               var noimage = features[index].image;
               if(noimage ==null){
                  image = '<img src="/MapHack/resource/infodetail/images/no_detail_img.gif" width=100% height=300/>';
                  features[index].image = "/MapHack/resource/infodetail/images/no_detail_img.gif";
               }else{
                  image = '<img src="'+features[index].image+'"width=100% height=300/>';
               }
               var likeimage;
               if(valuename[index]=='즐겨찾기추가'){
            	   likeimage = "/MapHack/resource/makemap/images/likeon.png";
               }else{
            	   likeimage = "/MapHack/resource/makemap/images/likeoff.png";
               }
               
               var contentString = '<div id="content">'+
               '<h6 id="firstHeading" class="firstHeading" style="text-align:center;"><img name="'+features[index].contentid+'" src="/MapHack/resource/makemap/images/liston.png" id="listbtn" value="리스트추가" onclick="listbtnadd(this,'+"'"+
              features[index].contentid+"','"+valuename[index]+"','"+features[index].title+
               "','"+features[index].image+"','"+features[index].mapx+"','"+features[index].mapy+
               "','"+features[index].contenttypeid+
               "'"+')" style="float:left;width:7%">'+features[index].title+'<img name="'+features[index].contentid+'" src="'+likeimage+'" id="favoritebtn" value="'+valuename[index]+'" onclick="btnadd(this,'+features[index].contentid+','+"'"+valuename[index]+"'"+')" style="float:right;width:7%"></h6>'+
               '</div>'+
               '<div id="siteNotice" style="float:left; width:30%;">'+
               
               '<img src="'+features[index].image+'"width=100% height=300/>'+
               
               '</div>'+
               
               '<div id="bodyContent" style="float:right; width:60%;">'+
               '<p>'+features[index].detail+'</p>' +
               '</div>'+
               '<div style="clear:both;">' +
               '</div>';// 다이얼 로그 내용 등록
               var infowindow = new google.maps.InfoWindow({
                   content: contentString
                });
               //마커에 다이얼로그 이벤트 등록
               marker.addListener('click', function() {
                   infowindow.open(map, marker);
                });
               index++;
             });
         clearMarkers();
      }
   });
         
}

function dayChoice() {
step1list = [];
var slide_inner = $('#step1list');
slide_inner.text("");
 var openday= window.open("/MapHack/dayChoice.mh","일정선택", "width=750px, height=320px, toolbar=no, scrollbars=no, resizable=yes");

}

//숙박 마커 생성
function homeMarker(){
   $.ajax({
      url:"/MapHack/mapHomeData.mh",
      dataType:"json",
      success(data){
         
         model4 = data.list2;
         model5 = data.detaillist2;
         model7 = data.favoritelist;
      
         
            // 구글 마커 아이콘        
         var icons = {
                 parking: {
                   icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/foodon.png', null, null, null, new google.maps.Size(48,48))
                 },
                 library: {
                   icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/homeon.png', null, null, null, new google.maps.Size(48,48))
                 },
                 info: {
                   icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/addon.png', null, null, null, new google.maps.Size(48,48))
                 }
               };
      //여행정보 가져오기
          
      //여행정보 마커에 등록        
           
           for(var i=0;i<model4.length;i++){
        	   if(model5[i].overview.length>150){
        		   model5[i].overview = model5[i].overview.substr(0,150)+"...";
	    	    }
             var infomation = {
                   position: new google.maps.LatLng(model4[i].mapy , model4[i].mapx ),
                    type: 'library',
                    image: model4[i].firstimage,
                    title: model4[i].title,
                    contenttypeid : model4[i].contenttypeid,
                    mapx : model4[i].mapx,
                    mapy : model4[i].mapy,
                    contentid: model4[i].contentid,
                   detail: model5[i].overview
               };
             homefeatures.push(infomation);
             
          }
           
           var valuename = [];
           if(model7.length <= 0){
              for(var j=0; j<model4.length; j++){
                 valuename[j] = "즐겨찾기추가";
              }
           }else{
              for(var i=0; i<model7.length; i++){
                  for(var j=0; j<model4.length; j++){
                     if(model7[i].bookmark == model4[j].contentid){
                        valuename[j] = "즐겨찾기삭제";
                     }else{
                        valuename[j] = "즐겨찾기추가";
                     }
                  }
               }
           }
           
         var index = 0;//마커 이벤트 등록할 index
         // 마커에 이벤트 등록하고 맵에 넣기
             homefeatures.forEach(function(feature) {
               var marker = new google.maps.Marker({
                 position: feature.position,
                 icon: icons[feature.type].icon,
                 map: map
               });
               
               homemarkers.push(marker);
               
               var image;
               var noimage = homefeatures[index].image;
               if(noimage ==null){
                  image = '<img src="/MapHack/resource/infodetail/images/no_detail_img.gif" width=100% height=300/>';
                  homefeatures[index].image = "/MapHack/resource/infodetail/images/no_detail_img.gif";
               }else{
                  image = '<img src="'+homefeatures[index].image+'"width=100% height=300/>';
               }
               var likeimage;
               if(valuename[index]=='즐겨찾기추가'){
            	   likeimage = "/MapHack/resource/makemap/images/likeon.png";
               }else{
            	   likeimage = "/MapHack/resource/makemap/images/likeoff.png";
               }
               var contentString = '<div id="content">'+
               '<h6 id="firstHeading" class="firstHeading" style="text-align:center;"><img name="'+homefeatures[index].contentid+'" src="/MapHack/resource/makemap/images/liston.png" id="listbtn" value="리스트추가" onclick="listbtnadd(this,'+"'"+
               homefeatures[index].contentid+"','"+valuename[index]+"','"+homefeatures[index].title+
               "','"+homefeatures[index].image+"','"+homefeatures[index].mapx+"','"+homefeatures[index].mapy+
               "','"+homefeatures[index].contenttypeid+
               "'"+')" style="float:left;width:7%">'+homefeatures[index].title+'<img name="'+homefeatures[index].contentid+'" src="'+likeimage+'" id="favoritebtn" value="'+valuename[index]+'" onclick="btnadd(this,'+homefeatures[index].contentid+','+"'"+valuename[index]+"'"+')" style="float:right;width:7%"></h6>'+
               '</div>'+
               '<div id="siteNotice" style="float:left; width:30%;">'+
               
               image+
               
               '</div>'+
               
               '<div id="bodyContent" style="float:right; width:60%;">'+
               '<p>'+homefeatures[index].detail+'</p>' +
               '</div>'+
               '<div style="clear:both;">' +
               '</div>';// 다이얼 로그 내용 등록
               var infowindow = new google.maps.InfoWindow({
                   content: contentString
                });
               //마커에 다이얼로그 이벤트 등록
               marker.addListener('click', function() {
                   infowindow.open(map, marker);
                });
               index++;
             });
             
         homeclearMarkers();
      }
   });
      
   
      
}
function hometoggle(){
    var msg = document.getElementById('home').value;
    if(msg =="숙박on" || msg==undefined){
       homeshowMarkers();
       document.getElementById('home').src = "/MapHack/resource/makemap/images/homeoff.png";
       document.getElementById('home').value = "숙박off"
    }
    else{
       homeclearMarkers();
       document.getElementById('home').src = "/MapHack/resource/makemap/images/homeon.png";
       document.getElementById('home').value = "숙박on"
    }
 }
function maptoggle(){
    var msg = document.getElementById('reval').value;
    if(msg =="관광지on" || msg==undefined){
       showMarkers();
       document.getElementById('reval').src = "/MapHack/resource/makemap/images/addoff.png";
       document.getElementById('reval').value = "관광지off";
    }
    else{
       clearMarkers();
       document.getElementById('reval').src = "/MapHack/resource/makemap/images/addon.png";
       document.getElementById('reval').value = "관광지on";
    }
 }
 

function foodtoggle(){
    var msg = document.getElementById('food').value;
    if(msg =="음식점on" || msg==undefined){
       foodshowMarkers();
       document.getElementById('food').src = "/MapHack/resource/makemap/images/foodoff.png";
       document.getElementById('food').value = "음식점off";
    }
    else{
       foodclearMarkers();
       document.getElementById('food').src = "/MapHack/resource/makemap/images/foodon.png";
       document.getElementById('food').value = "음식점on";
    }
 }

//Sets the map on all markers in the array.
function homesetMapOnAll(map) {

  for (var i = 0; i < homemarkers.length; i++) {
     
     
    homemarkers[i].setMap(map);

  }
}
// Removes the markers from the map, but keeps them in the array.
function homeclearMarkers() {

  homesetMapOnAll(null);
  
}

// Shows any markers currently in the array.
function homeshowMarkers() {
  
  homesetMapOnAll(map);
  
}

//Sets the map on all markers in the array.
function setMapOnAll(map) {

  for (var i = 0; i < markers.length; i++) {
     
     
    markers[i].setMap(map);

  }
}
// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {

  setMapOnAll(null);
  
}

// Shows any markers currently in the array.
function showMarkers() {
  
  setMapOnAll(map);
  
}




// Sets the map on all markers in the array.
function foodsetMapOnAll(map) {

  for (var i = 0; i < foodmarkers.length; i++) {
     
     
    foodmarkers[i].setMap(map);

  }
}
// Removes the markers from the map, but keeps them in the array.
function foodclearMarkers() {

  foodsetMapOnAll(null);
  
}

// Shows any markers currently in the array.
function foodshowMarkers() {
  
  foodsetMapOnAll(map);
  
}


//지도 검색 이벤트
function searchbtn(){
    var selectgu = [];

   var gu = document.getElementById("gu").value;
   
   var detailname = document.getElementById("detailname").value;
   alert(detailname);
   var cate = document.getElementById("cate").value;
   var a = document.getElementById("searchresult");
   a.innerHTML = "";
   
   if(cate == "32"){
      for(var i=0; i < model4.length; i++){
         var detailsearch = model4[i].title;
          if(model4[i].sigungucode == gu && detailsearch.indexOf(detailname, 0) >= 0){
             var select = {
            		 contentid:model4[i].contentid,
                firstimage : model4[i].firstimage,
                title : model4[i].title,
                mapx : model4[i].mapx,
                mapy : model4[i].mapy,
                contenttypeid : model4[i].contenttypeid,
                detail: model5[i].overview
             };
             selectgu.push(select);
          }
       }
   }else if(cate == "39"){
      for(var i=0; i < model1.length; i++){
         var detailsearch = model1[i].title;
          if(model1[i].sigungucode == gu && detailsearch.indexOf(detailname, 0) >= 0){
             var select = {
            		 contentid:model1[i].contentid,
                firstimage : model1[i].firstimage,
                title : model1[i].title,
                mapx : model1[i].mapx,
                mapy : model1[i].mapy,
                contenttypeid : model1[i].contenttypeid,
                detail: model3[i].overview
             };
             selectgu.push(select);
          }
       }
   }else if(cate =="12"){
      for(var i=0; i < model.length; i++){
         var detailsearch = model[i].title;
         
          if(model[i].sigungucode == gu && detailsearch.indexOf(detailname, 0) >= 0){
          
                var select = {
                		contentid:model[i].contentid,
                        firstimage : model[i].firstimage,
                        title : model[i].title,
                        mapx : model[i].mapx,
                        mapy : model[i].mapy,
                        contenttypeid : model[i].contenttypeid,
                        detail: model2[i].overview
                     };
                     selectgu.push(select);
             
             
          }
       }
   }
   
   
   for(var i=0; i<selectgu.length; i++){	
      var cut = [];
      if(selectgu[i].detail.length > 150){
         cut[i] = selectgu[i].detail.substr(0,150) + "...";
      }else {
         cut[i] = selectgu[i].detail;
      }
      if(selectgu[i].firstimage == null){
         selectgu[i].firstimage = '/MapHack/resource/infodetail/images/no_detail_img.gif';
      }
      
      
      selectdetail = selectgu[i].detail;
      var htmlcontent = '<a href="#" class="list-group-item">' +
        '<div class="media col-sm-3 col-md-3  col-xs-3"> '+
            '<figure class="pull-left">'+
                '<img class="media-object img-rounded img-responsive"  src="'+selectgu[i].firstimage+'" alt="placehold.it/350x150" >' +
            '</figure>' +
        '</div>'+
        '<div class="col-md-6">'+
            '<h4 class="list-group-item-heading"> '+selectgu[i].title+' </h4>'+
            '<p class="list-group-item-text"> '+cut[i]+'</p>' +
        '</div>' +
        '<div class="col-sm-3 col-md-3  col-xs-3 text-center">'+
            '<h2> 14240 <small> 좋아요 </small></h2>'+
            '<button type="button" class="btn btn-primary btn-lg btn-block" onclick="selectAddMarker('+
            "'"+selectgu[i].mapx+"'"+","+
            "'"+selectgu[i].mapy+"'"+","+
            "'"+selectgu[i].contenttypeid+"'"+","+
            "'"+selectgu[i].contentid+"'"+","+
            "'"+selectgu[i].firstimage+"'"+","+
            "'"+selectgu[i].title+"'"+
            ")"+'"'+'> 마커띄우기 </button>'+
            '<div class="stars">'+
                '<span>★</span>'+
                '<span>★</span>'+
            '</div>'+
            '<p>4.5  /  5 </p>'+
        '</div>'+
     '</a>';
     a.innerHTML += htmlcontent;
     
   }
   
}
//검색 마커 추가
function selectAddMarker(mapx,mapy,contenttypeid,contentid,firstimage,title){
	 $.ajax({
	      url:"/MapHack/selectFavoriteData.mh",
	      dataType:"json",
	      success(data){
	    	  model7 = data.favoritelist;
	    	 
	    	  // 구글 마커 아이콘        
	    	  var icons = {
	    	             parking: {
	    	               icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/foodon.png', null, null, null, new google.maps.Size(48,48))
	    	             },
	    	             library: {
	    	               icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/homeon.png', null, null, null, new google.maps.Size(48,48))
	    	             },
	    	             info: {
	    	               icon: new google.maps.MarkerImage('/MapHack/resource/makemap/images/addon.png', null, null, null, new google.maps.Size(48,48))
	    	             }
	    	           };
	    	    var selecttype;
	    	    switch(contenttypeid){
	    	    case'32' : selecttype='library';break;
	    	    case'39' : selecttype='parking';break;
	    	    case'12' : selecttype='info';break;
	    	    }
	    	   
	    	    //여행정보 마커에 등록        
	    	    
	    	    if(selectdetail.length>150){
	    	    	selectdetail = selectdetail.substr(0,150)+"...";
	    	    }
	    	      var infomation = {
	    	            position: new google.maps.LatLng(mapy , mapx ),
	    	             type: selecttype,
	    	             image: firstimage,
	    	             title: title,
	    	             contenttypeid : contenttypeid,
	    	             mapx : mapx,
	    	             mapy : mapy,
	    	             contentid: contentid,
	    	             detail: selectdetail
	    	       };
	    	 
	    	    
	    	    var valuename = "즐겨찾기추가";
	    	   
	    	       for(var i=0; i<model7.length; i++){
	    	    	  
	    	              if(model7[i].favoriteLocation == contentid){
	    	                 valuename = "즐겨찾기삭제";
	    	              }
	    	          
	    	        }
	    	  
	    	    
	    	  var index = 0;//마커 이벤트 등록할 index
	    	  // 마커에 이벤트 등록하고 맵에 넣기
	    	  		alert("찍어보기");
	    	     	alert(infomation.position);
	    	     	alert(icons[infomation.type].icon);
	    	
	    	        var marker = new google.maps.Marker({
	    	          position: infomation.position,
	    	          icon: icons[infomation.type].icon,
	    	          map: map
	    	        });
	    	        
	    	        
	    	        
	    	        var image;
	    	        var noimage = infomation.image;
	    	        if(noimage ==null){
	    	           image = '<img src="/MapHack/resource/infodetail/images/no_detail_img.gif" width=100% height=300/>';
	    	           
	    	        }else{
	    	           image = '<img src="'+noimage+'"width=100% height=300/>';
	    	        }
	    	        
	    	        var contentString = '<div id="content">'+
	    	        '<h6 id="firstHeading" class="firstHeading" style="text-align:center;"><img name="'+infomation.contentid+'" src="/MapHack/resource/makemap/images/liston.png" id="listbtn" value="리스트추가" onclick="listbtnadd(this,'+"'"+
	    	        infomation.contentid+"','"+valuename+"','"+infomation.title+
	    	        "','"+infomation.image+"','"+infomation.mapx+"','"+infomation.mapy+
	    	        "','"+infomation.contenttypeid+
	    	        "'"+')" style="float:left;width:7%">'+infomation.title+'<img name="'+infomation.contentid+'" src="/MapHack/resource/makemap/images/likeon.png" id="favoritebtn" value="'+valuename+'" onclick="btnadd(this,'+infomation.contentid+','+"'"+valuename+"'"+')" style="float:right;width:7%"></h6>'+
	    	        '</div>'+
	    	        '<div id="siteNotice" style="float:left; width:30%;">'+
	    	        
	    	        image+
	    	        
	    	        '</div>'+
	    	        
	    	        '<div id="bodyContent" style="float:right; width:60%;">'+
	    	        '<p>'+infomation.detail+'</p>' +
	    	        '</div>'+
	    	        '<div style="clear:both;">' +
	    	        '</div>';// 다이얼 로그 내용 등록
	    	        var infowindow = new google.maps.InfoWindow({
	    	            content: contentString
	    	         });
	    	        //마커에 다이얼로그 이벤트 등록
	    	        marker.addListener('click', function() {
	    	            infowindow.open(map, marker);
	    	         });
	    	        
	    	        
	      }
	 });
	
    
      
      
      
      
}
//즐겨찾기 이벤트
function btnadd(button,title,favorite){

    var iLocation = title;
    var favoritename = button.value;
  
   
    if(favoritename == "즐겨찾기추가" || favoritename==undefined){
    	button.src = "/MapHack/resource/makemap/images/likeoff.png"
       $.ajax({
           url: "favorite.mh",
           type: "GET",
           data: "bmIlocation="+iLocation,
           success: function(data){
              if(data == "등록완료"){
                 button.value = "즐겨찾기삭제";
                 alert(data);
              }
           }
        });
    }else{
    	button.src = "/MapHack/resource/makemap/images/likeon.png"
       $.ajax({
          url: "favoritedel.mh",
          type: "GET",
          data: "bmIlocation="+iLocation,
          success: function(data){
             if(data == "해제완료"){
                button.value = "즐겨찾기추가";
                alert(data);
             }
          }
       });
    }
    
 }

function listbtnadd(button,contentid,name,title,firstimage,mapx,mapy,contenttypeid){

   var list = {};
   
    var listname = button.value;
    
    if(listname == "리스트추가"||listname == undefined ){
    	alert("추가");
    	button.value = "리스트삭제";
        button.src = "/MapHack/resource/makemap/images/listoff.PNG"
        	
        list.contentid = contentid;
           list.title = title;
           list.firstimage = firstimage;
           list.mapx = mapx;
           list.mapy = mapy;
           list.contenttypeid = contenttypeid;
           step1list.push(list);
           stepAddMarker(step1list);
           if(step1list.length==0){
        	   start = new google.maps.LatLng(mapy, mapx);
        	   end = new google.maps.LatLng(mapy, mapx);
        	   directionsDisplay.setMap(map);
           }else if(step1list.length==1){
        	   start = end;
        	   end = new google.maps.LatLng(mapy, mapx);
        	   var request = {
        		          origin:start,
        		          destination:end,
        		          travelMode: eval("google.maps.DirectionsTravelMode."+"TRANSIT")
        		      };
        		      directionsService.route(request, function(response, status) {
        		        alert(status);  // 확인용 Alert..미사용시 삭제
        		        if (status == google.maps.DirectionsStatus.OK) {
        		            directionsDisplay.setDirections(response);
        		            var route = response.routes[0];
        		            alldistance = 0;
            		        for (var i = 0; i < route.legs.length; i++) {
               	            
               	              alert(route.legs[i].distance);
               	              alldistance += route.legs[i].distance;
               	            }
               		       alert("총거리 : "+alldistance);
        		        }else{
         		        	alert("경로가 존재하지 않습니다");
         		        }
        		       
           		       
        		      });
           }else{
        	   waypts.push({
                   location: new google.maps.LatLng(mapy, mapx),
                   stopover: true
               });
        	   var request = {
     		          origin:start,
     		          destination:end,
     		          waypoints: waypts,
     		          optimizeWaypoints: true,
     		          travelMode: eval("google.maps.DirectionsTravelMode."+"TRANSIT")
     		      };
     		      directionsService.route(request, function(response, status) {
     		        alert(status);  // 확인용 Alert..미사용시 삭제
     		        if (status == google.maps.DirectionsStatus.OK) {
     		        	 directionsDisplay.setDirections(response);
     		            var route = response.routes[0];
     		            alldistance = 0;
         		        for (var i = 0; i < route.legs.length; i++) {
            	            
            	              alert(route.legs[i].distance);
            	              alldistance += route.legs[i].distance;
            	            }
            		       alert("총거리 : "+alldistance);
     		            
     		        }else{
     		        	alert("경로가 존재하지 않습니다");
     		        }
     		      
     		       
     		     });
        	   
           }
           
          
           
          
            $.ajax({
               url : "/MapHack/addMarker.mh",
               dataType: 'text',
                data: {
                     "contentid" : contentid,
                    "title" : title,
                    "firstimage" : firstimage,
                    "mapx" : mapx,
                    "mapy" : mapy,
                    "contenttypeid" : contenttypeid},
               success(data){
               
               },
               error(err){
                
               }
            });
    }else{
    	alert("삭제");
    	   button.value = "리스트추가";
           button.src = "/MapHack/resource/makemap/images/liston.png"
       for(var i=0;i<step1list.length;i++){
          if(step1list[i].contentid==contentid){
             step1list.pop(i);
          }
       }
       stepAddMarker(step1list);
    
        $.ajax({
            url : "/MapHack/deleteMarker.mh",
            dataType: 'text',
            data: {
            "contentid" : contentid,
           "title" : title,
           "firstimage" : firstimage,
           "mapx" : mapx,
           "mapy" : mapy,
           "contenttypeid" : contenttypeid},
            success(data){
              
            },
            error(err){
               
            }
         })
    }
    
   
 }

   


function markCancel(button){
   button.parentNode.remove();
   contentid = button.parentNode.childNodes[4].value;
   for(var i=0;i<step1list.length;i++){
      if(step1list[i].contentid==contentid){
         step1list.pop(i);
      }
   } 
   
    $.ajax({
          url : "/MapHack/deleteMarker.mh",
          dataType: 'text',
            data: {
                 "contentid" : contentid,
                "title" : title,
                "firstimage" : firstimage,
                "mapx" : mapx,
                "mapy" : mapy,
                "contenttypeid" : contenttypeid},
          success(data){
         
          },
          error(err){
          
          }
       })
}

function stepAddMarker(step1list){
   
   arr = step1list;
   
    var slide_inner = $('#step1list');
    slide_inner.empty();
    
    var arr_index = arr.length;
    //나머지 변수 var ? = arr_index % 4
    var img_index = 0;
  
    var itemactive = $("<div class='item active'></div>");
//     alert(Math.ceil(arr_index/4));
//     alert("나머지"+ arr_index%4);
      var iteration;
      if(arr_index % 4 > 0){
         iteration= Math.ceil(arr_index/4)-1;
      }else{
         iteration= Math.ceil(arr_index/4);
      }
      alert("iteration : "+iteration );
    for(var i=0 ; i<iteration;i++){
      //i==0
      //a태그묵는것 시작  붙이고
      
     var item = $("<div class='item'></div>");
var row = $("<div class='row'></div>");
     
      for(var j=0;j<4;j++){
         //a태그 하나씩
         if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//           alert("["+img_index+"]"+arr[img_index].firstimage);
         
        

    var colmd3 = $("<div class='col-sm-3 col-md-3 col-xs-3' style='background-color:#ffffff'></div>");
    var thumbnail =$("<a class='thumbnail' href='#''></a>");
    var imgtitle = $("<div style='text-align:center'>"+arr[img_index].title+"</div>");
    var cancel = $("<input type='button'style='width:100%' value='X' class='cancel' onclick='markCancel(this)'></input>");
    var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
    var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
   var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
    var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");

  var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
   var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
  var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
  var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    


   
   

         
        if(arr[img_index].firstimage!='no'){   
        thumbnail.append(img);
       }else{
       thumbnail.append(imgnull);
       }
       colmd3.append(thumbnail);
       colmd3.append(imgtitle);
       colmd3.append(cancel);
       colmd3.append(title);
     colmd3.append(index);
     colmd3.append(contentid);
     colmd3.append(contenttypeid);
     colmd3.append(mapx);
     colmd3.append(mapy);
     row.append(colmd3);    
     
         img_index++;
      }
     //item 넣주기
     if(i==0){
     itemactive.append(row);
     }else{
     item.append(row);
     }
     
     

      //a태그 묵는것 닫는것 붙여
   }


   if(iteration==0){
      
   }else if(iteration == 1){
       slide_inner.append(itemactive);
   }else{
       slide_inner.append(itemactive);
       slide_inner.append(item); 
   }
 
 

 
   
  //나머지에대한 처리
  
    //i==0
    //a태그묵는것 시작  붙이고
    
    if((arr_index%4!=0)&&(iteration!=0)){
       var item = $("<div class='item'></div>");
        var row = $("<div class='row'></div>");
             
        
              for(var j=0;j<arr_index%4;j++){
                 //a태그 하나씩
                 if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                   alert("["+img_index+"]"+arr[img_index].firstimage);
                 
                
 
            var colmd3 = $("<div class='col-sm-3 col-md-3  col-xs-3' style='background-color:#ffffff' ></div>");
            var imgtitle = $("<div style='text-align:center'>"+arr[img_index].title+"</div>");
            var cancel = $("<input type='button' style='width:100%' value='X' class='cancel' onclick='markCancel(this)'></input>");
            var thumbnail =$("<a class='thumbnail' href='#'></a>");
            var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
            var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
           var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
            var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
          var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
         var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
          var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
          var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

           
           
       
                 
                if(arr[img_index].firstimage!='no'){   
                thumbnail.append(img);
               }else{
               thumbnail.append(imgnull);
               }
             
               colmd3.append(thumbnail);
               colmd3.append(imgtitle);
               colmd3.append(cancel);
               colmd3.append(title);
             colmd3.append(index);
             colmd3.append(contentid);
             colmd3.append(contenttypeid);
             colmd3.append(mapx);
             colmd3.append(mapy);
             row.append(colmd3);    
             
                 img_index++;
              }
             //item 넣주기
                
             item.append(row);
             slide_inner.append(item); 
    
    }else if((arr_index%4!=0)&&(iteration==0)){
       
       var itemactive = $("<div class='item active'></div>");
        var row = $("<div class='row'></div>");
             
        
              for(var j=0;j<arr_index%4;j++){
                 //a태그 하나씩
                 if( arr[img_index].firstimage == undefined ) arr[img_index].firstimage = 'no';
//                   alert("["+img_index+"]"+arr[img_index].firstimage);
                 
                
 
            var colmd3 = $("<div class='col-sm-3 col-md-3  col-xs-3' style='background-color:#ffffff'></div>");
            var imgtitle = $("<div style='text-align:center'>"+arr[img_index].title+"</div>");
            var cancel = $("<input type='button' style='width:100%'  value='X' class='cancel' onclick='markCancel(this)'></input>");
            var thumbnail =$("<a class='thumbnail' href='#''></a>");
            var img = $("<img src='"+arr[img_index].firstimage+"'></img>");
            var imgnull = $("<img src='/MapHack/resource/infodetail/images/no_detail_img.gif'></img>");
           var title = $("<input type='hidden' value='"+arr[img_index].title+"' name= 'title'></input>");
            var index = $("<input type='hidden' value='"+img_index+"' name= 'index'></input>");
          var contentid = $("<input type='hidden' value='"+arr[img_index].contentid+"' name= 'contentid'></input>"); 
         var contenttypeid = $("<input type='hidden' value='"+arr[img_index].contenttypeid+"' name= 'contenttypeid'></input>");    
          var mapx = $("<input type='hidden' value='"+arr[img_index].mapx+"' name= 'mapx'></input>");    
          var mapy = $("<input type='hidden' value='"+arr[img_index].mapy+"' name= 'mapy'></input>");    

           
           
       
                 
                if(arr[img_index].firstimage!='no'){   
                thumbnail.append(img);
               }else{
               thumbnail.append(imgnull);
               }
               
               colmd3.append(thumbnail);
               colmd3.append(imgtitle);
               colmd3.append(cancel);
               colmd3.append(title);
             colmd3.append(index);
             colmd3.append(contentid);
             colmd3.append(contenttypeid);
             colmd3.append(mapx);
             colmd3.append(mapy);
             row.append(colmd3);    
             
                 img_index++;
              }
             //item 넣주기
                
             itemactive.append(row);
             slide_inner.append(itemactive); 
       
    
       
    }
}