<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- jQuery -->
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<!-- google fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
	<style>
		html, body {margin: 0; padding: 0;}
		html {position: relative;}
		body{position:relative; z-index:1; font-family: 'Noto Sans KR', sans-serif;}
		ul{padding:0; margin:0;}
		ul li{list-style:none; border:1px solid #dee2e6; border-radius:10px; margin-bottom:0.25em;}
		ul li a{display:block; padding:1em; color:#000; text-decoration:none; transition: 0.3s; background:none; border:none; width:100%; text-align:left;}
		ul li a:hover, ul li.active a{background:#dee2e6; color:#000;}
		ul li a span{display:block; font-weight:700; font-family: 'Noto Sans KR', sans-serif;}
		ul li a span.lilText{font-size:0.75em; color:#333; font-weight:400;}
		ul li button{display:block; padding:1em; color:#000; text-decoration:none; transition: 0.3s; background:none; border:none; width:100%; text-align:left;}
		ul li button:hover, ul li.active button{background:#dee2e6;  }
		ul li button span{display:block; font-weight:700; font-family: 'Noto Sans KR', sans-serif;}
		ul li button span.lilText{font-size:0.75em; color:#333; font-weight:400;}
		.btn-outline-default{border:1px solid #26437e; color:#26437e; transition:0.3s;}
		.btn-outline-default:hover{background: #26437e; color: #fff; opacity: 0.9;}
		.btn-default{background: #26437e; color: #fff; opacity: 0.9; transition:0.3s;}
		.btn-default:hover{opacity:1; color:#fff;}
	</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<ul>
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					        				
			String sql = "select distinct p_instName,p_instAddress1,p_instAddress2, p_instPhone from tmpInstTBL";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					        				
			while(rs.next()){
				String instName = rs.getString("p_instName");
				String instAddr1 = rs.getString("p_instAddress1");	
				String instAddr2 = rs.getString("p_instAddress2");
				String phone = rs.getString("p_instPhone");
		%>
		<li>
			<form name="searchList" action="processInst2.jsp" method="post">
				<button type="submit">
					<span class="lilText"><%=instAddr1 %> &gt; <%=instAddr2 %></span> 
					<span id="instNameText" class="instNameText"><%=instName %></span>
				</button>
			</form>
		</li>
		<%
			}
		%>
		<%
	       	if(rs != null) rs.close();
	   		if(pstmt != null) pstmt.close();
	   		if(conn != null) conn.close();
		%>
	</ul>
</body>
</html>