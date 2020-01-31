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
     		<h2>친구관리</h2>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-4">
         <div  class="button button-xs button-secondary button-nina button-ellipse-md button-shadow" 
           style="float: right;"> ＋ 새 친구 등록하기</div> 
         </div>
    </div>
             
       <hr>
                    
     

                     
		<div id="accordion" role="tablist" aria-multiselectable="true">
  <div class="card">
    <div class="card-header" role="tab" id="headingOne">
      <h5 class="mb-0">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          친구리스트
        </a>
      </h5>
      
    </div>

    <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="card-block">
      
         <div class="table-novi table-custom-responsive">
         
         <div class="row">
    	<div class="col-sm-5">
         <p>친구관리(친구리스트)</p>
         </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-4">
							<span class="button-my-checkbox">
								<button type="button" class="btn" data-color="info" id="checkall">전체선택</button>
								<input type="checkbox" id="checkall" class="hidden"  />
							</span> <span class="my2-button-checkbox">
								<button type="button" class="btn" data-color="danger">선택삭제</button>
								<input type="checkbox" class="hidden" checked />
							</span>
         </div>
    </div>
   				<br>
   				
                <table class="table-custom table-hover col-sm-12">
                  <thead>
                    <tr>
                      <th>No.</th>
                      <th>친구 아이디</th>
                      <th>친구 닉네임</th>
                      <th>선택</th>
                    </tr>
                  </thead>
                  <tbody>
  				 <% int selectsize = 11; %>
       		  		 <% for(int i=1; i<selectsize; i++ ) { %>
                   	 <tr>
                      <td><%= i %></td>
                      <td>친구 아이디 <%= i %></td>
                      <td>친구 닉네임 <%= i %></td>
                      <td><input type="checkbox" name="chk6" /></td>
                   	 </tr>
                 <% } %>
                  </tbody>
                </table>
              </div>
    		  </div>
    		</div>
  		</div>
  
  
  
  <div class="card">
    <div class="card-header" role="tab" id="headingTwo">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          나에게 온 친구 신청 목록
        </a>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="card-block">
      
         <div class="table-novi table-custom-responsive">
 <div class="row">
    	<div class="col-sm-5">
         <p>친구관리(친구리스트)</p>
         </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-4">
							<span class="button-my-checkbox">
								<button type="button" class="btn" data-color="info" id="checkall">전체선택</button>
								<input type="checkbox" id="checkall" class="hidden"  />
							</span> <span class="my2-button-checkbox">
								<button type="button" class="btn" data-color="danger">선택삭제</button>
								<input type="checkbox" class="hidden" checked />
							</span>
         </div>
    </div>
    
    
   <br>
                <table class="table-custom table-hover">
                  <thead>
                    <tr>
                      <th>No.</th>
                      <th>친구 아이디</th>
                      <th>친구 닉네임</th>
                      <th>선택</th>
                    </tr>
                  </thead>
                  <tbody>
                  <% int selectsize2 = 11; %>
       		  		 <% for(int i=1; i<selectsize2; i++ ) { %>
                   	 <tr>
                      <td><%= i %></td>
                      <td>친구 아이디 <%= i %></td>
                      <td>친구 닉네임 <%= i %></td>
                      <td><input type="checkbox" name="chk6" /></td>
                   	 </tr>
                 <% } %>
                  </tbody>
                </table>
              </div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" role="tab" id="headingThree">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          내가보낸 친구요청 수신여부
        </a>
      </h5>
    </div>
    
    
    
    
    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="card-block">



   <div class="table-novi table-custom-responsive">
   
   <p>친구관리(수신내역)</p>
   <br>
                <table class="table-custom table-hover">
                  <thead>
                     <tr>
                      <th>No.</th>
                      <th>친구 아이디</th>
                      <th>친구 닉네임</th>
                      <th>선택</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% int selectsize3 = 11; %>
       		  		 <% for(int i=1; i<selectsize3; i++ ) { %>
                   	 <tr>
                      <td><%= i %></td>
                      <td>친구 아이디 <%= i %></td>
                      <td>친구 닉네임 <%= i %></td>
                      <td>
                        <div class="ui-group-buttons" style="padding: 10px 20px;">
                <button type="button" class="btn btn-primary btn-xs">수락</button>
                <div class="or or-xs"></div>
                <button type="button" class="btn btn-success btn-xs">거절</button>
                      </td>
                    </tr>
                 <% } %>
                  </tbody>
                </table>
              </div>
</div>
</div>
</div>



</div>

      </div>
</body>
</html>