<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO"/>
<jsp:useBean id="bvo" class="common.BlackVO"/>
<jsp:useBean id="vo" class="common.UserVO"/>


<%
	request.setCharacterEncoding("UTF-8");
	int day = Integer.parseInt(request.getParameter("black"));
	String reason = request.getParameter("reason");
	String id = request.getParameter("id");
	
	vo = dao.getUser(id);
	bvo.setmNum(vo.getmNum());
	bvo.setId(id);
	bvo.setReason(reason);
	
	dao.appointBlack(bvo, day);
%>
<script>
	window.close();
</script>