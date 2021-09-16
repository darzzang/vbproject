<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->    
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약하기" />
</jsp:include>
<script type="text/javascript" src="./resources/js/validation.js"></script>


<body>
	<div class="wrapper">
		<!-- nav 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/menu.jsp" %>
		
		<!-- visual & title Area --> 
		<div class="visualArea">
			<div class="dimArea"></div>
			<div class="container">
				<h1 class="move-up">예약하기</h1>
			</div>
		</div>
		
		<!-- 예약하기(form area) -->
		<div class="pd formArea">
			<div class="container"> 
				<div class="row">
					<div class="col-sm-8 offset-sm-2 noticeTextArea">
						<p class="lgText">개인정보 수집 및 이용에 대한 안내</p>
						<p>&ulcorner;감염병의 예방 및 관리에 관한 법률&lrcorner; 제33조의 4 및 같은 법 시행령 제32조의 3에 따라<br>코로나19 예방접종 예약신청을 위하여 다음의 개인정보를 수집합니다.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8 offset-sm-2 progressBar">
						<ul>
							<li class="active">
								<span class="smText">STEP 01.</span>
								<span class="lgText">예약자 정보 입력</span>
							</li>
							<li class="">
								<span class="smText">STEP 02.</span>
								<span class="lgText">의료기관 찾기</span>
							</li>
							<li class="">
								<span class="smText">STEP 03.</span>
								<span class="lgText">예약 결과 확인</span>
							</li>
						</ul>
					</div>
				</div>
				<!-- 입력값을 데이터베이스에 저장하고 결과창에 출력하는 프로세스 -->
				<form name="newBooking" action="booking.jsp" method="post">
					<div class="row">
						<div class="col-sm-8 offset-sm-2 formAreaInner">
							<div class="btnArea">
								이미 예약되어 있는 휴대전화번호입니다. 다시 입력해주세요.
							</div>			
							<div class="btnArea">
								<ul class="row justify-content-center">
									<li class="col-3"><input type="submit" class="btn bookingBtn" value="예약하러가기"></li>
									<li class="col-3"><a href="#" class="btn btn-outline-secondary">취소</a></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- footer 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/footer.jsp" %>
	</div>
</body>
</html>
