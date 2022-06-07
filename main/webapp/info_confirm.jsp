<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String id = (String)session.getAttribute("lgnId");%>
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
<script>
	function ChkPw() {
		const frm = document.ChkFrm;
		if (frm.pw.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.ChkFrm.pw.focus();
			return;
		}
		
		// 최종적으로 이상 없으면 submit (비밀번호가 맞고 틀리고는 다음 페이지에서 판단)
		frm.submit();	
	}
</script>
<body>
	<!-- 
		proc페이지가 너무 많아지는 상황이 발생함
		추후에 proc페이지를 하나로 합치고 폼마다 hidden input필드를 사용해서
		어떤 메소드를 활용할 것인지 switch문을 돌리던지 해야겠음
	 -->
  <div class="main">	
    <p class="sign" align="center">회원정보확인</p>
    <form class="form1" action="info_confirm_proc.jsp" method="post" name="ChkFrm">
        <p class="txt_center">회원정보수정 페이지로 넘어가길 원하시면<br> 패스워드를 입력해주세요.</p>
      <input class="pass" type="password" text-align="center" placeholder="Password" name="pw">
      <div>
      <!-- if (비밀번호 == DB비밀번호) {
      	submit else {location.href=#}   }
       -->
      <a class="submit" onclick="ChkPw()">확인 </a>
      <a class="reset" onclick="location.href='c_index.jsp';">취소</a>
      
      
    </div>
  

      </form>      
            
    </div>
</body>
</html>