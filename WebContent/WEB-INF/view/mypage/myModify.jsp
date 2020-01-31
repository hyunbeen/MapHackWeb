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
     		<h2>회원 정보수정</h2>
        </div>
    </div>
             
       <hr>
     
     
     
     <div class="style-switcher-container">
            <div class="style-switcher-toggle-wrap"> 
            </div>
            <section class="section section-lg text-center" style="padding-top: 25px;">
              <div class="shell shell-wide">
                <div class="range range-50 range-md-center"> 
               
                  <div class="cell-md-10 cell-lg-7 cell-xl-6">
                     <img alt="" src="/MapHack/resource/mypage/images/monitor.png" style="height: 9%">
                    <h4>비밀번호 확인</h4>
                    <br>
                    <h8>본인 확인을 위해 한번 더 비밀번호를 입력해주세요</h8><br>
                    <h8>비밀번호는 타인에게 노출되지 않도록 주의해주세요</h8>
                    <!-- RD Mailform-->
                    <form class="rd-mailform rd-mailform-small" data-form-output="form-output-global" 
                    data-form-type="contact" method="post" action="bat/rd-mailform.php"
                    style="padding-top: 2%">
                      <div class="form-wrap form-wrap-validation">
                        <input class="form-input" id="form-1-email" type="email" name="email" data-constraints="@Email @Required">
                        <label class="form-label" for="form-1-email">아이디</label>
                      </div>
                      <div class="form-wrap form-wrap-validation">
                        <input class="form-input" id="form-1-password" type="password" name="password" data-constraints="@Required">
                        <label class="form-label" for="form-1-password">비밀번호</label>
                      </div>
<!--                       <div class="form-wrap form-wrap-validation"> -->
<!--                         <input class="form-input" id="form-1-password-confirm" type="password" name="password-confirm" data-constraints="@Required"> -->
<!--                         <label class="form-label" for="form-1-password-confirm">Confirm Password</label> -->
<!--                       </div> -->
						<hr style="width: 150%; margin-left: -30%">
                      <div class="form-button" style="padding-top: 10%; width: 50%; margin-left: 20%">
                        <button class="button button-block button-secondary button-nina" type="submit">다음</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </section>
          </div>
      
      
      
      
      
      
      </div>
      
                         
          <script src="/MapHack/resource/main/js/core.min.js"></script>
    <script src="/MapHack/resource/main/js/script.js"></script>
    
    <script src="/MapHack/resource/mypage/js/acordianStyle.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>

                        
                    
                 
</body>
</html>