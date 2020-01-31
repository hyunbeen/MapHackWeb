function loginConfirm(){

	var id = document.getElementById("userId").value;
	var pw = document.getElementById("userPassword").value;

	$.ajax({
		url:"/MapHack/loginconfirm.mh",
		data: {mId : id, mPass: pw},
		success(data){

			if(data > 0){
				alert("로그인 성공");
				location.replace("main.mh");
			}else{
				alert("아이디나 비밀번호를 확인하세요");
			}
		},
		error:function(request,status,error){
	        alert("error:"+error);
	       }
	});
}



	
