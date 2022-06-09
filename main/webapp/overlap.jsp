<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
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
    	
    </script>
</head>
<body>
    <form action="overlap_proc.jsp" name="overlap-id" method="post">
        <div>
    <h1>아이디 중복확인 </h1>
    <input type="text">
    <%if(id != null) {
    	
    %>
    	
    <% }%>
    <!-- <p>텍스트 밑에 상황별로 안내문이 나오도록 해주면 괜찮을 것 같아요.</p> -->
    <button >중복확인</button>
    </div>
    <div class="submit-btn">
        <input type="submit" value="확인"></div>
        
        
</form>


</body>
</html>