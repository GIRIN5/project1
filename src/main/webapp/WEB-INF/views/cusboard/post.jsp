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
.container33 {
	max-width: 800px;
	margin: auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.container1 {
	max-width: 800px;
	margin: auto;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 5px;
}

.link1 {
	color: #555;
	text-decoration: none;
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
	color: rgb(023, 183, 094);
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 500;
	margin-left: 10px;
	margin-bottom: 16px;
}

.mokrok {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	margin-top: 10px;
}

.title {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 24px;
	font-weight: 500;
}

.viewcount {
	color: #aaa;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 13px;
	font-weight: 400;
}

.susac {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	margin-left: 30px;
}
</style>
</head>
<body>

	<%@ include file="../outline/menubar.jsp"%>

	<p style="text-align: center; margin: 60px 0 22px 0">
		<img src="../../resources/images/logo/comunityup.png"
			style="width: 60%">
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-8"></div>
		<div class="col-2 mokrok">
			<input type="button" class="btn1" value="목록으로"
				style="padding: 10px 15px; margin-left: 100px; font-weight: 600;"
				onclick="location.href='/board/list.do'">
		</div>
	</div>

	<p>
	<div class="row justify-content-center"
		style="width: 60%; margin: auto;">

		<div class="col-md-2">
			<div class="contents"
				style="width: 12rem; font-family: 'Noto Sans KR', sans-serif; border-left: none; border-right: none; border-top: 2px solid rgb(18, 95, 28); border-bottom: 2px solid rgb(18, 95, 28);">
				<ul class="list-group list-group-flush" style="border: none;">
					<li class="list-group-item" class="link1"><span
						style="font-size: 15px;">게시판</span></li>
					<li class="list-group-item" style="padding-left: 30px;">
						<p style="margin-bottom: 5px;">
							<a class="link1" href="#" onclick="toggle(this,'all')"
								style="color: #333; font-weight: 700;">전체글보기</a>
						</p>
						<p style="margin-bottom: 5px;">
							<a class="link1" href="#" onclick="toggle(this,'1')">공지사항</a>
						</p>
						<p style="margin-bottom: 5px;">
							<a class="link1" href="#" onclick="toggle(this,'2')">자유게시판</a>
						</p>
					</li>
				</ul>
			</div>
		</div>


		<div class="col-md-9 container1">

			<div class="row">
				<div class="col-sm-10 categoryfont">
					<c:choose>
						<c:when test="${dto.type == 1}">공지사항</c:when>
						<c:when test="${dto.type == 2}">자유게시판</c:when>
					</c:choose>
				</div>

			</div>

			<div class="container">
				<div class="row mb-2">
					<div class="col-sm-10 title">${dto.subject}</div>
				</div>
				<div class="row mb-2 viewcount">
					<div class="col-4">${dto.reg_date.substring(0, 10)}
						&nbsp;&nbsp;&nbsp;&nbsp;조회&nbsp;${dto.see}</div>
				</div>

				<hr style="border: 1px solid #ccc; width: 100%; margin: 25px 0 0 0;">

				<div style="margin: 20px 0"></div>

				<c:choose>
					<c:when test="${dto.filename=='-' || empty dto.filename}">
						<img class="post-image" src="/resources/images/notification.png">
					</c:when>
					<c:otherwise>
						<img class="post-image" src="/resources/images/${dto.filename}">
					</c:otherwise>
				</c:choose>

				<div class="post-contents">${dto.contents}</div>
			</div>
			<div style="margin: 25px 0"></div>
		</div>

		<div class="row" style="margin-top: 20px;">
			<div class="col-md-9"></div>


			<div class="col-2 susac">
				<input type="hidden" name="num" value="${dto.num}"> <input
					type="button" class="btn1" value="수정/삭제"
					style="padding: 10px 15px; margin-left: 110px; font-weight: 600;"
					onclick="location.href='/board/edit.do?num=${dto.num}'">
			</div>


		</div>

		<div style="margin: 30px 0"></div>
	</div>

	<%@ include file="../outline/footer.jsp"%>
</body>
</html>