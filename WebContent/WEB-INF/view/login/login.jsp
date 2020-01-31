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

      <section class="section fullwidth-page bg-image bg-image-4" style=" padding-top: 0px;">
        <div class="fullwidth-page-inner" style="height: 650px;">
          <div class="section-lg text-center">
            <div class="shell">
              <h3>MapHack</h3>
               <div class="divider divider-default" style="min-width: 250px;"></div>
              <div class="range range-xs-center">
                <div class="cell-sm-8 cell-md-6 cell-lg-4">
                  <!-- RD Mailform-->
                  <form class="rd-mailform rd-mailform-small" data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php">
                    
                    <div class="form-wrap form-wrap-validation">
                      <input class="form-input" id="userId" type="email" name="email" data-constraints="@Email @Required">
                      <label class="form-label" for="form-1-email">아이디</label>
                    </div>
                   
                    <div class="form-wrap form-wrap-validation">
                      <input class="form-input" id="userPassword" type="text" name="username" data-constraints="@Required">
                      <label class="form-label" for="form-1-username">비밀번호</label>
                    </div>
                 
                 
                
                 <div class="form-button">
<!--                     <div class="row"> -->
<!--                     	<div class="col-md-2"> -->
<!--                       	 	<button class="button button-block button-secondary button-nina"  -->
<!--                       	   style="min-width: 180px; border-radius: 8px;" type="submit">회원가입</button> -->
<!--                       	</div> -->
<!--                       	<div class="col-md-2"> -->
                      		<button class="button button-block button-secondary button-nina" 
                      		 style="/* margin-left: 122px; */ min-width: 180px; border-radius: 8px;" onclick="loginConfirm()">로그인</button>
<!--                     	</div> -->
<!--                     </div> -->
                 </div>   
                 <h7 style="margin-left: 165px;">MapHack 회원가입 하러가기</h7>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <jsp:include page="/WEB-INF/view/include/footer.jsp" />
      
    </div>
















<script>
function makeMember(){
	alert("회원가입 하기");
	location.href="/MapHack/join.mh";
}

</script>

    	
    	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
	<script src="/MapHack/resource/login/js/login.js"></script>
</body>
</html>