<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!-- datepicker sources -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- jQuery -->
<script src="resources/js/bootstrap-datepicker.js"></script>
<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
<script src="resources/js/datepicker_custom.js"></script>

<!-- (참고용) 검색 버튼 클릭 시 검색 결과 영역 출력 -->
<script type="text/javascript">
	
	/* '검색' 버튼에 onclick으로 이벤트 설정 */
	function showRes() {
		
		/* 날짜/기관 검색 시 페이지 이동 없이 modal에서 처리되는 것처럼 보이도록 만드는 코드 */
		document.findInst.target = 'ifrm';
	    document.findInst.action = '/processInst.jsp';
	    
	    var Date = findInst.date.value; // 선택 날짜
	    var addr1 = findInst.addr1.value; // 주소1(광역시도)
	    var addr2 = findInst.addr2.value; // 주소2(시군구)
	    var addr3 = findInst.addr3.value; // 주소3(읍면동)
	    
	   	console.log(Date, addr1, addr2, addr3); // 확인용 console.log
	   	
	   	document.findInst.submit();
	    
		if ($('#modalResult').css('display') == 'none') {
			$('#modalResult').slideDown();
		} else {
			$('#modalResult').hide();
		}
	}
</script>


<div class="modal fade" id="bookingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">의료기관 찾기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="searchArea">
        	<div class="container-fluid">
        		<form name="findInst" method="post">
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
		        			<select class="form-select" name="addr3" required>
		        				<option selected>읍면동</option>
		        				<option value="검사동">검사동</option>
		        				<option value="효목동">효목동</option>
		        			</select>
	        			</div>
	        			<div class="col-sm-3 btnArea">
		        			<input type="submit" value="검색" class="btn btn-outline-default" onclick="showRes()">
		        		</div>
	        		</div>
        		</form>
        		<!-- page 이동 없이 submit을 하기 위해 필요 -->
        		<iframe name='ifrm' style="display:none"></iframe>
        	</div>
        </div>   
		<%@ include file="dbconn.jsp" %>
        <%

			String date = request.getParameter("date"); // 날짜
			String addr1 = request.getParameter("addr1"); // 주소1(광역시도)
			String addr2 = request.getParameter("addr2"); // 주소2(시군구)
			String addr3 = request.getParameter("addr3"); // 주소3(읍면동)
		        
	        PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from instTBL where p_instAddress3 = '" + addr3 + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				// instTBL 
				String instName = rs.getString("p_instName");
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
        <div class="SearchResultArea" id="modalResult">
        	<div class="container-fluid">
        		<div class="row">
        			<p>검색 결과 총 2개</p>
        			<div class="col-sm-4 instArea">
        				<ul>
        					<li class="active">
        						<button>
        							<span class="lilText"><%=instAddr1%> &gt; <%=instAddr2%></span>
        							<span><%=instName%></span>
        						</button>
        					</li>
        				</ul>
        			</div>
        			<div class="col-sm-8 infoArea">
        				<div class="titleArea">
        					<p class="title"><%=instName%></p>
        					<p class="addressText"><%=instAddr1%> <%=instAddr2%> <%=instAddr3%> <%=instAddr4%></p>
        				</div>
        				<div class="instInfo">
        					<table>
        						<tbody>
        							<tr>
        								<th>전화번호</th>
        								<td><%=phone%></td>
        							</tr>
        							<tr>
        								<th>진료시간</th>
        								<td><%=WorkHr%></td>
        							</tr>
        						</tbody>
        					</table>
        				</div>
        				
        				<!-- 시간 선택 시 텍스트 변경 이벤트 추가 -->
        				<script type="text/javascript">
	        				$(document).ready(function(){
	        					/* 시간 초기값(09:00) */
	        					document.getElementById('selectTime').innerText = document.querySelector('input[name="time"]:checked').value;	
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
        								<input type="radio" name="time" value="09:00" id="time09" onclick='getTime(event)' checked><label for="time09" class="btn btn-outline-default">09:00</label>	
        								<input type="radio" name="time" value="10:00" id="time10" onclick='getTime(event)'><label for="time10" class="btn btn-outline-default">10:00</label>	
        								<input type="radio" name="time" value="11:00" id="time11" onclick='getTime(event)'><label for="time11" class="btn btn-outline-default">11:00</label>	
        								<input type="radio" name="time" value="12:00" id="time12" onclick='getTime(event)'><label for="time12" class="btn btn-outline-default">12:00</label>
        								<input type="radio" name="time" value="13:00" id="time13" onclick='getTime(event)'><label for="time13" class="btn btn-outline-default">13:00</label>
        								<input type="radio" name="time" value="14:00" id="time14" onclick='getTime(event)'><label for="time14" class="btn btn-outline-default">14:00</label>	
        								<input type="radio" name="time" value="15:00" id="time15" onclick='getTime(event)'><label for="time15" class="btn btn-outline-default">15:00</label>	
        								<input type="radio" name="time" value="16:00" id="time16" onclick='getTime(event)'><label for="time16" class="btn btn-outline-default">16:00</label>	
        								<input type="radio" name="time" value="17:00" id="time17" onclick='getTime(event)'><label for="time17" class="btn btn-outline-default">17:00</label>	
        								<input type="radio" name="time" value="18:00" id="time18" onclick='getTime(event)'><label for="time18" class="btn btn-outline-default">18:00</label>	
        							</div>
        						</form>
        					</div>
        				</div>
        				
        				<div class="vacsInStock">
        					<p>잔여 백신 수량: &#47; </p>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <%
			}
        %>
        
        <%
        	if(rs != null) rs.close();
    		if(pstmt != null) pstmt.close();
    		if(conn != null) conn.close();
        %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-default">선택</button>
      </div>
    </div>
  </div>
</div>
