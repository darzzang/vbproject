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
		String deleteEdit = "delete from edit";
		pstmt = conn.prepareStatement(deleteEdit);
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
	%>	
	<script>
			/* 안내문구 출력 후 booking.jsp로 이동 */
			alert("수정이 취소되었습니다.");	
			location.href="result2.jsp"
	</script>
	
</body>
</html>