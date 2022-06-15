<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<jsp:useBean id="vo" class="common.UserVO" />
<jsp:useBean id="pdao" class="common.PostDAO" />
<%@ page import = "common.UserVO" %>
<%@ page import = "common.PostDAO" %>
<%@ page import = "common.PostVO" %>
<%@ page import = "java.util.*" %>
<%@ page import = "common.CommentVO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/userinfo.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>회원 상세정보 페이지</title>
</head>
<body>
    <div class="headerdiv">
        <p>회원 상세정보 페이지</p>
        <div class="buttondiv">
            <button type="button" onclick="location.href='c_index.jsp'">메인 페이지</button>
            <button type="button" onclick="location.href='MemberList.jsp'">회원 목록페이지</button>
        </div> <!-- buttondiv -->
    </div> <!-- headerdiv -->

	<% String name = request.getParameter("name"); %> 
	<!-- 회원 목록 리스트에서 아이디를 클릭시 그 아이디가 name에 담겨서 넘어오고 그 name의 값을 String 변수 name에 담는다-->
	
	<% vo = dao.getUser(name); %>
	<!-- name을 UserDAO의 getUser 메소드의 매개변수에 넣는다. 
		getUser는 매개배변수로 받은 id의 모든 정보(mNum,id,email,pNum 등등)을 반환한다.
		그 리턴값을 vo 에 저장한다.-->
	
	
	<% String postname = request.getParameter("name"); %>
	<!-- 회원 목록 리스트에서 아이디를 클릭시 그 아이디가 name에 담겨서 넘어오고 그 name의 값을 String 변수 postname에 담는다-->
	
	<% List<PostVO> arr = pdao.getUserPostList(postname); %>
	<!-- postname을 PostDAO의 getUserPostList 메소드에 매개변수로 넣는다.
		getUserPostList는 매개변수로 받은 id가 작성한 글들의 고유번호(pNum)와 글 제목(title)과
		작성한 게시판 종류(category)를 반환한다. 그 반환값들을 arr 에 담는다. -->
	
	<% String commentname = request.getParameter("name"); %>
	<!-- 회원 목록 리스트에서 아이디를 클릭시 그 아이디가 name에 담겨서 넘어오고 그 name의 값을 String 변수 commentname에 담는다-->
	
	<% List<CommentVO> cmtarr = pdao.getUserCommentList(commentname); %>
	<!-- commentname을 PostDAO의 getUserCommentList 메소드의 매개변수로 넣는다.
		getUserCommentList는 매개변수로 받은 id가 작성한 댓글이 쓰여진 게시물의 번호(postNum)와
		작성한 댓글의 내용(contents)을 반환한다. 그 반환값들을 cmtarr에 담는다. -->
	
	
        <div class="infodiv">
            <table class="infotable">
                <tr>
                    <td>회원 번호</td> <td><%=vo.getmNum() %></td>
                </tr>

                <tr>
                    <td>회원 아이디</td> <td><%=vo.getId() %></td> 
                </tr>

                <tr>
                    <td>회원 이름</td> <td><%=vo.getName() %></td> 
                </tr>

                <tr>
                    <td>회원 이메일</td> <td><%=vo.getEmail() %></td>
                </tr>

                <tr>
                    <td>회원 전화번호</td> <td><%=vo.getpNum() %></td>
                </tr>

                <tr>
                    <td>회원 생년월일</td> <td><%=vo.getBirth() %></td>
                </tr>

                <tr>
                    <td>회원 가입일자</td> <td><%=vo.getSignUpDate() %></td>
                </tr>
                
            </table> <!-- infotable -->	
            <br>
            
            <div class="deletebutton">
                <form action="deleteproc.jsp" method="post">
                <input name="id" type="hidden" value="<%=vo.getId()%>" />
                <input style="width: 150px; height:50px; font-size:20px;" 
                type="submit" value="회원 삭제"/>
                </form>	
            </div> <!-- deletebutton -->
            
            <br><br>
            
            <div class="selectdiv">
            	<section class="selectsection">
	                <form action="blacklistproc.jsp" class="selectform">
	            	<input type="radio" name="black" value="1day" checked/>1일 활동정지<br>
	            	<input type="radio" name="black" value="3day" />3일 활동정지<br>
	            	<input type="radio" name="black" value="7day" />7일 활동정지<br>
	            	<input type="radio" name="black" value="15day" />15일 활동정지<br>
	            	<input type="radio" name="black" value="30day" />30일 활동정지<br>
	            	<input type="radio" name="black" value="allday" />영구 활동정지<br><br>
	            	<input style="width: 200px; height:50px; font-size:20px;" 
	                type="submit" name="blacklistuser" value="회원 활동제한 추가"/>
	                </form>
                </section> <!-- selectsection -->
            </div> <!-- selectdiv -->
            
            <div class="userwritelist">
            	<table>
            	<tbody>
            		<tr>
            			<td>작성한 글의 제목</td>
            			<td>작성한 글의 게시판</td>
            		</tr>
            		
            		<% for (int i = 0; i < arr.size(); i++){ %>
            		<tr>
            			<td><a href="read.jsp?pNum=<%=arr.get(i).getPNum()%>">
            			<%= arr.get(i).getTitle() %></a></td>
            			<td><%= arr.get(i).getCategory() %></td>
            		</tr>
            		<% } %>
            		
           		</tbody>
            	</table>
            </div> <!-- userwritelist div -->
            
            
            <div class="userwriteboard">
            	<table>
            	<tbody>
            		<tr>
            			<td>작성한 댓글의 내용</td>
            			<td>작성한 댓글이 쓰여진 게시물의 제목</td>
            		</tr>
            		
           		<% if (cmtarr.size() > 0 && arr.size() > 0) {%>
           			<% for (int j = 0; j < cmtarr.size(); j++) { %>
           			<% PostVO commentTitle = pdao.readPost(arr.get(j).getPNum()); %>
            		<tr>
            			<td><%= cmtarr.get(j).getContents() %></td>            			
            			<td><%= commentTitle.getTitle() %></td>
            		</tr>
            		<% } 
           			} else {
            		
           		} %>
           		</tbody>
            	</table>
            </div> <!-- userwirteboard div -->
            
        </div> <!-- infodiv -->
    

    <footer></footer>
</body>
</html>