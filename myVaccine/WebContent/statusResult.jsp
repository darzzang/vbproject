<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">

	<style>
		html, body {margin: 0; padding: 0;}
		html {position: relative;}
		body{position:relative; z-index:1; font-family: 'Noto Sans KR', sans-serif;}
		.accordionArea p{font-size:1em; margin-bottom:0.5em;}
		.accordionArea h3{font-size:1.25em;}
		.accordion-body{padding:3em 5em;}
		.accordion-body h4{font-size:1.25em; font-weight:700; margin-bottom:1.25em;}
		.accordion-body dd{margin-bottom:1.5em;}
		.accordion-body table th,.accordion-body table td{text-align:center; vertical-align:middle;}
		.accordion-body table ul{padding-left:0; margin-bottom:0;}
		.accordion-body table ul li{list-style:none; display:inline-block; margin-right:2em;}
		
			
	</style>
	<script>
		// 페이지 새로고침문제 해결
		if (self.name != 'reload') {
		    self.name = 'reload';
		    self.location.reload(true);
		}
		else self.name = '';	
	</script>
	
</head>


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
<body>
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
											<th rowspan="2">접종 가능 시간</th>
											<th colspan="2">잔여 백신 수량</th>
										</tr>
										<tr>
											<th>모더나</th>
											<th>화이자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th><%=selectTime%></th>
											<td><%=mdnUse%> &sol; <%=mdnTotal%></td>
											<td><%=pfzrUse%> &sol; <%=pfzrTotal%></td>
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
</body>
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
