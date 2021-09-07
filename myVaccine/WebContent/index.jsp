<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->    
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약" />
</jsp:include>

<body class="main">
	<div class="wrapper">
		<div class="visualArea">
			<div class="dimArea"></div>
			<div class="container">
				<div class="textArea">
					<h1 class="lgText move-up">COVID-19<br>예방접종 사이트</h1>
					<p class="move-up">본 사이트는 프로젝트를 위한 가상 페이지입니다</p>
					<div class="btnArea move-up">
						<a href="/booking.jsp">접종 예약하기</a>
					</div>
				</div>
			</div>
		</div>
	
		<!-- footer 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/footer.jsp" %>
	</div>
</body>
</html>