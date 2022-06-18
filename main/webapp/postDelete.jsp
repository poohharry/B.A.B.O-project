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
<script>
	
	/* 원래 보고있던 게시판으로 되돌리는 기능이 필요 */
</script>
	
</head>
<body>
	<script>
		<%=A%>
		location.href="c_index.jsp"
	</script>
</body>
</html>