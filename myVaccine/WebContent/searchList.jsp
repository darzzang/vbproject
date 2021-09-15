<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		body{margin:0;}
		ul{padding:0;}
		ul li{list-style:none; border:1px solid #dee2e6; border-radius:10px; margin-bottom:0.25em;}
		ul li button{display:block; padding:1em; color:#000; text-decoration:none; transition: 0.3s; background:none; border:none; width:100%; text-align:left;}
		ul li button:hover, ul li.active button{background:#dee2e6;  }
		ul li button span{display:block; font-weight:700;}
		ul li button span.lilText{font-size:0.75em; color:#333; font-weight:400;}
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
					        				
			String sql = "select * from institution";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					        				
			while(rs.next()){
				String instName = rs.getString("p_instName");
				String instAddr1 = rs.getString("p_instAddress1");	
				String instAddr2 = rs.getString("p_instAddress2");
		%>
		<li>
			<button>
				<span class="lilText"><%=instAddr1 %> &gt; <%=instAddr2 %></span> <span
					id="instNameText" class="instNameText"><%=instName %></span>
			</button>
		</li>
		<%
			}
		%>
	</ul>
</body>
</html>