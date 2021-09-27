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
		
		//vac 가져오기 - 수정을 하기 위해서는 result에서 수정버튼을 눌러야 한다. 
		//result 페이지로 가기 위해서는 예약 -> 결과 or 조회 -> 결과의 과정을 거쳐야 하는데 이때 입력한 사용자 정보가 vac에 저장되어 있다.
		String select = "select * from vac";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		while(rs.next()){
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
			//나머지 값은 processEdit2 에서 사용

			//vac 테이블의 값을 edit 테이블에  insert
			String copy = "insert into edit(v_vaccine, v_name, v_idNum1, v_idNum2, v_phone1, v_phone2, v_phone3, v_idNum, v_phone) values(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(copy);
			pstmt.setString(1, cvac);
			pstmt.setString(2, cname);
			pstmt.setString(3, cidNum1);
			pstmt.setString(4, cidNum2);
			pstmt.setString(5, cphone1);
			pstmt.setString(6, cphone2);
			pstmt.setString(7, cphone3);
			pstmt.setString(8, cidNum);
			pstmt.setString(9, cphone);
			pstmt.executeUpdate();	
		
			//입력된 값들을 edit 테이블에 update
			String update_edit = "update edit set v_vaccine=?, v_name=?, v_idNum1=?, v_idNum2=?, v_idNum=? where v_phone=?";
			pstmt = conn.prepareStatement(update_edit);
			pstmt.setString(1, vaccine);
			pstmt.setString(2, name);
			pstmt.setString(3, idNum1);
			pstmt.setString(4, idNum2);
			pstmt.setString(5, idNum);
			pstmt.setString(6, cphone);
			pstmt.executeUpdate();
			//bookingEdit2 페이지에서 취소할 경우 edit테이블의 데이터를 지워주어야 한다.
		}
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("result.jsp");
	%>
	
</body>
</html>