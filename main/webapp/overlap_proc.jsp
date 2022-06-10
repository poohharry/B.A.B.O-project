<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("inputID");
	
	// 아이디가 이미 존재하는지 체크하는 함수(이미 존재하면 true, 없으면 false를 반환)
	boolean flag = dao.isIdExist(id);
	
	String url = "overlap.jsp?id=" + id + "\\&flag=" + flag;
	
%>
    
<script>
	location.href = "overlap.jsp?id=" + "<%=id%>" + "\&flag=" + "<%=flag%>";
</script>