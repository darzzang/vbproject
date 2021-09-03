//예약페이지 유효성 검사
function CheckBooking() {
	
	var name = document.getElementById("name");
	var idNum1 = document.getElementById("idNum1");
	var idNum2 = document.getElementById("idNum2");
	var phone1 = document.getElementById("phone1");
	var phone2 = document.getElementById("phone2");
	var phone3 = document.getElementById("phone3");
	
	//이름 체크
	if (name=="" || name==null) {
		alert("이름을 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	else if (!check(/^[가-힣]/$, name, "이름은 한글만 사용가능합니다.")) {
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