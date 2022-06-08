<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <link rel="stylesheet" href="css/write.css">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <title>게시글 작성</title>
</head>
<body>


  
  <div class="main">	
    <p class="sign" align="center">게시글 작성</p>
    <form class="form1">
        <div>
       
        </div>    <div style="margin-top: 35px;">
            <span class="sign-input">
               
                        <select id="board-type-select" class="selectbox" name="board-type" onchange="">
                            <option value="board-type">구분</option>
                            <option value="type1">자유게시판</option>
                            <option value="type2">Q&A게시판</option>
                        </select>
                        
                            <input id="signup-name" type="text" placeholder="제목" name="board-title"></input>
                       
                    </span>

            </span>

            <span class="textarea-Contents">
                <textarea name="" id="" cols="113" rows="20" placeholder="내용"></textarea>
                <span class="signup-input file-select" >
                    <button>파일 선택</button>
                </span>
            </span>
         
            
        </div>
    
     
          
            
            <div class="change_btn">
                <input type="submit" class="submit" value="작성">
                <input type="reset" class="reset" value="취소" onclick="location.href='./c_index.jsp'">
            </div>
      
      </form>      
            
    </div>
</body>
</html> 