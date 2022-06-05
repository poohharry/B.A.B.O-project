<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.MemberTable thead tr td{
		border: 1px #000 solid;
		width: 100px;
		height: 50px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% List<String> arr = dao.getUsers(); %> <!-- arr에 인덱스 5개가 담겨져있음 -->
	<table class="MemberTable">
	
		<thead>
			<tr>
				
				<td>회원 아이디</td>
				<td>회원 이름</td>
				<td>회원 이메일</td>
				<td>회원 전화번호</td>
				<td>회원 가입날짜</td>
			</tr>
			
<%-- 			
			<tr>
				<td><%= arr.get(0) %></td>
				
				<td><%= arr.get(1) %></td>
			
				<td><%= arr.get(2) %></td>
			
				<td><%= arr.get(3) %></td>
			
				<td><%= arr.get(4) %></td>
				
			</tr>  
 --%>			
			
			
			
			
			<% for(int i = 0; i < arr.size(); i+=5) {%>
			<tr>
				<td> <%= arr.get(i) %></td>
				<td> <%= arr.get(i+1) %></td>
				<td> <%= arr.get(i+2) %></td>
				<td> <%= arr.get(i+3) %></td>
				<td> <%= arr.get(i+4) %></td>
			</tr> 
			<% } %>  
		</thead>
		
		<!-- 
	</table> <br><br>
	<p> <%= arr.size() %> </p>
	<% for(int j = 0; j < arr.size(); ++j) { 
		// 자료형이 list, arraylist, vector 일때는 배열의 길이를 설정할때 length 대신 size를 쓴다.
		%> <p> <%= arr.get(j) %> </p>
		<% }//for %> -->
			 
		 <%-- 
		 <% List<UserVO> arr = dao.getUsers();
				for (int i = 0; i < arr.size(); ++i) {
				System.out.println(arr.get(i).getID());}
				%> --%>
		
	
</body>
</html>