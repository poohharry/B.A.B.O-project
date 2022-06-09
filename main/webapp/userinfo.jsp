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
    <title>유저 상세정보 페이지</title>
</head>
<body>
    <div class="headerdiv">
        <p>유저 상세정보 페이지</p>
        <div class="buttondiv">
            <button type="button" onclick="location.href='c_index.jsp'">메인 페이지</button>
        </div>
    </div>

    <div class="maindiv">
        <div class="listdiv">
            <ul class="listul">
                <li><p>유저 관리</p>
                    <ul>
                        <li><a href="#">유저 상세정보 페이지</a></li>
                        <li><a href="#">작성한 글 목록</a></li>
                        <li><a href="#">작성한 댓글 목록</a></li>
                        <li><a href="#">활동 제한 추가</a></li>
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
        </div>

        <div class="infodiv">
            <table class="infotable">
                <tr>
                    <td>유저 번호</td> <td>mNum</td>
                </tr>

                <tr>
                    <td>유저 아이디</td> <td>id</td> 
                </tr>

                <tr>
                    <td>유저 이름</td> <td>name</td> 
                </tr>

                <tr>
                    <td>유저 이메일</td> <td>email</td>
                </tr>

                <tr>
                    <td>유저 전화번호</td> <td>pNum</td>
                </tr>

                <tr>
                    <td>유저 생년월일</td> <td>birth</td>
                </tr>

                <tr>
                    <td>유저 가입일자</td> <td>signUpDate</td>
                </tr>
                
            </table>
            <div class="deletebutton">
                <form action="deleteproc.jsp">
                <input type="submit" name="deleteuser" value="회원 삭제"/>
                </form>
            </div>
        </div>
    </div>

    <footer></footer>
</body>
</html>