<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item"%>
<%@page
	import="org.hibernate.usertype.internal.OffsetDateTimeCompositeUserType.OffsetDateTimeEmbeddable"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.example.ground.dto.GroundDTO"%>
<%@ page import="com.example.ground.dto.ReservationDTO"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Time"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.example.ground.dao.ReservationDAOImpl"%>
<%@page import="com.example.ground.dao.ReservationDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장예약</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="icon" href="../../resources/images/logo/icon1.png"
	type="image/x-icon">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
    window.onload = function() {
        // 예약된 시간을 담을 배열
        var reservedTimes = [];

        // JSP에서 받은 예약된 시간 목록을 JavaScript 배열에 추가
        <c:forEach var="time" items="${reserve}">
            reservedTimes.push("<fmt:formatDate value='${time.RESERVATION_DATE}' pattern='yyyy-MM-dd HH:mm' />");
        </c:forEach>

        console.log(reservedTimes);

        // 현재 시간을 가져오는 함수
        function getCurrentTime() {
            var now = new Date();
            var year = now.getFullYear();
            var month = String(now.getMonth() + 1).padStart(2, '0');
            var date = String(now.getDate()).padStart(2, '0');
            var hours = String(now.getHours()).padStart(2, '0');
            var minutes = String(now.getMinutes()).padStart(2, '0');
            var currentTime = year + "-" + month + "-" + date + " " + hours + ":" + minutes;
            return currentTime;
        }

        // 버튼 비활성화 함수
        function disableReservedTimes() {
            // 현재 시간 가져오기
            var currentTime = getCurrentTime();

            // 모든 버튼을 가져옴
            var buttons = document.querySelectorAll("#date button");
            
            // 각 버튼에 대해 처리
            buttons.forEach(function(button) {
                // 버튼의 값(시간)을 가져옴
                var time = button.value;

                // 예약된 시간 배열에 해당 시간이 포함되어 있는지 확인
                if (reservedTimes.includes(time) || time < currentTime) {
                    // 포함되어 있거나 현재 시간 이전이라면 버튼을 비활성화
                    button.classList.add("disabled");
                }
            });
        }

        // 버튼 비활성화 함수 호출
        disableReservedTimes();
    };
</script>
<style>
.ground-image {
	max-width: 400px;
	height: auto;
	display: block;
	margin: 10px 0;
}

.ground-image2 {
	max-width: 400px;
	height: auto;
	display: block;
	margin: 10px 0;
}

.ground-image3 {
	max-width: 400px;
	height: auto;
	display: block;
	margin: 10px 0;
}

button {
	background-color: lightgray;
	border: none;
	padding: 10px 20px;
	margin: 5px;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 18px;
	font-weight: 400;
	color: #333;
	font-size: 18px;
}

/* 선택된 버튼 스타일 */
button.selected {
	background-color: lightblue;
}

button.disabled {
	background-color: gray;
	pointer-events: none;
}

.modal {
	display: none; /* 모달은 기본적으로 숨겨져 있음 */
	position: fixed; /* 고정 위치 */
	z-index: 1; /* 다른 요소 위에 나타나도록 설정 */
	left: 0;
	top: 0;
	width: 100%; /* 화면 전체 너비 */
	height: 100%; /* 화면 전체 높이 */
	overflow: auto; /* 넘치는 내용을 스크롤 가능하도록 설정 */
	background-color: rgb(0, 0, 0); /* 배경색 */
	background-color: rgba(0, 0, 0, 0.9); /* 배경색 + 투명도 */
}

.modal-content {
	margin: auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.modal-content img {
	max-width: 80%;
	max-height: 80%;
	margin: 20px;
}

.close {
	color: #fff;
	position: absolute;
	top: 10px;
	right: 20px;
	font-size: 30px;
	font-weight: bold;
	cursor: pointer;
}

#carouselExampleRide {
	width: 60%;
	margin: auto; /* 가운데 정렬 */
}

.name {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 40px;
	font-weight: 500;
	color: #333;
}

.address {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	font-weight: 400;
	color: #aaa;
}

.big1 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 24px;
	font-weight: 400;
	color: #333;
	margin: 10px 0 2px 0;
}

#date {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	font-weight: 400;
	color: #333;
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
	margin-top : 10px;
	margin-left  : 10px;
}

