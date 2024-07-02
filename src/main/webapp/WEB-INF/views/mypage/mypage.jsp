<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	function openPopup1() {
		// 팝업 창을 띄우기
		window.open("/maketeam.do", 'edit', 'width=550, height=450');
	}
	function reservelist() {
		window.location.href = "/mypage/reservationlist.do"
	}
</script>
<style>
.modal {
	display: none; /* 초기에는 보이지 않도록 설정 */
	position: fixed; /* 화면에 고정 */
	z-index: 1; /* 다른 요소들보다 위에 표시 */
	left: 0;
	top: 0;
	width: 50%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명한 배경 */
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 모달을 화면 중앙에 위치 */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* 모달 너비 */
}

/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.btn1 {
	background-color: rgb(224, 248, 235);
	color: rgb(0, 159, 071);
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	font-weight: 500;
	padding: 50px 15px 17px 15px;
	margin: 30px 0 30px 80px;
	width: 100%;
}

.btn1:hover {
	background-color: rgb(0, 159, 071);
	color: rgb(224, 248, 235);
}
</style>
</head>
<body>
	<%@ include file="../outline/menubar.jsp"%>

	<div style="margin: 60px 0"></div>

	<div class="row">
		<div class="col-3"></div>
		<div class="col-2" style="text-align: center; margin-right: 5%;">
			<div>

				<button class="btn1" id="reservelist">
					<p style="margin: 10px 0 30px 0;">
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
							fill="currentColor" class="bi bi-bucket-fill" viewBox="0 0 16 16">
  <path
								d="M2.522 5H2a.5.5 0 0 0-.494.574l1.372 9.149A1.5 1.5 0 0 0 4.36 16h7.278a1.5 1.5 0 0 0 1.483-1.277l1.373-9.149A.5.5 0 0 0 14 5h-.522A5.5 5.5 0 0 0 2.522 5m1.005 0a4.5 4.5 0 0 1 8.945 0z" />
</svg>
					</p>
					<p>구장 예약 내역</p>
				</button>
			</div>

			<div id="reserveModal" class="modal">
				<!-- 모달 내용 -->
				<div class="modal-content">
					<c:forEach var="res" items="${reserve}">
						<a href="/mypage/reservedetail.do?idx=${res.idx}">${res.groundname},<fmt:formatDate
								value="${res.reservation_date}" pattern="yyyy-MM-dd HH:mm"
								var="formattedDate" /> ${formattedDate}
						</a>
					</c:forEach>
					<span class="close">&times;</span>
				</div>
			</div>

		</div>

		<div class="col-2" style="text-align: center;">

			<div>

				<button class="btn1" id="modalButton">
					<p style="margin: 10px 0 30px 0;">
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
							fill="currentColor" class="bi bi-microsoft-teams"
							viewBox="0 0 16 16">
  <path
								d="M9.186 4.797a2.42 2.42 0 1 0-2.86-2.448h1.178c.929 0 1.682.753 1.682 1.682zm-4.295 7.738h2.613c.929 0 1.682-.753 1.682-1.682V5.58h2.783a.7.7 0 0 1 .682.716v4.294a4.197 4.197 0 0 1-4.093 4.293c-1.618-.04-3-.99-3.667-2.35Zm10.737-9.372a1.674 1.674 0 1 1-3.349 0 1.674 1.674 0 0 1 3.349 0m-2.238 9.488-.12-.002a5.2 5.2 0 0 0 .381-2.07V6.306a1.7 1.7 0 0 0-.15-.725h1.792c.39 0 .707.317.707.707v3.765a2.6 2.6 0 0 1-2.598 2.598z" />
  <path
								d="M.682 3.349h6.822c.377 0 .682.305.682.682v6.822a.68.68 0 0 1-.682.682H.682A.68.68 0 0 1 0 10.853V4.03c0-.377.305-.682.682-.682Zm5.206 2.596v-.72h-3.59v.72h1.357V9.66h.87V5.945z" />
</svg>
					</p>
					<p>내 팀</p>
				</button>
			</div>

			<!-- 모달 -->
			<div id="myModal" class="modal">
				<!-- 모달 내용 -->
				<div class="modal-content">
					<c:forEach var="team" items="${team}">
						<a href="/selectteamdetail.do?code=${team.code}"><img
							src="/resources/images/${team.logo}"
							style="width: 200px; height: 100px;" alt="Team Logo">,${team.teamname}</a>
						<br>
					</c:forEach>
					<span class="close">&times;</span>
					<button onclick="openPopup1()"
						style="border: none; background: none; cursor: pointer;">
						새로운팀 만들기</button>
				</div>
			</div>

		</div>
		<div class="col-3"></div>
	</div>

	<div style="margin: 60px 0"></div>

	<script>
		$(document).ready(function() {
			$('.close').click(function() {
				$(this).closest('.modal').hide();
			});
		});

		var modalBtn = document.getElementById("modalButton");
		var modalreserve = document.getElementById("reservelist");
		//모달
		var modal = document.getElementById("myModal");
		var reservemodal = document.getElementById("reserveModal");
		//모달 열기 버튼 클릭 시
		modalBtn.onclick = function() {
			modal.style.display = "block"; // 모달 보이기
		}
		modalreserve.onclick = function() {
			reservemodal.style.display = "block"; // 모달 보이기
		}

		//모달 닫기 버튼 선택

		//모달 외부를 클릭하면 모달 닫기
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none"; // 모달 숨기기
				reservemodal.style.display = "none";
			}
		}
	</script>
	<%@ include file="../outline/footer.jsp"%>
</body>
</html>
