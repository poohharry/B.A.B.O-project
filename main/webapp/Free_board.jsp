<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dao" class="common.PostDAO" />
<jsp:useBean id="vo" class="common.PostVO" />
<jsp:useBean id="udao" class="common.UserDAO" />
<jsp:useBean id="uvo" class="common.UserVO" />


<%@ page import = "java.util.*" %>
<%@ page import = "common.PostVO" %>
<%@ page import = "common.CommentVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("lgnId");
	uvo = udao.getUser(id);
	
	String cate = "Free_board";
	List<PostVO> list = dao.getPostList(cate);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/board.css">
    
    <title>자유 게시판</title>
    
    <script>
    	function1 () {
    		
    	}
    </script>
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
	    <% if(id != null) {%>
	      		<li><a href="write.jsp">글쓰기</a></li>
	    <% if(id.equals("admin")) {%>
	    	<li><a href="MemberList.jsp">회원 관리 페이지</a></li>
	    <% 		} 
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
      
      <div class="container" >
  	<h1> 자유게시판</h1>
	    <div id="postListContainer">
		    <table>
		    	<tr class="postList">
		    		<td id="pNum">번호</td>
		    		<td id="title">제목</td>
		    		<td id="writter">작성자</td>
		    		<td id="writeDate">작성일</td>
		    		<td id="viewCnt">조회수</td>
		    	</tr>
		    	<% for(int i = 0; i < list.size(); i++) { %>
		    	<% List<CommentVO> comList = dao.getComments(list.get(i).getPNum());%>
		    		<tr class="postList">
		    			<td id="pNum"><%=list.get(i).getPNum() %></td>
		    			<td id="title">
		    			<a href="read.jsp?pNum=<%=list.get(i).getPNum()%>">
		    			<%=list.get(i).getTitle() %>[<%=comList.size() %>]</a></td>
		    			<td id="writter">
		    			<a href="profilepage.jsp?id=<%=list.get(i).getWritter() %>">
		    			<%=list.get(i).getWritter() %></a></td>
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
      </div>
      
      <footer>
        <div class="footer bg-navy">
            <p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
          </div>
      </footer>
</body>
</html>