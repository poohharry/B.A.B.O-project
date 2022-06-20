<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "vo" class = "common.PostVO" />
<jsp:useBean id = "dao" class ="common.PostDAO" />
<% int pNum = Integer.parseInt(request.getParameter("name")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% boolean A = dao.deletePost(pNum); %>	
</head>
<body>
	<script>
		<%=A%>
		location.href="c_index.jsp"
	</script>
</body>
</html>