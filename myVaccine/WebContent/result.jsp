<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="dimArea"></div>
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
							<tr>
								<th>선택한 백신</th>
								<td>모더나</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>신효행</td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td>210830 - 2<span>******</span></td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td>010 - 1234 - 5678</td>
							</tr>
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