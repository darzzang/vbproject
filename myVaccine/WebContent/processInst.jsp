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

		/* 여기서 조건과 db가 맞는지 판별 */
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String addrChk = "select * from  institution where p_instAddress3 = '" + addr3 + "'";
		pstmt = conn.prepareStatement(addrChk);
		rs = pstmt.executeQuery();
		
		while (rs.next()){
			String instName = rs.getString("p_instName");
			String instAddr1 = rs.getString("p_instAddress1");	
			String instAddr2 = rs.getString("p_instAddress2");	
			String instAddr3 = rs.getString("p_instAddress3");
			String instAddr4 = rs.getString("p_instAddress4");
			String phone = rs.getString("p_instPhone");
			String WorkHr = rs.getString("p_instWorkHour");
		}
		
		if(rs != null) rs.close();
    	if(pstmt != null) pstmt.close();
    	if(conn != null) conn.close();
		
		response.sendRedirect("modal_haeng.jsp");
	%>