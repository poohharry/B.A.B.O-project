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
    <title>로그인 페이지</title>
</head>
<body>
   
<div class="main">
    <div class="header">
        <a href="c_index.jsp"><img src="images/부산광역시-removebg-preview.png"></a>
                <h1 class="title_txt">Busan Cummunity</h1>
    </div> <!--header-->
     <form action="login_ok.jsp" method="post">
    <div class="body-center">
        <fieldset>
            <legend class="Login_txt">Login</legend>
                    <input type="text" name="login_ID" placeholder="아이디"><br>
                    <input type="password" name="login_PW" placeholder="비밀번호"><br><br>
                    <button type="submit">로 그 인</button>
        </fieldset>
        <div class="bottom_tag">
            <a href="#" target="_blank">비밀번호 찾기</a> &nbsp;| <a href="#" target="_blank">아이디 찾기</a> |&nbsp; <a href="register_test.jsp" target="_blank">회원가입</a>
            </div>
    </div> <!-- body-center-->
</div>    <!--main-->
</form>
</body>
</html>