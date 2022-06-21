<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="common.UserDAO" />
<jsp:useBean id="uvo" class="common.UserVO" />
<jsp:useBean id="dao" class="common.PostDAO" />

<%@ page import="common.PostVO" %>
<%@ page import="common.CommentVO" %>
<%@ page import="java.util.*" %>

<%
  request.setCharacterEncoding("UTF-8");
  String id = (String)session.getAttribute("lgnId");
  uvo = udao.getUser(id);
  // 공지사항 필드에 최신순으로 10개만 올라가도록
  List<PostVO> noticeList = dao.getPostList("Notice_Board", 1, 10);
  List<PostVO> recentPostList = dao.getAllPostList();
  List<PostVO> hotList = dao.getHotList();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/allBoard.css">
    <title>B.A.B.O</title>
    
</head>
<body>
    <header>
    	<section class="hbody">
       	    <article class="nav">
       	    
            	<div class="title">
            		<a href="./c_index.jsp">B.A.B.O</a>
            	</div>

	            <ul id="menu">
	            <li><a href="./Notice_Board.jsp" class="bar-anchor"><span>공지사항</span><div class="transition-bar"></div></a></li>
	            <li><a href="./introduce.jsp">소개 </a></li>
	            <li><a href="./Free_board.jsp">자유게시판</a></li>
	            <li><a href="./Q&A_Board.jsp">질문게시판</a></li>
		        <% if(id != null) {%>
		      		<li><a href="write.jsp">글쓰기</a></li>
			    <% 	if(id.equals("admin")) {%>
			    	<li><a href="MemberList.jsp">회원 관리 페이지</a></li>
			    <% } } %>
	          	</ul>
	          
	              <ul id="menu-2">
	              	<li>
	                <%
	                if(id != null){
	                	 if(uvo.getNickname().length() < 6) {
	                		out.print(uvo.getNickname() +"님 환영합니다.");
	                	 }else{
	                		out.print(uvo.getNickname().substring(0, 5) + "...님");
	                	 } %>
	                </li>
	                <li><a href="./info_confirm.jsp">마이 페이지</a></li>
	                <li><a href="./logout.jsp">로그아웃</a></li>
	                <% } else { %>
	 				<li><a href="./login.jsp">로그인</a></li>
	            	<li><a href="./register.jsp">회원가입 </a></li>
	            	<% }%>
	         	  </ul>
         	  
          	</article> <!-- nav -->
        </section> <!-- hbody -->
    </header>
    
	<div class="container">
		<div id="mainContent">
	    	<div id="main_upperContent">
	     		<fieldset class=" notice">
	         		<legend>공지사항</legend>
	         		<table style="margin:0 auto;">
	        			<%for(int i = 0; i < noticeList.size(); i++) { %>
	   	     			<tr>
	         				<td><a href="read.jsp?pNum=<%=noticeList.get(i).getPNum()%>" id="main_notice_title"><%=noticeList.get(i).getTitle()%></a></td>
	        				<td id="main_notice_wrDate"><%=noticeList.get(i).getWrDate() %></td>
	        			</tr>
	         			<%}%>
	         		</table>
	     		</fieldset>
	     		<fieldset class=" new_board">
	        		<legend>최신 글</legend>
	        		<div>
		        		<table style="margin:0 auto;">
		        			<%for(int i = 0; i < recentPostList.size(); i++) {
		        			PostVO recentVO = recentPostList.get(i);%>
		        			<tr>
		        				<td id="main_new_category"><%=recentVO.getCategory()%> &nbsp;</td>
		        				<td><a href="read.jsp?pNum=<%=recentVO.getPNum()%>" id="main_new_title"><%=recentVO.getTitle() %></a></td>
		        				<td><%=recentVO.getWrDate()%></td>
		        			</tr>
		        			
		        			<%}%>
		        		</table>
	        		</div>
	    		</fieldset>
			</div> <!-- display:flex -->
	     	<fieldset class="Free_board">
	         	<legend>실시간 인기글</legend>
	         	<div>
		         	<table style="margin:0 auto;">
		         		<%for(int i = 0; i < hotList.size() ; i++) {
		         		PostVO vo = hotList.get(i);
		         		// 댓글 개수를 표시하기 위해 
		         		List<CommentVO> comList = dao.getComments(vo.getPNum());%>
		         		<tr>
		         			<td id="main_hot_category"><%=vo.getCategory()%> &nbsp;</td>
		         			<td><a href="read.jsp?pNum=<%=vo.getPNum()%>" id="main_hot_title"><%=vo.getTitle()%> <span style="color:blue;">[<%=comList.size()%>]</span> </a>&nbsp;</td>
		         			<td id="main_hot_wrDate"><%=vo.getWrDate()%> &nbsp;</td>
		         			<td id="main_hot_viewCnt" style="width: 150px; text-align: right;"><%=vo.getViewCnt()%> views</td>
		         		</tr>
		         		<%}%>
	         		</table>
	         	</div>
	     	</fieldset>
		</div><!-- mainContent -->
 	</div><!-- container -->
 	
    <footer>
    	<div class="footer bg-navy">
        	<p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
        </div>
    </footer>
</body>
</html>