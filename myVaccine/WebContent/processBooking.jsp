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
		
		//데이터베이스 테이블은 vac 와 data 두개를 사용합니다
		//테이블 data는 입력받은 예약들을 누적해서 insert해 가는 테이블입니다(흔히 생각하는 예약자 목록)
		//테이블 vac는 예약자 한명의 데이터를 임시로 저장하는 테이블입니다(result에 표시되는 정보가 이 테이블에 있는 정보입니다)
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String delete = "delete from vac";
		pstmt = conn.prepareStatement(delete);
		pstmt.executeUpdate();
		
		//입력받은 휴대폰 번호가 이미 등록되어 있는 번호인지 확인해야 한다
		String confirm = "select * from data where v_phone = '" + phone + "'";
		pstmt = conn.prepareStatement(confirm);
		rs = pstmt.executeQuery();
		//입력받은 phone번호가 이미 등록되어 있다면
		if(rs.next()){
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			
			%>
				<script>
					/* 안내문구 출력 후 booking.jsp로 이동 */
					alert("이미 예약된 번호입니다.");	
					location.href="booking.jsp"
				</script>
			<%
		}else{//입력받은 phone번호가 등록되어 있지 않은 번호라면
			//입력받은 값을 결과창에 출력하기 위해 임시로 저장하는 table vac
			//9월 27일 기존 data테이블(인적 정보만 있던 테이블)에서 데이터를 받아오던 것에서 bigdata테이블(인적정보+기관정보)에서 데이터를 받아오는 임시 테이블 vac로 변경 
			String vac_insert = "insert into vac(v_vaccine, v_name, v_idNum1, v_idNum2, v_phone1, v_phone2, v_phone3, v_idNum, v_phone) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(vac_insert);
			pstmt.setString(1, vaccine);
			pstmt.setString(2, name);
			pstmt.setString(3, idNum1);
			pstmt.setString(4, idNum2);
			pstmt.setString(5, phone1);
			pstmt.setString(6, phone2);
			pstmt.setString(7, phone3);
			pstmt.setString(8, idNum);
			pstmt.setString(9, phone);
			pstmt.executeUpdate();
			
			
			
			//입력받은 값들을 누적해서 저장하는 table data
			String data_insert = "insert into data values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(data_insert);
			pstmt.setString(1, vaccine);
			pstmt.setString(2, name);
			pstmt.setString(3, idNum1);
			pstmt.setString(4, idNum2);
			pstmt.setString(5, phone1);
			pstmt.setString(6, phone2);
			pstmt.setString(7, phone3);
			pstmt.setString(8, idNum);
			pstmt.setString(9, phone);
			pstmt.executeUpdate();
			
			String bigdata_insert = "insert into bigdata(v_vaccine, v_name, v_idNum1, v_idNum2, v_phone1, v_phone2, v_phone3, v_idNum, v_phone) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(bigdata_insert);
			pstmt.setString(1, vaccine);
			pstmt.setString(2, name);
			pstmt.setString(3, idNum1);
			pstmt.setString(4, idNum2);
			pstmt.setString(5, phone1);
			pstmt.setString(6, phone2);
			pstmt.setString(7, phone3);
			pstmt.setString(8, idNum);
			pstmt.setString(9, phone);
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			response.sendRedirect("booking2.jsp");		
		}
	%>
	
</body>
</html>