<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.selected {
   background-color: blue;
   color: white;
}

.con1 {
   font-family: Noto Sans KR, sans-serif;
   color: #666;
   font-size: 15px;
}

.big1 {
   font-size: 24px;
   font-weight: 500;
   color: #333;
   display: flex;
   align-items: center;
}

.man {
   border: none;
   padding: 0;
   font-family: Noto Sans KR, sans-serif;
   background-color: #eee;
   font-size: 14px;
   color: #666;
}

.time {
   font-family: Noto Sans KR, sans-serif;
   font-size: 18px;
   font-weight: 700;
   color: #333;
   display: flex;
   align-items: center;
   justify-content: center;
}

.line{
   border-bottom : 1px solid #ccc;
   padding: 10px 0 10px 0;
   margin-bottom: 20px;
}

.sinchung {
   color: white;
   border: none;
   padding: 11px 20px;
   border-radius: 5px;
   font-family: "Noto Sans KR", sans-serif;
   font-size: 14px;
   font-weight: 600;
   margin: 20px 0px 20px 20px;
   width: 80%;
   background-color: #0066ff;
   cursor: pointer;
}

.sinchung:hover {
  background-color: #0044cc;
}

.magam {
   color: white;
   border: none;
   padding: 11px 20px;
   border-radius: 5px;
   font-family: "Noto Sans KR", sans-serif;
   font-size: 14px;
   font-weight: 600;
   margin: 20px 0px 20px 20px;
   width: 80%;
   background-color: red;
   cursor: normal;
   text-align:center;
}

.custom-page-item.active .page-link {
   background-color: rgb(023, 183, 094);
   color: white;
   border-color: rgb(023, 183, 094);
}

.custom-page-item .page-link {
   background-color: #f8f9fa;
   color: rgb(023, 183, 094);
      border-color:#f8f9fa;
   padding-left:10px;
   padding-right:10px;
}

.custom-page-item .page-link:hover {
   background-color: rgb(170, 230, 180); /* 마우스를 올렸을 때의 배경색 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색 */
   font-weight: 700;
}

</style>

<link rel="icon" href="../../resources/images/logo/icon1.png"
   type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>

<script>
   function list(page) {
      location.href = "/social/social.do?cur_page=" + page;
   }
   document.addEventListener("DOMContentLoaded", function() {
      var buttons = document.querySelectorAll("button");
      buttons.forEach(function(button) {
         button.addEventListener("click", function() {
            buttons.forEach(function(btn) {
               btn.classList.remove("selected");
            });
            button.classList.add("selected");
         });
      });
   });
</script>
<body>
   <%@ include file="../outline/menubar.jsp"%>
   <%
   // 현재 날짜와 7일 후의 날짜 계산
   java.util.Calendar calendar = java.util.Calendar.getInstance();
   java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm EEEE");
   String date;
   date = dateFormat.format(calendar.getTime());
   String[] dates = new String[3];

   for (int i = 0; i < 3; i++) {
      dates[i] = dateFormat.format(calendar.getTime());
      calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
   }
   request.setAttribute("date", date);
   request.setAttribute("dates", dates);
   %>
   <%-- <c:forEach var="date" items="${dates}">
      <c:set var="dayOfWeek"
         value="${date.substring(date.lastIndexOf(' ')+1)}" />
      <c:set var="dayOfMonth"
         value="${date.substring(date.lastIndexOf('-')+1, date.lastIndexOf(' '))}" />
      <c:if test="${dayOfMonth.startsWith('0')}">
         <c:set var="dayOfMonth" value="${dayOfMonth.substring(1)}" />
      </c:if>
      <button value="${dayOfWeek}">${dayOfWeek}${dayOfMonth}</button>
   </c:forEach> --%>
<div style="text-align:center; margin:60px 0 60px 0">
<img src="../../resources/images/logo/matchup.png"  style="width:60%; margin:auto;"></div>
   <c:forEach var="row" items="${dto}">
      <%-- <a href="/teamcollect4.do?code=${row.code}" class="d-flex mb-3"> --%>
      <a href="/social/detail.do?idx=${row.idx}"
         style="text-decoration: none;">

         <div class="row ">
            <div class="col-md-3"></div>

            <div class="col-md-1 time line">
               <p style="padding: 0 0 0 20px;">
                  <fmt:formatDate value="${row.matchdate}" pattern="HH:mm"
                     var="formattedDate" />
                  ${formattedDate}
               </p>
            </div>

            <div class="col-md-4 line">

               <div class="con1">
                  <p class="big1" style="padding: 0 0 0 20px; margin-bottom: 5px;">${row.groundname }&nbsp;
                     <span class="man"> &nbsp;<svg
                           xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                           fill="currentColor" class="bi bi-people-fill"
                           viewBox="0 0 16 16">
  <path
                              d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
</svg>&nbsp;&nbsp;${row.count}&nbsp;
                     </span>
                  </p>
                  <p style="padding: 0 0 0px 20px;">${row.gender}ㆍ${row.age}ㆍ${row.way}</p>
                  <p style="padding: 0 0 0 20px;">
                     <fmt:formatDate value="${row.matchdate}"
                        pattern="yyyy-MM-dd" var="formattedDate" />
                     ${formattedDate}
                  </p>

               </div>
            </div>


            <div class="col-md-1 line">
               <p>
                  <c:choose>
                     <c:when test="${formattedDate lt date}">
               <p class="magam">마감</p>
               </c:when>
                     <c:when test="${formattedDate gt date && sdao.count2(row.idx, sessionScope.userid) == 0}">
               <button class="sinchung">신청가능</button>
               </c:when>
               <c:when test="${formattedDate gt date && sdao.count2(row.idx, sessionScope.userid) == 1}">
               <button class="sinchung" disabled>이미 신청</button>
               
               </c:when>
                  </c:choose>
               </p>
            </div>
         </div>

      </a>
   </c:forEach>

<div style="margin: 25px 0"></div>

      <nav aria-label="Page navigation example">
         <ul class="pagination  pagination-sm justify-content-center">
            <li class="page-item custom-page-item"><c:if
                  test="${page.curPage > 1}">
                  <a class="page-link" href="#" onclick="list('1')">처음</a>
               </c:if></li>
            <li class="page-item custom-page-item"><c:if
                  test="${page.curBlock > 1}">
                  <a class="page-link" href="#" onclick="list('${page.prevPage}')">이전</a>
               </c:if></li>
            <c:forEach var="num" begin="${page.blockStart}"
               end="${page.blockEnd}">
               <c:choose>
                  <c:when test="${num == page.curPage}">
                     <li class="page-item active custom-page-item" aria-current="page">
                        <span class="page-link">${num}</span>
                     </li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item custom-page-item"><a class="page-link"
                        href="#" onclick="list('${num}')">${num}</a></li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <li class="page-item custom-page-item"><c:if
                  test="${page.curBlock < page.totBlock}">
                  <a class="page-link" href="#" onclick="list('${page.nextPage}')">다음</a>
               </c:if></li>
            <li class="page-item custom-page-item"><c:if
                  test="${page.curPage < page.totPage}">
                  <a class="page-link" href="#" onclick="list('${page.totPage}')">마지막</a>
               </c:if></li>
         </ul>
      </nav>

   <%@ include file="../outline/footer.jsp"%>
</body>

</html>