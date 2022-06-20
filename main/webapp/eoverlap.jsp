<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String flag = request.getParameter("flag");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 체크</title>
	
	<link rel="stylesheet" href="css/overlap.css">
</head>
<body>
	<form action="overlap_proc.jsp?item=email" name="emailFrm" method="post">
        <div>
		    <h1>이메일 중복확인 </h1>
		    <input type="text" name="inputEmail" id="inputEmail"
		    <%if(email != null) {%>
		    	value="<%=email %>" <% }%>>
		    <button type="button" onclick="chkEmail()">중복확인</button>
		    <%if(flag != null && email != null) {
		    	if(flag.equals("true")) { %>
		    		<p><%=email %>는 이미 존재하는 이메일입니다.</p>
		    	<% } else { %>
		    		<p><%=email %>는 사용가능한 이메일입니다.</p>
		    	<%}
		    }%>
	    </div>
	    <div class="submit-btn">
	    <%
	    	if(flag != null) {
		    	if(flag.equals("false")){%>
		    		<button type="button" onclick="sendID(inputEmail.value)">확인</button>
		    	<%}	    		
	    	}
	    %>
	    	
        </div>
	</form>


	<script type="text/javascript">
	
		const frm = document.emailFrm;
		
		function sendID(email) {
			opener.document.regiFrm.email.value = email;
			self.close();
		}
		
		function chkEmail() {
			if(frm.inputEmail.value == "") {
				alert("이메일을 입력하십시오");
				frm.inputEmail.focus();
				return;
			}
			
			let str=frm.inputEmail.value;						// poohharry@naver.com
		    let atPos = str.indexOf('@');					// 9
		    let atLastPos = str.lastIndexOf('@');			// 9
		    let dotPos = str.indexOf('.'); 					// 15
		    let spacePos = str.indexOf(' ');				// -1
		    let commaPos = str.indexOf(',');				// -1
		    let eMailSize = str.length;						// 18
		    
		    if (atPos > 1 									// @앞에 글자가 2개 이상
		    	&& atPos == atLastPos 						// @가 하나만 있는 경우
		    	&& dotPos > 3 								// . 옆에 글자가 4개 이상
		    	&& spacePos == -1 							// 공백 없음
		    	&& commaPos == -1 							// 콤마(,) 없음
			    && atPos + 1 < dotPos 						// @와 . 사이에 글자가 1개 이상
			    && dotPos + 1 < eMailSize)					// .뒤에 글자가 1개 이상
			    {
				
			}					
		    else {
		          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
			      frm.inputEmail.focus();
				  return;
		    }
			
			frm.submit();
		}
	</script>

</body>
</html>