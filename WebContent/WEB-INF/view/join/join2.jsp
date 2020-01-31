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


		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		 <!-- Default Image Background-->
      <section class="section section-lg bg-white" style="background-color: #cfecf4; margin-top: -30px; padding-bottom: 0px;">
        <!-- section wave-->
      
        <div class="section-xxl bg-image context-dark" style="background-image: url(/MapHack/resource/main/images/mainCustom/cacao.png); padding-bottom: 502px;">
<!--           <div class="shell"> -->
<!--             <h3>Default image background</h3> -->
<!--           </div> -->
        </div>
      </section>
  <section class="section section-xl bg-gray-lighter">

<div class="container" style="width:100%">
	<div class="row">
		
        <div class="col-md-offset-1 col-md-4" style="width:100%"" id="join">
        	<h3>회원가입</h3>
                    
                    <form class="rd-mailform rd-mailform-medium" data-form-output="form-output-global" data-form-type="contact" method="post">
                      <div class="form-wrap form-wrap-validation">
                        <label>아이디</label>
                        <input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="text" id="id"  placeholder="아이디">
                        
                      </div>
                       <div class="form-wrap form-wrap-validation">
                       <label>패스워드</label>
                        <input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="password" id="password"  placeholder="패스워드">
                        
                      </div>
                      <div class="form-wrap form-wrap-validation">
                      	 <label>패스워드확인</label>
                        <input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="password" id="password_confirm" placeholder="패스워드 확인">
                        
                      </div>
                       <div class="form-wrap form-wrap-validation">
                        <label>이름</label>
                        <input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="text" id="name"  placeholder="이름">
                        
                      </div>
                      <div class="form-wrap form-wrap-validation">
                       <label>이메일</label>
                        <input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="email" id="email"  placeholder="이메일">
                        
                        <input type="button" class="btn btn-primary btn-md" value="이메일 인증" onclick="sendEmail()"/>
                        <input style="border: none;height: 50px;width: 15%;margin-left:5%;"  id="responseemail"  placeholder="인증번호입력">
                        <input type="button" class="btn btn-primary btn-md" value="인증완료" onclick="responseEmail()"/>
                      </div>
                      <div class="form-wrap form-wrap-validation">
                       <label>닉네임</label>
                        <input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="text" id="nickname" placeholder="닉네임">
                        
                      </div>
                       <div class="form-wrap form-wrap-validation">
                       <label>핸드폰</label>
                        <input style="border: none;height: 50px;width: 15%;margin-left:5%;" type="text" id="phone">
                        <input style="border: none;height: 50px;width: 15%;margin-left:2%;" type="text" id="phone2">
                        <input style="border: none;height: 50px;width: 15%;margin-left:2%;" type="text" id="phone3">
                      </div>
                    
                       <div class="form-wrap form-wrap-validation">
                       <label>성별</label>
                        <select style="border: none;height: 50px;width: 30%;margin-left:5%;" id="gender" data-constraints="@Required">
                        <option>남자</option>
                        <option>여자</option>
                       </select>
                      </div>
                       <div class="form-wrap form-wrap-validation">
                        <label>생일입력</label><input style="border: none;height: 50px;width: 30%;margin-left:5%;" type="date" id="datepicker"placeholder="생일 입력">
						</div>
                      <div class="form-button">
                        <button class="btn btn-primary btn-md" type="button" onclick="joinComplete()">회원가입하기</button>
                        <button class="btn btn-primary btn-md" onclick="joinCancel()" id="cancel" type="button">취소</button>
                      </div>
                    </form>
        
        
        
        
        
        
        
        
        
        
        </div>
	</div>
	
         
 </div>
            
                  
           
    </section>

			
             
                 
    <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    	<script src="/MapHack/resource/join/js/join.js"></script>
    	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
	<script src="/MapHack/resource/login/js/login.js"></script>
</body>
</html>