.price {
	color: white;
	border: none;
	padding: 11px 20px;
	border-radius: 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin: 20px 0px 20px 20px;
	width: 18%;
	background-color: #0066ff;
	cursor: pointer;
}

.price:hover {
	background-color: #0044cc;
}

.nope {
	opacity: 0.3;
}

.line {
	text-decoration: line-through;
}

.title {
	color: rgb(023, 183, 094);
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	font-weight: 500;
	margin: 12px 0 10px 0px;
}

.title2 {
	color: #ff6600;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	font-weight: 500;
	margin: 12px 0 10px 0px;
}
</style>
</head>
<body>

	<%@ include file="../outline/menubar.jsp"%>


	<div style="margin: 60px 0"></div>


	<!-- 
     <div class="carousel-images" class="carousel-item active" data-bs-ride="carousel" data-bs-interval="3000" data-bs-ride="carouse1" data-bs-pause="false">
    <img src="../../resources/images/ground/${item.getFilename()}" alt="Ground Image" class="carousel-image" onclick='showAllImages()'>
    <img src="../../resources/images/ground/${item.getFilename2()}" alt="Ground Image" class="carousel-image" onclick='showAllImages()'>
    <img src="../../resources/images/ground/${item.getFilename3()}" alt="Ground Image" class="carousel-image" onclick='showAllImages()'>
</div> -->

	<div style="padding: 20px 0 20px 0;">
		<div id="carouselExampleRide" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="3000"
			data-bs-ride="carouse1" data-bs-pause="false";>
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner"
				style="width: 100%; height: 600px; object-fit: cover; object-position: center;">
				<div class="carousel-item active">
					<a href="home.do"><img
						src="../../resources/images/ground/${item.getFilename()}"
						class="d-block w-100" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href="home.do"><img
						src="../../resources/images/ground/${item.getFilename2()}"
						class="d-block w-100" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href="home.do"><img
						src="../../resources/images/ground/${item.getFilename3()}"
						class="d-block w-100" alt="..."></a>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleRide" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleRide" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>


	<!-- 모달 창 -->
	<div id="myModal" class="modal">
		<span class="close" onclick="closeModal()">&times;</span>
		<div class="modal-content"></div>
	</div>

	<script>
    function showAllImages() {
        var modal = document.getElementById("myModal");
        var modalContent = document.querySelector(".modal-content");
        var images = document.querySelectorAll(".carousel-images img");

        // 모달에 이미지 추가
        modalContent.innerHTML = ""; // 모달 내용 초기화
        images.forEach(function(image) {
            var img = document.createElement("img");
            img.src = image.src;
            img.alt = image.alt;
            img.classList.add("modal-image");
            modalContent.appendChild(img);
        });

        // 모달 열기
        modal.style.display = "block";
    }

    // 모달 닫기
    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }
