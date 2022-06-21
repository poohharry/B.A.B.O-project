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
    <title>아이디 찾기 페이지</title>
</head>
<body>

	  <button type="button" value="아이디찾기" id="findid" >아이디 찾기</button>
    <button type="button" value="비밀번호찾기" id="findpw">패스워드 찾기</button>

	<div id="main">	
        <p class="sign" align="center">아이디 찾기</p>
        <form action="find_proc.jsp?item=id" method="post" class="form1" name="findId">
          <p align="center" style="margin-left:25px;">가입했을 때의 이메일을 입력해주세요</p><br>
          <input id="un" name="login_email" type="text" align="center" placeholder="Email">
          
          <a class="submit" onclick="document.findId.submit()">아이디 검색</a>
          <a id="submit" onclick="history.back()">뒤로가기 </a>
          </form>        
        </div>
        <div id="main2">	
            <p class="sign" align="center">비밀번호 찾기</p>
        
            <form action="find_proc.jsp?item=email" method="post" class="form1">
              <p class="" align="center">비밀번호를 찾을 계정의 ID와<br> 이메일을 입력해주세요</p><br>
              <input id="pass" name="login_id" type="text" placeholder="ID" />
              <input id="pass" name="login_email" type="text"  placeholder="E-mail" /> 
              <div style="display:flex;">
              <input type="submit" class="submit2" value="비밀번호 찾기" />
          	  <a id="submit2" onclick="history.back()">뒤로가기 </a>
              </div>
            </form>        
        </div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="./js/find.js">
</script>
</html>