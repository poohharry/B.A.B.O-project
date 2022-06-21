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
    <link rel="stylesheet" href="./css/allboard.css">
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
                     
                    // 화면 이동 0.5초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 500, complete: function () {
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
       	    
            	<div class="title">
            		<a href="./c_index.jsp">B.A.B.O</a>
            	</div>

	            <ul id="menu">
	            <li><a href="./Notice_Board.jsp" class="bar-anchor">공지사항</a></li>
	            <li><a href="./introduce.jsp">소개 </a></li>
	            <li><a href="./Free_board.jsp">자유게시판</a></li>
	            <li><a href="./Q&A_Board.jsp">질문게시판</a></li>
		        <% if(id != null) {%>
		      		<li><a href="write.jsp">글쓰기</a></li>
			    <% 	if(id.equals("admin")) {%>
			    	<li><a href="MemberList.jsp">회원 관리 페이지</a></li>
			    <% } } %>
	          	</ul>
	          
	              <ul id="menu-2">
	              	<li>
	                <%
	                if(id != null){
	                	 if(uvo.getNickname().length() < 6) {
	                		out.print(uvo.getNickname() +"님 환영합니다.");
	                	 }else{
	                		out.print(uvo.getNickname().substring(0, 5) + "...님");
	                	 } %>
	                </li>
	                <li><a href="./info_confirm.jsp">마이 페이지</a></li>
	                <li><a href="./logout.jsp">로그아웃</a></li>
	                <% } else { %>
	 				<li><a href="./login.jsp">로그인</a></li>
	            	<li><a href="./register.jsp">회원가입 </a></li>
	            	<% }%>
	         	  </ul>
         	  
          	</article> <!-- nav -->
        </section> <!-- hbody -->
    </header>
     <div class="container ">
      <div class="wrap">
           <div class="box" id="a1">
            <div class="map1-title">감천문화마을</div>
             <div class="map1-title-real">감천문화마을</div>
        	<div class="map1-first">위치:부산광역시 사하구 감내1로 200</div>
        	<div class="map1-comment">감천문화마을은 1950년대 6.25 피난민의 힘겨운<br>
        	삶의 터전으로 시작되어 현재에 이르기까지<br>
        	민족현대사의 한 단면과 흔적인 부산의 역사를<br>
        	그대로 간직하고 있는 곳입니다.<br>
        	산자락을 따라 질서정연하게 늘어선 계단식 집단<br>
        	주거형태와 모든 길이 통하는 미로미로 골목길의<br>
        	경관은 감천만의 독특함을 보여줍니다.
        	</div>
        </div>
        <div class="box" id="a2">
            <div class="map2-title">해운대해수욕장</div>
            <div class="map2-title-real">해운대해수욕장</div>
            <div class="map2-first">위치:부산광역시 해운대구</div>
            <div class="map2-comment">부산광역시 해운대구에 있는 해수욕장.<br>
            	 광안대교와 더불어 외지인들에게 가장<br>
            	 유명한 부산의 양대 랜드마크이다.<br>
				 도심지에 위치한 해수욕장이라는 점이 특징이다.<br>
				 매년 국내 최고의 여름 휴가철 여행지 1순위로 꼽히며,<br>
				 이 때문에 7~8월 성수기엔 전국에서 몰려드는<br>
				 관광객들로 인해 가장 붐비는 해수욕장으로 유명하다.
				 </div>
        </div>
        <div class="box" id="a3">
                  <div class="map3-title">태종대</div>
            <div class="map3-first">위치:부산광역시 영도구 동삼동 산 29-1</div>
            <div class="map3-comment">부산광역시 영도구 동삼동에 있는<br>
             						명승지(국가 지정 명승지 제17호)이다.<br>
									이름의 유래는 신라 태종 무열왕이 들러서<br>
									활쏘기를 하고 연회를 개최했던 것이다.<br>
									울창한 숲과 기암괴석이 남해 바다와<br>
									어우러진 비경으로 유명한 곳<br>
									태종대는 9천만 년 전엔 호수이었지만<br>
									7천3백만 년 전의 화산 활동으로 생긴<br>
									현무암 용암으로 덮어지고 신생대에 와서<br>
									풍화되어서 현재까지 온것이다
				 </div>
        </div>
        <div class="box" id="a4">
                       <div class="map4-title">더베이 101</div>
            <div class="map4-first">위치:부산광역시 해운대구 동백로 52</div>
            <div class="map4-comment">부산광역시 해운대구 우동 동백섬 서북쪽<br>
            				 춘천 하구 쪽에 있는 종합 식음료 시설 + 해양레저시설.<br>
							 홍보도 엄청나게 했고 입소문을 많이 타서<br>
							 사람들이 많이 오다 보니 주말에는 주차장이 꽉 차서<br>
							 주차 대기열까지 생기며 인근에 교통체증을 발생시키기도 한다.<br>							 
							 다만 가격이 좀 많이 비싸다. 생맥주 한 잔에 8,000원 정도.<br>
							 여기서 해운대 마린시티의 빼곡하게 들어서 있는 높은 마천루들을<br>
							 배경으로 한 사진이 유명하여 찾기도 한다.
            	 
				 </div>
        </div>
        <div class="box" id="a5">
                <div class="map5-title">씨라이프 부산 아쿠아리움</div>
            <div class="map5-first">위치:부산광역시 해운대구 해운대해변로 266</div>
            <div class="map5-comment">부산광역시 해운대구 중동에 있는 아쿠아리움.<br>
            						  2001년 오픈. 40개의 크고 작은 테마별 수족관을 통해 250종,<br>
            						  10,000여 마리의 해양생물과 담수(민물) 생물들을 전시하고 있다.<br>
            						  특히 국내 최대 길이인 80m의 해저 터널이 유명하다.<br>
									  호주의 아쿠아리움 업체가 운영했고<br>
									  지금은 영국의 종합 엔터테인먼트 업체인<br>
									  "멀린 엔터테인먼트"가 운영 중이다.
            	 
				 </div>
        </div>
        <footer>
            <div class="footer box">
                <p>Copyright ⓒ 2022.06.22 B.A.B.O All rights reserved.</p>
              </div>
          </footer>
      </div>
     </div><!-- container -->
     
</body>
</html>