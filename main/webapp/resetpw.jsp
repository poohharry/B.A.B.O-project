<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
	<link rel="stylesheet" href="css/allLogin.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
</head>
<body>
	<div class="main">	
		<p class="sign" align="center">비밀번호 재설정</p>
		<form action="login_ok.jsp" method="post" class="form1" name="loginFrm" >
		    <input class="pass" name="login_ID" type="password" align="center" placeholder="새 비밀번호">
		    <input class="pass" name="login_PW" type="password" align="center"placeholder="비밀번호 확인">
		
		    <button class="submit" onclick="location.href=''">로그인 </button>
		
		</form> <!-- form1 form -->    
	</div> <!-- main -->
</body>
</html>