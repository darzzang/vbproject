<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약 현황" />
</jsp:include>

<!-- (참고용) 검색 버튼 클릭 시 검색 결과 영역 출력 -->
<script type="text/javascript">
	
	/* '검색' 버튼에 onclick으로 이벤트 설정 --> 추후에 유효성 검사 후 이벤트 재설정 필요! */
	function showResult() {
		if ($('#ResultArea').css('display') == 'none') {
			$('#ResultArea').slideDown();
		} else {
			$('#ResultArea').hide();
		}
	}
</script>

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
				<div class="row searchArea">
					<form>
						<div class="formAreaInner">
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
							<div class="col-sm-4 offset-sm-4 btnArea">
								<input type="submit" value="검색" class="btn btn-default" onclick="showResult()">
							</div>
						</div>
					</form>
				</div>
				<!--// 검색영역 종료 -->

				<!-- 검색 결과 영역 시작 -->
				<div class="row searchResultArea" id="ResultArea">
					<div class="resultTitle">
						<h2>검색 결과</h2>
						<p>검색 결과 총 2건</p>
					</div>
					<div class="accordionArea">
						<div class="accordion" id="accoResult">
							<div class="accordion-item">
								<div class="accordion-header" id="accoHead_1">
									<div class="accordion-button" data-bs-toggle="collapse" data-bs-target="#accoBody_1" aria-expanded="true" aria-controls="accoBody_1">
										<div>
											<p>대구광역시 &gt; 동구</p>
											<h3>의료기관명1</h3>
										</div>
									</div>
								</div>
								<div id="accoBody_1" class="accordion-collapse collapse show" aria-labelledby="accoHead_1" data-bs-parent="#accoResult">
									<div class="accordion-body">
										<div class="row">
											<div class="col-sm-6">
												<h4>의료기관 정보</h4>
												<dl>
													<dt>전화번호</dt>
													<dd>053-000-0000</dd>
													<dt>상세 주소</dt>
													<dd>대구광역시 동구 ㅇㅇ동 ㅇㅇ길 000-1</dd>
												</dl>
											</div>
											<div class="col-sm-6">
												<h4>진료 시간 및 잔여 백신 수량</h4>
												<table class="table table-bordered">
													<thead class="table-light">
														<tr>
															<th>접종 가능 시간</th>
															<th>잔여 백신 수량</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th>09:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>10:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>11:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>12:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>13:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>14:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>15:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>16:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>17:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th>18:00</th>
															<td>
																<ul>
																	<li>모더나: 20/30</li>
																	<li>화이자: 20/30</li>
																</ul>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<div class="accordion-header" id="accoHead_2">
									<div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accoBody_2" aria-expanded="false" aria-controls="accoBody_2">
										<div>
											<h3>의료기관명2</h3>
											<p>대구광역시 &gt; 동구</p>
										</div>
									</div>
								</div>
								<div id="accoBody_2" class="accordion-collapse collapse" aria-labelledby="accoHead_2" data-bs-parent="#accoResult">
									<div class="accordion-body">
										본문 영역2222
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