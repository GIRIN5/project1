<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="icon" href="../../resources/images/logo/icon1.png"
   type="image/x-icon">
<script>
   function onClickButton() {
      // 팝업 창을 띄우기
      var width = 600;
      var height = 700;
      var left = (window.screen.width - width) / 2;
      var top = (window.screen.height - height) / 2;
      window.open("/mate.do", 'teammate', 'width=' + width + ', height='
            + height + ', left=' + left + ', top=' + top);
   }
   function list(page) {
      location.href = "/teammate.do?cur_page=" + page;
   }
</script>
<style>
.team1 {
   background-color: rgb(224, 248, 235);
   color: rgb(0, 159, 071);
   border: none;
   border-radius: 5px;
   cursor: pointer;
   transition: background-color 0.3s ease;
   font-family: "Noto Sans KR", sans-serif;
   font-size: 20px;
   font-weight: 500;
   padding: 7px 15px;
   margin: 30px  0 30px 80px;
}

.team1:hover {
   background-color: rgb(0, 159, 071);
   color: rgb(224, 248, 235);
}

.section1 .card-custom {
   border-top: none;
   border-left: none;
   border-right: none;
   border-bottom: 1px solid #dee2e6; /* 아래쪽 테두리만 남김 */
}

.section1 a {
   text-decoration: none; /* 하이퍼링크의 밑줄 제거 */
   color: inherit; /* 기본 텍스트 색상 상속 */
}

#stickmenu {
   background-color: rgba(0, 0, 0, 0.5); /* 반투명한 배경 */
}

.twobtn{
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


</head>
<body>
   <%@ include file="../outline/menubar.jsp"%>
   <%@ include file="../outline/modal"%>



   <section class="section1 container"
      style="width: 60%; margin-top: 30px;">
      <img src="../../resources/images/logo/teamup.png">

      <%--    <button id="modalButton">모달 열기</button>
      <div id="myModal" class="modal">
         <!-- 모달 내용 -->
         <div class="modal-content">
            <span class="close">&times;</span>
            <button onclick="openPopup1()"
               style="border: none; background: none; cursor: pointer;">
               새로운팀 만들기</button>
               
               <c:forEach var="dto" items="${dto}">
            <tr align="center">
                <td><<img src="/resources/images/${dto.logo}"
      style="width: 50px; height: 50;"></td>
                <td>${dto.name}</td>
        </c:forEach>
         </div>
      </div> --%>
      <div class="twobtn">
      
         <button class="team1" onclick="openPopup1()">
            <p style="margin: 10px 0;">
               <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                  fill="currentColor" class="bi bi-person-arms-up"
                  viewBox="0 0 16 16">
  <path d="M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3" />
  <path
                     d="m5.93 6.704-.846 8.451a.768.768 0 0 0 1.523.203l.81-4.865a.59.59 0 0 1 1.165 0l.81 4.865a.768.768 0 0 0 1.523-.203l-.845-8.451A1.5 1.5 0 0 1 10.5 5.5L13 2.284a.796.796 0 0 0-1.239-.998L9.634 3.84a.7.7 0 0 1-.33.235c-.23.074-.665.176-1.304.176-.64 0-1.074-.102-1.305-.176a.7.7 0 0 1-.329-.235L4.239 1.286a.796.796 0 0 0-1.24.998l2.5 3.216c.317.316.475.758.43 1.204Z" />
</svg>
            </p>
            팀 만들기
         </button>

         <c:choose>
            <c:when test="${sessionScope.userid != null}">
               <button class="team1" onclick="onClickButton()">
                  <p style="margin: 10px 0;">
                     <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                        fill="currentColor" class="bi bi-person-plus-fill"
                        viewBox="0 0 16 16">
  <path
                           d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
  <path fill-rule="evenodd"
                           d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5" />
</svg>
                  </p>
                  팀원 모집
               </button>
            </c:when>
            <c:otherwise>
               <button class="team1" onclick="location.href='/login_page.do'">
                  <p style="margin: 10px 0;">
                     <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                        fill="currentColor" class="bi bi-person-plus-fill"
                        viewBox="0 0 16 16">
  <path
                           d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
  <path fill-rule="evenodd"
                           d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5" />
</svg>
                  </p>
                  팀원 모집
               </button>
            </c:otherwise>
         </c:choose>
         
      </div>

      <script>
         var modalBtn = document.getElementById("modalButton");

         //모달
         var modal = document.getElementById("myModal");

         //모달 열기 버튼 클릭 시
         modalBtn.onclick = function() {
            modal.style.display = "block"; // 모달 보이기
         }

         //모달 닫기 버튼 선택
         var closeBtn = document.getElementsByClassName("close")[0];

         //모달 닫기 버튼 클릭 시
         closeBtn.onclick = function() {
            modal.style.display = "none"; // 모달 숨기기
         }

         //모달 외부를 클릭하면 모달 닫기
         window.onclick = function(event) {
            if (event.target == modal) {
               modal.style.display = "none"; // 모달 숨기기
            }
         }
      </script>
      
      <hr style="1px solid #eee">

      <c:forEach var="row" items="${list}">
         <a href="/teamcollect4.do?code=${row.code}" class="d-flex mb-3">
            <div class="card card-custom" style="width: 100%; margin-top: 15px;">
               <div class="row no-gutters">
                  <div class="col-md-4" style="width: 9%;">
                     <img src="/resources/images/${row.logo_1}"
                        style="margin-top: 15px; width: 100px; height: 100px;"
                        class="img-fluid" alt="Team Logo">
                  </div>
                  <div class="col-md-8">
                     <div class="card-body" style="padding: 0 0 0 17px;">
                        <h5 class="card-title"
                           style="border: none; padding: 0; font-family: Noto Sans KR, sans-serif; font-size: 17px;">${row.name}
                           <span
                              style="background-color: #eee; font-size: 14px; color: #666">
                              &nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="16"
                                 height="16" fill="currentColor" class="bi bi-person-fill"
                                 viewBox="0 0 16 16">
                       <path
                                    d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                     </svg> ${row.count}&nbsp;
                           </span>
                        </h5>
                     </div>
                     <ul class="list-group list-group-flush">
                        <li class="list-group-item"
                           style="border: none; padding: 0 0 0 20px; font-family: Noto Sans KR, sans-serif; color: #666; font-size: 15px;">주
                           활동 지역, 경기장</li>
                        <li class="list-group-item"
                           style="border: none; padding: 0 0 20px 20px; font-family: Noto Sans KR, sans-serif; color: #666; font-size: 15px;">${row.gender}ㆍ${row.age}ㆍ${row.skil}ㆍ${row.days}ㆍ${row.time}</li>
                        <p class="card-text"
                           style="border: none; padding: 0 0 30px 30px; margin: 0; font-family: Noto Sans KR, sans-serif; color: #888; font-size: 13px;">${row.shot }</p>
                        <!--  <li class="list-group-item" style="border:none; padding:20px 0 15px 20px; font-family: Noto Sans KR, sans-serif;  color: #888; font-size : 13px;">조회수ㆍ신청수 자리</li>-->
                     </ul>
                  </div>
               </div>
            </div>
         </a>
      </c:forEach>
      
      <div style="margin: 60px 0"></div>

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

<div style="margin: 60px 0"></div>

   </section>

   <%@ include file="../outline/footer.jsp"%>

   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