</script>

	<div class="col-7" style="margin: auto;">
		<p class="name">${item.getName()}</p>
		<p class="address">${item.getAddress()}</p>

		<div class="row">
			<hr style="margin: 20px 0">
		</div>

		<%
		Date now = new Date();
		Date next = new Date(now.getTime() + 24 * 60 * 60 * 1000);
		Date nextnext = new Date(next.getTime() + 24 * 60 * 60 * 1000);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String format = sdf.format(now);
		String format2 = sdf.format(next);
		String format3 = sdf.format(nextnext);
		%>


		<div id="date">

			<div class="big1" id="today"><%=format%></div>

			<var id="selectdate1" data-date="<%=format%>">
				<button value="<%=format%> 08:00" data-price="${item.price}"
					onclick="go(this)">08:00 - 10:00</button>
				<button value="<%=format%> 10:00" data-price="${item.price}"
					onclick="go(this)">10:00 - 12:00</button>
				<button value="<%=format%> 12:00" data-price="${item.price}"
					onclick="go(this)">12:00 - 14:00</button>
				<button value="<%=format%> 14:00" data-price="${item.price}"
					onclick="go(this)">14:00 - 16:00</button>
				<button value="<%=format%> 16:00" data-price="${item.price}"
					onclick="go(this)">16:00 - 18:00</button>
				<button value="<%=format%> 18:00" data-price="${item.price}"
					onclick="go(this)">18:00 - 20:00</button>
				<button value="<%=format%> 20:00" data-price="${item.price}"
					onclick="go(this)">20:00 - 22:00</button>
				<button value="<%=format%> 22:00" data-price="${item.price}"
					onclick="go(this)">22:00 - 24:00</button>
			</var>



			<div class="big1" id="next"><%=format2%></div>

			<var id="selectdate2" data-date="<%=format2%>">
				<button value="<%=format2%> 08:00" data-price="${item.price}"
					onclick="go(this)">08:00 - 10:00</button>
				<button value="<%=format2%> 10:00" data-price="${item.price}"
					onclick="go(this)">10:00 - 12:00</button>
				<button value="<%=format2%> 12:00" data-price="${item.price}"
					onclick="go(this)">12:00 - 14:00</button>
				<button value="<%=format2%> 14:00" data-price="${item.price}"
					onclick="go(this)">14:00 - 16:00</button>
				<button value="<%=format2%> 16:00" data-price="${item.price}"
					onclick="go(this)">16:00 - 18:00</button>
				<button value="<%=format2%> 18:00" data-price="${item.price}"
					onclick="go(this)">18:00 - 20:00</button>
				<button value="<%=format2%> 20:00" data-price="${item.price}"
					onclick="go(this)">20:00 - 22:00</button>
				<button value="<%=format2%> 22:00" data-price="${item.price}"
					onclick="go(this)">22:00 - 24:00</button>
			</var>

			<div class="big1"><%=format3%></div>

			<var id="selectdate3" data-date="<%=format3%>">
				<button value="<%=format3%> 08:00" data-price="${item.price}"
					onclick="go(this)">08:00 - 10:00</button>
				<button value="<%=format3%> 10:00" data-price="${item.price}"
					onclick="go(this)">10:00 - 12:00</button>
				<button value="<%=format3%> 12:00" data-price="${item.price}"
					onclick="go(this)">12:00 - 14:00</button>
				<button value="<%=format3%> 14:00" data-price="${item.price}"
					onclick="go(this)">14:00 - 16:00</button>
				<button value="<%=format3%> 16:00" data-price="${item.price}"
					onclick="go(this)">16:00 - 18:00</button>
				<button value="<%=format3%> 18:00" data-price="${item.price}"
					onclick="go(this)">18:00 - 20:00</button>
				<button value="<%=format3%> 20:00" data-price="${item.price}"
					onclick="go(this)">20:00 - 22:00</button>
				<button value="<%=format3%> 22:00" data-price="${item.price}"
					onclick="go(this)">22:00 - 24:00</button>
			</var>
		</div>

		<div style="text-align: right; margin: 30px 80px 0 0;">
			<button class="price" onclick="kakaopay()">
				<span id="total">0</span>원&nbsp;결제하기
			</button>
		</div>

		<div class="row">
			<hr style="margin: 15px 0">
		</div>

<p class="title">구장 정보</p>
		<div class="con1">
			<p>
				경기장 사이즈&nbsp; :&nbsp;<span>${item.groundsize}</span><p>
		
				<c:choose>
					<c:when test="${item.shower == '샤워 가능'}">
						<p>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-droplet-fill"
								viewBox="0 0 16 16">
  <path
									d="M8 16a6 6 0 0 0 6-6c0-1.655-1.122-2.904-2.432-4.362C10.254 4.176 8.75 2.503 8 0c0 0-6 5.686-6 10a6 6 0 0 0 6 6M6.646 4.646l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448c.82-1.641 1.717-2.753 2.093-3.13" />
</svg>
							&nbsp;&nbsp;&nbsp;샤워실
						</p>
					</c:when>
					<c:when test="${item.shower== '샤워 불가능'}">
						<p class="nope">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-droplet-fill"
								viewBox="0 0 16 16">
  <path
									d="M8 16a6 6 0 0 0 6-6c0-1.655-1.122-2.904-2.432-4.362C10.254 4.176 8.75 2.503 8 0c0 0-6 5.686-6 10a6 6 0 0 0 6 6M6.646 4.646l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448c.82-1.641 1.717-2.753 2.093-3.13" />
