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
		
		//vac 가져오기 - data 테이블에 입력받은 값은 입력받은 값으로 update, 그렇지 않은 부분은 기존 vac 테이블의 값으로 update
		String select = "select * from vac";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		while(rs.next()){//booking, checking과는 달리 primary key가 겹치거나 null이 될 일이 없다.
			//vac 테이블의 값
			String cphone = rs.getString("v_phone");
			
			//입력받은 값들을 data 테이블에  update
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