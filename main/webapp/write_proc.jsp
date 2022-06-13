<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.PostDAO" />
<jsp:useBean id="udao" class="common.UserDAO" />
<jsp:useBean id="vo" class="common.PostVO" />
<jsp:useBean id="uvo" class="common.UserVO" />

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("lgnId");
	String category = request.getParameter("board-type");
	String title = request.getParameter("board-title");
	String contents = request.getParameter("ir1");
	
	uvo = udao.getUser(id);
	
	String nickname = uvo.getNickname() + "(" + uvo.getId() + ")";
	
	
	vo.setWritter(id);
	vo.setNickname(nickname);
	vo.setCategory(category);
	vo.setTitle(title);
	vo.setContents(contents);
	
	String msg = "";
	boolean flag = dao.writePost(vo);
	
	if(!flag) {
		msg = "글 작성 실패";
	}
	
%>

<script>
	if(<%=flag%> == "false") alert("<%=msg%>");
	location.href = "Free_board.jsp";
</script>