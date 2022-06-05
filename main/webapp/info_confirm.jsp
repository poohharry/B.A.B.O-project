<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/info_confirm.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>회원정보확인</title>
</head>
<body>
  <div class="main">	
    <p class="sign" align="center">회원정보확인</p>
    <form class="form1">
        <p class="txt_center">회원정보수정 페이지로 넘어가길 원하시면<br> 패스워드를 입력해주세요.</p>
      <input class="pass" type="password" text-align="center" placeholder="Password">
      <div>
      <!-- if (비밀번호 == DB비밀번호) {
      	submit else {location.href=#}   }
       -->
      <a class="submit">확인 </a>
      <a class="reset" onclick="location.href='c_index.jsp';">취소</a>
      
      
    </div>
  

      </form>      
            
    </div>
</body>
</html>