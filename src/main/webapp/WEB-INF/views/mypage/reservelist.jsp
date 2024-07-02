<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
<style>
.submit-btn {
	background-color: #888;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: normal;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin-top: 10px;
}

.active {
	background-color: #0066ff; /* 활성화된 상태의 색상 */
	cursor: pointer;
}

.choice1 {
	border: 2px solid #888;
	border-radius: 10px; /* 테두리 끝만 둥글게 하기 위해 변경 */
	font-family: "Noto Sans KR", sans-serif;
	background-color: #fff;
	padding: 5px 10px 5px 10px;
	cursor: pointer;
}

.choice2 {
	border: 2px solid #888;
	border-radius: 10px; /* 테두리 끝만 둥글게 하기 위해 변경 */
	font-family: "Noto Sans KR", sans-serif;
	background-color: #fff;
	padding: 5px 10px 5px 10px;
	cursor: pointer;
}

.choice3 {
	border: 2px solid #888;
	border-radius: 10px; /* 테두리 끝만 둥글게 하기 위해 변경 */
	font-family: "Noto Sans KR", sans-serif;
	background-color: #fff;
	padding: 5px 10px 5px 10px;
	cursor: pointer;
}

.select {
	color: #0066ff;
	font-weight: bold;
	border: 2px solid #0066ff;
}

.modal {
	display: none; /* 초기 상태는 보이지 않음 */
	position: fixed; /* 창이 화면에 고정됨 */
	z-index: 1; /* 다른 요소보다 위에 표시 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경을 어둡게 */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* 넓이 설정 */
}
</style>
</head>
<body>
	<%@ include file="../outline/menubar.jsp"%>
	<c:choose>
		<c:when test="${empty reserve}">
			<a href="/ground/list.do">구장예약하러 가기</a>
		</c:when>
		<c:otherwise>
			<table border="1">
				<thead>
					<tr>
						<th>Ground Name</th>
						<th>Reservation Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="res" items="${reserve}">
						<tr>
							<td>${res.groundname}</td>
							<td><fmt:formatDate value="${res.reservation_date}"
									pattern="yyyy-MM-dd HH:mm" var="formattedDate" />
								${formattedDate}</td>
							<td>${res.idx}</td>
							<td><input type="hidden" name="groundname"
								value="${res.groundname}"> <input type="hidden"
								name="reservation_date" value="${formattedDate}">
								<c:choose>
								<c:when test="${res.section==0}">
								<button class="openModal" data-idx="${res.idx}">소셜매치
									만들기</button>
								</c:when>
									<c:otherwise>
									<button onclick="stopmatch(${res.idx});">소셜매치 중단하기</button>
									</c:otherwise>
									</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:forEach var="res" items="${reserve}">
				<div id="modal1_${res.idx}" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span> <span>${res.groundname}</span>
						<span><fmt:formatDate value="${res.reservation_date}"
								pattern="yyyy-MM-dd HH:mm" var="formattedDate" />
							${formattedDate}</span>
						<button type="button" class="next" data-next="modal2_${res.idx}">Next</button>
					</div>
				</div>
				<form id="form1" action="/social/create.do" method="post">
					<div id="modal2_${res.idx}" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span> <span>${res.groundname}</span>
							<input type="hidden" value="${res.idx}" name="idx">
							 <input type="hidden" value="${formattedDate}"
								name="date"> <input type="hidden"
								value="${res.groundname}" name="groundname">
							<p class="p1">나이 (중복 가능)</p>
							<button type="button" class="choice1"
								onclick="toggleAge(this,'${res.idx}')">10대</button>
							<button type="button" class="choice1"
								onclick="toggleAge(this,'${res.idx}')">20대</button>
							<button type="button" class="choice1"
								onclick="toggleAge(this,'${res.idx}')">30대</button>
							<button type="button" class="choice1"
								onclick="toggleAge(this,'${res.idx}')">40대</button>
							<button type="button" class="choice1"
								onclick="toggleAge(this,'${res.idx}')">50대</button>
							<button type="button" class="choice1"
								onclick="toggleAge(this,'${res.idx}')">60대이상</button>
							<input type="hidden" id="selectedAge_${res.idx}" name="selectedAge" value="">
							<p class="p1">성별</p>
							<button type="button" class="choice2"
								onclick="toggleGender(this,'${res.idx}')">남자</button>
							<button type="button" class="choice2"
								onclick="toggleGender(this,'${res.idx}')">여자</button>
							<button type="button" class="choice2"
								onclick="toggleGender(this,'${res.idx}')">남녀모두</button>
							<input type="hidden" id="selectedGender_${res.idx}" name="selectedGender"
								value="">
							<p class="p1">진행방식</p>
							<button type="button" class="choice3"
								onclick="toggleWay(this,'${res.idx}')">6vs6 2파전</button>
							<button type="button" class="choice3"
								onclick="toggleWay(this,'${res.idx}')">6vs6 3파전</button>
							<button type="button" class="choice3"
								onclick="toggleWay(this,'${res.idx}')">6vs6 4파전</button>
							<input type="hidden" id="selectedWay_${res.idx}" name="selectedWay" value="">
							<p class="p1">모집 인원</p>
							<input type="text" id="selectedCount_${res.idx}" name="selectedCount"
								placeholder="모집인원을 입력하세요"
								onkeyup="checkFormCompletion(${res.idx});"
								 />
							<button id="submitButton_${res.idx}" type="submit"
								class="submit-btn">제출</button>
						</div>
					</div>
				</form>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<script>
