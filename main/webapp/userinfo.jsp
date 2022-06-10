<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        </div> <!-- buttondiv -->
    </div> <!-- headerdiv -->


        <div class="infodiv">
            <table class="infotable">
                <tr>
                    <td>회원 번호</td> <td>mNum</td>
                </tr>

                <tr>
                    <td>회원 아이디</td> <td>id</td> 
                </tr>

                <tr>
                    <td>회원 이름</td> <td>name</td> 
                </tr>

                <tr>
                    <td>회원 이메일</td> <td>email</td>
                </tr>

                <tr>
                    <td>회원 전화번호</td> <td>pNum</td>
                </tr>

                <tr>
                    <td>회원 생년월일</td> <td>birth</td>
                </tr>

                <tr>
                    <td>회원 가입일자</td> <td>signUpDate</td>
                </tr>
                
            </table> <!-- infotable -->	
            
            <div class="deletebutton">
                <form action="deleteproc.jsp">
               <input style="width: 150px; height:50px; font-size:20px;" 
                type="submit" name="deleteuser" value="회원 삭제"/>
                </form>
            </div> <!-- deletebutton -->
            
            <div class="userwritelist">
            	<table>
            		<tr>
            			<td>작성한 글 목록</td>
            			<td>작성한 게시판 분류</td>
            		</tr>
            	</table>
            </div>
        </div> <!-- infodiv -->
    

    <footer></footer>
</body>
</html>