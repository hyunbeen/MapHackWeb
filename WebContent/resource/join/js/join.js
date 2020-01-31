
function joinCancel(){
	alert("회원가입 취소");
	location.href='/MapHack/main.mh';
}
//입력값을 확인하고 디비에 저장
function joinComplete(){
	
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var password = document.getElementById("password").value;
	var password_confirm = document.getElementById("password_confirm").value;
	var email = document.getElementById("email").value;
	var nickname = document.getElementById("nickname").value;
	var phone = document.getElementById("phone").value;
	var phone2 = document.getElementById("phone2").value;
	var phone3 = document.getElementById("phone3").value;
	var phoneall = phone + phone2 + phone3;
	var gender = document.getElementById("gender").value;
	var birth = document.getElementById("datepicker").value;
	if(name == ""){
		alert("이름을 입력해주세요");
	}else if(id == ""){
		alert("id를 입력해주세요");
	}else if(password == ""){
		alert("패스워드을 입력해주세요");
	}else if(password_confirm == ""){
		alert("패스워드 확인을 입력해주세요");
	}else if(email == ""){
		alert("이메일을 입력해주세요");
	}else if(nickname == ""){
		alert("닉네임을 입력해주세요");
	}else if(phone == ""){
		alert("핸드폰 번호를 입력해주세요");
	}else if(phone2 == ""){
		alert("핸드폰 번호를 입력해주세요");
	}else if(phone3 == ""){
		alert("핸드폰 번호를 입력해주세요");
	}else if(gender == ""){
		alert("성별을 입력해주세요");
	}else if(birth == ""){
		alert("생일을 입력해주세요");
	}else if(password != password_confirm){
		alert("패스워드가 다릅니다");
	}else{
		$.ajax({
			url:"/MapHack/makeMember.mh", 
			data: {mId : id, mPass: password,mNickname:nickname ,mName:name ,mMobile:phoneall ,mEmail :email ,mGender :gender,mBirth :birth}, 
			success(data){

				if(data == 1){
					alert("회원가입 성공");
					alert("로그인을 다시 해주세요");
					location.replace("login.mh");
				}else if(data == 0){
					alert("회원가입 실패");
				}else{
					alert("이메일 인증을 완료해주세요");
				}
			},
			error:function(request,status,error){
		        alert("error:"+error);
		       }
		});
		
	}
	
}

function sendEmail(){
	//가입 이메일 보내기
	var sendemail = document.getElementById("email").value;
	alert("가입 이메일을 보냈습니다");
	$.ajax({
		url:"/MapHack/sendEmail.mh", 
		data: {"email" : sendemail}, 
		success(data){
			
		},
		error:function(request,status,error){
	        alert("error:"+error);
	    }
	});
}

function responseEmail(){
	//가입 인증 확인 
	var emailpass = document.getElementById("responseemail").value;
	if(emailpass==""){
		alert("인증 번호를 입력해주세요")
	}else{
		$.ajax({
			url:"/MapHack/emailPass.mh", 
			data: {"emailpass" : emailpass}, 
			success(data){
				alert("성공 : "+data);
			},
			error:function(request,status,error){
		        alert("error:"+error);
		    }
		});
	}
}