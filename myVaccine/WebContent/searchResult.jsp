<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- jQuery -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- google fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
	html, body {margin: 0; padding: 0;}
	html {position: relative;}
	body{position:relative; z-index:1; font-family: 'Noto Sans KR', sans-serif;}
	.form-group .labelArea{height:auto; padding-top:0.75em; padding-bottom:0.75em; background:none;}
	.infoArea table th{background:#f8f9fa; padding-top:1.25em; padding-bottom:1.25em; width:20%;}
	.infoArea .titleArea{margin-bottom:1em; border-bottom:1px solid #dee2e6;}
	.infoArea .titleArea p{margin-bottom:0.5em; color:#555;}
	.infoArea .titleArea p.title{font-weight:700; font-size:1.25em; color:#000;}
	.infoArea table{width:100%;}
	.infoArea table th, .infoArea table td{border:1px solid #dee2e6; padding:1em;}
	.infoArea table th{width:25%;}
	.timeSelect{margin-top:1em;}
	.timeSelectText{font-weight:700; color:#26437e;}
	.form-group{display:block;}
	input[type=radio]{display:none;}
	input[type=radio]:checked + label{background: #26437e; color: #fff; opacity: 0.9;}
	label{font-weight:400; width:19%; margin-bottom:0.5em;}
	label:nth-of-type(5){margin-right:0;}
	.vacsInStock{margin-top:1em;}
	.vacsInStock p{font-weight:700; color:#26437e;}
	.vacsInStock ul{padding:0;}
	.vacsInStock ul li{list-style:none; display:inline-block; margin-right:1.5em;}
	.infoArea{margin-bottom:0;}
	.btn-outline-default{border:1px solid #26437e; color:#26437e; transition:0.3s;}
	.btn-outline-default:hover{background: #26437e; color: #fff; opacity: 0.9;}
	.btn-default{background: #26437e; color: #fff; opacity: 0.9; transition:0.3s;}
	.btn-default:hover{opacity:1; color:#fff;}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body class="infoArea">
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from instTBL";
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
	<%
		}
	%>
	<%
       	if(rs != null) rs.close();
   		if(pstmt != null) pstmt.close();
   		if(conn != null) conn.close();
	%>
</body>
</html>