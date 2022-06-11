<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.PostDAO" />
<jsp:useBean id="vo" class="common.PostVO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- <% String id = (String)session.getAttribute("id"); %>
	<% String category = (String)session.getAttribute("category"); %>
	<% String title = (String)session.getAttribute("title"); %>
	<% String contents = (String)session.getAttribute("contents"); %>
	<div>
		<p><%=id%></p>
		<p><%=category %></p>
		<p><%=title %></p>
		<p><%=contents %></p>
	</div> --%>
	<!-- 세션이 아니라 DB에서 정보를 직접 가져오는 식으로 만들어야함 -->
	<header>
		<% vo = dao.readPost(1); %>
	</header>
</body>
</html>