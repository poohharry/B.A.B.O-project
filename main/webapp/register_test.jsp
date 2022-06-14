<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
</head>
<body>
    <form action="register_test_proc.jsp" method="post">
    <div>
    <h1>회원가입 페이지</h1>
    <div>
       <p> 아이디 :  <input type="text" name="id" placeholder="ID를 입력해주세요." required></p>
       <p> 비밀번호 : <input type="password" name="pw" placeholder="PW를 입력해주세요." required></p>
       <p> 이메일 : <input type="text" name="email" required>@<select name="site">
            <option value="naver.com" selected>naver.com</option>
            <option value="google.com" >google.com</option>
            <option value="daum.net" >daum.net</option>
            <option value="yahoo.co.kr">yahoo.co.kr</option>
       </select> </p>
       <p> 이름: <input type="text" name="name" placeholder="이름을 입력해주세요." required> </p>
       <p> 연락처: <input type="text" name="pNum" placeholder="휴대폰 번호를 입력해주세요." ></p>
       <p><label>사업자면 체크<input type="checkbox" name="isbiz"></label></p>
   
       <input type='submit' value='가입하기' />
       <input type="reset" value="취소하기">
              

    <div>

    </div>
</form>
</body>
</html>