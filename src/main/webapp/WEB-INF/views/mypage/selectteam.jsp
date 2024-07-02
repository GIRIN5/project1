<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.bor1 {
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 20px 0 0 0;
	margin-right: 10px;
	background-color: #fff;
}

.bor2 {
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 60px 0 0 0;
	margin-right: 10px;
	background-color: #fff;
}

.teamname {
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
	font-weight: 600;
	color: #333;
}

.btn1 {
	color: white;
	border: none;
	padding: 11px 20px;
	border-radius: 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin: 40px 0px 20px 0px;
	width: 80%;
	background-color: rgb(239, 040, 040);
	cursor: pointer;
}

.btn1:hover {
	background-color: rgb(178, 016, 016);
}

.btn2 {
	color: white;
	border: none;
	padding: 11px 20px;
	border-radius: 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin: 20px 0px 20px 0px;
	width: 95%;
	background-color: #0066ff;
	cursor: pointer;
}

.btn2:hover {
	background-color: #0044cc;
}

.btn3 {
	color: white;
	border: none;
	padding: 11px 20px;
	border-radius: 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin: 20px 0px 20px 0px;
	width: 95%;
	background-color: rgb(239, 040, 040);
	cursor: pointer;
}

.btn3:hover {
	background-color: rgb(178, 016, 016);
}

.title {
	color: rgb(023, 183, 094);
	font-family: "Noto Sans KR", sans-serif;
	font-size: 18px;
	font-weight: 500;
	margin: 12px 0 10px 10px;
}

.back1 {
	background-color: #fff;
	border-radius: 10px;
}

.con1 {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 17px;
	font-weight: 400;
	padding-bottom: 20px;
}
</style>

</head>
<body style="background-color: rgb(238, 239, 242)">

	<%@ include file="../outline/menubar.jsp"%>

	<div class="container"
		style="font-family: Noto Sans KR, sans-serif; margin-top: 30px; margin-bottom: 20px; width: 100%;">

		<div class="row">

			<div class="col-4 bor2" style="margin-left: 50px;">
				<div class="row" style="justify-content: center;">
					<div class="col-5">
						<img src="/resources/images/${dto.logo}" style="width: 100%">
					</div>
					<div class="col-5 teamname">${dto.name}</div>
				</div>
				<div class="row">
					<div class="col" style="display: flex; justify-content: center;">
						<c:choose>
							<c:when test="${ttdto.grade == 2}">
								<button class="btn1" onclick="disbandteam('${ttdto.code}')">팀
									해체하기</button>
							</c:when>
							<c:otherwise>
								<button onclick="teamleave('${ttdto.code}')">팀 탈퇴하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>

			<div class="col-7">
				<div class="row bor1 con1">
					<div class="row">
						<p class="title" style="color: rgb(047, 085, 187)">팀 정보</p>
					</div>
					<div style="margin-left: 20px">
						<div class="row ">
							<div class="col-3">${dto.gender}</div>
							<div class="col-3">모임 시간 : ${dto.time}</div>
						</div>
						<div class="row">
							<div class="col-3">${dto.age}</div>
							<div class="col-3">활동 요일 : ${dto.days}</div>
						</div>
						<div class="row">
							<div class="col-3">팀 레벨 ${dto.skil}</div>
						</div>
					</div>
				</div>


				<div class="row bor1" style="margin-top: 10px;">
					<p class="title" style="color: rgb(058, 060, 132)">멤버</p>

					<c:forEach var="member" items="${member}">
						<c:choose>
							<c:when test="${member.grade == 2}">
								<div class="row con1">
									<div class="col-11" style="margin-left: 25px;">팀장 :
										${member.name}</div>
								</div>
							</c:when>

							<c:otherwise>
								<div class="row con1">
									<div class="col-11" style="margin-left: 25px;"> 팀원 : ${member.name}</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>

				</div>
			</div>

			<div class="row bor1" style="margin-top: 10px; width:92%; margin-left: 50px;">
				<div class="row con1">
					<p class="title" style="color: rgb(058, 060, 132)">가입 신청 내역</p>
					<div class="col-11" style="margin-left: 25px;">

						<c:choose>
							<c:when test="${adto2 != null}">
								<c:forEach var="app" items="${adto2}">
                ${app.name} - ${app.introduce} 
                </c:forEach>
							</c:when>
						</c:choose>

					</div>
				</div>

				<div class="row" style="padding-left: 40px;">
					<div class="col-2">
						<button class="btn2"
							onclick="application('${app.code}', '${app.userid}', '가입승인')">가입승인</button>
					</div>
					<div class="col-2">
						<button class="btn3"
							onclick="application('${app.code}', '${app.userid}', '가입거절')">가입거절</button>
					</div>
				</div>

			</div>
		</div>

	</div>




	<%@ include file="../outline/footer.jsp"%>

	<script>
		function application(code, userid, check) {
			$.ajax({
				type : "post",
				url : "/applicationcheck.do",
				data : {
					"userid" : userid,
					"code" : code,
					"check" : check
				},
				success : function(response) {
					if (response == "approval") {
						alert("승인이 완료되었습니다");
						window.location.href = "/mypage/detail.do"
					} else {
						alert("거절이 완료되었습니다");
						location.reload();
					}
				},
				error : function(xhr, status, error) {
					console.error("오류 발생: " + error);
					// 오류 발생 시 처리할 내용
				}
			});
		}
		function disbandteam(code) {
			$.ajax({
				type : "post",
				url : "/disbandteam.do",
				data : {
					"code" : code,
				},
				success : function(response) {
					if (response == "complete") {
						alert("팀해체가 완료됐습니다.");
						window.location.href = "/mypage/detail.do"
					} else {
						alert("거절이 완료되었습니다");
						location.reload();
					}
				},
				error : function(xhr, status, error) {
					console.error("오류 발생: " + error);
					// 오류 발생 시 처리할 내용
				}
			});
		}
		function teamleave(code) {
			$.ajax({
				type : "post",
				url : "/teamleave.do",
				data : {
					"code" : code,
				},
				success : function(response) {
					if (response == "complete") {
						alert("팀탈퇴가 완료됐습니다.");
						location.reload();
					} else {
						alert("거절이 완료되었습니다");
						location.reload();
					}
				},
				error : function(xhr, status, error) {
					console.error("오류 발생: " + error);
					// 오류 발생 시 처리할 내용
				}
			});
		}
	</script>


</body>
</html>
