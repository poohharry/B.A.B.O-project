<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("lgnId");
	String category = request.getParameter("board-type");
	String title = request.getParameter("board-title");
	String contents = request.getParameter("ir1");
	
	System.out.println("작성자 " + id);
	System.out.println("카테고리 " + category);
	System.out.println("제목 " + title);
	System.out.println("내용 " + contents);
	System.out.println("====================");
%>
<html>
<body>
	<h1>Testing</h1>
</body>
</html>