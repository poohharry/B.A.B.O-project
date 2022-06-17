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
	history.back(3);
	/* 게시글 목록으로 되돌리는 작업 필요 */
</script>
	
</head>
<body>

</body>
</html>