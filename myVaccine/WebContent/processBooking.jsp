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
	
		String vaccine = request.getParameter("vaccine");	//벡신 종류
		String name = request.getParameter("name");			//이름
		String idNum1 = request.getParameter("idNum1");		//주민번호 앞 6자리
		String idNum2 = request.getParameter("idNum2");		//주민번호 7번째자리
		String phone1 = request.getParameter("phone1");		//폰 앞자리
		String phone2 = request.getParameter("phone2");		//폰 중간
		String phone3 = request.getParameter("phone3");		//폰 뒷자리
		String idNum = idNum1 + idNum2;						//주민번호 7자리
		String phone = phone1 + phone2 + phone3;			//폰 번호
		
		PreparedStatement pstmt = null;
		PreparedStatement d_pstmt = null;
		
		String delete = "delete from vac";
		pstmt = conn.prepareStatement(delete);
		pstmt.executeUpdate();
		
		//입력받은 값을 결과창에 출력하기 위해 임시로 저장하는 table vac
		String sql = "insert into vac values(?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vaccine);
		pstmt.setString(2, name);
		pstmt.setString(3, idNum1);
		pstmt.setString(4, idNum2);
		pstmt.setString(5, phone1);
		pstmt.setString(6, phone2);
		pstmt.setString(7, phone3);
		pstmt.executeUpdate();
		
		//입력받은 값들을 누적해서 저장하는 table data
		String data = "insert into data values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		d_pstmt = conn.prepareStatement(data);
		d_pstmt.setString(1, vaccine);
		d_pstmt.setString(2, name);
		d_pstmt.setString(3, idNum1);
		d_pstmt.setString(4, idNum2);
		d_pstmt.setString(5, phone1);
		d_pstmt.setString(6, phone2);
		d_pstmt.setString(7, phone3);
		d_pstmt.setString(8, idNum);
		d_pstmt.setString(9, phone);
		d_pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("result.jsp");
	%>
	
</body>
</html>