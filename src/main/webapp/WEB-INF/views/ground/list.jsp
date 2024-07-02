<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축구장 리스트</title>
<!-- 부트스트랩 CDN 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="icon" href="../../resources/images/logo/icon1.png" type="image/x-icon">
<style>
.modal {
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgba(0, 0, 0, 0.9);
}

.modal-content {
   margin: auto;
   display: block;
   width: 80%;
   max-width: 700px;
   padding: 20px;
}

.modal-image {
   display: block;
   margin: auto;
   max-width: 100%;
   height: auto;
   margin-bottom: 10px;
}

.close {
   color: #ccc;
   float: right;
   font-size: 28px;
   font-weight: bold;
   cursor: pointer;
}

.close:hover, .close:focus {
   color: #888;
   text-decoration: none;
   cursor: pointer;
}

.title {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 24px;
   font-weight: 500;
   color: #333;
   border-bottom: 1px solid #ccc;
   padding: 10px 10px;
}

.btn {
   border: none;
}

.btn button {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 18px;
   background-color: #eee;
   color: #aaa;
   border: 1px solid #aaa;
   padding-left: 12px;
   padding-right: 12px;
   margin: 10px 8px 40px 8px;
   border-radius: 7px;
}

.btn button:hover {
   background-color: rgb(170, 230, 180);
   color: white;
   border-color: rgb(170, 230, 180);
   font-weight: 700;
}

.name {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 22px;
   font-weight: 500;
   color: #333;
}

.address {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 16px;
   font-weight: 400;
   color: #aaa;
}

.kan {
   display: flex;
   cursor: pointer;
   flex-direction: column; /* 세로 배치를 위해 추가 */
   
}

.jul {
   margin-bottom: 20px;
   border-bottom: 1px solid #ccc;
   padding-bottom: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>

   <%@ include file="../outline/menubar.jsp"%>

   <p style="text-align: center; margin: 60px 0 80px 0">
      <img src="../../resources/images/logo/reservation.png" style="width: 60%">
   </p>
   <div class="row" style="width: 50%; margin: auto;">
      <p class="title" style="width: 100%;">&nbsp;&nbsp;구장 예약</p>

      <div class="btn">
         <button onclick="sero()">전체</button>
         <button onclick="search('서울')">서울</button>
         <button onclick="search('경기')">경기</button>
         <button onclick="search('인천')">인천</button>
         <button onclick="search('부산')">부산</button>
         <button onclick="search('대구')">대구</button>
         <button onclick="search('경남')">경남</button>
         <button onclick="search('경북')">경북</button>
      </div>

      <div class="row"><hr style="1px solid #eee"></div>

      <div>
         <div>
            <c:forEach items="${list}" var="ground">
               <div class="row jul">
                  <div class="col-1"></div>
                  <div class="col-4">
                     <img src="../../resources/images/ground/${ground.filename}" alt="구장 이미지" style="width: 80%" onclick="openModal('${ground.filename}', '${ground.filename2}', '${ground.filename3}')">
                  </div>
                  <div class="col-7 kan" onclick="window.location.href='detail.do?name=${ground.name}'">
                     <div class="row name">
                        <div class="col" style="margin-top: 40px;">${ground.name}</div>
                     </div>
                     <div class="row address">
                        <div class="col">${ground.address}</div>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>

      <div id="myModal" class="modal">
         <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <img id="modalImage1" class="modal-image">
            <img id="modalImage2" class="modal-image">
            <img id="modalImage3" class="modal-image">
         </div>
      </div>

      <!-- 페이지 번호 표시 -->
      <c:if test="${page.totPage > 1}">
         <nav aria-label="Page navigation" class="d-flex justify-content-center">
            <ul class="pagination">
               <c:forEach begin="1" end="${page.totPage}" var="pageNum">
                  <c:url value="/ground/list.do" var="pageLink">
                     <c:param name="cur_page" value="${pageNum}" />
                  </c:url>
                  <li class="page-item"><a class="page-link" href="${pageLink}">${pageNum}</a></li>
               </c:forEach>
            </ul>
         </nav>
      </c:if>
   </div>

   <!-- 부트스트랩 JS 추가 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

   <script>
      function openModal(filename1, filename2, filename3) {
         var modal = document.getElementById("myModal");
         var modalImage1 = document.getElementById("modalImage1");
         var modalImage2 = document.getElementById("modalImage2");
         var modalImage3 = document.getElementById("modalImage3");

         modalImage1.src = "../../resources/images/ground/" + filename1;
         modalImage2.src = "../../resources/images/ground/" + filename2;
         modalImage3.src = "../../resources/images/ground/" + filename3;

         modal.style.display = "block";
      }

      function closeModal() {
         var modal = document.getElementById("myModal");
         modal.style.display = "none";
      }

      function search(region) {
         $.ajax({
            type: "post",
            url: "/ground/search.do",
            data: {
               "region": region,
            },
            success: function(response) {
               document.write(response);
               document.close();
            },
            error: function(xhr, status, error) {
               console.error("오류 발생: " + error);
            }
         });
      }

      function sero() {
         location.reload();
      }
   </script>

   <%@ include file="../outline/footer.jsp"%>
</body>
</html>
