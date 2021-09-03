
// 함수명 추가
function checkBooking(){
	
	// '이름' 변수 선언
	var name = document.getElementById("name");
	
	var idNum2 = document.getElementById("idNum2");
	var phone1 = document.getElementById("phone1");
	var phone2 = document.getElementById("phone2");
	var phone3 = document.getElementById("phone3");
	
	/* Ch.08 유효성 검사.pdf 3. 데이터 형식 유효성 검사 예제 8-5 활용 */
	var regExpName = /^[가-힣]*$/;
	
	
	//이름 체크
	if (name=="" || name==null) {
		alert("이름을 입력하세요.");
		name.select();
		name.focus();
		return false();
	}else if (!regExpName.test(name)) { // 유효성 검사 형식 수정
		alert("이름은 한글만 사용가능합니다.");
		return false;
	}
	
	//주민등록번호 앞자리 체크
	if (idNum1=="" || idNum1==null || idNum1.value.length!=6) {
		alert("주민등록번호 앞자리 6글자를 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	
	//주민등록번호 뒷자리 체크
	if (idNum2=="" || idNum2==null) {
		alert("주민등록번호 뒷자리를 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	else if (idNum2.value > 4) {
		alert("주민등록번호 뒷자리를 정확하게 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	
	//휴대폰번호 체크
	if(phone1.value.lengh == 3 || phone2.value.lengh == 4 || phone3.value.lengh == 4) {
		alert("휴대폰 번호를 정확하게 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	
	
	function check(reqExp, e, msg) {
		if (reqExp, test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.result.submit() 
	
}