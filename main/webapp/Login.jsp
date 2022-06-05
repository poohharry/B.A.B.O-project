<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/login_style.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>로그인</title>
</head>
<body>


  
  <div class="main">	
    <p class="sign" align="center">로그인</p>
    <form action="login_ok.jsp" method="post" class="form1">
      <input class="un " name="login_ID" type="text" align="center" placeholder="ID">
      <input class="pass" name="login_PW" type="password" align="center"placeholder="Password">
      <a class="submit">로그인 </a>
      <p class="forgot" align="center"><a href="info_confirm.jsp">아이디 또는 패스워드를 잊었나요?</a></p>
      <p class="register" align="center"><a href="register.jsp">회원 가입</a></p>
      </form>      
            
    </div>
</body>
</html>