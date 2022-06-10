<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String flag = request.getParameter("flag");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=200px, initial-scale=1.0">
    <link rel="stylesheet" href="css/overlap.css">
    <title>아이디 중복체크</title>
    
    <script type="text/javascript">
    	function sendID(id) {
    		opener.document.regiFrm.id.value = id;
    		self.close();
    	}
    </script>
    
</head>
<body>
    <form action="overlap_proc.jsp" name="overlap-id" method="post">
        <div>
		    <h1>아이디 중복확인 </h1>
		    <input type="text" name="inputID" id="inputid"
		    <%if(id != null) {%>
		    	value="<%=id %>" <% }%>>
		    <button type="submit">중복확인</button>
		    <!-- <p>텍스트 밑에 상황별로 안내문이 나오도록 해주면 괜찮을 것 같아요.</p> -->
		    <%if(flag != null && id != null) {
		    	if(flag.equals("true")) { %>
		    		<p><%=id %>는 이미 존재하는 ID입니다.</p>
		    	<% } else { %>
		    		<p><%=id %>는 사용가능한 ID입니다.</p>
		    	<%}
		    }%>
	    </div>
	    <div class="submit-btn">
	    <%
	    	if(flag != null) {
		    	if(flag.equals("false")){%>
		    		<button type="button" onclick="sendID(inputid.value)">확인</button>
		    	<%}	    		
	    	}
	    %>
	    	
        </div>
	</form>
</body>
</html>



