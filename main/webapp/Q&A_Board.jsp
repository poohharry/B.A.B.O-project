<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="common.UserDAO" />
<jsp:useBean id="uvo" class="common.UserVO" />
<jsp:useBean id="dao" class="common.PostDAO" />
<jsp:useBean id="vo" class="common.PostVO" />
<%@ page import = "java.util.*" %>
<%@ page import = "common.PostVO" %>
<%@ page import = "common.CommentVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("lgnId");
	uvo = udao.getUser(id);
	
	
	// 페이징 넘버 작업
	
	// 한 페이지에 보여줄 게시글 개수
	int pageSize = 10;
	// 현재 페이지
	String pageNum = request.getParameter("pageNum");
	// pageNum이 null이라는 뜻은 처음 이 사이트에 들어왔다는 뜻이며, 그러한 경우 1번 페이지를 보여준다.
	if(pageNum == null) {
		pageNum = "1";
	}
	
	// 첫번째 글이 전체 게시글중 몇번째인지 계산
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	
	String cate = "Q&A_Board";
	List<PostVO> list = dao.getPostList(cate, startRow, pageSize);
	// 현재 카테고리에 해당하는 글이 총 몇개인지 확인
	int cnt = dao.getPostCount(cate);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Q&A_Board.css">
    <title>질문과 답변 게시판</title>
    
</head>
<body>
    <header>
        <section class="hbody">
          <article class="nav">
          <div class="title"><a href="c_index.jsp">B.A.B.O</a></div>
          <ul id="menu">
            <li><a href="./Notice_Board.jsp" class="bar-anchor"><span>공지사항</span><div class="transition-bar"></div></a></li>
            <li><a href="./introduce.jsp">소개 </a></li>
            <li><a href="./Free_board.jsp">자유게시판</a></li>
            <li><a href="./Q&A_Board.jsp">질문게시판</a></li>
      <% if(id != null) {%>
      		<li><a href="write.jsp">글쓰기</a></li>
	    <% if(id.equals("admin")) {%>
	    	<li><a href="MemberList.jsp">회원 관리 페이지</a></li>
	    <%} 
	    	} %>
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
 				<li><a href="./login.jsp">로그인</a></li>
            	<li><a href="./register.jsp">회원가입 </a></li>
            <% }%>
          </ul>
     
        
          </article>
        </section>
      </header>
      <div class="container ">
  	<h1> 질문과 답변 게시판</h1>
	    <div id="postListContainer">
		    <table>
		    	<tr class="postList">
		    		<td id="pNum">번호</td>
		    		<td id="title">제목</td>
		    		<td id="writter">작성자</td>
		    		<td id="writeDate">작성일</td>
		    		<td id="viewCnt">조회수</td>
		    	</tr>
		    	<%for(int i = 0; i < list.size(); i++) { 
		    	List<CommentVO> comList = dao.getComments(list.get(i).getPNum());%>
		    		<tr class="postList">
		    			<td id="pNum"><%=list.get(i).getPNum() %></td>
		    			<td id="title"><a href="read.jsp?pNum=<%=list.get(i).getPNum()%>"><%=list.get(i).getTitle() %>[<%=comList.size() %>]</a></td>
		    			<td id="writter"><%=list.get(i).getWritter() %></td>
		    			<td id="writeDate"><%=list.get(i).getWrDate() %></td>
		    			<td id="viewCnt"><%=list.get(i).getViewCnt() %></td>
		    		</tr>
		    	<% }%>
		    	
		    </table>
		    <br>
		    <% if(id != null){%>
		    <button type="button" class="write-btn" onclick="location.href='./write.jsp'">글쓰기</button>
		    <%}%>
	    </div>
	    <!-- 게시글 페이징 -->
	    <div id="page_control" style="text-align: center;">
			<%
	    		if(cnt != 0) {
	    			// 전체 페이지 수 계산
	    			int pageCnt = cnt / pageSize + (cnt%pageSize == 0 ? 0 : 1);
	    			// 한 페이지에 보여줄 페이지 번호 개수
	    			int pageBlock = 10;
	    			// 시작하는 페이지 번호  ex) 1, 11, 21...
	    			int startPage = ((currentPage-1) / pageBlock) * pageBlock + 1;
	    			// 끝나는 페이지 번호
	    			int endPage = startPage + pageBlock-1;
	    			
	    			if(endPage > pageCnt) {
	    				endPage = pageCnt;
	    			}
	    			
	    			// 10페이지 이전으로 가는 버튼
	    			// 시작페이지가 11이상이 아니면 이전 버튼을 만들 필요가 없다. 
		    		if(startPage > pageBlock) { %>
		    			<a href="Q&A_Board.jsp?pageNum=<%=startPage - pageBlock%>">이전</a>
		    		<%}
	    			// 몇번 페이지로 갈 것인지 번호를 a태그로 생성
	    			for(int i = startPage; i <= endPage; i++) { %>
	    				<a href="Q&A_Board.jsp?pageNum=<%=i%>"><%=i %></a>
	    			<%}
	    			
	    			// 10페이지 건너뛰는 버튼
	    			// 남은 페이지가 10 이하라면 다음으로 가는 버튼을 만들 필요가 없다.
	    			if(endPage < pageCnt) { %>
	    				<a href="Q&A_Board.jsp?pageNum=<%=startPage + pageBlock%>">다음</a>
	    			<%}
	    		}
  			%>
	    </div>
      
        
         
     </div><!-- container -->
      <footer>
        <div class="footer bg-navy">
            <p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
          </div>
      </footer>
</body>
</html>