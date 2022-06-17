<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("lgnId");
	String pw = request.getParameter("pw");
	// default URL주소
	String location = "info_confirm.jsp";
	
	session.setAttribute("id",id);
	
	// 세션ID와 입력받은 비밀번호를 매개변수로 비밀번호 체크메소드 호출(boolean 반환)
	if(dao.ChkPW(id, pw)) { 
		session.setAttribute("id",id);
	%>
		<script>
		location.href = "myinfo.jsp";
		</script>
	<% } else { %>
		<script>
			alert("비밀번호가 다릅니다. 다시 입력해주세요");
			history.back();
		</script>
	<% }%>
	
