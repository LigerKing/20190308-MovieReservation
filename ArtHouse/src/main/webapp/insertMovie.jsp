<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 등록</title>
<!-- 달력 스타일시트 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 개봉일 */
		$("#playdate").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		
		/* 포스터 미리보기 */
		$("#photo").change(function(e) {

			/* 선택한파일을 files에넣는다. */
			var files = e.target.files;
			console.log("파일이름:" + files);
			/* files를 배열에 넣는다 */
			var filesArr = Array.prototype.slice.call(files);
			console.log(filesArr);
			/* 배열에 들어있는거하나씩꺼내기 */
			filesArr.forEach(function(f) {
				/* 이미지타입이아닐때, */
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					console.log("not image");
					return;
				} // match if 
				console.log("yes image");
				/* f를 sel_file에 대입. */
				sel_file = f;
				/* 파일리더는 무엇인가? */
				var reader = new FileReader();
				reader.onload = function(e) {
					/* 속성 : src 지정 */
					$("#poster-thumbnail").attr("src", e.target.result);
				} // reader Function 
				reader.readAsDataURL(f);
			}); // forEach
		}); //change
	});
</script>
</head>
<body>
	<div class="page-body">
		<!-- 상단메뉴 -->
		<jsp:include page="admin_top.jsp"></jsp:include>

		<!-- 중간내용 -->
		<div class="main-context">
			<!-- 영화등록 -->
			<h2 style="text-align: center">관리자 - 영화 등록</h2>
			<hr>
			<form action="insertMovie.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="grade" value="0">
			<input type="hidden" name="count" value="0">
			<input type="hidden" name="recommend" value="0">
				<div align="center">
					<table border="1">
						<tr>
							<td rowspan="9">
								<div class="img_wrap">
									<img id="poster-thumbnail" style="width: 250px; height: 360px;">
								</div>
								<div>
									<input type="file" id="photo" name="file">
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" id="title" name="title"></td>
						</tr>
						<tr>
							<th>장르</th>
							<td><select style="width: 170px" name="ganre">
									<option value="공포">공포</option>
									<option value="코미디">코미디</option>
									<option value="멜로">멜로</option>
									<option value="액션">액션</option>
									<option value="가족">가족</option>
							</select></td>
						</tr>
						<tr>
							<th>개봉일</th>
							<td><input type="text" id='playdate' name="playdate"></td>
						</tr>
						<tr>
							<th>상영시간</th>
							<td><input type="text" id='runtime' name="runtime"> 분</td>
						</tr>
						<tr>
							<th>감독</th>
							<td><input type="text" id='director' name="director"></td>
						</tr>
						<tr>
							<th>배우</th>
							<td><input type="text" id='actors' name="actors"></td>
						</tr>
						<tr>
							<th>연령제한</th>
							<td><input type="text" id='agerequire' name="agerequire"> 세</td>
						</tr>
						<tr>
							<th>줄거리</th>
							<td><textarea rows="12" cols="70" id="summary" name='summary'></textarea></td>
						</tr>
					</table>
				</div>
				<br>
				<div align="center">
					<input type="submit" value="등록">
					<input type="reset" value="다시 입력">
				</div>
			</form>

		</div>

		<!-- 하단내용 -->
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>