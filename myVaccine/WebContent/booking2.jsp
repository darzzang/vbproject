<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->    
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약하기" />
</jsp:include>


<!-- datepicker sources -->
<script src="resources/js/bootstrap-datepicker.js"></script>
<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
<script src="resources/js/datepicker_custom.js"></script>


<body>
	<div class="wrapper">
		<!-- nav 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/menu.jsp" %>
		
		<!-- visual & title Area --> 
		<div class="visualArea">
			<div class="dimArea"></div>
			<div class="container">
				<h1 class="move-up">예약하기</h1>
			</div>
		</div>
		
		<!-- 예약하기(form area) -->
		<div class="pd formArea">
			<div class="container"> 
				<div class="row">
					<div class="col-sm-8 offset-sm-2 noticeTextArea">
						<p class="lgText">개인정보 수집 및 이용에 대한 안내</p>
						<p>&ulcorner;감염병의 예방 및 관리에 관한 법률&lrcorner; 제33조의 4 및 같은 법 시행령 제32조의 3에 따라<br>코로나19 예방접종 예약신청을 위하여 다음의 개인정보를 수집합니다.</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-8 offset-sm-2 progressBar">
						<ul>
							<li class="">
								<span class="smText">STEP 01.</span>
								<span class="lgText">예약자 정보 입력</span>
							</li>
							<li class="active">
								<span class="smText">STEP 02.</span>
								<span class="lgText">의료기관 찾기</span>
							</li>
							<li class="">
								<span class="smText">STEP 03.</span>
								<span class="lgText">예약 결과 확인</span>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-8 offset-sm-2 findInstitution">
						<div class="searchArea">
				        	<div class="container-fluid">
				        		<form name="findInst" action="processInst.jsp" method="post">
					        		<div class="form-group row datePicker">
					        			<div class="col-sm-2 labelArea">
											<label>날짜 선택<span class="require-mark">*</span></label>
										</div>
										<div class="col-sm-10 inputArea">
											<input type="text" class="form-control datePickerInput" name="date" id="datePicker" required>
										</div>
					        		</div>
					        		<div class="form-group row placePicker">
					        			<div class="col-sm-2 labelArea">
											<label>기관 선택<span class="require-mark">*</span></label>
										</div>
					        			<div class="col-sm-7 inputArea">
					        				<select class="form-select" name="addr1" required>
					        					<option selected>광역시도</option>
					        					<option value="대구광역시">대구광역시</option>
						        			</select>
						        			<select class="form-select" name="addr2" required>
						        				<option selected>시군구</option>
						        				<option value="동구">동구</option>
						        			</select>
						        			<!-- <select class="form-select" name="addr3" required>
						        				<option selected>읍면동</option>
						        				<option value="검사동">검사동</option>
						        				<option value="효목동">효목동</option>
						        			</select> -->
					        			</div>
					        			<div class="col-sm-3 btnArea">
						        			<input type="submit" value="검색" class="btn btn-outline-default" onclick="showRes()">
						        		</div>
					        		</div>
				        		</form>
				        		<!-- page 이동 없이 submit을 하기 위해 필요 -->
				        		<!-- <iframe name='ifrm' style="display:none"></iframe> -->
				        	</div>
				        </div>  
						
						<div class="SearchResultArea">
				        	<div class="row">
				        		<!-- 리스트 카운트 -->
				        		<%
								 	PreparedStatement pstmt = null;
		        					ResultSet rs = null;
		        					int cnt = 0;
		        							
			        				String sql = "select count(*) from institution";
			        				pstmt = conn.prepareStatement(sql);
			        				rs = pstmt.executeQuery();
			        				
			        				while(rs.next()){
			        					cnt = rs.getInt(1);
								%>
				        		<p>검색 결과 총 <%=cnt%>개</p>
				        		<%
			        				}
				        		%>
				        		<div class="col-sm-4 instArea">
				        			<ul>
				        				<%
					        		        pstmt = null;
					        				rs = null;
					        				
					        				sql = "select * from institution";
					        				pstmt = conn.prepareStatement(sql);
					        				rs = pstmt.executeQuery();
					        				
					        				while(rs.next()){
					        					String instName = rs.getString("p_instName");
					        					String instAddr1 = rs.getString("p_instAddress1");	
					        					String instAddr2 = rs.getString("p_instAddress2");
				        				%>
				        				<li>
				        					<button>
				        						<span class="lilText"><%=instAddr1 %> &gt; <%=instAddr2 %></span>
				        						<span id="instNameText" class="instNameText"><%=instName %></span>
				        					</button>
				        				</li>
				        				<%
					        				}
				        				%>
				        			</ul>
				        		</div>
				        		<%
					        		pstmt = null;
			        				rs = null;
			        				
			        				sql = "select * from instTBL";
			        				pstmt = conn.prepareStatement(sql);
			        				rs = pstmt.executeQuery();
			        				
			        				if(rs.next()){
			        					String inst = rs.getString("p_instName");
			        					String instAddr1 = rs.getString("p_instAddress1");	
			        					String instAddr2 = rs.getString("p_instAddress2");	
			        					String instAddr3 = rs.getString("p_instAddress3");
			        					String instAddr4 = rs.getString("p_instAddress4");
			        					String phone = rs.getString("p_instPhone");
			        					String WorkHr = rs.getString("p_instWorkHour");
			        					String selectTime = rs.getString("vac_time"); // 접종 시간
			        					String mdnTotal = rs.getString("vac_mdnTotal"); // 시간별 모더나 총량
			        					String mdnUse = rs.getString("vac_mdnUse"); // 시간별 모더나 잔여량
			        					String pfzrTotal = rs.getString("vac_pfzrTotal"); // 시간별 화이자 총량
			        					String pfzrUse = rs.getString("vac_pfzrUse"); // 시간별 화이자 잔여량
				        		%>
				        		<div class="col-sm-8 infoArea">
				        			<div class="titleArea">
				        				<p class="title"><%=inst %></p>
				        				<p class="addressText"><%=instAddr1 %> <%=instAddr2 %> <%=instAddr3 %> <%=instAddr4 %></p>
				        			</div>
				        			<div class="instInfo">
				        				<table>
				        					<tbody>
				        						<tr>
				        							<th>전화번호</th>
				        							<td><%=phone %></td>
				        						</tr>
				        						<tr>
				        							<th>진료시간</th>
				        							<td><%=WorkHr %></td>
				        					</tr>
				        					</tbody>
				        				</table>
				        			</div>
				        			<!-- 시간 선택 시 텍스트 변경 이벤트 추가 -->
				        			<script type="text/javascript">
					        			$(document).ready(function(){
					        				/* 시간 초기값(09:00) */
					        				document.getElementById('selectTime').innerText = $('input[name=time]:checked').val(); 	
					        			});
					        			
					    				function getTime(event) {
					    					var selectTime = event.target.value;
											document.getElementById('selectTime').innerText = selectTime;
											console.log(selectTime);
					    				}
				        			</script>	
				        			
				        			<div class="timeSelect">
				        				<p class="timeSelectText">시간선택: <span id="selectTime"></span></p>
				        				<div class="timeSelectArea">
				        					<form>
				        						<div class="form-group">
				        							<input type="radio" name="time" value="09:00" id="time09" checked onclick="getTime(event)"><label for="time09" class="btn btn-outline-default">09:00</label>	
				        							<input type="radio" name="time" value="10:00" id="time10" onclick="getTime(event)"><label for="time10" class="btn btn-outline-default">10:00</label>	
				        							<input type="radio" name="time" value="11:00" id="time11" onclick="getTime(event)"><label for="time11" class="btn btn-outline-default">11:00</label>	
				        							<input type="radio" name="time" value="12:00" id="time12" onclick="getTime(event)"><label for="time12" class="btn btn-outline-default">12:00</label>
				        							<input type="radio" name="time" value="13:00" id="time13" onclick="getTime(event)"><label for="time13" class="btn btn-outline-default">13:00</label>
				        							<input type="radio" name="time" value="14:00" id="time14" onclick="getTime(event)"><label for="time14" class="btn btn-outline-default">14:00</label>	
				        							<input type="radio" name="time" value="15:00" id="time15" onclick="getTime(event)"><label for="time15" class="btn btn-outline-default">15:00</label>	
				        							<input type="radio" name="time" value="16:00" id="time16" onclick="getTime(event)"><label for="time16" class="btn btn-outline-default">16:00</label>	
				        							<input type="radio" name="time" value="17:00" id="time17" onclick="getTime(event)"><label for="time17" class="btn btn-outline-default">17:00</label>	
				        							<input type="radio" name="time" value="18:00" id="time18" onclick="getTime(event)"><label for="time18" class="btn btn-outline-default">18:00</label>	
				        						</div>
				        					</form>
				        				</div>
				        			</div>
				        			<div class="vacsInStock">
				        				<p>잔여 백신 수량: (모더나)<%=mdnUse %>/<%=mdnTotal %> | (화이자)<%=pfzrUse %>/<%=pfzrTotal %></p>
				        			</div>
				        		</div>
				        		<%
			        				}
				        		%>
				        	</div>
				        </div>
				        
				        <div class="btnArea">
							<ul class="row justify-content-center">
								<li class="col-3"><input type="button" class="btn bookingBtn" value="예약" onclick=""></li>
								<li class="col-3"><a href="#" class="btn btn-outline-secondary">취소</a></li>
							</ul>
						</div>	
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/footer.jsp" %>
	</div>
</body>
</html>
