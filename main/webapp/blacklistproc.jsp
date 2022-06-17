<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO"/>
<jsp:useBean id="bvo" class="common.BlackVO"/>


<%
	int day = Integer.parseInt(request.getParameter("black"));
	String reason = request.getParameter("reason");
	
	
	
%>