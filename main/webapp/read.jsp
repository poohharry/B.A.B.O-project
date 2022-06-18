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
	
	String writer = vo.getWritter();
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
			<div class="Title">
				<p>제목 : <%=vo.getTitle()%></p> &nbsp;&nbsp; <br>
			</div> <!-- Title -->
			<div class="writer">
			작성자 : <a href="profilepage.jsp?id=<%=vo.getWritter()%>"><%=vo.getNickname() %></a>
			</div> <!-- writer -->
		</div> <!-- content-title -->
			
		
		<br>
		
		<!-- 글 내용의 메인 -->
		<div class="article-content">
	
			<%if(vo.getFileName() != null) { // 게시글에 사진이 있는지 여부 검사, 있으면 밑의 코드 실행
				String extension = vo.getFileName().substring(vo.getFileName().lastIndexOf("."));
				if(extension.equals(".jpg") 
				|| extension.equals(".jpeg") 
				|| extension.equals(".gif") 
				|| extension.equals(".png") 
				|| extension.equals(".webp")) {%>
				<img src = "./uploadFiles/<%=vo.getFileName()%>">
				<%}
			}%>

				<%=vo.getContents() %> <!-- 게시글 내용을 출력하는 코드 -->
				
		</div> <!-- article-content -->
		
		<br>
		<div class="content-change">
			<div class="mbdiv">
			<% if(id != null){ %> <!-- 로그인 상태라면 {}내부의 코드를 실행 -->
				<% if(id.equals(writer) || id.equals("admin")){ %> 
				<!-- 아이디가 작성자 이거나 아이디가 admin일 경우 -->
					<button type="button" class="cont-ch">수정</button>
					<button type="submit" class="cont-de" 
					onclick="location.href='postDelete.jsp?name=<%=pNum%>'">게시물 삭제</button>
				<% }
			} %> <!-- if(id != null) -->
			
				<button type="button" value="목록" class="move-board" 
				onclick="history.back()">목록</button>
			</div> <!-- mbdiv -->
		</div> <!-- content-change -->
				
		<br><br>
		<!-- 댓글 -->
		<%
			if(id != null) {%>
		<div class="comment-write">
			<p>댓글 작성하기</p><br>
		</div>
		
		<%} %>
		<div id="CommentBox">
			<!-- 로그인 상태일 경우에만 활성화 -->
			<% if(id != null) {%>
			<form action="writeComment.jsp" method="get">
				<!-- 현재 보고있는 게시글 번호 -->
				<input type="hidden" name="postNum" value="<%=vo.getPNum()%>">
				<!-- 현재 로그인된 계정의 ID -->
				<input type="hidden" name="commentWritter" value="<%=id%>">
				<!-- 현재 로그인된 계정의 닉네임 -->
				<input type="hidden" name="nickname" value="<%=nickname%>">
				
				<!-- 댓글 내용 -->
				<div class="cbdiv">
					<input type="text" name="contents" class="comment-contents">
					<input type="submit" value="댓글 작성" class="comment-submit">
				</div> <!-- class="cbdiv" -->
			</form>
			<% }%> <!-- if문 끝 -->
		</div> <!-- CommentBox -->
				
		<br>
		<div class="cdiv">
			<p class="comment">댓글[<%=commentList.size() %>]</p>
		</div> <!-- cdiv -->
		
		<div style="margin-left: 580px;">
			<%for(int i = 0; i < commentList.size(); i++) {%>
				<!-- 유저의 정보(프로필)를 확인-->
				<div style="display:flex; margin-top: 15px;">
					<a href="#" style="color: black;">
					<%= commentList.get(i).getNickname()%></a>
					<p class="comment-day"><%= commentList.get(i).getWriteDate() %></p>
				</div> <!-- style="display:flex; margin-top: 15px -->	
			 	<% if(commentList.get(i).getTag() != null) {%>
					<!-- 유저의 정보(프로필)를 확인  -->
					태그 : #<a href="#">
					<%=commentList.get(i).getTag() %></a> <%}%> <!-- if문 끝 -->
				  	<p class="comment-cont">
				  	<%= commentList.get(i).getContents() %></p><% }%> <!-- for문 끝 -->
		</div> <!-- style="margin-left: 580px -->
					
	</div> <!-- Container -->
			<br>
			
    <footer>
    	<div class="footer bg-navy">
        	<p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
        </div>
    </footer>
      
</body>
</html>