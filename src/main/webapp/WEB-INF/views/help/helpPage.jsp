<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="icon" href="../../resources/images/logo/icon1.png"
	type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>도움말 리스트</title>

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        // 페이지가 로드될 때 각 항목을 클릭하여 펼치는 스크립트
        document.querySelectorAll('.accordion-button').forEach(button => {
            button.click(); // 각 버튼을 클릭하여 펼치기
        });
    });
</script>

<style>
.title {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 26px;
	font-weight: 500;
}

.qq {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-weight: 400;
}

.aa {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	font-weight: 400;
}
</style>
</head>
<body>
	<%@ include file="../outline/menubar.jsp"%>

	<div class="row justify-content-center"
		style="width: 60%; margin: auto;">

		<p class="title" style="margin: 30px 0 20px 0">도움말 리스트</p>
		<div style="margin-bottom: 80px">
			<c:forEach items="${list}" var="help" varStatus="status">
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="false"
								aria-controls="panelsStayOpen-collapse${status.index}"><span class="qq">${help.title}</span></button>
						</h2>
						<div id="panelsStayOpen-collapse${status.index}"
							class="accordion-collapse collapse show"
							data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding:20px 40px;"><span class="aa">${help.contents}</span></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>

	<%@ include file="../outline/footer.jsp"%>
</body>
</html>
