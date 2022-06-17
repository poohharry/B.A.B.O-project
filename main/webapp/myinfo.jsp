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
    <title>나의 상세정보 페이지</title>
</head>
<body>
    <div class="headerdiv">
        <p>나의 상세정보 페이지</p>
        <div class="buttondiv">
            <button type="button" onclick="location.href='c_index.jsp'">메인 페이지</button>
        </div> <!-- buttondiv -->
    </div> <!-- headerdiv -->

	<% String id = (String)session.getAttribute("id"); %>
	<% UserVO uid = dao.getUser(id); %>
	<% List<PostVO> arr = pdao.getUserPostList(id); %>
   	<% List<CommentVO> cmtarr = pdao.getUserCommentList(id); %>
   
      <div class="infodiv">
          <table class="infotable">
              <tr>
                  <td>회원 번호</td> <td><%=uid.getmNum() %></td>
              </tr>
              <tr>
                  <td>회원 아이디</td> <td><%=uid.getId() %></td> 
              </tr>

              <tr>
                  <td>회원 이름</td> <td><%=uid.getName() %></td> 
              </tr>

              <tr>
                  <td>회원 이메일</td> <td><%=uid.getEmail() %></td>
              </tr>

              <tr>
                  <td>회원 전화번호</td> <td><%=uid.getpNum() %></td>
              </tr>

              <tr>
                  <td>회원 생년월일</td> <td><%=uid.getBirth() %></td>
              </tr>

              <tr>
                  <td>회원 가입일자</td> <td><%=uid.getSignUpDate() %></td>
              </tr>
              <tr>
              	  <td>회원 닉네임</td> <td><%=uid.getNickname() %>
              </tr>
              
          </table> <!-- infotable -->   
          <br>
          
          <div class="deletebutton">
              <form action="deleteproc.jsp" method="post">
              <input name="id" type="hidden" value="<%=vo.getId()%>" />
              <input style="width: 150px; height:50px; font-size:20px;" 
              type="submit" value="회원 탈퇴"/>
              </form>   
          </div> <!-- deletebutton -->
          
          <br><br>
          
          <div class="userwritelist">
             <table>
              <tbody>
                 <tr>
                    <td>작성한 글의 제목</td>
                    <td>작성한 글의 게시판</td>
                 </tr>
                 <% for (int i = 0; i < arr.size(); i++){ %>
                 <tr>
                    <td class="write-title"><a href="read.jsp?pNum=<%=arr.get(i).getPNum()%>">
                    <%= arr.get(i).getTitle() %></a></td>
                    <td><%= arr.get(i).getCategory() %></td>
                 </tr>
                 <% } %>
                </tbody>
             </table>
          </div> <!-- userwritelist -->
          
          <div class="userwriteboard">
             <table class="userwritetable">
             <tbody>
                <tr>
                   <td>작성한 댓글의 내용</td>
                   <td>작성한 댓글이 쓰여진 게시물의 제목</td>
                </tr>
               <% if (cmtarr.size() > 0 && arr.size() > 0) {%>
               <!-- cmtarr은 현재 id의 게시물번호와 댓글내용이 담긴 변수 -->
               <!-- cmtarr.size()는 현재 id의 댓글 배열(작성한 게시물번호+댓글내용)의 길이 -->
               <!-- cmtarr.size()가 0이라는것은 작성한 댓글이 하나도 없다는것 -->
               <!-- arr은 현재 id의 게시글 배열(작성한 글의 고유번호, 글 제목, 작성한 게시판 종류)이 담긴 변수 -->
               <!-- arr.size()가 0이라는것은 작성한 글이 하나도 없다는것 -->
                  <% for (int j = 0; j < cmtarr.size(); j++) { %>
                  <% PostVO commentTitle = pdao.readPost(arr.get(j).getPNum()); %>
                  <!-- arr.get(j) = arr(에 담긴 list)의 j번째 인덱스
                  (= 현재 아이디로 쓴 j번째 게시물) 
                  (= 이 인덱스에는 게시글 고유번호,글제목,게시판 종류 값이 들어있다)를 가져오는것. -->
                  <!-- arr.get(j).getPNum = arr의 j번째 인덱스의 게시물 고유번호 -->
                  <!-- pdao.readPost(N) 
                  = N이라는 게시글 고유번호를 매개변수로 받아서 그 게시물의 모든 정보를 vo에 담아서 return -->
                  <!-- 그 값들을 다시 commentTitle 이라는 변수에 저장 -->
                <tr>
                   <td><%= cmtarr.get(j).getContents() %></td> 
                   <!-- cmtarr.get(j) = cmtarr 의 j번째 인덱스
                   = [j번째로 작성한 댓글의 내용]과 [그 댓글이 달린 게시물의 번호] 이다. -->
                   <!-- cmtarr.get(j).getContents()
                   = cmtarr 의 j번째 인덱스의 getContents 값 (=댓글 내용) -->
                   <!-- cmtarr은 CommentVO 타입 이므로 CommentVO의 모든 변수와 메소드를 가지고있다
                   그래서 getContents()도 사용 가능 -->                    
                   
                   <td class="secondlink">
                   <a href="read.jsp?pNum=<%=arr.get(j).getPNum()%>">
                   <%= commentTitle.getTitle() %></a></td>
                   <!-- commentTitle.getTitle
                   = commentTitle은 PostVO 타입이므로 모든 getter, setter를 가지고있다.
                   그래서 getTitle 메소드를 쓸수있고 getTitle 메소드는 title 값을 반환하므로
                   결국 commentTitle(arr에 담긴 list의 j번째 게시물의 모든 정보)에 담긴 
                   id의 title 값을 반환한다. 그래서 결국 표시되는 값은 현재 id가 작성한 게시글의 제목이다. -->
                </tr>
                <% } 
                  } else {
               } %>
               </tbody>
             </table>
          </div> <!-- userwirteboard -->
      </div> <!-- infodiv -->
        
    <footer></footer>
</body>
</html>