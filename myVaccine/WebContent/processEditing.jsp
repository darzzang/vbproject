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
		
		String vaccine = request.getParameter("vaccine");	//벡신 종류
		String name = request.getParameter("name");			//이름
		String idNum1 = request.getParameter("idNum1");		//주민번호 앞 6자리
		String idNum2 = request.getParameter("idNum2");		//주민번호 7번째자리
		String idNum = idNum1 + idNum2;
		
		//vac 가져오기 - data 테이블에 입력받은 값은 입력받은 값으로 update, 그렇지 않은 부분은 기존 vac 테이블의 값으로 update
		String select = "select * from vac";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		while(rs.next()){//booking, checking과는 달리 primary key가 겹치거나 null이 될 일이 없다.
			//vac 테이블의 값
			String cvac = rs.getString("v_vaccine");	
			String cname = rs.getString("v_name");
			String cidNum1 = rs.getString("v_idNum1");
			String cidNum2 = rs.getString("v_idNum2");
			String cphone1 = rs.getString("v_phone1");
			String cphone2 = rs.getString("v_phone2");
			String cphone3 = rs.getString("v_phone3");
			String cidNum = rs.getString("v_idNum");
			String cphone = rs.getString("v_phone");
			
			//입력받은 값들을 data 테이블에  update
			String update = "update data set v_vaccine=?, v_name=?, v_idNum1=?, v_idNum2=?, v_idNum=? where v_phone=?";
			pstmt = conn.prepareStatement(update);
			pstmt.setString(1, vaccine);
			pstmt.setString(2, name);
			pstmt.setString(3, idNum1);
			pstmt.setString(4, idNum2);
			pstmt.setString(5, idNum);
			pstmt.setString(6, cphone);//primary key
			pstmt.executeUpdate();	
		
			//update된 data 테이블의 값들을 vac 테이블에 update(결과창에서 vac 테이블을 사용해서 vac 테이블을 업데이트 해줘야 한다)
			String update_v = "update vac set v_vaccine=?, v_name=?, v_idNum1=?, v_idNum2=?, v_idNum=? where v_phone=?";
			pstmt = conn.prepareStatement(update_v);
			pstmt.setString(1, vaccine);
			pstmt.setString(2, name);
			pstmt.setString(3, idNum1);
			pstmt.setString(4, idNum2);
			pstmt.setString(5, idNum);
			pstmt.setString(6, cphone);//primary key
			pstmt.executeUpdate();
		}
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("result.jsp");
	%>
	
</body>
</html>