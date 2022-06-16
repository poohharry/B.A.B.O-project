<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "common.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

		function deliver (B) {
			if(confirm("정말 삭제하시겠습니까?") == true) {
				clicker(B);
			} else {
				return false;
			}
		}
		
		function clicker(A) {
			let url = "deleteproc.jsp?id="+A;
			location.href = url;
		}
		</script>
	<link rel="stylesheet" href="css/MemberList.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<% List<UserVO> arr = dao.getUsers(); %>
	<% boolean del = dao.deleteUser("selector"); %>
	
	<div class="headerdiv">
		<p class="MainP">회원 목록</p>
	</div>
	
	<div class="boxdiv">
	
	    <div class="listdiv">
		    <ul class="listul">
		        <li><p>회원 목록</p>
		            <ul>
		                <li><a href="MemberList.jsp">회원상세정보</a></li>
		            </ul>
		        </li>
		        <br><br>
		        <li><p>게시판 관리</p>
		            <ul>
		                <li><a href="#"></a></li>
		                <li><a href="#"></a></li>
		                <li><a href="#"></a></li>
		                <li><a href="#"></a></li>
		            </ul>
		        </li>
		        <br><br>
		        <li><p>~~@@</p>
		            <ul>
		                <li><a href="#"></a></li>
		                <li><a href="#"></a></li>
		                <li><a href="#"></a></li>
		                <li><a href="#"></a></li>
		            </ul>
		        </li>
		    </ul>
	    </div> <!-- listdiv -->
		
		<div class="MainDiv">
			<section class="MainSection">
				<table class="MemberTable">
					<thead class="MemberThead">
						<tr>
							<td>순서</td>
							<td>회원 아이디</td>
							<td>회원 이름</td>
							<td>회원 이메일</td>
							<td>회원 전화번호</td>
							<td>회원 가입날짜</td>
						</tr>
						<% for(int i = 0; i < arr.size(); i++) {%>
						<tr>
							<td> <%= arr.get(i).getmNum() %></td>
							<td ><a href="userinfo.jsp?name=<%=arr.get(i).getId() %>" 
							target="_blank"> <%= arr.get(i).getId() %></a></td>
							<td> <%= arr.get(i).getName() %></td>
							<td> <%= arr.get(i).getEmail() %></td>
							<td> <%= arr.get(i).getpNum() %></td>
							<td> <%= arr.get(i).getSignUpDate() %></td>
							<td>
							<button class="deleteBtn"
							onClick="deliver('<%=arr.get(i).getId() %>')">회원 삭제하기</button>
							</td>
						</tr> <% } %>
					</thead> <!-- MemberThead -->
				</table> <!-- MemberTable -->
			</section> <!-- MainSection -->
		</div> <!-- MainDiv -->
		
	</div> <!-- boxdiv -->
		<br>
</body>
</html>