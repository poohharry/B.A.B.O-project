<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />

	<% String newarr = request.getParameter("name"); %>
	
	<% dao.deleteUser(newarr); %>
	
<script>
	location.href="MemberList.jsp";
</script>