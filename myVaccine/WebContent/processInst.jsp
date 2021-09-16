<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String date = request.getParameter("date"); // 날짜
		String addr1 = request.getParameter("addr1"); // 주소1(광역시도)
		String addr2 = request.getParameter("addr2"); // 주소2(시군구)
		String addr3 = request.getParameter("addr3"); // 주소3(읍면동)
		String addr = addr1+addr2;
		
		// instTBL의 임시저장 테이블(tmpinstTBL)을 만들어서 addr3의 조건이 맞으면 데이터 저장 후 모달창에 출력
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String delete = "delete from tmpInstTBL";
		pstmt = conn.prepareStatement(delete);
		pstmt.executeUpdate();
		
		String select = "select * from instTBL where p_instAddress3 = '" + addr3 +"'";
		pstmt = conn.prepareStatement(select);
		rs = pstmt.executeQuery();
		
		while (rs.next()){
			String instName = rs.getString("p_instName");
			String instAddr1 = rs.getString("p_instAddress1");	
			String instAddr2 = rs.getString("p_instAddress2");	
			String instAddr3 = rs.getString("p_instAddress3");
			String instAddr4 = rs.getString("p_instAddress4");
			String phone = rs.getString("p_instPhone");
			String WorkHr = rs.getString("p_instWorkHour");
			String selectTime = rs.getString("vac_time"); // 접종 시간
			String mdnTotal = rs.getString("vac_mdnTotal"); // 시간별 모더나 총량
			String mdnUse = rs.getString("vac_mdnUse"); // 시간별 모더나 잔여량
			String pfzrTotal = rs.getString("vac_pfzrTotal"); // 시간별 화이자 총량
			String pfzrUse = rs.getString("vac_pfzrUse"); // 시간별 화이자 잔여량
			
			String chk = "insert into tmpInstTBL values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(chk);
			pstmt.setString(1, instAddr1);
			pstmt.setString(2, instAddr2);
			pstmt.setString(3, instAddr3);
			pstmt.setString(4, instAddr4);
			pstmt.setString(5, instName);
			pstmt.setString(6, phone);
			pstmt.setString(7, WorkHr);
			pstmt.setString(8, instName);
			pstmt.setString(9, selectTime);
			pstmt.setString(10, mdnTotal);
			pstmt.setString(11, mdnUse);
			pstmt.setString(12, pfzrTotal);
			pstmt.setString(13, pfzrUse);
			pstmt.executeUpdate();	
		}
		
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("searchList.jsp");
	%>
	