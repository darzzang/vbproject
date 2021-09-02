<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 메뉴 클릭시 활성화 이벤트 -->
<script type="text/javascript">
$(document).ready(function() {
	
	/* 페이지가 이동하고 나서도 메뉴 활성화 유지 */
	var url = location.href;
	var navList1 = url.indexOf("booking");
	var navList2 = url.indexOf("status");
	
	if(navList1 != -1) {
		$(".nav-item").removeClass("active");
        $("#navBooking").addClass("active");
    }
    if(navList2 != -1) {
    	$(".nav-item").removeClass("active");
        $("#navStatus").addClass("active");
    }
    
    /* 클릭 시 즉각 적용 */
	 var navList = $(".nav-item");
	 navList.find("a").click(function(){ 
	 	navList.removeClass("active");
		$(this).parent().addClass("active");
	});
});	

</script>


<nav class="navbar sticky-top navbar-light ">
  <div class="container">
    <a class="navbar-brand" href="/index.jsp"><i class="fas fa-syringe"></i> COVID-19 백신 예약</a>
    <div class="d-flex">
    	<ul class="navbar-nav me-auto">
    		<li class="nav-item" id="navBooking"><a class="nav-link" href="/booking.jsp">예약하기</a></li>
    		<li class="nav-item" id="navStatus"><a class="nav-link" href="/status.jsp">예약 현황</a></li>
    		<li class="nav-item"><a class="nav-link" href="#">예약 조회</a></li>
    		
    		<!-- 선택사항 -->
 			<!-- <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li> -->	
    	</ul>
    </div>
  </div>
</nav>