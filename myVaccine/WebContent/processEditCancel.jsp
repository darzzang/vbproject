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
		
		//edit삭제
		String deleteEdit = "delete from edit";
		pstmt = conn.prepareStatement(deleteEdit);
		pstmt.executeUpdate();
		
		//tmp3삭제
		String deletetmp3 = "delete from tmpInstTBL3";
		pstmt = conn.prepareStatement(deletetmp3);
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("result2.jsp");
	%>		
</body>
</html>