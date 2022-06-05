<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("lgnId");
	String pw = request.getParameter("pw");
	// default URL주소
	String location = "info_confirm.jsp";
	
	// 세션ID와 입력받은 비밀번호를 매개변수로 비밀번호 체크메소드 호출(boolean 반환)
	if(dao.ChkPW(id, pw)) {
		location = "Change_info.jsp";
	} else{
		// 비밀번호 틀렸을 경우 알림창을 띄우던가 해야하는데...?
	}
	
%>
<script>
	if("<%=location%>" == "info_confirm.jsp") {
		alert("비밀번호가 틀렸습니다.");
	}
	location.href="<%=location%>";
</script>