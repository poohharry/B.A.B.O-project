<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
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
		<form action="resetpw_proc.jsp?id=<%=id%>" method="post" class="form1" name="resetPWFrm" >
		    <input class="pass" name="newPW" type="password" align="center" placeholder="새 비밀번호">
		    <input class="pass" name="chkNewPW" type="password" align="center"placeholder="비밀번호 확인">
		    <button type="button" class="submit" onclick="document.resetPWFrm.submit()">비밀번호 재설정</button>
		
		</form> <!-- form1 form -->    
	</div> <!-- main -->
</body>
</html>