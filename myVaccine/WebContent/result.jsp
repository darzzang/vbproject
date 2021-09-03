<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->    
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약완료" />
</jsp:include>


<body>
	<div class="wrapper">
		<!-- nav 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/menu.jsp" %>
		
		<!-- visual & title Area --> 
		<div class="visualArea">
			<div class="container">
				<h1 class="move-up">예약 완료</h1>
			</div>
		</div>
		
		<!-- 예약 완료(result area) -->
		<div class="pd resultArea">
			<div class="container">
			
				<!-- 예약자 정보 영역(userArea) -->
				<div class="infoArea userArea">
					<h2>예약자 정보</h2>
					<table class="table align-middle">
						<tbody>
							<%
								PreparedStatement pstmt = null;
								ResultSet rs = null;
								String sql = "select * from vac";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								while (rs.next()){
									String vac = rs.getString("v_vaccine");
									if(vac.equals("Moderna")) vac = "모더나";
									if(vac.equals("Pfizer")) vac = "화이자";
									
									String name = rs.getString("v_name");
									String idNum1 = rs.getString("v_idNum1");
									String idNum2 = rs.getString("v_idNum2");
									String phone1 = rs.getString("v_phone1");
									String phone2 = rs.getString("v_phone2");
									String phone3 = rs.getString("v_phone3");
							%>
							<tr>
								<th>선택한 백신</th>
								<td><%=vac %></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><%=name %></td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td> <%=idNum1 %> - <%=idNum2 %><span>******</span></td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td><%=phone1 %> - <%=phone2 %> - <%=phone3 %></td>
							</tr>
							<%
								}
								if(rs != null) rs.close();
								if(pstmt != null) pstmt.close();
								if(conn != null) conn.close();
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		<!-- footer 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/footer.jsp" %>
	</div>
</body>
</html>