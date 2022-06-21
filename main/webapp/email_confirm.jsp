<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="common.UserVO"/>
<jsp:useBean id="dao" class="common.UserDAO"/>
<%
	request.setCharacterEncoding("UTF-8"); 
	String id = request.getParameter("id");
	vo = dao.getUser(id);
	String email = vo.getEmail();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 확인</title>
<link rel="stylesheet" href="./css/login_style.css">

</head>
<body>
<div class="main">	
    <p class="sign" align="center">이메일 확인인증</p>
    <form action="c_index.jsp" method="post" class="form1" name="email_confirm">
    <br><br>
      <input class="pass" name="inputEmail" type="text" align="center" placeholder="Email" id=inEmail>
      <a class="submit" onclick="checkEmail()">확인</a>
      </form>      
            
    </div>
</body>

<script>
	
	// 추가인증으로 미리 조회한 이메일과 입력받은 이메일이 일치하는지 확인
	const frm = document.email_confirm;
	function checkEmail() {

		if(frm.inputEmail.value != "<%=email%>") {
			alert("이메일이 일치하지 않습니다.");
			frm.inputEmail.focus();
			return;
		}
		frm.submit();
	}
</script>

</html>