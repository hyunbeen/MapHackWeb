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
<script>
function makeMember(){
	alert("회원가입 하기");
	location.href="/MapHack/join.mh";
}

</script>

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
		<div class="col-md-offset-5 col-md-4">
            <div class="form-login">
            <h4>MapHack Login</h4>
            </br>
            </br>
            <label>아이디</label>
            <input type="text" id="userId" style="border: none;height: 50px;width: 54%;margin-left:5%;" placeholder="user id" />
            </br>
            <label>비밀번호</label>
            <input type="password" id="userPassword" style="border: none;height: 50px;width: 50%;margin-left:5%;" placeholder="password" />
            </br>
            </br>
            </br>
            <div class="wrapper">
            <span class="group-btn">     
                <input type="button" class="btn btn-primary btn-md" value="로그인" onclick="loginConfirm()">
            </span>
            <span class="group-btn">     
                <input type="button" class="btn btn-primary btn-md" value="회원가입" onclick="makeMember()">
            </span>
            </div>
            </div>
        
        </div>
       
	</div>
	
         
 </div>
            
                  
           
    </section>

			
             
                 
    <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    	
    	<script src="/MapHack/resource/main/js/core.min.js"></script>
	<script src="/MapHack/resource/main/js/script.js"></script>
	<script src="/MapHack/resource/login/js/login.js"></script>
</body>
</html>