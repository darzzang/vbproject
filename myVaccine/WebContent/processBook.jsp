<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- jQuery -->
</head>
<body>
<script>
	var date = $('#datePicker').val();
	console.log(date);
</script>
<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String time = request.getParameter("time");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String delete = "delete from tmpInstTBL2";
		pstmt = conn.prepareStatement(delete);
		pstmt.executeUpdate();
		
		String sql = "select * from tmpInstTBL where vac_time = '" + time +"'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String appdate = rs.getString("p_appDate");
			String instName = rs.getString("p_instName");
			String instAddr1 = rs.getString("p_instAddress1");	
			String instAddr2 = rs.getString("p_instAddress2");	
			String instAddr3 = rs.getString("p_instAddress3");
			String instAddr4 = rs.getString("p_instAddress4");
			String phone = rs.getString("p_instPhone");
			String WorkHr = rs.getString("p_instWorkHour");
			String selectTime = rs.getString("vac_time"); // 접종 시간
		
			String insertTBL = "insert into tmpInstTBL2(p_appDate,p_instAddress1,p_instAddress2,p_instAddress3,p_instAddress4,p_instName,p_instPhone,p_instWorkHour, vac_time) values (?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(insertTBL);
			pstmt.setString(1, appdate);
			pstmt.setString(2, instAddr1);
			pstmt.setString(3, instAddr2);
			pstmt.setString(4, instAddr3);
			pstmt.setString(5, instAddr4);
			pstmt.setString(6, instName);
			pstmt.setString(7, phone);
			pstmt.setString(8, WorkHr);
			pstmt.setString(9, selectTime);
			pstmt.executeUpdate();
		}
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
			
		response.sendRedirect("result.jsp");		
	%>
	
</body>
</html>