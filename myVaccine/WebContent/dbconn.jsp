<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	try{
		String url = "jdbc:mysql://localhost:3306/vacdb";
		String user = "root";
		String password = "1234";
		
		/* 
			[오류 로그] 
			Loading class `com.mysql.jdbc.Driver'. This is deprecated. 
			The new driver class is `com.mysql.cj.jdbc.Driver'. 
			The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary. 
		*/		
		Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이브 클래스명 변경
		conn = DriverManager.getConnection(url, user, password);
	}catch(SQLException ex){
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>