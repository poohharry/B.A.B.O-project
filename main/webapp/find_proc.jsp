<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<jsp:useBean id="vo" class="common.UserVO" />

<%
	// 찾는게 아이디인지 비밀번호인지
	String item = request.getParameter("item");

	String id = request.getParameter("login_id");
	String email = request.getParameter("login_email");
	String msg = "";
	String url = "login.jsp";
	String findID;
	String findPW;
	
	if(item.equals("id")) {
		findID = dao.findID(email);
		if(findID != null) {
			msg = "찾으시는 id는 " + findID + "입니다.";
		} else {
			msg = "해당하는 ID가 존재하지 않습니다.";
		}
	} else if(item.equals("email")) {
		findPW = dao.findPW(id, email);
		if(findPW != null) {
			msg = "찾으시는 pw는 " + findPW + "입니다.";
		} else {
			msg = "입력하신 정보를 다시 한번 확인해 주세요.";
		}
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>




