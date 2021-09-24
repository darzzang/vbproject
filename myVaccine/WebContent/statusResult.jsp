<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String status = "select * from tmpInstTBL";
	pstmt = conn.prepareStatement(status);
	rs = pstmt.executeQuery();
	if (rs.next()){
		String appdate = rs.getString("p_appDate");
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
<div class="accordionArea">
	<div class="accordion" id="accoResult">
		<div class="accordion-item">
			<div class="accordion-header" id="accoHead_1">
				<div class="accordion-button" data-bs-toggle="collapse" data-bs-target="#accoBody_1" aria-expanded="true" aria-controls="accoBody_1">
					<div>
						<p><%=instAddr1%> &gt; <%=instAddr2%></p>
						<h3><%=instName%></h3>
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
								<dd><%=phone%></dd>
								<dt>상세 주소</dt>
								<dd><%=instAddr1%> <%=instAddr2%> <%=instAddr3%> <%=instAddr4%></dd>
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
										<th><%=selectTime%></th>
										<td>
											<ul>
												<li>모더나: <%=mdnUse%>/<%=mdnTotal%></li>
												<li>화이자: <%=pfzrUse%>/<%=pfzrTotal%></li>
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
	</div>
</div>
<%
	}
%>
<%
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
