<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.title {
	color: rgb(023, 183, 094);
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
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
	font-size: 15px;
	font-weight: 400;
	padding-bottom: 20px;
}

.noto {
	font-family: "Noto Sans KR", sans-serif;
}

.sinchung {
	color: white;
	border: none;
	padding: 11px 20px;
	border-radius: 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin: 20px 0px 20px 20px;
	width: 80%;
	background-color: #0066ff;
	cursor: pointer;
}

.sinchung:hover {
	background-color: #0044cc;
}
</style>
</head>
<body style="background-color: rgb(233, 234, 238)">
	<%@ include file="../outline/menubar.jsp"%>
	<div class="row justify-content-center"
		style="width: 60%; margin: auto;">


		<img src="../../resources/images/ground/${dto.filename}"
			style="margin-top: 50px; width: 97%; height: 600px; object-fit: cover; object-position: center;">


		<div class="row">

			<div class="col-7">

				<div class="row" style="margin-top: 10px;">
					<div class="back1 con1">
						<p class="title" style="color: #ff3333">매치 정보</p>
						<div class="row" style="padding-left: 20px; margin-bottom: 5px;">
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
</svg>
								&nbsp;&nbsp;&nbsp;${dto.age}
							</div>
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-gender-ambiguous"
									viewBox="0 0 16 16">
  <path fill-rule="evenodd"
										d="M11.5 1a.5.5 0 0 1 0-1h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V1.707l-3.45 3.45A4 4 0 0 1 8.5 10.97V13H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V14H6a.5.5 0 0 1 0-1h1.5v-2.03a4 4 0 1 1 3.471-6.648L14.293 1zm-.997 4.346a3 3 0 1 0-5.006 3.309 3 3 0 0 0 5.006-3.31z" />
</svg>
								&nbsp;&nbsp;&nbsp;${dto.gender}
							</div>
						</div>
						<div class="row" style="padding-left: 20px;">
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-flag-fill" viewBox="0 0 16 16">
  <path
										d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12 12 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A20 20 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a20 20 0 0 0 1.349-.476l.019-.007.004-.002h.001" />
</svg>
								&nbsp;&nbsp;&nbsp;${dto.way}
							</div>
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-people-fill"
									viewBox="0 0 16 16">
  <path
										d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
</svg>
								&nbsp;&nbsp;&nbsp;${dto.count}&nbsp;&nbsp;&nbsp;명
							</div>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: 10px;">
					<div class="back1 con1">
						<p class="title">구장 정보</p>
						<div class="row" style="padding-left: 20px; margin-bottom: 5px;">
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-arrows-move"
									viewBox="0 0 16 16">
  <path fill-rule="evenodd"
										d="M7.646.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 1.707V5.5a.5.5 0 0 1-1 0V1.707L6.354 2.854a.5.5 0 1 1-.708-.708zM8 10a.5.5 0 0 1 .5.5v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 0 1 .708-.708L7.5 14.293V10.5A.5.5 0 0 1 8 10M.146 8.354a.5.5 0 0 1 0-.708l2-2a.5.5 0 1 1 .708.708L1.707 7.5H5.5a.5.5 0 0 1 0 1H1.707l1.147 1.146a.5.5 0 0 1-.708.708zM10 8a.5.5 0 0 1 .5-.5h3.793l-1.147-1.146a.5.5 0 0 1 .708-.708l2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708L14.293 8.5H10.5A.5.5 0 0 1 10 8" />
</svg>
								&nbsp;&nbsp;&nbsp;${gdto.groundsize}
							</div>
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-droplet-fill"
									viewBox="0 0 16 16">
  <path
										d="M8 16a6 6 0 0 0 6-6c0-1.655-1.122-2.904-2.432-4.362C10.254 4.176 8.75 2.503 8 0c0 0-6 5.686-6 10a6 6 0 0 0 6 6M6.646 4.646l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448c.82-1.641 1.717-2.753 2.093-3.13" />
