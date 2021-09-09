
	
/* booking.jsp 내 form 유효성 검사 */
function checkBooking(){

	var name = newBooking.name.value;
	var idNum1 = newBooking.idNum1.value;
	var idNum2 = newBooking.idNum2.value;
	var phone1 = newBooking.phone1.value;
	var phone2 = newBooking.phone2.value;
	var phone3 = newBooking.phone3.value;
	
	var regExpName = /^[가-힣]+$/; 
	var regExpBirth = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/;
	var regExpGen = /^[1-4]{1}/;
	var regExpPhn1 = /^01(?:0|1|[6-9])/;
	var regExpPhn2 = /^(?:\d{3}|\d{4})/;
	var regExpPhn3 = /^\d{4}/;
	
	//이름 체크
	if (!regExpName.test(name)) {
		console.log("test1: 이름 체크");
		$(".alertText").hide();
		$("#nameError").fadeIn();
		name = "";
		newBooking.name.focus();
		return;
	}
	
	//주민등록번호 앞자리 체크
	if (!regExpBirth.test(idNum1)) {
		console.log("test2: 주민등록번호 앞자리 체크");
		$(".alertText").hide();
		$("#birthError").fadeIn();
		idNum1 = "";
		newBooking.idNum1.focus();
		return;
	}
	
	//주민등록번호 뒷자리 체크
	if (!regExpGen.test(idNum2)) { 
		console.log("test3: 주민등록번호 뒷자리 체크");
		$(".alertText").hide();
		$("#genError").fadeIn();
		idNum2 = "";
		newBooking.idNum2.focus();
		return;
	}
	
	//휴대폰번호 체크
	if(!regExpPhn1.test(phone1)) {
		console.log("test4: 휴대폰 번호 앞자리 체크");
		$(".alertText").hide();
		$("#phnError").fadeIn();
		phone1 = "";
		newBooking.phone1.focus();
		return;
	}
	if(!regExpPhn2.test(phone2)) {
		console.log("test5: 휴대폰 번호 중간자리 체크");
		$(".alertText").hide();
		$("#phnError").fadeIn();
		phone2 = "";
		newBooking.phone2.focus();
		return;
	}
	if(!regExpPhn3.test(phone3)) {
		console.log("test6: 휴대폰 번호 뒷자리 체크");
		$(".alertText").hide();
		$("#phnError").fadeIn();
		phone3 = "";
		newBooking.phone3.focus();
		return;
	}
	
	document.newBooking.submit();
	
}


/* modal 검색영역 유효성 검사 */
function findInstitution(){
	
	var date = findInst.date.value;

	var holiday = 

	document.findInst.submit(); 
}
