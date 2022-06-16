<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="common.UserDAO" />
<jsp:useBean id="uvo" class="common.UserVO" />
<%
  request.setCharacterEncoding("UTF-8");
  String id = (String)session.getAttribute("lgnId");
  uvo = udao.getUser(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/introduce.css">
    <title>B.A.B.O</title>
          <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }
        </script>
</head>
<body>
    <header>
        <section class="hbody">
          <article class="nav">

          <div class="title"><a href="./c_index.jsp">B.A.B.O</a></div>


          <ul id="menu">
            <li><a href="./Notice_Board.jsp" class="bar-anchor"><span>공지사항</span><div class="transition-bar"></div></a></li>
            <li><a href="./introduce.jsp">소개 </a></li>
            <li><a href="./Free_board.jsp">자유게시판</a></li>
            <li><a href="./Q&A_Board.jsp">질문게시판</a></li>
        <% if(id != null) {%>
      		<li><a href="write.jsp">글쓰기</a></li>
	    <% 		if(id.equals("admin")) {%>
	    	<li><a href="MemberList.jsp">회원 관리 페이지</a></li>
	    <% 		} 
	    	} %>
	    
          </ul>
          
              <ul id="menu-2">
              	
                <li>
                <%if(id != null){
                	 if(uvo.getNickname().length() < 6) {
                out.print(uvo.getNickname() +"님 환영합니다.");
                	 }else{
                		 out.print(uvo.getNickname().substring(0, 5) + "...님");
                	 }
                	 
                %></li>
                <li><a href="./info_confirm.jsp">마이 페이지</a></li>
                <li><a href="./logout.jsp">로그아웃</a></li>
                 
                <%
            }else{ %>
 				<li><a href="./login.jsp">로그인</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
            	<li><a href="./register.jsp">회원가입 </a></li>
            <% }%>
          </ul>
     
        
          </article>
        </section>
      </header>
      <div class="container ">
      <div class="wrap">
		<div class="box" id="a1"></div>
        <div class="box" id="a2"></div>
        <div class="box" id="a3"></div>
        <div class="box" id="a4"></div>
        <div class="box" id="a5"></div>
        <footer>
            <div class="footer box">
                <p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
              </div>
          </footer>
      </div>     </div><!-- container -->
     
</body>
</html>