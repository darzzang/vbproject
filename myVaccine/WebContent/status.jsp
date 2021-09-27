<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- db연결  -->
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- head 영역 -->
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약 현황" />
</jsp:include>

<!-- datepicker sources -->
<script src="resources/js/bootstrap-datepicker.js"></script>
<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
<script src="resources/js/datepicker_custom.js"></script>

<!-- (참고용) 검색 버튼 클릭 시 검색 결과 영역 출력 -->
<script type="text/javascript">
	
	function showResult() {
		
		document.stausSearch.target = 'ifrm';
		document.stausSearch.action = '/processStatus.jsp';
		document.stausSearch.submit();
		
		if ($('#ResultArea').css('display') == 'none') {
			$('#ResultArea').slideDown();
		} else {
			$('#ResultArea').hide();
		}
		
		document.getElementById("statusResult").contentDocument.location.reload(true);
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
					<form id="stausSearch" name="stausSearch" method="post">
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
									<input type="text" class="form-control datePickerInput" id="datePicker2" name="Date" required>
								</div>
							</div>
							<!-- 시간 선택(선택) -->
							<div class="form-group row timePicker">
								<div class="col-sm-3 labelArea">
									<label>시간 선택</label>
								</div>
								<div class="col-sm-9 inputArea">
									<select class="form-select" name="time">
										<option selected>시간 선택</option>
										<option>09:00</option>
										<option>10:00</option>
										<option>11:00</option>
										<option>12:00</option>
										<option>13:00</option>
										<option>14:00</option>
										<option>15:00</option>
										<option>16:00</option>
										<option>17:00</option>
										<option>18:00</option>
									</select>
								</div>
							</div>
							<!-- 위치 선택(선택) -->
							<div class="form-group row placePicker">
							
								<div class="col-sm-3 labelArea">
									<label>위치 선택</label>
								</div>
								<div class="col-sm-9 inputArea">
									<select class="form-select" name="addr1">
										<option selected>광역시도</option>
										<option>대구광역시</option>
									</select> <select class="form-select" name="addr2">
										<option selected>시군구</option>
										<option>동구</option>
									</select> <select class="form-select" name="addr3">
										<option selected>읍면동</option>
										<option>검사동</option>
									</select>
								</div>
							</div>
							<!-- 검색 버튼 -->
							<div class="col-sm-4 offset-sm-4 btnArea">
								<input type="submit" value="검색" class="btn btn-default" onclick="showResult()">
							</div>
						</div> 
					</form>
					<iframe name='ifrm' style="display:none"></iframe>
				</div>
				<!--// 검색영역 종료 -->
				
				<!-- 검색 결과 영역 시작 -->
				<div class="row searchResultArea" id="ResultArea">
					<div class="resultTitle">
						<h2>검색 결과</h2>
						<%
						 	PreparedStatement pstmt = null;
        					ResultSet rs = null;
        					int cnt = 0;
        							
	        				String sql = "select count(distinct p_instName) from tmpInstTBL";
	        				pstmt = conn.prepareStatement(sql);
	        				rs = pstmt.executeQuery();
	        				
	        				while(rs.next()){
	        					cnt = rs.getInt(1);
						%>
		        		<p>검색 결과 총 <%=cnt%>개</p>
		        		<%
	        				}
		        		%>
		        	</div>
	        		<div class="col-sm-4 instArea">
	        			<iframe class="ifrmResult" src="statusResult.jsp"></iframe>
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
