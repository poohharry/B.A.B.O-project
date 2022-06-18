<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%@ page import="java.util.*" %>
<%@ page import="common.BlackVO" %>
<%
	List<BlackVO> list = dao.getBlackList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{
		border: 1px solid black;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>유저번호</td>
			<td>id</td>
			<td>지정날짜</td>
			<td>해지날짜</td>
			<td>사유</td>
		</tr>
		
		<%for(int i = 0; i < list.size(); i++) { %>
			<tr>
				<td><%=list.get(i).getmNum() %></td>
				<td><%=list.get(i).getId() %></td>
				<td><%=list.get(i).getAppointDate() %></td>
				<td><%=list.get(i).getFreeDate() %></td>
				<td><%=list.get(i).getReason() %></td>
			</tr>
		<% }%>
	</table>
</body>
</html>