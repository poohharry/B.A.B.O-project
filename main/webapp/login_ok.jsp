<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="common.UserDAO"/>
<jsp:useBean id="bvo" class="common.BlackVO"/>

<%
	String id = request.getParameter("login_ID");
	String pw = request.getParameter("login_PW");
	
	bvo = dao.getBlack(id);
	
	
	int num = dao.login(id, pw);
	String url = "login.jsp";
	String msg = "";
	
	switch(num) {
	case 1: msg = "아이디가 없습니다.";
		break;
	case 2: msg = "비밀번호가 일치하지 않습니다.";
		break;
	case 3: {
		msg = "로그인에 성공하였습니다.\\n" + id + "님 환영합니다!";
		url = "c_index.jsp";
		session.setAttribute("lgnId", id);
		break;
		}
	case 4: {
		msg = "로그인에 성공했지만 추가인증이 필요합니다. \\n" + "등록된 이메일을 입력해 주세요";
		url = "email_confirm.jsp?id="+ id;
		break;
		}
	case 5 : {
		msg = "차단된 계정입니다. \\n" + "사유 : " + bvo.getReason() + "\\n해지 예정 날짜 : " + bvo.getFreeDate();
		url = "c_index.jsp";
	}
		break;
	}
%>
<html>
<body>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
</body>
</html>