<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/blacklist.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>회원 활동제한 추가 페이지</title>
</head>
<body>
    <div class="headerdiv">
        <p>회원 활동제한 추가 페이지</p>
        <div class="buttondiv">
            <button type="button" onclick="location.href='c_index.jsp'">메인 페이지</button>
            <button type="button" onclick="location.href='MemberList.jsp'">회원 목록페이지</button>
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
            
            <br>
            
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
                </section>
            </div>
            
            
    <footer></footer>
</body>
</html>