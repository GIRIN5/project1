<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.io.IOException"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.parser.ParseException"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>

<head>
<script>
	function openPopup1(event) {
		event.preventDefault(); // 기본 동작 방지
		window.open("/member_origin/idsearch.do", 'edit',
				'width=550, height=450');
	}

	function openPopup2(event) {
		event.preventDefault(); // 기본 동작 방지
		window.open("/member_origin/pwsearch.do", 'edit',
				'width=550, height=450');
	}
</script>
<style>
.section1 {
	font-family: "Noto Sans KR", sans-serif;
}

.loginbtn {
	width: 70%;
	height: 100%;
	background-color: rgb(23, 183, 94);
	transition: background-color 0.3s ease; /* 배경색 전환 효과 */
	border: none;
	color: white;
	font-size: 17px;
	font-weight: 400;
}

.loginbtn:hover {
	background-color: rgb(0, 150, 70); /* 호버 시 배경색 변경 */
}

.link1 {
	text-decoration: none;
	color: black;
}

.title {
	font-size: 18px;
	margin-top: 30px;
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- SweetAlert2 스크립트 먼저 호출 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 그 다음에 스위트 얼럿을 표시하는 스크립트 호출 -->
<c:if test='${message=="error"}'>
	<script>
		alert("아이디 혹은 비밀번호가 잘못되었습니다.")
	</script>
</c:if>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<%@ include file="../outline/menubar.jsp"%>

	<div class=section1 style="background: rgb(240, 240, 240); margin:80px 0;">



		<div class="row justify-content-center"
			style="width: 60%; margin: auto;">
			<div class=row style="margin: 40px 0;">
				<div class="col-6" style="padding-left: 50px;">
					<div class=title>
						로그인<a href="/admin/admin_login.do"></a>
					</div>
					<hr style="border: 1px solid #ccc; margin: 10px 0;">

					<form id="loginForm" method="post">
						<div class="row">
							<div class="col-8">
								<div class="row">
									<input name="userid" placeholder="아이디를 입력하세요"
										style="width: 100%; height: 2rem; margin-bottom: 5px; padding: 18px;">
								</div>
								<div class="row">
									<input type="password" name="pwd1" placeholder="비밀번호를 입력하세요"
										style="width: 100%; height: 2rem; padding: 18px;">
								</div>
							</div>
							<div class="col-4">
								<button type="submit" formaction="/member_origin/login.do"
									class="loginbtn">로그인</button>
							</div>
						</div>

						<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
							<a style="padding: 0; width: 20%"
								href=https://kauth.kakao.com/oauth/authorize?client_id=6af5904faf501d1253a5af1ab06cfed0&redirect_uri=http://localhost/kakao/callback&response_type=code><img
								src="/images/kakao_login.png"></a>
						</div>

						<p style="font-size: 14px;">
							<a class="link1" href="/member/register.do">회원가입</a>
							&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;
							<button onclick="openPopup1(event)"
								style="border: none; background: none; cursor: pointer;">아이디찾기</button>
							&nbsp;&nbsp;/&nbsp;&nbsp;
							<button onclick="openPopup2(event)"
								style="border: none; background: none; cursor: pointer;">비밀번호찾기</button>
							&nbsp;&nbsp;/&nbsp;&nbsp;
							<button type="submit" formaction="/admin/login.do"
								style="border: none;">관리자</button>
						</p>
					</form>

				</div>
				<div class="col-6" style="display: flex; align-items: center;">
					<img src="../../resources/images/adver/newevent.png"
						style="width: 100%; height: auto; padding-left: 50px;">
				</div>
			</div>
			
		</div>
	</div>

	<%@ include file="../outline/footer.jsp"%>
</body>

</html>