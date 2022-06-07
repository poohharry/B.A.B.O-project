<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="common.UserVO" />
<jsp:useBean id="dao" class="common.UserDAO" />

<%
	request.setCharacterEncoding("UTF-8"); 
	String id = (String)session.getAttribute("lgnId");
//	String email = request.getParameter("email") + "@" + request.getParameter("site");
	String email = request.getParameter("email");
	String birth = request.getParameter("year") + "-" +request.getParameter("month") + "-" +request.getParameter("day");
	
	vo.setPw(request.getParameter("pw"));
	vo.setName(request.getParameter("name"));
	vo.setEmail(email);
	vo.setpNum(request.getParameter("pNum"));
	vo.setBirth(birth);
	vo.setId(id);

/*	
 	// 체크박스여부는 체크됐을때 on을 체크되지 않았을 경우 null을 반환한다
	if(request.getParameter("isbiz") == null) {
		vo.setIsBiz("NULL"); 
	} else {
		vo.setIsBiz(request.getParameter("isbiz"));
	}
 */	
 
	boolean flag = dao.updateUser(vo);
 
 	String msg = "정보수정에 실패했습니다.";
	String location = "Change_info.jsp";
	
	if(flag){
		msg = "정보수정에 성공했습니다..";
		location = "c_index.jsp";
	}
	
%>
<script>
 	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

