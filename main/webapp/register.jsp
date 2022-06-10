<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/register_style.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>회원가입</title>
    <script src="js/registerChk.js">
    </script>
</head>
<body>

  
  <div class="main">	
    <p class="sign" align="center">회원가입</p>
    
    <!-- 폼 작성할 때 action, method 및 각 input필드마다 name을 꼭!! 적어주자 
    	그래야 백엔드가 그걸 토대로 DAO를 작성하던, proc페이지를 작성하던 한다. -->
    <form class="form1" action="register_proc.jsp" method="post" name="regiFrm">
        <div >
            <!--아이디,비밀번호,비밀번호재확인-->
            
            <h3>아이디</h3>
            <div style="display:flex;">
            <span class="signup-input1">
                <input id="signup-id" type="text" name="id" readonly></input>
            </span>
            <button type="button" onclick="overlap()" style="margin-right:90px; width:75px;">중복체크</button>
          </div>
           <!-- 이부분은 좀 건들다가 잘안되가지고 화나서 초기값으로 해놓고 내일 하겠습니다..  -->
        
            <h3>비밀번호</h3>
            <span class="signup-input">
                <input id="signup-pw" type="password" name="pw"></input>
                <span class="pw-lock"></span>
            </span>

            <h3>비밀번호 재확인</h3>
            <span class="signup-input">
                <input id="signup-pww" type="password" name="ChkPw"></input>
                <span class="pww-lock"></span>
            </span>

        </div>
        
        <div style="margin-top: 35px;">
            <!--닉네임,이름,생년월일,성별,이메일-->
            <h3>닉네임</h3>
            <span class="signup-input">
                <input id="signup-name" type="text" name="nick"></input>
            </span>
            <h3>이름</h3>
            <span class="signup-input">
                <input id="signup-name" type="text" name="name"></input>
            </span>

            <h3>생년월일</h3>
            <span style="display: flex;">
                <span class="signup-input-birth">
                    <input id="signup-birth-yy" name="birth_yy" type="number" placeholder="년(4자)" maxlength="4" oninput="maxLengthCheck(this)" min="1931" max="2022"></input>
                </span>
                <span class="signup-input-birth" style="margin-left: 10px;">
                    <select id="signup-birth-mm" class="selectbox" name="month" >
                        <option value="month">월</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </span>
                <span class="signup-input-birth" style="margin-left: 10px;">
                    <input id="signup-birth-dd" type="number" placeholder="일" maxlength="2" oninput="maxLengthCheck(this)" min="1" max="31" ></input>
                </span>
            </span>


            <span class="choice">
                <h3>본인 확인 이메일 (선택)</h3>
               
            </span>
            <span class="signup-input">
                <input id="signup-email" type="text" placeholder="선택입력" name="email"></input>
            </span>

            
        </div>
    
        <div style="margin-top: 35px;">
            <!--휴대전화-->
            <h3>연락처</h3>
 
            <div style="display: flex;">
                <span class="signup-input">
                    <input id="signup-phone" type="text" placeholder="전화번호 입력" name="pNum" maxlength="11"></input>
                </span>
            
            </div>
            <div style="margin-top: 35px;">
                
                <h3><label>사업자 여부 <input type="checkbox" name="isBiz"></label></h3>
                
                    
                
            
        <div class="signup-btn-wrap">
            <button id="signup-btn">가입하기</button>
        </div>

      </form>      
            
    </div>

    <script type="text/javascript">
        function overlap() {
          window.open(
            "overlap.jsp",
            "중복 확인",
            "width=400, height=300, top=50, left=50"
          );
        }
        
	
    function maxLengthCheck(object){
      if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
      }    
    }
    


        
    </script>
</body>
</html>