</svg>
							&nbsp;&nbsp;&nbsp;<span class="line">샤워실</span>
						</p>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${item.parking == '주차 공간 협소'}">
						<p>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-car-front-fill"
								viewBox="0 0 16 16">
  <path
									d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z" />
</svg>
							&nbsp;&nbsp;&nbsp;무료주차
						</p>
					</c:when>
					<c:when test="${item.parking== '주차 공간 없음'}">
						<p class="nope">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-car-front-fill"
								viewBox="0 0 16 16">
  <path
									d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z" />
</svg>
							&nbsp;&nbsp;&nbsp;<span class="line">주차장</span>
						</p>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${item.borrow == '신발 대여 가능'}">
						<p>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-bookmark-check"
								viewBox="0 0 16 16">
  <path fill-rule="evenodd"
									d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0" />
  <path
									d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
</svg>
							&nbsp;&nbsp;&nbsp;풋살화 대여 가능
						</p>
					</c:when>
					<c:when test="${item.borrow== '신발 대여 불가능'}">
						<p class="nope">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-bookmark-check"
								viewBox="0 0 16 16">
  <path fill-rule="evenodd"
									d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0" />
  <path
									d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
</svg>
							&nbsp;&nbsp;&nbsp;<span class="line">풋살화 대여</span>
						</p>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${item.drinking == '음료 판매'}">
						<p>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-cup-straw" viewBox="0 0 16 16">
  <path
									d="M13.902.334a.5.5 0 0 1-.28.65l-2.254.902-.4 1.927c.376.095.715.215.972.367.228.135.56.396.56.82q0 .069-.011.132l-.962 9.068a1.28 1.28 0 0 1-.524.93c-.488.34-1.494.87-3.01.87s-2.522-.53-3.01-.87a1.28 1.28 0 0 1-.524-.93L3.51 5.132A1 1 0 0 1 3.5 5c0-.424.332-.685.56-.82.262-.154.607-.276.99-.372C5.824 3.614 6.867 3.5 8 3.5c.712 0 1.389.045 1.985.127l.464-2.215a.5.5 0 0 1 .303-.356l2.5-1a.5.5 0 0 1 .65.278M9.768 4.607A14 14 0 0 0 8 4.5c-1.076 0-2.033.11-2.707.278A3.3 3.3 0 0 0 4.645 5c.146.073.362.15.648.222C5.967 5.39 6.924 5.5 8 5.5c.571 0 1.109-.03 1.588-.085zm.292 1.756C9.445 6.45 8.742 6.5 8 6.5c-1.133 0-2.176-.114-2.95-.308a6 6 0 0 1-.435-.127l.838 8.03c.013.121.06.186.102.215.357.249 1.168.69 2.438.69s2.081-.441 2.438-.69c.042-.029.09-.094.102-.215l.852-8.03a6 6 0 0 1-.435.127 9 9 0 0 1-.89.17zM4.467 4.884s.003.002.005.006zm7.066 0-.005.006zM11.354 5a3 3 0 0 0-.604-.21l-.099.445.055-.013c.286-.072.502-.149.648-.222" />
</svg>
							&nbsp;&nbsp;&nbsp;음료 판매
						</p>
					</c:when>
					<c:when test="${item.drinking== '음료 미판매'}">
						<p class="nope">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-cup-straw" viewBox="0 0 16 16">
  <path
									d="M13.902.334a.5.5 0 0 1-.28.65l-2.254.902-.4 1.927c.376.095.715.215.972.367.228.135.56.396.56.82q0 .069-.011.132l-.962 9.068a1.28 1.28 0 0 1-.524.93c-.488.34-1.494.87-3.01.87s-2.522-.53-3.01-.87a1.28 1.28 0 0 1-.524-.93L3.51 5.132A1 1 0 0 1 3.5 5c0-.424.332-.685.56-.82.262-.154.607-.276.99-.372C5.824 3.614 6.867 3.5 8 3.5c.712 0 1.389.045 1.985.127l.464-2.215a.5.5 0 0 1 .303-.356l2.5-1a.5.5 0 0 1 .65.278M9.768 4.607A14 14 0 0 0 8 4.5c-1.076 0-2.033.11-2.707.278A3.3 3.3 0 0 0 4.645 5c.146.073.362.15.648.222C5.967 5.39 6.924 5.5 8 5.5c.571 0 1.109-.03 1.588-.085zm.292 1.756C9.445 6.45 8.742 6.5 8 6.5c-1.133 0-2.176-.114-2.95-.308a6 6 0 0 1-.435-.127l.838 8.03c.013.121.06.186.102.215.357.249 1.168.69 2.438.69s2.081-.441 2.438-.69c.042-.029.09-.094.102-.215l.852-8.03a6 6 0 0 1-.435.127 9 9 0 0 1-.89.17zM4.467 4.884s.003.002.005.006zm7.066 0-.005.006zM11.354 5a3 3 0 0 0-.604-.21l-.099.445.055-.013c.286-.072.502-.149.648-.222" />
