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
    <link rel="stylesheet" href="css/allUser.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>회원 상세정보 페이지</title>
</head>
<body>
	<% String id = (String)session.getAttribute("lgnId"); %>
	<%
		if(id == null) id = "";
	%>
	<% if (!(id.equals("admin")) || id.equals("")){ %>
		<script>alert("접근 권한이 없습니다.");
		location.href="c_index.jsp"; </script>
	<% } %>
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
      getUser는 매개변수로 받은 id의 모든 정보(mNum,id,email,pNum 등등)을 반환한다.
      그 리턴값을 vo 에 저장한다.-->

   <% List<PostVO> arr = pdao.getUserPostList(name); %>
   <!-- name을 PostDAO의 getUserPostList 메소드에 매개변수로 넣는다.
      getUserPostList는 매개변수로 받은 id가 작성한 글들의 고유번호(pNum)와 글 제목(title)과
      작성한 게시판 종류(category)를 반환한다. 그 반환값들을 arr 에 담는다. 
      즉 arr은 현재 id의 작성한 글의 고유번호, 글 제목, 작성한 게시판 종류가 담긴 변수이다.-->
   
   <% List<CommentVO> cmtarr = pdao.getUserCommentList(name); %>
   <!-- name을 PostDAO의 getUserCommentList 메소드의 매개변수로 넣는다.
      getUserCommentList는 매개변수로 받은 id가 작성한 댓글이 쓰여진 게시물의 번호(postNum)와
      작성한 댓글의 내용(contents)을 반환한다. 그 반환값들을 cmtarr에 담는다. 
      즉 cmtarr은 현재 id의 게시물번호와 댓글내용이 담긴 변수이다.-->
   
   
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
              <tr>
              	  <td>회원 닉네임</td> <td><%=vo.getNickname() %></td>
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
               <form action="blacklistproc.jsp?id=<%=vo.getId()%>" method="post" class="selectform">
                 <label><input class="blackinput" type="radio" name="black" value="1" checked/>
                 1일 활동정지</label><br> 
                 
                 <label><input class="blackinput" type="radio" name="black" value="3" />
                 3일 활동정지</label><br>
                 <label><input class="blackinput" type="radio" name="black" value="7" />
                 7일 활동정지</label><br>
                 
                 <label><input class="blackinput" type="radio" name="black" value="15" />
                 15일 활동정지</label><br>
                 
                 <label><input class="blackinput" type="radio" name="black" value="30" />
                 30일 활동정지</label><br>
                 
                 <label><input class="blackinput" type="radio" name="black" value="9999" />
                 영구 활동정지</label><br><br>
                 
                 <label><textarea class="reasoninput" name="reason"
                 placeholder="사유를 입력하세요"></textarea></label><br><br>
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
               <% if (cmtarr.size() > 0) {%>
               <!-- cmtarr은 현재 id의 게시물번호와 댓글내용이 담긴 변수 -->
               <!-- cmtarr.size()는 현재 id의 댓글 배열(작성한 게시물번호+댓글내용)의 길이 -->
               <!-- cmtarr.size()가 0이라는것은 작성한 댓글이 하나도 없다는것 -->
               <!-- arr은 현재 id의 게시글 배열(작성한 글의 고유번호, 글 제목, 작성한 게시판 종류)이 담긴 변수 -->
               <!-- arr.size()가 0이라는것은 작성한 글이 하나도 없다는것 -->
                  <% for (int j = 0; j < cmtarr.size(); j++) { %>
                  <% PostVO commentTitle = pdao.readPost(cmtarr.get(j).getPostNum()); %>
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
                   <a href="read.jsp?pNum=<%=cmtarr.get(j).getPostNum()%>">
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