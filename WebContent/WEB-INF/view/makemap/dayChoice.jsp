<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/MapHack/"></script>

<link rel="stylesheet" type="text/css"
   href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
<link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
<link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">

<link rel="stylesheet"
   href="/MapHack/resource/main/css/fl-bigmug-line.css">



</head>
<body>



   <!-- 일정선택-->
   <section class="section section-lg bg-white text-center">
   <div class="shell">
      <div class="range range-xs-center">
         <div class="cell-sm-10 cell-lg-8">
            <h3>일정 선택</h3>
            <!-- RD Mailform-->
            <form class="rd-mailform" data-form-output="form-output-global"
               data-form-type="contact" method="post" action="bat/rd-mailform.php">
               <div class="range range-20">
                  <div class="cell-sm-6">
                     <div class="form-wrap form-wrap-validation">
                        <label class="form-label-outside" for="form-1-name">시작일자
                           </label> <input class="form-input datepicker1" id="form-1-name"
                           type="text" name="name" data-constraints="@Required" />
                     </div>
                  </div>
                  <div class="cell-sm-6">
                     <div class="form-wrap form-wrap-validation">
                        <label class="form-label-outside" for="form-1-last-name">종료일자
                           </label> <input class="form-input datepicker2"
                           id="form-1-last-name" type="text" name="last-name"
                           data-constraints="@Required" />
                     </div>
                  </div>
                  
                  <div class="cell-sm-6">
                     <div class="form-wrap form-wrap-validation">
                        <button class="button button-secondary button-nina"
                           type="button" onclick="dayok()">일정입력</button>
                     </div>
                  </div>
                  
                  <div class="cell-sm-6">
                     <div class="form-wrap form-wrap-validation">
                        <button class="button button-secondary button-nina"
                           type="button" onclick="daycancel()">취소</button>
                     </div>
                  </div>
                  
                  

                   
               </div>
            </form>
         </div>
      </div>
   </div>
   </section>



   <script type="text/javascript">

               $.datepicker.setDefaults({
                   dateFormat: 'yy-mm-dd',
                   prevText: '이전 달',
                   nextText: '다음 달',
                   monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                   monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                   dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                   dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                   dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                   showMonthAfterYear: true,
                   yearSuffix: '년',
                   
                 });

                 $(function() {
                   $(".datepicker1, .datepicker2").datepicker();
                 });
                 
            
             
               
               
               function dayok(){
                  var startdate = new Date($('.datepicker1').val());
                     var enddate = new Date($('.datepicker2').val());
                     var dayindex = enddate.getTime()-startdate.getTime();
                        dayindex= Math.floor(dayindex / (1000 * 60 * 60 * 24))+1;

                     var start = $('.datepicker1').val(); //date형식의 startdate
                     var end = $('.datepicker2').val();
                  alert("데이인덱스 :"+dayindex);
                  if(dayindex>0){
                    $.ajax({
                     url: "sendDay.mh",
                     type: "GET",
                     data : {
                        startdate : start,
                        enddate : end,
                       dayindex : dayindex },
                     success: function(data){
                        
                       
                        $(opener.document).find("#step2iframe").attr('src',"/MapHack/step2.mh");
                        
                       

                        window.close()
//                         $(opener.document).find("#step2").html("abc");
//                         $(opener.document).find("#step2").append("<"+"jsp"+":include page"+"="+"'/step2.mh'"+"/"+">");
                     }
                 }); 
                     
                     
                     
                    
                  }else{
                     alert("시작일자가 종료일자보다 큽니다.")
                  }
//                   
                  }
               
               function daycancel(){
                  
                  window.close();
                  }
            

               </script>




</body>
</html>
