<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- #####부트스트랩 , CSS _ START #####-->
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- #####부트스트랩 , CSS _ END ####-->

</head>

<body>

<div class="page">

<jsp:include page="/WEB-INF/view/include/header.jsp" />

      <section class="section fullwidth-page bg-image bg-image-4">
        <div class="fullwidth-page-inner">
          <div class="section-lg text-center" style="padding-top: 5px; padding-bottom: 197px;">
            <div class="shell">
              <h3 style="margin-left: 9px;">MapHack 회원가입</h3>
               <div class="divider divider-default" style="min-width: 250px;"></div>
                  <!-- RD Mailform-->
                  <div class="row" style="margin-top: 80px;">
                  <div class="col-md-2"></div>
                  <div class="col-md-8">
                  <form class="" data-form-output="form-output-global" data-form-type="contact" method="post" action="">
                    
                    <div class="row" style="width: 754px;">
                    <div class="col-md-10">
                     <div class="form-wrap form-wrap-validation">
                      <input class="form-input" id="form-1-email" type="id" name="id" style="max-height: 54px;  
                      padding-top: 13px;padding-bottom: 14px;max-width: 641px; padding-right: 0px;">
                      <label class="form-label" for="form-1-email">아이디</label>
                    </div>
                    </div>
                    <div class="col-md-2" style="padding-left: 0px; padding-right: 0px;">
                     	<input type="button" class="btn btn-primary btn-md" style="border-radius: 3px; 
                     	 margin-top: 0px; min-height: 61.9px; background-color: green;  border-color: green;
                     	   padding-top: 13px;padding-bottom: 14px;" value="아이디 중복확인" onclick="responseEmail()"/>
                   	</div>
                   	</div>	
                   	
                   	<hr style="margin-top: 16px; margin-bottom: -4px;"/>
                    
                    <div class="row" style="margin-top: 20px;">
                    <div class="col-md-6">
	                    <div class="form-wrap form-wrap-validation">
	                      <input class="form-input" id="form-1-password" type="password" name="password" 
	                      data-constraints="@Required" style="min-height: 45px;">
	                      <label class="form-label" for="form-1-password">비밀번호</label>
	                    </div>
                    </div>
                     <div class="col-md-6">
	                     <div class="form-wrap form-wrap-validation">
	                      <input class="form-input" id="form-1-password-confirm" type="password" name="password-confirm" data-constraints="@Required" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;">
	                   	  <label class="form-label" for="form-1-password-confirm">비밀번호 확인</label>
	                     </div>
                    </div>
                    </div>
                    
                    <hr style="margin-top: 16px; margin-bottom: -4px;"/>
                    
                    <div class="row">
                    	<div class="col-md-6">
		                    <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <input class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                      <label class="form-label" for="form-1-username">이름</label>
		                    </div>
	                   </div>
	                    
	                    <div class="col-md-6">
		                     <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <input class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                      <label class="form-label" for="form-1-username">닉네임</label>
		                    </div>
	                     </div>
                    </div>
                    
                    
                    <hr style="margin-top: 16px; margin-bottom: -4px;"/>
                    
                    
                    <div class="row" style="margin-top: 20px;">
                    <div class="col-md-6" style="padding-right: 0px; max-width: 380px;">
                    <div class="form-wrap form-wrap-validation">
                      <input class="form-input" id="form-1-email" type="email" name="email" data-constraints="@Email @Required">
                      <label class="form-label" for="form-1-email">이메일</label>
                     </div>  
                     </div>
                       <div class="col-md-1" style="padding-left: 0px;padding-right: 0px;">   
                       	 <input type="button" class="btn btn-primary btn-md" value="인증" style="border-radius: 3px; min-height: 60.6px;
                       	   padding-top: 13px;padding-bottom: 14px;background-color: red;
   					 border-color: red; margin-top: 0px;" onclick="sendEmail()"/>
                       </div>
                      <div class="col-md-4" style="padding-right: 0px"> 
		                    <div class="form-wrap form-wrap-validation">
		                      <input id="responseemail" class="form-input" id="form-1-email" type="email" name="email" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" data-constraints="@Email @Required">
		                      <label class="form-label" for="form-1-email">인증번호 입력</label>
		                     </div>  
                       </div>
                       <div class="col-md-1" style="padding-left: 0px;padding-right: 0px;"> 
<!--                         <input style="border: none;height: 50px;width: 15%;margin-left:5%;"  id="responseemail"  placeholder="인증번호입력"> -->
                        	<input type="button" class="btn btn-primary btn-md" style="background-color: green;  border-color: green;border-radius: 3px;  
                        	margin-top: -1px; min-height: 60.6px;;  padding-top: 13px;padding-bottom: 14px;" value="완료" onclick="responseEmail()"/>
                   		</div>
                   </div>
                    
                     
                    <hr style="margin-top: 16px; margin-bottom: -4px;"/> 
                     
                       <div class="row">
                    	<div class="col-md-6">
		                    <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <select class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                      	  <option>성별</option>
		                      	  <option>남자</option>
                        		  <option>여자</option>
		                      </select>
		                    </div>
	                   </div>
	                    
	                    <div class="col-md-6">
		                     <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <input class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                      <label class="form-label" for="form-1-username">생년월일 (YYYY-MM-DD)</label>
		                    </div>
	                     </div>
                    </div>
                    
                    
                   <hr style="margin-top: 16px; margin-bottom: -4px;"/>     
                    
                   <div class="row" style="margin-left: 27px; margin-bottom: 58px;">
                       <div class="col-md-2">
                       <label style="margin-top: 36px;">핸드폰번호</label>
                       </div>
                       
                    	<div class="col-md-3">
		                    <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <input class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                    </div>
	                   </div>
	                    -
	                    <div class="col-md-3" style="padding-left: 0px;">
		                     <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <input class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                    </div>
	                     </div>
	                     -
	                      <div class="col-md-3" style="padding-left: 0px;">
		                     <div class="form-wrap form-wrap-validation" style="margin-top: 20px;">
		                      <input class="form-input" id="form-1-username" type="text" style="max-height: 54px;  padding-top: 13px;padding-bottom: 14px;" name="username" data-constraints="@Required">
		                    </div>
	                     </div> 
                    </div> 
                     
                     
                      <div class="divider divider-default" style="min-width: 790px; margin-left: -12px; height: 6px;"></div>
						
                    <div class="form-button">
                    <div class="row">
                     <div class="col-md-8">
	                      <button class="button button-block button-secondary button-nina" style="border-radius: 3px;">회원가입 완료</button>
	                 </div>     
	                  <div class="col-md-2">    
	                       <button class="button button-block button-secondary button-nina" style="border-radius: 3px; background-color: rgba(87, 204, 135,1)">취소</button>
                    	</div>
                     </div>
                    </div>
                  </form>
                  </div>
                  <div class="col-md-2"></div>
                </div> 
            </div>
          </div>
        </div>
      </section>
          <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    </div>

			
             
                 
    	<script src="/MapHack/resource/join/js/join.js"></script>
    	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
	<script src="/MapHack/resource/login/js/login.js"></script>
</body>
</html>