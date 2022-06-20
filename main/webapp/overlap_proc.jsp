<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("inputID");
	String email = request.getParameter("inputEmail");
	String item = request.getParameter("item");
	String url = "";
	
	// 아이디를 중복처리하는지 이메일을 중복처리하는지 item값을 건네 받아서 체크
	if(item.equals("id")) {
		// 아이디가 이미 존재하는지 체크하는 함수(이미 존재하면 true, 없으면 false를 반환)
		boolean flag = dao.isIdExist(id);
		url = "overlap.jsp?id=" + id + "\\&flag=" + flag;		
	} else if(item.equals("email")) { 
		boolean flag = dao.isEmailExist(email);
		url = "eoverlap.jsp?email=" + email + "\\&flag=" + flag;				
	}
	
%>
    
<script>
	location.href = "<%=url%>";
</script>