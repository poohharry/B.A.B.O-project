<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.PostDAO" />
<jsp:useBean id="vo" class="common.PostVO" />
<jsp:useBean id="udao" class="common.UserDAO" />
<jsp:useBean id="uvo" class="common.UserVO" />
<jsp:useBean id="cvo" class="common.CommentVO" />
<%@ page import = "java.util.*" %>
<%@ page import = "common.CommentVO" %>
<%
	// 파라미터 값으로 넘어오는 애들 한글깨짐 방지
	request.setCharacterEncoding("UTF-8");
	// 로그인된 ID
	String id = (String)session.getAttribute("lgnId");
	uvo = udao.getUser(id);
	// 문자열로 받은 쿼리속 변수를 Integer로 변환후 저장
	Integer pNum = Integer.parseInt(request.getParameter("pNum"));
	// 파라미터로 전달받은 postNumber값에 따라 read.jsp내용물 vo로 받아오기
	vo = dao.readPost(pNum);
	// 탭에 들어갈 페이지 제목, 글의 제목
	String title = vo.getTitle();
	// 현재 게시글에 달린 댓글 불러오기
	List<CommentVO> list = dao.getComments(pNum);
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title %></title>
<link rel="stylesheet" href="./css/c_style.css">
</head>
<body>
	<header>
        <section class="hbody">
          <article class="nav">
          <div class="title"><a href="./c_index.jsp">B.A.B.O</a></div>
          <ul id="menu">
            <li><a href="./c_index.jsp" class="bar-anchor"><span>공지사항</span><div class="transition-bar"></div></a></li>
            <li><a href="./introduce.jsp">소개 </a></li>
            <li><a href="./Free_board.jsp">자유게시판</a></li>
        <%if(id != null) {%>
      		<li><a href="write.jsp">글쓰기</a></li>
	    <%}%>
          </ul>
          
              <ul id="menu-2">
              	
                <li>
                <%if(id != null){
                	 if(uvo.getNickname().length() < 6) {
                out.print(uvo.getNickname() +"님 환영합니다.");
                	 }else{
                		 out.print(uvo.getNickname().substring(0, 5) + "...님");
                	 }
                	 
                %></li>
                <li><a href="./info_confirm.jsp">마이 페이지</a></li>
                <li><a href="./logout.jsp">로그아웃</a></li>
                 
                <%
            }else{ %>
 				<li><a href="./login.jsp">로그인</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
            	<li><a href="./register.jsp">회원가입 </a></li>
            <% }%>
          </ul>
          </article>
        </section>
      </header>
      
	<div class="container">
		<!-- 제목 및 작성자와 같은 글 내용의 헤더 -->
		<div>
			제목 : <%=vo.getTitle()%> &nbsp;&nbsp; 작성자 :  <%=vo.getNickname() %>
		</div>
		<br>
		
		<!-- 글 내용의 메인 -->
		<div>
			글 내용 : <%=vo.getContents() %>
		</div>
		<br>
		<!-- 댓글 -->
		<div>
			댓글 : 
			<%
				for(int i = 0; i < list.size(); i++) {%>
					댓글 작성자 : <%= list.get(i).getNickname()%>
					
					댓글 내용 : 
					
				<% }%>
		</div>
		
	</div>
      
      
      
      <footer>
        <div class="footer bg-navy">
            <p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
          </div>
      </footer>
</body>
</html>