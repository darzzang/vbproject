<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- head 영역 -->
<jsp:include page="include/head.jsp">
	<jsp:param name="title" value="백신예약: 예약조회" />
</jsp:include>


<body>
	<div class="wrapper">
		<!-- nav 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/menu.jsp"%>

		<!-- visual & title Area -->
		<div class="visualArea">
			<div class="dimArea"></div>
			<div class="container">
				<h1 class="move-up">예약 조회</h1>
			</div>
		</div>

		<div class="pd bookingCheckArea">
			<div class="container">
				<div class="row">
					<form>
						<div class="loginArea col-sm-6 offset-sm-3">
							<div class="form-group row">
								<div class="col-sm-3 labelArea">
									<label>이름</label>
								</div>
								<div class="col-sm-9 inputArea">
									<input type="text"  name="name" class="form-control" required>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-3 labelArea">
									<label>휴대폰 번호</label>
								</div>
								<div class="col-sm-9 inputArea">
									<div class="row phnNumArea">
										<div class="col-3">
											<input type="text" name="phone1" maxlength="3" size="4" class="form-control" required>
										</div>
										<span class="col-1 align-center">-</span>
										<div class="col-3">
											<input type="text" name="phone2" maxlength="4" size="4" class="form-control" required>
										</div>
										<span class="col-1 align-center">-</span>
										<div class="col-3">
											<input type="text" name="phone3" maxlength="4" size="4" class="form-control" required>
										</div>
									</div>
								</div>
							</div>
							<div class="btnArea">
								<input type="submit" class="btn btn-default" value="조회">
							</div>
						</div>
					</form>
				</div>
				
					
				
			</div>
		</div>

		<!-- footer 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/footer.jsp"%>
	</div>
</body>
</html>