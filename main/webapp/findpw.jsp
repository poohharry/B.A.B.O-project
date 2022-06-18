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
    <title>비밀번호 찾기 페이지</title>
</head>
<body>
	<div class="main">	
    <p class="sign" align="center">비밀번호 찾기</p>

    <form action="find_proc.jsp?item=email" method="post" class="form1_findpw">
      <p class="" align="center">비밀번호를 찾을 계정의 ID와<br> 이메일을 입력해주세요</p><br>
      <input class="pass" name="login_id" type="password" placeholder="ID" />
      <input class="pass" name="login_email" type="text"  placeholder="E-mail" />
      
      
      <input type="submit" class="submit_findid_findpw" value="비밀번호 찾기" />
      <p class="register" align="center"><a href="findid.jsp">아이디를 잊었나요?</a></p>
      </form>        
    </div>
</body>
</html>