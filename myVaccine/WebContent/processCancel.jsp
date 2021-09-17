<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//vac 가져오기 
		String select = "select * from vac";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		while(rs.next()){
			//vac 테이블에서 v_phone값
			String cphone = rs.getString("v_phone");
			
			//vac의 v_phone과 data의 v_phone이 같은 경우의 값을 지움
			String delete = "delete from data where v_phone = '"+cphone+"'";
			pstmt = conn.prepareStatement(delete);
			pstmt.executeUpdate();	
			
			//임시 테이블 vac 역시 삭제
			String delete_vac = "delete from vac";
			pstmt = conn.prepareStatement(delete_vac);
			pstmt.executeUpdate();
		}
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("booking.jsp");
	%>
	
</body>
</html>