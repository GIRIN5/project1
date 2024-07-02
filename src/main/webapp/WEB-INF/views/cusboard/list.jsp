<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>공지사항/자주 묻는 질문</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.link1 {
	color: #555;
	text-decoration: none;
}

.link1.selected {
	color: #333;
	font-weight: 700;
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

.searchbtn1 {
	background-color: rgb(023, 183, 094);
	border: none;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	font-weight: 400;
	color: white;
}

input[name="keyword"] {
	border: 2px solid rgb(23, 183, 94);
	padding: 2px;
	border-radius: 4px; /* 테두리 모서리를 둥글게 */
	box-sizing: border-box; /* 패딩과 테두리를 포함하여 요소 크기 계산 */
	outline: none; /* 포커스 시 기본 테두리 제거 */
}

input[name="keyword"]:focus {
	border-color: rgb(0, 150, 70); /* 포커스 시 테두리 색상 변경 */
	box-shadow: 0 0 5px rgba(0, 150, 70, 0.5); /* 포커스 시 그림자 효과 */
}

.searchbtn {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	font-weight: 400;
	background-color: rgb(23, 183, 94);
	color: white;
	border: none;
	padding: 4px 8px;
	cursor: pointer;
	border-radius: 4px;
	transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

.searchbtn:hover {
	background-color: rgb(0, 150, 70); /* 호버 시 배경색 변경 */
}

.searchbtn2 {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	font-weight: 400;
	background-color: #eee;
	color: #333;
	border: none;
	padding: 2px 6px;
	cursor: pointer;
	border-radius: 4px;
	transition: background-color 0.3s ease; /* 배경색 전환 효과 */
	border: 2px solid #888
}

.searchbtn2:hover {
	background-color: #bbb; /* 호버 시 배경색 변경 */
}

.row .custom {
	border-bottom:1px solid #ddd;
	height : 35px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 400;
	color: #333;
	align-items: center;
}

#gong {
    background-color: rgb(245 245, 245);
    
}

#gong1 {
    color: red; 
    border:1px solid red;
   	width:78px;
   	margin-right: 56px;
   	margin-left: 5px;
}

#gong2 {
    color: red; 
}

#gong3 {
    color: rgb(245 245, 245);
}

</style>
<script>
	function list(page) {
		location.href = "/board/list.do?cur_page=" + page
				+ "&search_option=${search_option}&keyword=${keyword}";

	}

	window.onload = function() {
		var allLink = document.querySelector('.link1');
		allLink.click();
	}

	function toggle(link, type) {
		var links = document.querySelectorAll(".link1");
		links.forEach(function(link) {
			link.classList.remove('selected');
		});
		link.classList.add('selected');

		var allPosts = document.querySelectorAll('.category');
		allPosts.forEach(function(post) {
			post.parentElement.style.display = "none"; // 모든 게시물을 숨깁니다.
		});

		if (type === 'all') {
			allPosts.forEach(function(post) {
				post.parentElement.style.display = ""; // 모든 게시물을 보여줍니다.
			});
		} else {
			allPosts.forEach(function(post) {
				if (post.getAttribute('data-type') === type) {
					post.parentElement.style.display = ""; // 해당 카테고리에 속하는 게시물을 보여줍니다.
				}
			});
		}
	}
</script>
</head>

<body>

	<%@ include file="../outline/menubar.jsp"%>

	<p style="text-align: center; margin: 60px 0 80px 0">
		<img src="../../resources/images/logo/comunityup.png"
			style="width: 60%">
	<p>
	<div class="row justify-content-center"
		style="width: 60%; margin: auto;">

		<div class="col-md-2">
			<div class="contents"
				style="width: 12rem; font-family: 'Noto Sans KR', sans-serif; border-left:none; border-right:none; border-top:2px solid rgb(18, 95, 28); border-bottom:2px solid rgb(18, 95, 28);">
				<ul class="list-group list-group-flush" style="border:none;">
					<li class="list-group-item" ><span style="font-size: 15px;">게시판</span></li>
					<li class="list-group-item" style="padding-left: 30px;">
						<p style="margin-bottom: 5px;">
							<a class="link1" href="#" onclick="toggle(this,'all')">전체글보기</a>
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

		<div class="col-md-9 container">
			<div class="row"  style="border-top:2px solid rgb(18, 95, 28); height: 35px; font-family: 'Noto Sans KR', sans-serif;">
				<div class="col-1"></div>
				<div class="col-2"></div>
				<div class="col-5" style="text-align:center;">제목</div>
				<div class="col-2" style="text-align:center;">작성일</div>
				<div class="col-2" style="text-align:center;">조회수</div>
			</div>
			<div class="table-group-divider" style="border-top:1px solid #eee;">
				<c:forEach var="dto" items="${list}">
					<div class="row custom"
						onclick="location.href='/board/post.do?num=${dto.num}'"<c:if test="${dto.type == 1}">id="gong"</c:if> >
						<div class="col-1"<c:if test="${dto.type == 1}">id="gong3"</c:if>>${dto.num}</div>
						<div class="col-2 category" data-type="${dto.type}" <c:if test="${dto.type == 1}">id="gong1"</c:if>>
							<c:choose>
								<c:when test="${dto.type == 1}" >공지사항</c:when>
								<c:when test="${dto.type == 2}">자유게시판</c:when>
							</c:choose>
						</div>
						<div class="col-5" <c:if test="${dto.type == 1}">id="gong2"</c:if>>
							<a>${dto.subject}</a>
						</div>
						<div class="col-2">${dto.reg_date.substring(0, 10)}</div>
						<div class="col-2">${dto.see}</div>
					</div>
				</c:forEach>
			</div>
		</div>

<div style="margin: 25px 0"></div>

		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-sm justify-content-center"  >
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
		<div style="margin: 25px 0"></div>

		<form name="form1" method="post" action="/board/search.do">
			<div style="text-align: center;">
				<select name="search_option" class="searchbtn2">
					<c:choose>
						<c:when test="${search_option == null || search_option == 'all'}">
							<option value="all" selected>전체검색</option>
							<option value="subject">제목</option>
							<option value="contents">내용</option>
						</c:when>
						<c:when test="${search_option == 'subject'}">
							<option value="all">전체검색</option>
							<option value="subject" selected>제목</option>
							<option value="contents">내용</option>
						</c:when>
						<c:when test="${search_option == 'contents'}">
							<option value="all">전체검색</option>
							<option value="subject">제목</option>
							<option value="contents" selected>내용</option>
						</c:when>
					</c:choose>
				</select> <input name="keyword" value="${keyword}"
					style="border-color: rgb(023, 183, 094);"> <input
					type="submit" value="확인" id="btnSearch" class="searchbtn">

				<button type="button" value="글쓰기" class="searchbtn2"
					onclick="location.href='/board/write.do'">글쓰기</button>
			</div>
		</form>

		<div style="margin: 25px 0"></div>

	</div>
	<%@ include file="../outline/footer.jsp"%>
</body>
</html>