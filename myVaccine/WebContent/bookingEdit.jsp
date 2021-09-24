<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
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
				<form name="newBooking" action="processEditing.jsp" method="post">
					<div class="pd resultArea">
						<div class="container">
						
							<!-- 예약자 정보 영역(userArea) -->
							<div class="infoArea userArea">
								<h2>예약자 정보</h2>
								<table class="table align-middle">
									<tbody>
										<%
											//수정 페이지인데 table vac를 불러오는 이유
											//수정페이지는 결과페이지에서 넘어옵니다(예약-결과-수정 or 조회-결과-수정)
											//결과페이지에서 표시되는 예약자의 정보가 vac에 저장되어 있어서 이걸 불러옵니다
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
											<th>이름</th>
											<td>
												<div class="col-sm-8 inputArea">
													<input type="text" id="name" name="name" class="form-control" required value="<%=name%>">
													<p class="alertText" id="nameError">* 이름에는 한글만 사용 가능합니다</p>
												</div>
											</td>
										</tr>
			
										<tr>
											<th>주민등록번호</th>
											<td>
												<div class="col-sm-8 inputArea">
													<div class="row idNumArea">
														<div class="col-4">
															<input type="text" id="idNum1" name="idNum1" maxlength="6" size="6" class="form-control idNum-01" required value="<%=idNum1 %>">
														</div> 
														<span class="col-1 align-center">-</span> 
														<div class="col-2">
															<input type="text" id="idNum2" name="idNum2" maxlength="1" size="1" class="form-control idNum-02" required value="<%=idNum2 %>">
														</div>
														<span class="col-5">******</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>휴대폰 번호</th>
											<td><%=phone1 %> - <%=phone2 %> - <%=phone3 %>
											</td>
										</tr>
										
									</tbody>
								</table>
							</div>
							
							<!-- 예약 정보 영역 -->
							<div class="infoArea vacArea">
								<h2>예약 정보</h2>
								<table class="table align-middle">
									<tbody>
										<tr>
											<th>백신 선택</th>
											<td>
												<input type="radio" name="vaccine" value="Moderna" checked> 모더나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="vaccine" value="Pfizer"> 화이자
											</td>
										</tr>
										<tr>
											<th>의료기관</th>
											<td>의료기관명</td>
										</tr>
										<tr>
											<th>접종일시</th>
											<td style="color:#0048F5"> </td>
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
							<!-- 수정/확인/취소 버튼 추가(2021.09.03) -->
							<!-- 페이지 구성 시 필요없는 버튼이 있으면 li 삭제 -->
							<div class="btnArea">
								<ul class="row justify-content-center">
									<li class="col-3"><input type="submit" class="btn bookingBtn" value="예약수정" onclick="checkBooking()"></li>
									<li class="col-3"><a href="#" class="btn btn-secondary">취소</a></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 의료기관 찾기 창(modal) -->
		<%@ include file="modal.jsp" %>
		
		<!-- footer 영역(include 디렉티브 태그 이용) -->
		<%@ include file="include/footer.jsp" %>
	</div>
</body>
</html>
