<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<style>
.container {
	max-width: 800px;
	margin: auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.post-image {
	max-width: 100%;
	height: auto;
	display: block;
	margin-bottom: 20px;
}

.post-contents {
	line-height: 1.6;
	color: #333;
	margin-bottom: 20px;
	font-family: "Noto Sans KR", sans-serif;
}

.categoryfont {
	color: #993300;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-weight: 500;
	margin-left: 10px;
	margin-bottom: 10px;
}

.title {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 24px;
	font-weight: 500;
	margin-left: 10px;
	margin-bottom: 30px;
}

.susac {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	margin-left: 30px;
}

.mokrok {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	margin-top: 10px;
}

.btn1 {
	background-color: rgb(224, 248, 235);
	color: rgb(0, 159, 071);
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.btn1:hover {
	background-color: rgb(0, 159, 071);
	color: rgb(224, 248, 235);
}

<%@ include file="../outline/morebutton_css"%>
</style>
</head>
<body>

	<%@ include file="../outline/menubar.jsp"%>

	<div style="margin: 20px 0"></div>

	<div class="row">
		<div class="col-8"></div>
		<div class="col-2">
			<button onclick="location.href='/magazine/list.do'" class="moreButton" style="margin: 0 0 10px 40px;">
				<span>목록으로</span>
			</button>
		</div>
	</div>

	<div class="row justify-content-center"
		style="width: 50%; margin: auto;">

		<div class="container">


			<div class="categoryfont">
				<c:choose>
					<c:when test="${dto.type==1}">문화</c:when>
					<c:when test="${dto.type==2}">가이드</c:when>
				</c:choose>
			</div>

			<div class="title">${dto.subject}</div>



			<c:choose>
				<c:when test="${dto.filename=='-' || empty dto.filename}">
					<img class="post-image" src="/resources/images/notification.png">
				</c:when>
				<c:otherwise>
					<img class="post-image"
						src="/resources/images/magazine/${dto.filename}">
				</c:otherwise>
			</c:choose>

			<div class="post-contents">${dto.contents}</div>

		</div>
	</div>

	<div class="row" style="margin-top: 30px;">
		<div class="col-8"></div>
		<div class="col-2 susac">
			<input type="hidden" name="num" value="${dto.num}"> <input
				type="button" class="btn1" value="수정/삭제"
				style="padding: 10px 15px; margin-left: 23px; font-weight: 600;"
				onclick="location.href='/magazine/edit.do?num=${dto.num}'">
		</div>

	</div>

	<div style="margin: 30px 0"></div>
	<%@ include file="../outline/footer.jsp"%>
</body>

</html>