$(document).ready(function() {

    $('.openModal').click(function() {
        var idx = $(this).data('idx'); // $(this)를 사용하여 클릭된 버튼을 가져옵니다.
        console.log(idx);
        $('#modal1_' + idx).show(); // 해당 idx에 대한 모달을 보이게 합니다.
    });
    // 닫기 버튼
    $('.close').click(function() {
        if (confirm("창을 닫으면 저장 내용이 삭제됩니다. 닫으시겠습니까?")) {
            $(this).closest('.modal').hide();
            clearModalInputs();

            clearSelectedButtons(); // 선택된 버튼 클래스 제거 함수 호출
        }
    });
    $('.next').click(function() {
        var currentModal = $(this).closest('.modal');
        var nextModalId = $(this).data('next');
        currentModal.hide();
        $('#' + nextModalId).show();
    });
});

function toggleAge(button, idx) {
    button.classList.toggle('select');
    updateSelectedAge(idx);
    checkFormCompletion(idx);
}

function updateSelectedAge(idx) {
    var buttons = document.querySelectorAll('#modal2_' + idx + ' .choice1');
    console.log(buttons)
    var selectedAges = [];

    buttons.forEach(function(button) {
        if (button.classList.contains('select')) {
            selectedAges.push(button.textContent);
        }
    });

    document.getElementById('selectedAge_'+idx).value = selectedAges.join(', ');
}

function toggleGender(button, idx) {
    var buttons = document.querySelectorAll('#modal2_' + idx + ' .choice2');
    buttons.forEach(function(btn) {
        btn.classList.remove('select');
    });

    button.classList.add('select');
    updateSelectedGender(idx);
    checkFormCompletion(idx);
}

function updateSelectedGender(idx) {
    var selectedGender = '';
    var selectedButton = document.querySelector('#modal2_' + idx + ' .choice2.select');

    if (selectedButton) {
        selectedGender = selectedButton.textContent;
    }

    document.getElementById('selectedGender_'+idx).value = selectedGender;
}

function toggleWay(button, idx) {
    var buttons = document.querySelectorAll('#modal2_' + idx + ' .choice3');
    buttons.forEach(function(btn) {
        btn.classList.remove('select');
    });

    button.classList.add('select');
    updateSelectedWay(idx);
    checkFormCompletion(idx);
}

function updateSelectedWay(idx) {
    var selectedWay = '';
    var selectedButton = document.querySelector('#modal2_' + idx + ' .choice3.select');

    if (selectedButton) {
        selectedWay = selectedButton.textContent;
    }

    document.getElementById('selectedWay_'+idx).value = selectedWay;
}

function clearModalInputs() {
    $('#selectedAge').val(''); // 나이 선택 값 초기화
    $('#selectedGender').val(''); // 성별 선택 값 초기화
    $('#selectedClass').val(''); // 모집 인원 선택 값 초기화
    $('#selectedWay').val(''); // 진행방식 선택 값 초기화
}

function clearSelectedButtons() {
    $('.choice1').removeClass('select');
    $('.choice2').removeClass('select');
    $('.choice3').removeClass('select');
    $('input').val('');
}

function checkFormCompletion(idx) {
    var selectedGender = document.getElementById('selectedGender_'+idx).value;
    var selectedWay = document.getElementById('selectedWay_'+idx).value;
    var selectedAge = document.getElementById('selectedAge_'+idx).value;
    var selectedCount = document.getElementById('selectedCount_'+idx).value;
    var submitButton = document.getElementById('submitButton_'+idx);
    console.log(selectedGender)
    console.log(selectedWay)
    console.log(selectedAge)
    console.log(selectedCount)
    console.log(submitButton)
    console.log(idx)
    if (selectedGender && selectedWay && selectedAge&&selectedCount) {
        submitButton.disabled = false;
        submitButton.classList.add('active');
    } else {
        submitButton.disabled = true;
        submitButton.classList.remove('active');
    } 
}

function stopmatch(idx) {
	$.ajax({
		type: "post",
		url: "/social/matchstop.do",
		data: {
			"idx": idx,
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
</body>
</html>

