<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인증정보(세션삭제)
	//리다이렉트
	
	session.invalidate(); // 세션을 끊는 메소드가 session.invalidate() 이다.
	response.sendRedirect("login.jsp");
%>