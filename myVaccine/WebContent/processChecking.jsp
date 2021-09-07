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
	
		String phone1 = request.getParameter("phone1");		//폰 앞자리
		String phone2 = request.getParameter("phone2");		//폰 중간
		String phone3 = request.getParameter("phone3");		//폰 뒷자리
		String phone = phone1 + phone2 + phone3;			//폰 번호
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String delete = "delete from vac";
		pstmt = conn.prepareStatement(delete);
		pstmt.executeUpdate();
		
		String select = "select * from data where v_phone = '" + phone + "'";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		while (rs.next()){
			String cvac = rs.getString("v_vaccine");	
			String cname = rs.getString("v_name");
			String cidNum1 = rs.getString("v_idNum1");
			String cidNum2 = rs.getString("v_idNum2");
			String cphone1 = rs.getString("v_phone1");
			String cphone2 = rs.getString("v_phone2");
			String cphone3 = rs.getString("v_phone3");
			String cidNum = rs.getString("v_idNum");
				
			String check = "insert into vac values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(check);
			pstmt.setString(1, cvac);
			pstmt.setString(2, cname);
			pstmt.setString(3, cidNum1);
			pstmt.setString(4, cidNum2);
			pstmt.setString(5, cphone1);
			pstmt.setString(6, cphone2);
			pstmt.setString(7, cphone3);
			pstmt.executeUpdate();		
		}
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("result.jsp");
	%>
	
</body>
</html>