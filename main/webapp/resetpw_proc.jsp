<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("newPW");
	
	dao.resetPW(id, pw);
%>
<script>
	alert("비밀번호를 재설정 했습니다. 다시 로그인 해 주세요");
	location.href="login.jsp";
</script>