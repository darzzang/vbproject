function checkBooking(){
	
	var name = newBooking.name.value;
	var idNum1 = newBooking.idNum1.value;
	var idNum2 = newBooking.idNum2.value;
	var phone1 = newBooking.phone1.value;
	var phone2 = newBooking.phone2.value;
	var phone3 = newBooking.phone3.value;
	
	
	/* Ch.08 유효성 검사.pdf 3. 데이터 형식 유효성 검사 예제 8-5 활용 */
	var regExpName = /^[가-힣]+$/; 
	var regExpBirth = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/;
	var regExpGen = /^[1-4]{1}/;
	var regExpPhn1 = /^01(?:0|1|[6-9])/;
	var regExpPhn2 = /^(?:\d{3}|\d{4})/;
	var regExpPhn3 = /^\d{4}/;
	
	
	//이름 체크
	if (!regExpName.test(name)) {
		console.log("test1: 이름 체크");
		alert("이름은 한글만 사용 가능합니다.");
		name = "";
		newBooking.name.focus();
		return;
	}
	
	//주민등록번호 앞자리 체크
	if (!regExpBirth.test(idNum1)) {
		console.log("test2: 주민등록번호 앞자리 체크");
		alert("주민등록번호 앞자리는 6개의 숫자만 입력 가능합니다.");
		idNum1 = "";
		newBooking.idNum1.focus();
		return;
	}
	
	//주민등록번호 뒷자리 체크
	if (!regExpGen.test(idNum2)) { 
		console.log("test3: 주민등록번호 뒷자리 체크");
		alert("주민등록번호 뒷자리는 1,2,3,4만 가능합니다.");
		idNum2 = "";
		newBooking.idNum2.focus();
		return;
	}
	
	//휴대폰번호 체크
	if(!regExpPhn1.test(phone1)) {
		console.log("test4: 휴대폰 번호 앞자리 체크");
		alert("휴대폰 번호를 정확하게 입력하세요.");
		phone1 = "";
		newBooking.phone1.focus();
		return;
	}
	if(!regExpPhn2.test(phone2)) {
		console.log("test5: 휴대폰 번호 중간자리 체크");
		alert("휴대폰 번호를 정확하게 입력하세요.");
		phone2 = "";
		newBooking.phone2.focus();
		return;
	}
	if(!regExpPhn3.test(phone3)) {
		console.log("test6: 휴대폰 번호 뒷자리 체크");
		alert("휴대폰 번호를 정확하게 입력하세요.");
		phone3 = "";
		newBooking.phone3.focus();
		return;
	}
	
	document.newBooking.submit(); 
	
}