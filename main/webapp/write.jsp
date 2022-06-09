<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/write.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <script type="text/javascript" src="./SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    
    <script type="text/javascript">
		let oEditors = [];
	
	    function smartEditor() {
		nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "./SE2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
		})
	    }
	
	    $(document).ready(function() {
	      smartEditor()
	    })
	</script>
    
    <title>게시글 작성</title>
</head>
<body>
	<div class="main">	
	    <p class="sign" align="center">게시글 작성</p>
	    <form class="form1">
        <div style="margin-top: 35px;">
            <span class="sign-input">
            	<select id="board-type-select" class="selectbox" name="board-type" onchange="">
	                <option value="board-type">구분</option>
	                <option value="type1">자유게시판</option>
	                <option value="type2">Q&A게시판</option>
                </select>
                <input id="signup-name" type="text" placeholder="제목" name="board-title" />
            </span>
            <span class="textarea-Contents">
            	<textarea name="ir1" id="ir1" cols="113" rows="20" placeholder="내용"></textarea>
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