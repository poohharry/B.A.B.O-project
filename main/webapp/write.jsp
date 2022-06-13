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
			fCreator: "createSEditor2",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : false,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, 
				}
			});
	    }
	
	    $(document).ready(function() {
	      smartEditor()
	      	// 전송버튼 클릭이벤트
			$("#savebutton").click(function(){
				//if(confirm("저장하시겠습니까?")) {
					// id가 smarteditor인 textarea에 에디터에서 대입
					oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		
					// 이부분에 에디터 validation 검증
					if(validation()) {
						$("#frm").submit();
					}
				//}
			})
	    })
		    // 필수값 Check
		function validation(){
			var contents = $.trim(oEditors[0].getContents());
			if(contents === '<p>&bnsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
				alert("내용을 입력하세요.");
				oEditors.getById['ir1'].exec('FOCUS');
				return false;
			}
		
			return true;
		}
	</script>
    
    <title>게시글 작성</title>
</head>
<body>
	<div class="main">	
	    <p class="sign" align="center">게시글 작성</p>
	    <form class="form1" action="write_proc.jsp" method="get" name="writeFrm" id="frm">
        <div style="margin-top: 35px;">
            <span class="sign-input">
            	<select id="board-type-select" class="selectbox" name="board-type" onchange="">
	                <option value="board-type">구분</option>
	                <option value="freeBoard">자유게시판</option>
	                <option value="Q&A">Q&A게시판</option>
                </select>
                <input id="signup-name" type="text" placeholder="제목" name="board-title" />
            </span>
            <span class="textarea-Contents">
            	<textarea name="ir1" id="ir1" cols="113" rows="20" placeholder="내용"></textarea>
            	<span class="signup-input file-select" >
            		<button type="button">파일 선택</button>
            	</span>
            </span>
    	</div>
            <div class="change_btn">
                <input type="button" id="savebutton" class="submit" value="작성">
                <input type="reset" class="reset" value="취소" onclick="location.href='./c_index.jsp'">
            </div>
            <input type="hidden" name="contents">
      	</form>
    </div>
</body>
</html> 