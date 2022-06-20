<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
    
<% String id = request.getParameter("id"); %>
<% dao.deleteUser(id); %>

<script>
	location.href="logout.jsp";
	
</script>
	
