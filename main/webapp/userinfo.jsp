<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<jsp:useBean id="vo" class="common.UserVO" />
<jsp:useBean id="pdao" class="common.PostDAO" />
<%@ page import = "common.UserVO" %>
<%@ page import = "common.PostDAO" %>
<%@ page import = "common.PostVO" %>
<%@ page import = "java.util.*" %>

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
	<% vo = dao.getUser(name); %>
	<% String postname = request.getParameter("name"); %>
	<% List<PostVO> arr = pdao.getUserPostList(postname); %>
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
            </div>
            
            
            <div class="userwriteboard">
            	<table>
            	<tbody>
            		<tr>
            			<td>작성한 댓글의 제목</td>
            			<td>작성한 댓글의 게시판</td>
            		</tr>
            		
            		<tr>
            			<td>DB 작성한 댓글 목록</td>
            			<td>DB 작성한 댓글의 게시판 목록</td>
            		</tr>
           		</tbody>
            	</table>
            </div>
        </div> <!-- infodiv -->
    

    <footer></footer>
</body>
</html>