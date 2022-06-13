<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id = request.getParameter("login_id");
		String email = request.getParameter("login_email");
		
		System.out.println(id);
		System.out.println(email);
	%>
	
	
	<!-- 
		우선 한글
		findpw.jsp 에서 id 와 email 정보를 받아온다 (id 의 name 은 login_id 이고
		email 의 name 은 login_email 이다.)
		DB에서 해당 id 와 email을 조회한다.
		조회해서 들어맞는 계정이 있으면 비밀번호 업데이트 메소드를 이용하여
		새로운 비밀번호를 업데이트 할수 있게 한다.
		
		그러면 필요한 메소드 = 
		id 와 email 을 받아서 DB에 조회할수 있는 메소드
		그리고 비밀번호만 새롭게 업데이트 할수 있는 메소드  
	 -->
</body>
</html>