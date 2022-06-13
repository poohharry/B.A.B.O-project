<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.UserDAO" />
<%@ page import = "common.UserVO" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id = request.getParameter("login_id");
		String email = request.getParameter("login_email");
		
		System.out.println(id);
		System.out.println(email);
		
		UserVO getu = dao.getUser(id); %>
		<!-- getu 라는 변수가 담고있는 메소드는 UserVO 의 것이다.
		(getu 에 . 을 찍으면 나오는 메소드들은 UserVO에 있는 메소드들이라는 이야기)
			변수 앞 뒤가 다른 이유는 단순하게 dao.getUser()의 반환형이
			UserVO 이기 때문이다. 
			즉 dao.getUser()는 UserVO 타입의 값을 return하고
			그렇기 때문에 그 값을 변수에 담기 위해서는 변수의 타입도 UserVO여야 하므로
			getu 앞에 UserVO 를 써야하는것이다.
		 -->
		
		ASD a = ZXC();
		
		<% int a = 1000;
			String b = new String("hello");
		%>
		
		<%= getu.getmNum() %><br>
		<%= getu.getId() %><br>
		<%= getu.getName() %><br>
		<%= getu.getEmail() %><br>
		<%= getu.getpNum() %><br>
		<%= getu.getBirth() %><br>
		<%= getu.getSignUpDate() %><br>
		<%= getu.getLgnFailCnt() %><br>
		<%= getu.getChangePwDate() %><br>
		<%= getu.getLastLoginDate() %><br>
		<%= getu.getIsBiz() %><br>
		<%= getu.getNickname() %>
		
		<% if (//DB에 해당 ID와 Email이 존재하지 않는다면) { %>
			<script> 
				alert("해당 ID/Email 이 존재하지 않습니다."); 
				location.href="findpw.jsp";
			</script>
		<% } else { %>
			<script> 
				alert("비밀번호 재설정 페이지로 이동합니다.");
			 	location.href="resetpw.jsp"; 
		 	</script>
		<% } %>
			
		
		<!-- vo.setmNum(rs.getInt("mNum"));
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setpNum(rs.getString("pNum"));
				vo.setBirth(rs.getString("birth"));
				vo.setSignUpDate(rs.getString("signUpDate"));
				vo.setLgnFailCnt(rs.getInt("lgnFailCnt"));
				vo.setChangePwDate(rs.getString("changePwDate"));
				vo.setLastLoginDate(rs.getString("lastLoginDate"));
				vo.setIsBiz(rs.getString("isBiz"));
				vo.setNickname(rs.getString("nickname")); -->
		
		
	<!-- 
		우선 한글
		findpw.jsp 에서 id 와 email 정보를 받아온다 (id 의 name 은 login_id 이고
		email 의 name 은 login_email 이다.)
		DB에서 해당 id 와 email을 조회한다.
		조회해서 들어맞는 계정이 있으면 비밀번호 업데이트 메소드를 이용하여
		새로운 비밀번호를 업데이트 할수 있게 한다.
		
		그러면 필요한 메소드 = 
		id 와 email 을 받아서 DB에 조회할수 있는 메소드
		그리고 비밀번호만 새롭게 업데이트 할수 있는 메소드  
	 -->
</body>
</html>