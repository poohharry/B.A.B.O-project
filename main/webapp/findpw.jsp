<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/findpw.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>비밀번호 찾기 페이지</title>
</head>
<body>
	<div class="main">	
    <p class="sign" align="center">비밀번호 찾기</p>
    <form action="findpwproc.jsp" method="post" class="form1">
      <p class="" align="center">비밀번호를 찾을 계정의 ID와 이메일을 입력해주세요</p><br>
      <input class="pass" name="login_id" type="text" align="center" placeholder="ID" />
      <input class="pass2" name="login_email" type="text" align="center" placeholder="E-mail" />
      <input type="submit" value="비밀번호 찾기" />
      
      <a class="submit">비밀번호 검색</a>
      <!-- <p class="forgot" align="center"><a href="#">아이디 또는 패스워드를 잊었나요?</a></p> -->
      <p class="register" align="center"><a href="findid.jsp">아이디 찾기</a></p>
      </form>        
    </div>
</body>
</html>