</svg>
							&nbsp;&nbsp;&nbsp;<span class="line">음료 판매</span>
						</p>
					</c:when>
				</c:choose></div>
				
				<div class="row">
			<hr style="margin-bottom: 10px 0">
		</div>

		<div>
			<p class="title2">예약 취소 및 환불 규정</p>
			<p class="con1">10일 전 100% 환불<br> 5일 전 80% 환불<br>
			3일 전 50% 환불<br> 2일 전 ~ 예약 당일 환불 불가</p> 
			
			<p class="con1" style="margin: 0px 3px;">강수 시 변경 및 환불 규정</p>
			<p class="con1"  style="margin: 0px 9px;">
			●아래 조건에 해당하는 경우, 플래비(홈페이지 우측 하단의 노란색 아이콘)를 통해 문의주시면 확인 후 변경 및 환불을
			도와드립니다.<br> ●실내 구장은 강수로 인한 변경 및 환불 가능 조건에 해당하지 않습니다.<br> 변경
			규정<br> ●예약 시작 시간 2시간 전 기상청 날씨누리 해당 주소지를 기준으로 합니다<br> - 오전
			예약의 경우 전일 21시부터 변경 요청 가능<br> ●시간당 5mm 이상의 강수량이 예보되는 경우, 예약일 변경이
			가능합니다.<br> 환불 규정<br> ●당일 천재지변으로 인해 구장 이용이 불가한 경우, 100%
			환불됩니다.<br> - 적용 기준: 호우·대설·태풍·강풍 주의보 및 경보, 한파·폭염 경보<br> 그 외
			취소 기준<br> ●결제 후 30분 이내 하루 1회에 한해 무료 취소가 가능합니다.<br> ●단순 변심에
			의한 날짜 변경은 불가합니다.<br> ●예약 시간이 지나고 문의하는 경우 변경 및 환불이 불가합니다.</p>
		</div>

	</div>

	<script>
      let total = 0;
      let selectedTimes = [];

      function go(button) {
         let price = parseInt(button.getAttribute("data-price"));
         let time = button.value;

         if (button.classList.contains("selected")) {
            button.classList.remove("selected");
            total -= price;
            selectedTimes = selectedTimes.filter(t => t !== time);
         } else {
            button.classList.add("selected");
            total += price;
            selectedTimes.push(time);
         }
         document.getElementById("total").innerHTML = total;
      }

      function kakaopay() {
         var amount = total;
         console.log(amount);
         IMP.init('imp68066408');
         IMP.request_pay({
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: "그라운드어스",
            amount: amount,
            buyer_name: '${sessionScope.userid}'
         }, function(rsp) {
            if (rsp.success) {
               alert('결제가 완료되었습니다.');
               var userid = '${sessionScope.userid}';
               var groundname = '${item.name}';
                  var reservation_date = selectedTimes.join(", ")
               console.log(userid);
               console.log(groundname);
               console.log(reservation_date);
               insert(userid, groundname, reservation_date);
            } else {
               alert('결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg);
            }
         });
      }

      function insert(userid, groundname, reservation_date) {
         $.ajax({
            type: "post",
            url: "/reservation/insert.do",
            data: {
               "userid": userid,
               "groundname": groundname,
               "reservation_date": reservation_date,
            },
            success: function(response) {
               console.log("삽입 성공: " + response);
                location.reload();
            },
            error: function(xhr, status, error) {
               console.error("오류 발생: " + error);
               // 오류 발생 시 처리할 내용
            }
         });
      }
      
      </script>

	<%@ include file="../outline/footer.jsp"%>
</body>
</html>
