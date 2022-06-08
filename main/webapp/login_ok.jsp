<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO"/>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("login_ID");
	String pw = request.getParameter("login_PW");
	
	String url = "login.jsp";
	String msg = "";
	int num = dao.login(id, pw);
	
	switch(num) {
	case 1: msg = "아이디가 없습니다.";
		break;
	case 2: msg = "비밀번호가 일치하지 않습니다.";
		break;
	case 3: {
		msg = "로그인에 성공하였습니다.";
		url = "c_index.jsp";
		session.setAttribute("lgnId", id);
	}
		break;
	}
%>
<script>
	alert("<%=msg%>\n<%=id%> 님 환영합니다!");	
	location.href="<%=url%>";
</script>