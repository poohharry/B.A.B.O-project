<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="vo" class="common.UserVO"></jsp:useBean>
<jsp:useBean id="dao" class="common.UserDAO"></jsp:useBean>
<%
	String id = (String)session.getAttribute("lgnId");
	vo = dao.getUser(id);
	String year, month, day, birth;
	birth = vo.getBirth();
	String[] birthArr = birth.split("-");	
	
	
	year = birthArr[0];
	month = birthArr[1];
	day = birthArr[2];
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/Chan_info.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>회원정보수정</title>
    <script>
    	$(document).ready(function(){
    		$(('select[name="month"]').find('option:value="<%=month%>")').attr("selected",true);
    				
    	});
  	</script>
</head>
<body>


  
  <div class="main">	
    <p class="sign" align="center">회원정보수정</p>
    <form action="Change_info_proc.jsp" method="post" class="form1">
        <div>
        <h3>신규 비밀번호</h3>
        <span class="signup-input">
            <input id="signup-pw" type="password" name="newPw"></input>
            <span class="pw-lock"></span>
        </span>

        <h3>비밀번호 재확인</h3>
        <span class="signup-input">
            <input id="signup-pww" type="password" name="newPwChk"></input>
            <span class="pww-lock"></span>
        </span>
        </div>    <div style="margin-top: 35px;">
            <!--이름,생년월일,성별,이메일-->
            <h3>이름</h3>
            <span class="signup-input">
                <input id="signup-name" type="text" name="name" value="<%=vo.getName() %>"></input>
            </span>

            <h3>생년월일</h3>
            <span style="display: flex;">
                <span class="signup-input-birth">
                    <input id="signup-birth-yy" type="text" placeholder="년(4자)"  maxlength='4' name="year" value="<%=year%>"></input>
                </span>
                <span class="signup-input-birth" style="margin-left: 10px;">
                    <select id="signup-birth-mm" class="selectbox" name="month" onchange="">
                        <option value="month" name="month" selected><%=month %></option>
                        <option value="1" name="month" >1</option>
                        <option value="2" name="month" >2</option>
                        <option value="3" name="month" >3</option>
                        <option value="4" name="month">4</option>
                        <option value="5" name="month">5</option>
                        <option value="6" name="month">6</option>
                        <option value="7" name="month">7</option>
                       	<option value="8" name="month">8</option>
                        <option value="9" name="month">9</option>
                        <option value="10" name="month">10</option>
                        <option value="11" name="month">11</option>
                        <option value="12" name="month">12</option>
                    </select>
                </span>
                <span class="signup-input-birth" style="margin-left: 10px;">
                    <input id="signup-birth-dd" type="text" placeholder="일" maxlength="2" name="day" value="<%=day%>"></input>
                </span>
            </span>

            <span class="choice">
                <h3>이메일</h3>
               
            </span>
            <span class="signup-input">
                <input id="signup-email" type="text" placeholder="선택입력" name="email" value="<%=vo.getEmail()%>"></input>
            </span>
            
        </div>
    
        <div style="margin-top: 35px;">
            <!--휴대전화-->
            <h3>연락처</h3>
            <span class="signup-input">
                <select id="signup-country" class="selectbox" name="country" onchange="">
                    <option value="ko">대한민국 +82</option>
                </select>
            </span>
            <br>
            <div style="display: flex;">
                <span class="signup-input">
                    <input id="signup-phone" type="text" placeholder="전화번호 입력" name="pNum" value="<%=vo.getpNum()%>"></input>
                </span>
            
            </div>
            <div class="change_btn">
                <input type="submit" class="submit" value="수정">
                <input type="reset" class="reset" value="리셋">
            </div>
      
      </form>      
            
    </div>
</body>
</html>