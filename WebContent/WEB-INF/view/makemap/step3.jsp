<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.points_table thead {
   width: 100%;
}

.points_table tbody {
   height: 300px;
   overflow-y: auto;
   width: 100%;
}

.points_table thead tr {
   width: 99%;
}

.points_table tr {
   width: 100%;
}

.points_table thead, .points_table tbody, .points_table tr,
   .points_table td, .points_table th {
   display: inline-block;
}

.points_table thead {
   background: #d91f2d;
   color: #fff;
}

.points_table tbody td, .points_table thead>tr>th {
   float: left;
   border-bottom-width: 0;
}

.points_table>tbody>tr>td, .points_table>tbody>tr>th, .points_table>tfoot>tr>td,
   .points_table>tfoot>tr>th, .points_table>thead>tr>td, .points_table>thead>tr>th
   {
   padding: 8px;
   height: 50px;
   text-align: center;
   line-height: 32px;
}

.odd {
   background: #ffffff;
   color: #000;
}

.even {
   background: #efefef;
   color: #000;
}

.points_table_scrollbar {
   height: 612px;
   overflow-y: scroll;
}

.points_table_scrollbar::-webkit-scrollbar-track {
   -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.9);
   border-radius: 10px;
   background-color: #444444;
}

.points_table_scrollbar::-webkit-scrollbar {
   width: 1%;
   min-width: 5px;
   background-color: #F5F5F5;
}

.points_table_scrollbar::-webkit-scrollbar-thumb {
   border-radius: 10px;
   background-color: #D62929;
   background-image: -webkit-linear-gradient(90deg, transparent, rgba(0, 0, 0, 0.4)
      50%, transparent, transparent)
}
</style>

</head>
<body>

 <c:set var="index" value="0" />
                           <div class="container" style="width: 47.5%; float: left;">
                              <div class="row">
                                 <h2>회원검색</h2>

                                 <table class="points_table">
                                    <thead>
                                       <tr>
                                          <th class="col-xs-3">선택</th>
                                          <th class="col-xs-4">아이디</th>
                                          <th class="col-xs-4">이름</th>
                                       </tr>
                                    </thead>

                                    <tbody class="points_table_scrollbar">
                                       <c:forEach var="a" items="${listMember}">
                                          <c:choose>





                                             <c:when test="${index mod 2 eq 0 }">
                                                <tr class="odd">
                                                   <td class="col-xs-3"><input type="checkbox" />
                                                   </td>
                                                   <td class="col-xs-4">${a.mId}</td>
                                                   <td class="col-xs-4">${a.mName}</td>
                                                </tr>
                                             </c:when>



                                             <c:otherwise>
                                                <tr class="even">
                                                   <td class="col-xs-3"><input type="checkbox" />
                                                   </td>
                                                   <td class="col-xs-4">${a.mId}</td>
                                                   <td class="col-xs-4">${a.mName}</td>
                                                </tr>
                                             </c:otherwise>


                                          </c:choose>

                                          <c:set var="index" value="${index + 1}" />



                                       </c:forEach>

                                    </tbody>
                                 </table>


                                 <div class="input-group cell-lg-4 cell-md-6 cell-sm-12"
                                    style="margin-top: 20px">
                                    <div class="input-group-btn search-panel">
                                       <button type="button"
                                          class="btn btn-default dropdown-toggle"
                                          data-toggle="dropdown">
                                          <span id="search_concept" style="display: block;">장소명</span>
                                          <span class="caret" style="float: right;"></span>
                                       </button>
                                       <ul class="dropdown-menu" role="menu">
                                          <li><a href="#id"><i
                                                class="fa fa-angle-double-right"></i> ID</a></li>
                                          <li><a href="#name"><i
                                                class="fa fa-angle-double-right"></i> 장소명</a></li>
                                          <li><a href="#description"><i
                                                class="fa fa-angle-double-right"></i> Description</a></li>
                                       </ul>
                                    </div>
                                    <input type="hidden" name="search_param" value="name"
                                       id="search_param"> <input type="text"
                                       class="form-control" name="q" placeholder="Search.."
                                       id="search_key" value="" style="height: 41px;"> <span
                                       class="input-group-btn">
                                       <button class="btn btn-info"
                                          style="margin-left: -137%; float: left; margin-top: -5%;"
                                          type="submit">Search</button>
                                    </span>
                                 </div>


                              </div>
                           </div>
                           <div class="container"
                              style="width: 47.5%; float: left; margin-left: 2%">
                              <div class="row">
                                 <h2>그룹원</h2>

                                 <table class="points_table">
                                    <thead>
                                       <tr>
                                          <th class="col-xs-4">보낸이</th>
                                          <th class="col-xs-4">받는이</th>
                                          <th class="col-xs-3">상태</th>
                                       </tr>
                                    </thead>

                                    <tbody class="points_table_scrollbar">
                                       <c:forEach var="a" items="${groupMember}">
                                          <c:choose>





                                             <c:when test="${index mod 2 eq 0 }">
                                                <tr class="odd">
                                                   <td class="col-xs-4">${a.map_send_mid}</td>
                                                   <td class="col-xs-4">${a.map_fri_mid}</td>
                                                   <td class="col-xs-3">${a.map_fri_stat}</td>
                                                </tr>
                                             </c:when>



                                             <c:otherwise>
                                                <tr class="even">
                                                   <td class="col-xs-4">${a.map_send_mid}</td>
                                                   <td class="col-xs-4">${a.map_fri_mid}</td>
                                                   <td class="col-xs-3">${a.map_fri_stat}</td>
                                                </tr>
                                             </c:otherwise>


                                          </c:choose>

                                          <c:set var="index" value="${index + 1}" />



                                       </c:forEach>

                                    </tbody>
                                 </table>
                              </div>
                           </div>
                           <script src="/MapHack/resource/main/js/core.min.js"></script>
                           <script src="/MapHack/resource/main/js/script.js"></script>



                    
     


</body>
</html>
