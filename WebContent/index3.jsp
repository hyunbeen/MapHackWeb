<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>
<body>
<!--프로젝트 시작 -->
<% String id = String.valueOf(request.getParameter("id")); %>
<% response.sendRedirect("/MapHack/myMakeMapDetail.mh?id="+id);%>

myMakeMapDetail.mh
<!-- 시작 --> 
</body>
</html>
