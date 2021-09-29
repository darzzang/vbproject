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
		
		//조회창에서 휴대폰 번호만 받는다
		String phone1 = request.getParameter("phone1");		//폰 앞자리
		String phone2 = request.getParameter("phone2");		//폰 중간
		String phone3 = request.getParameter("phone3");		//폰 뒷자리
		String phone = phone1 + phone2 + phone3;			//폰 번호
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//vac, tmpInst2 테이블을 사용하기 위해 일단 초기화
		String vac_delete = "delete from vac";
		pstmt = conn.prepareStatement(vac_delete);
		pstmt.executeUpdate();
		
		String tmp2_delete = "delete from tmpInstTBL2";
		pstmt = conn.prepareStatement(tmp2_delete);
		pstmt.executeUpdate();
		
		//입력받은 번호로 bigdata 테이블 검색
		String select = "select * from bigdata where v_phone = '" + phone + "'";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		if(rs.next()){//입력받은 번호가 data에 있으면
			//v_phone = phone인 데이터들을 불러들인다
			String cvac = rs.getString("v_vaccine");	
			String cname = rs.getString("v_name");
			String cidNum1 = rs.getString("v_idNum1");
			String cidNum2 = rs.getString("v_idNum2");
			String cphone1 = rs.getString("v_phone1");
			String cphone2 = rs.getString("v_phone2");
			String cphone3 = rs.getString("v_phone3");
			String cidNum = rs.getString("v_idNum");
			
			String appdate = rs.getString("p_appDate");
			String instName = rs.getString("p_instName");
			String instAddr1 = rs.getString("p_instAddress1");	
			String instAddr2 = rs.getString("p_instAddress2");	
			String instAddr3 = rs.getString("p_instAddress3");
			String instAddr4 = rs.getString("p_instAddress4");
			String instphone = rs.getString("p_instPhone");
			String WorkHr = rs.getString("p_instWorkHour");
			String selectTime = rs.getString("vac_time"); // 접종 시간

			//bigdata에서 불러온 데이터를 vac에 저장한다
			String check = "insert into vac(v_vaccine, v_name, v_idNum1, v_idNum2, v_phone1, v_phone2, v_phone3, v_idNum, v_phone) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(check);
			pstmt.setString(1, cvac);
			pstmt.setString(2, cname);
			pstmt.setString(3, cidNum1);
			pstmt.setString(4, cidNum2);
			pstmt.setString(5, cphone1);
			pstmt.setString(6, cphone2);
			pstmt.setString(7, cphone3);
			pstmt.setString(8, cidNum);
			pstmt.setString(9, phone);
			pstmt.executeUpdate();		
			
			String status = "insert into tmpInstTBL2(p_appDate,p_instAddress1,p_instAddress2,p_instAddress3,p_instAddress4,p_instName,p_instPhone,p_instWorkHour, vac_time) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(status);
			pstmt.setString(1, appdate);
			pstmt.setString(2, instName);
			pstmt.setString(3, instAddr1);
			pstmt.setString(4, instAddr2);
			pstmt.setString(5, instAddr3);
			pstmt.setString(6, instAddr4);
			pstmt.setString(7, instphone);
			pstmt.setString(8, WorkHr);
			pstmt.setString(9, selectTime);
			pstmt.executeUpdate();
					
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			
			response.sendRedirect("result2.jsp");
		}else{//입력받은 번호가 data에 없으면(즉 예약된 번호가 아니라면)
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			//예약조회 오류메시지 띄우고 다시 예약조회 페이지로
			%>
			<script>
					/* 안내문구 출력 후 bookingCheck.jsp로 이동 */
					alert("예약되지 않은 번호입니다.");	
					location.href="bookingCheck.jsp"
			</script>
			<%
		}
	%>
	
</body>
</html>