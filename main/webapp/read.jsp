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
	List<CommentVO> commentList = dao.getComments(pNum);
	
	String nickname = uvo.getNickname() + "(" + uvo.getId() + ")";
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title %></title>
<link rel="stylesheet" href="./css/c_style.css">
<link rel="stylesheet" href="./css/read.css">
</head>
<body>
	<header>
        <section class="hbody">
          <article class="nav">
          <div class="title"><a href="./c_index.jsp">B.A.B.O</a></div>
          <ul id="menu">
            <li><a href="./Notice_Board.jsp" class="bar-anchor"><span>공지사항</span><div class="transition-bar"></div></a></li>
            <li><a href="./introduce.jsp">소개 </a></li>
            <li><a href="./Free_board.jsp">자유게시판</a></li>
            <li><a href="./Q&A_Board.jsp">질문게시판</a></li>
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
		<div class="content-title">
			제목  <%=vo.getTitle()%> &nbsp;&nbsp; <br>
			<div class="writer">
			작성자 :  <%=vo.getNickname() %>
			</div>
			</div>
			
		
		<br>
		
		<!-- 글 내용의 메인 -->
		<div class="article-content">
		<p><%=vo.getContents() %></p>
		</div>
		<div class="content-change">
		<button type="button" value="목록" class="move-board" onclick="history.back()">목록</button>
		<button type="button" value="수정" class="cont-ch">수정</button>
		<button type="button" value="삭제" class="cont-de">삭제</button>
		</div>
		<br>
		<!-- 댓글 -->
		<%
			if(id != null) {%>
		<p class="comment-write">댓글 작성하기</p><br>
		<%} %>
		<div id="CommentBox">
			
			<!-- 로그인 상태일 경우에만 활성화 -->
			<%
				if(id != null) {%>
				
					<form action="writeComment.jsp" method="get">
						<!-- 현재 보고있는 게시글 번호 -->
						<input type="hidden" name="postNum" value="<%=vo.getPNum()%>">
						<!-- 현재 로그인된 계정의 ID -->
						<input type="hidden" name="commentWritter" value="<%=id%>">
						<!-- 현재 로그인된 계정의 닉네임 -->
						<input type="hidden" name="nickname" value="<%=nickname%>">
						
						<!-- 댓글 내용 -->
						<div style="display:flex;">
						<input type="text" name="contents" class="comment-contents">
						<input type="submit" value="댓글 작성" class="comment-submit">
						</div>
					</form>
					
				<% }%>
			
			<br>
			<p class="comment">댓글[<%=commentList.size() %>]</p> 
			<br>
		<div style="margin-left: 580px;">
			<%for(int i = 0; i < commentList.size(); i++) {%>
					<!-- 유저의 정보(프로필)를 확인-->
					<div style="display:flex; margin-top: 15px;">
					<a href="#" style="color: black;"><%= commentList.get(i).getNickname()%></a>
					
					<p class="comment-day"><%= commentList.get(i).getWriteDate() %></p>
					</div>		
				 	 <% if(commentList.get(i).getTag() != null) {%>
					<!-- 유저의 정보(프로필)를 확인  -->
						태그 : #<a href="#"><%=commentList.get(i).getTag() %></a>
					<%}%> 
				  	<p class="comment-cont"><%= commentList.get(i).getContents() %></p>
				<% }%>	
					</div>
					
				
			</div><!-- CommentBox -->
			<br>
			<br>
		  <footer>
        <div class="footer bg-navy">
            <p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
          </div>
      </footer>
		</div><!-- Container -->
      
      
     
</body>
</html>