</svg>
								&nbsp;&nbsp;&nbsp;${gdto.shower}
							</div>
						</div>
						<div class="row" style="padding-left: 20px; margin-bottom: 5px;">
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-car-front-fill"
									viewBox="0 0 16 16">
  <path
										d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z" />
</svg>
								&nbsp;&nbsp;&nbsp;${gdto.parking}
							</div>
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-bookmark-check"
									viewBox="0 0 16 16">
  <path fill-rule="evenodd"
										d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0" />
  <path
										d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
</svg>
								&nbsp;&nbsp;&nbsp;${gdto.borrow}
							</div>
						</div>
						<div class="row" style="padding-left: 20px;">
							<div class="col">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-cup-straw" viewBox="0 0 16 16">
  <path
										d="M13.902.334a.5.5 0 0 1-.28.65l-2.254.902-.4 1.927c.376.095.715.215.972.367.228.135.56.396.56.82q0 .069-.011.132l-.962 9.068a1.28 1.28 0 0 1-.524.93c-.488.34-1.494.87-3.01.87s-2.522-.53-3.01-.87a1.28 1.28 0 0 1-.524-.93L3.51 5.132A1 1 0 0 1 3.5 5c0-.424.332-.685.56-.82.262-.154.607-.276.99-.372C5.824 3.614 6.867 3.5 8 3.5c.712 0 1.389.045 1.985.127l.464-2.215a.5.5 0 0 1 .303-.356l2.5-1a.5.5 0 0 1 .65.278M9.768 4.607A14 14 0 0 0 8 4.5c-1.076 0-2.033.11-2.707.278A3.3 3.3 0 0 0 4.645 5c.146.073.362.15.648.222C5.967 5.39 6.924 5.5 8 5.5c.571 0 1.109-.03 1.588-.085zm.292 1.756C9.445 6.45 8.742 6.5 8 6.5c-1.133 0-2.176-.114-2.95-.308a6 6 0 0 1-.435-.127l.838 8.03c.013.121.06.186.102.215.357.249 1.168.69 2.438.69s2.081-.441 2.438-.69c.042-.029.09-.094.102-.215l.852-8.03a6 6 0 0 1-.435.127 9 9 0 0 1-.89.17zM4.467 4.884s.003.002.005.006zm7.066 0-.005.006zM11.354 5a3 3 0 0 0-.604-.21l-.099.445.055-.013c.286-.072.502-.149.648-.222" />
</svg>
								&nbsp;&nbsp;&nbsp;${gdto.drinking}
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-5" style="margin-top: 10px;">
				<div class="back1 noto" style="padding: 35px 0 20px 40px;">
					<p
						style="color: #888; font-size: 18px; font-weight: 600; margin: 0">${dto.matchdate}</p>
					<p
						style="color: #333; font-size: 26px; font-weight: 500; margin-top: 10px;">${dto.groundname}</p>
					<p
						style="color: #555; font-size: 15px; font-weight: 400; margin-top: 15px;">${dto.address}</p>
					<c:choose>
						<c:when test="${count==1}">
							<button class="sinchung" disabled>이미 신청</button>
						</c:when>
						<c:when test="${count==0}">
							<input type="button" id="sinchung" class="sinchung"
								onclick="application()" value="신청하기">
						</c:when>
					</c:choose>
				</div>

			</div>

		</div>


		<div style="margin: 50px 0;"></div>

	</div>
	<%@ include file="../outline/footer.jsp"%>
	<script>
	function application() {
	      var idx = ${dto.idx};
          var userid = "${sessionScope.userid}";
          var button = document.getElementById("sinchung"); // 버튼의 ID를 가져옵니다.

		 $.ajax({
			type: "post",
			url: "/social/application.do",
			data: {
				"idx": idx,
				"userid":userid
			},
			success: function(response) {
				console.log("삽입 성공: " + response);
		            button.disabled = true;
		            button.value = "신청 완료"; 

			}
		}); 
	}
	</script>
</body>
</html>