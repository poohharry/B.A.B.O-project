'use strict'

const sFrm = document.regiFrm;


function signUpChk() {

	if(sFrm.id.value == "") {
		alert("아이디를 입력하십시오");
		sFrm.id.focus();
		return;
	}
	
	if(sFrm.pw.value == "") {
		alert("비밀번호를 입력하십시오");
		sFrm.pw.focus();
		return;
	}
	
	if(sFrm.ChkPw.value == "" || sFrm.pw.value != sFrm.repw.value) {
		alert("비밀번호를 확인하십시오");
		sFrm.repw.value="";
		sFrm.repw.focus();
		return;
	}
	
	if(sFrm.nick.value == "") {
		alert("닉네임을 입력하십시오");
		sFrm.nick.focus();
		return;
	}
	
	if(sFrm.name.value == "") {
		alert("이름을 입력하십시오");
		sFrm.name.focus();
		return;
	}
	
	// 생년월일 검사하는 부분 만들기
	
	if(sFrm.birth-yy.value==""){
		alert("태어난 년도를 입력해주세요.");
		sFrm.birth-yy.focus();
		return
		
	}
	const month = sFrm.month.value;
	if(sFrm.birth-dd.value >31){
		alert("일은 31일까지 밖에 입력이 안됩니다.");
		sFrm.birth-dd.focus();
		return;
	}
	if(month == 4 || month == 6 || month == 9 || month == 11){
		if(sFrm.birth-dd >30){
			alert("해당 달은 30일까지 있습니다.");
			sFrm.birth-dd.focus();
			return;
		}
	}
	if( month == 2){
		if(sFrm.birth-dd.value >28){
			alert("2월은 28일까지 밖에 없습니다.");
			sFrm.birth-dd.focus();
			return;
		}
	}
	if(sFrm.birth-dd.value==""){
		alert("태어난 일을  입력해주세요.");
		sFrm.birth-dd.focus();
		return;
	}
	if(sFrm.email.value == "") {
		alert("이메일을 입력하십시오");
		sFrm.email.focus();
		return;
	}
	
	
	if(sFrm.phone.value == "") {
		alert("휴대폰 번호를 입력하십시오");
		sFrm.phone.focus();
		return;
		// 휴대폰 번호 입력양식 검사하는 부분 만들기
		
	}
	if(sFrm.phone.value.substr(0,3) != "010"){
		alert("앞자리 3자리는 010으로 해주시길 바랍니다.");
		sFrm.phone.focus();
		return;
	}
	let str=sFrm.email.value;						// poohharry@naver.com
    let atPos = str.indexOf('@');					// 9
    let atLastPos = str.lastIndexOf('@');			// 9
    let dotPos = str.indexOf('.'); 					// 15
    let spacePos = str.indexOf(' ');				// -1
    let commaPos = str.indexOf(',');				// -1
    let eMailSize = str.length;						// 18
    
    if (atPos > 1 									// @앞에 글자가 2개 이상
    	&& atPos == atLastPos 						// @가 하나만 있는 경우
    	&& dotPos > 3 								// . 옆에 글자가 4개 이상
    	&& spacePos == -1 							// 공백 없음
    	&& commaPos == -1 							// 콤마(,) 없음
	    && atPos + 1 < dotPos 						// @와 . 사이에 글자가 1개 이상
	    && dotPos + 1 < eMailSize)					// .뒤에 글자가 1개 이상
	    {
		
	}					
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      sFrm.email.focus();
		  return;
    }
    sFrm.submit();
}
