<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
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
	.align-center{text-align:center;}
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
	input[type=radio]:disabled + label.disabled{background:#e9ecef; color:#777; border-color:#ced4da; opacity:0.9;}
	label{font-weight:400; width:19%; margin-bottom:0.5em;}
	/* label:nth-of-type(5){margin-right:0;} */
	.vacsInStock{margin-top:1em;}
	.vacsInStock p{font-weight:700; color:#26437e;}
	.vacsInStock ul{padding:0;}
	.vacsInStock ul li{list-style:none; display:inline-block; margin-right:1.5em;}
	.infoArea{margin-bottom:0;}
	.btn-outline-default{border:1px solid #26437e; color:#26437e; transition:0.3s; width:100%; margin-bottom:0;}
	.btn-outline-default:hover{background: #26437e; color: #fff; opacity: 0.9;}
	.btn-default{background: #26437e; color: #fff; opacity: 0.9; transition:0.3s;}
	.btn-default:hover{opacity:1; color:#fff;}
	
	.timeSelect table th{padding:0.5em 1em;}
</style>
<meta charset="UTF-8">
<script>
//페이지 새로고침
if (self.name != 'reload') {
    self.name = 'reload';
    self.location.reload(true);
}
else self.name = ''; 

// 시간별 백신 잔여량과 총량을 가져와서 잔여량과 총량이 동일할 때 radio button이 선택되지 않도록 비활성화(disabled)
console.log("input disabled test start");
$(document).ready(function(){
	var arrList = $(".timeSelectArea tbody tr td");
	var wrapperArray = [];
	var i = 0;
	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String vaccine = "select v_vaccine from vac";
	pstmt = conn.prepareStatement(vaccine);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		String vac = rs.getString("v_vaccine");
	%>	
	
	var vac = "<%=vac%>";
	console.log(vac);
	
	$.each(arrList, function(index, item){
		var vac = $(item).text();
		var strArray = vac.split('/');
		wrapperArray.push(strArray);
		
		// 잔여량이 없으면
		if(i%2 == 0){ // 모더나
			
			/* if(vac == "Moderna" && wrapperArray[i][0] == 0) {
				$(this).parent().children("th").find("input").attr("disabled", true);
				$(this).parent().children("th").find("label").addClass("disabled");			
			} */
		}
		//console.log(wrapperArray[i][0]);
		
		i++;
	<%
		}
	%>	
		/* if(strArray[0] == 0){
			$(this).parent().children("th").find("input").attr("disabled", true);
			$(this).parent().children("th").find("label").addClass("disabled");
		} */
		
		
		
	});
	
	
});
console.log("input disabled test end");
</script>
</head>
<body class="infoArea">
	<%
		String id = request.getParameter("id");
		
		pstmt = null;
		rs = null;
		
		String sql = "select * from tmpInstTBL";
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
			function getTime(event) {
				var selectTime = event.target.value;
				document.getElementById('selectTime').innerText = selectTime;
				console.log(selectTime);
			}
	 	</script>	
		<%
			}
		%>
		
		<div class="timeSelect">
			<p class="timeSelectText">시간선택: <span id="selectTime"></span></p>
			<div class="timeSelectArea">
				<form name="sendform" action="processBook.jsp" method="post">
					<table class="align-center">
						<thead>
							<tr>
								<th>시간 선택</th>
								<th>모더나</th>
								<th>화이자</th>
							</tr>
						</thead>
						<tbody>
							<%
								String timeSql = "select date_format(vac_time, '%H:%i'), vac_mdnTotal, vac_mdnUse, vac_pfzrTotal, vac_pfzrUse from tmpInstTBL";
								pstmt = conn.prepareStatement(timeSql);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
									String selectTime = rs.getString("date_format(vac_time, '%H:%i')"); // 접종 시간
									String mdnTotal = rs.getString("vac_mdnTotal"); // 시간별 모더나 총량
									String mdnUse = rs.getString("vac_mdnUse"); // 시간별 모더나 잔여량
									String pfzrTotal = rs.getString("vac_pfzrTotal"); // 시간별 화이자 총량
									String pfzrUse = rs.getString("vac_pfzrUse"); // 시간별 화이자 잔여량
									
							%>
							
							<tr class="<%=selectTime %>">
								<th>
									<div class="form-group">
										<input type="radio" name="time" value="<%=selectTime %>" id="time<%=selectTime %>" onclick="getTime(event)"><label for="time<%=selectTime %>" class="btn btn-outline-default"><%=selectTime %></label>
									</div>
								</th>
								<td><span class="mdn stock"><%=mdnUse %></span> &sol; <span class="mdn total"><%=mdnTotal %></span></td>
								<td><span class="pfzr stock"><%=pfzrUse %></span> &sol; <span class="pfzr total"><%=pfzrTotal %></span></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					
					<input type="submit" value="submit" id="sendformBtn" style="display:none;">
				</form>
			</div>
		</div>							
									
	<%
       	if(rs != null) rs.close();
   		if(pstmt != null) pstmt.close();
   		if(conn != null) conn.close();
	%>
</body>
</html>