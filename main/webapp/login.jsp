<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/allLogin.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>로그인</title>
    <script>
    	
    	// 로그인체크 (ID와 비밀번호가 공백인지 체크후 각 상황에 맞게 알림창과 포커스를 맞춰준다)
  	    function loginChk() {
    		
	    	// 로그인 form의 name을 따와서 변수로 사용
	    	const frm = document.loginFrm;
	    	
	    	if(frm.login_ID.value == "") {
	    		alert("아이디를 입력해 주세요.");
	    		frm.login_ID.focus();
	    		return;
	    	}
	    	if (frm.login_PW.value == "") {
	    		alert("비밀번호를 입력해 주세요.");
	    		document.loginFrm.login_PW.focus();
	    		return;
	    	}
	    	
	    	// 최종적으로 이상 없으면 submit (비밀번호가 맞고 틀리고는 다음 페이지에서 판단)
	    	frm.submit();
	    }
    </script>
    
</head>
<body>
  <div class="main">	
    <p class="sign" align="center">로그인</p>
    <form action="login_ok.jsp" method="post" class="form1" name="loginFrm" >
      <input class="pass" name="login_ID" type="text" align="center" placeholder="ID">
      <input class="pass" name="login_PW" type="password" align="center"placeholder="Password">

      <button class="submit" onclick="loginChk()">로그인 </button>

      <p class="forgot" align="center"><a href="findid.jsp" class ="forgot_a">아이디 또는 패스워드를 잊었나요?</a></p>
      <p class="register" align="center"><a href="register.jsp">회원 가입</a></p>
      </form> <!-- form1 form -->    
    </div> <!-- main -->
</body>
</html>
