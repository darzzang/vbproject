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

		String vac_confirm = "select * from vac";
		pstmt = conn.prepareStatement(vac_confirm);
		rs = pstmt.executeQuery();
		while(rs.next()){//입력받은 번호가 data에 있으면
			//v_phone = phone인 데이터들을 불러들인다
			String cvac = rs.getString("v_vaccine");	
			String cname = rs.getString("v_name");
			String cidNum1 = rs.getString("v_idNum1");
			String cidNum2 = rs.getString("v_idNum2");
			String cphone1 = rs.getString("v_phone1");
			String cphone2 = rs.getString("v_phone2");
			String cphone3 = rs.getString("v_phone3");
			String cidNum = rs.getString("v_idNum");
			String cphone = rs.getString("v_phone");
			
			//vac값을 bigdata에 저장한다
			String vac_insert = "insert into bigdata(v_vaccine, v_name, v_idNum1, v_idNum2, v_phone1, v_phone2, v_phone3, v_idNum, v_phone) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(vac_insert);
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
		}
		String tmp2_confirm = "select * from tmpInstTBL2";
		pstmt = conn.prepareStatement(tmp2_confirm);
		rs = pstmt.executeQuery();
		while(rs.next()){
			String cdate = rs.getString("p_appDate");	
			String cinstname = rs.getString("p_instName");
			String caddr1 = rs.getString("p_instAddress1");
			String caddr2 = rs.getString("p_instAddress2");
			String caddr3 = rs.getString("p_instAddress3");
			String caddr4 = rs.getString("p_instAddress4");
			String cinstphone = rs.getString("p_instPhone");
			String cworkhour = rs.getString("p_instWorkHour");
			String ctime = rs.getString("vac_time");
			
			//tmpInstTBL2값을 bigdata에 저장한다
			String tmp2_insert = "update bigdata set p_appDate=?, p_instName=?, p_instAddress1=?, p_instAddress2=?, p_instAddress3=?, p_instAddress4=?, p_instPhone=?, p_instWorkHour=?, vac_time=?";
			pstmt = conn.prepareStatement(tmp2_insert);
			pstmt.setString(1, cdate);
			pstmt.setString(2, cinstname);
			pstmt.setString(3, caddr1);
			pstmt.setString(4, caddr2);
			pstmt.setString(5, caddr3);
			pstmt.setString(6, caddr4);
			pstmt.setString(7, cinstphone);
			pstmt.setString(8, cworkhour);
			pstmt.setString(9, ctime);
			pstmt.executeUpdate();
		}

			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();

			response.sendRedirect("result2.jsp");
	%>
	<script>
			/* 안내문구 출력 후 booking.jsp로 이동 */
			alert("예약이 완료되었습니다.");	
			location.href="result2.jsp"
	</script>
</body>
</html>