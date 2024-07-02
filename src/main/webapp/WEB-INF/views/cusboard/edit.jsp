<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
.title {
	color: #333;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 24px;
	font-weight: 500;
}

.border1 {
	border: 1px solid #ccc;
	margin-right: 10px;
	border-radius: 10px;
	font-family: "Noto Sans KR", sans-serif;
}

.border2 {
	margin-top: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-family: "Noto Sans KR", sans-serif;
	padding: 20px;
}

#contents {
	border: none;
	margin: 10px;
}

#subject {
	margin: 20px 0 0 20px;
	padding: 10px 18px;
	border: none;
	background-color: rgb(243, 243, 243);
	border-radius: 10px;
	width: 95%;
}

.btn1 {
	background-color: rgb(224, 248, 235);
	color: rgb(0, 159, 071);
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	font-weight: 500;
	padding: 7px 15px;
	margin: 30px 0;
}

.btn1:hover {
	background-color: rgb(0, 159, 071);
	color: rgb(224, 248, 235);
}
</style>

<script src="http://code.jquery.com/jquery-3.6.1.js"></script>

<script>
	function confirmDelete() {
		let num = document.form1.num.value;
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "/board/delete.do";
			document.form1.submit();
		}
	}
	function update() {

		let num = document.form1.num.value;
		let subject = document.form1.subject.value;
		let contents = document.form1.contents.value;
		let type = document.form1.type.value;

		if (type == "0") {
			alert("타입을 설정해주세요.");
			return;
		}
		if (subject == "") {
			alert("제목을 입력하세요.");
			return;
		}

		let filename = document.form1.file1.value;
		let start = filename.lastIndexOf(".") + 1;
		if (start != -1) {
			let ext = filename.substring(start, filename.length);
			if (ext == "jsp" || ext == "exe") {
				alert("업로드할 수 없는 파일입니다.")
				return;
			}
		}

		document.form1.action = "/board/update.do"
		document.form1.submit();
	}
</script>
</head>
<body>

	<%@ include file="../outline/menubar.jsp"%>

	<form name="form1" method="post" enctype="multipart/form-data">
		<div class="row justify-content-center"
			style="width: 60%; margin: auto;">

			<p class="title" style="margin: 20px 0 10px 20px">게시글 수정</p>

			<div
				style="width: 95%; height: 2px; background-color: #000; margin: 0px 9px 20px 0;"></div>

			<div class=border1 style="width: 95%">
				<div class="row">
					<div>
						<select name="type" id="type"
							style="border: none; border-bottom: 1px solid #333; margin: 20px 0 0 20px;">
							<option value="0">&nbsp;&nbsp;게시판을 선택하세요&nbsp;&nbsp;</option>
							<option value="1">&nbsp;&nbsp;공지사항</option>
							<option value="2">&nbsp;&nbsp;자유게시판</option>
						</select>
						<script>
							document.getElementById("type").value = "${dto.type}";
						</script>
						<input type="text" id="subject" name="subject"
							placeholder="제목을 입력하세요" value="${dto.subject}">
					</div>
				</div>



				<div>
					<div class="row" style="margin: 20px 0 20px 20px">
						<div class="col-3">
						<input type="file" name="file1" >
						</div>
						<div class="col">
							<c:if test="${not empty dto.filename}">
                        ${dto.filename}
                        <input type="checkbox" name="delete_file"> 첨부파일 삭제<br>
							</c:if>
						</div>
					</div>
				</div>

			</div>

			<div class="row">
				<div>
					<div class="border2" style="width: 99%;">
						<textarea rows="15" cols="122" name="contents" id="contents"
							placeholder="내용을 입력하세요">${dto.contents}
</textarea>
					</div>
				</div>
			</div>

		</div>

		<div>
			<div align="center">
				<input type="hidden" value="${dto.num}" name="num" id="num">
				<input type="button" class="btn1" value="수정" onclick="update()">
				<input type="button" class="btn1" value="삭제"
					onclick="confirmDelete()">
			</div>
		</div>
	</form>

	<%@ include file="../outline/footer.jsp"%>
</body>
</html>
