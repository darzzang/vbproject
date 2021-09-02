<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약 현황" />
</jsp:include>


<body>
	<div class="wrapper">
		<!-- nav 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/menu.jsp"%>

		<!-- visual & title Area -->
		<div class="visualArea">
			<div class="dimArea"></div>
			<div class="container">
				<h1 class="move-up">예약 현황</h1>
			</div>
		</div>

		<div class="pd statusArea">
			<div class="container">
				<h2>검색</h2>

				<!-- 검색영역 시작 -->
				<div class="searchArea">
					<form>
						<div class="col-sm-8 offset-sm-2 formAreaInner">
							<!-- 백신 선택(checkbox, 필수) -->
							<div class="form-group row">
								<div class="col-sm-3 labelArea">
									<label>백신 선택<span class="require-mark">*</span></label>
								</div>
								<div class="col-sm-9 inputArea">
									<ul class="radioArea">
										<li><input type="checkbox" name="vaccine_chk"
											value="Moderna" checked> 모더나</li>
										<li><input type="checkbox" name="vaccine_chk"
											value="Pfizer"> 화이자</li>
									</ul>
								</div>
							</div>

							<!-- 날짜 선택(필수) -->
							<div class="form-group row datePicker">
								<div class="col-sm-3 labelArea">
									<label>날짜 선택<span class="require-mark">*</span></label>
								</div>
								<div class="col-sm-9 inputArea">
									<input type="date" class="form-control" required>
								</div>
							</div>

							<!-- 시간 선택(선택) -->
							<div class="form-group row timePicker">
								<div class="col-sm-3 labelArea">
									<label>시간 선택</label>
								</div>
								<div class="col-sm-9 inputArea">
									<select class="form-select">
										<option selected>시간 선택</option>
										<option>09:00</option>
										<option>10:00</option>
										<option>11:00</option>
										<option>12:00</option>
									</select>
								</div>
							</div>

							<!-- 위치 선택(선택) -->
							<div class="form-group row placePicker">
								<div class="col-sm-3 labelArea">
									<label>위치 선택</label>
								</div>
								<div class="col-sm-9 inputArea">
									<select class="form-select">
										<option selected>광역시도</option>
										<option>ㅇㅇ</option>
									</select> <select class="form-select">
										<option selected>시군구</option>
										<option>ㅇㅇ</option>
									</select> <select class="form-select">
										<option selected>읍면동</option>
										<option>ㅇㅇ</option>
									</select>
								</div>
							</div>

							<!-- 검색 버튼 -->
							<div class="col-sm-6 offset-sm-3 btnArea">
								<input type="submit" value="검색" class="btn btn-default">
							</div>
						</div>
					</form>
				</div>
				<!--// 검색영역 종료 -->

				<!-- 검색 결과 영역 시작 -->
				<h2>검색 결과</h2>
				<div class="row searchResultArea">
					<div class="col-sm-8 offset-sm-2">
						<div class="row accordionArea">
							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h3 class="accordion-header" id="headingOne">
										<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">의료기관명</button>
									</h3>
									<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
										<div class="accordion-body">
											진료시간, 잔여백신 등
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h3 class="accordion-header" id="headingTwo">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">의료기관명</button>
									</h3>
									<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
										<div class="accordion-body">
											진료시간, 잔여백신 등
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--// 검색 결과 영역 종료 -->
				</div>
			</div>


			<!-- footer 영역(include 디렉티브 태그 이용) -->
			<%@ include file="include/footer.jsp"%>
		</div>
</body>
</html>