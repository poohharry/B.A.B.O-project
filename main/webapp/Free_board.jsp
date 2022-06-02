<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판</title>
    <link rel="stylesheet" href="css/c_style.css">
    <link rel="shortcut icon" type="image/x-icon" href="부산광역시-removebg-preview.ico">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div class="main ">
        <div class="title">
            <div class="title_btn title_btn-outline">
                <button type="button" onclick="location.href='/login.html'" width=100px >로그인</button>&nbsp;
                <button type="button" onclick="location.href='/register.html'">회원가입</button>
            </div> <!--title_btn-->
            <a href="c_index.html"><img src="images/부산광역시-removebg-preview.png"></a>
                <h1 class="title_txt">Busan Cummunity</h1>
    </div><!-- title -->

     <div >
        <section>
            <div class="dropmenu">
              <ul id="dm_ul">
                <li><a href="#">커뮤니티</a>
                  <ul>
                   
                    <li><a href="/Free_board.html">자유 게시판</a></li>
                    <li><a href="/c_index.html">질문/답변 게시판</a></li>
                  
                    <!-- <li><a href="#">미정</a></li> -->
                  </ul>
                </li>
                <li><a href="#">장터</a>
                  <ul>
                    <li><a href="#">사고싶어요</a></li>
                    <li><a href="#">팔고싶어요</a></li>
                    <li><a href="#">흥정 원해요</a></li>
                    <li><a href="#">신고 게시판</a></li>
                  </ul>
                </li>
                <li><a href="#">맛집</a>
                  <ul>
                    <li><a href="#">여긴 어때요?</a></li>
                    <!-- <li><a href="#">미정</a></li>
                    <li><a href="#">미정</a></li>
                    <li><a href="#">미정</a></li> -->
                  </ul>
                </li>
                <li><a href="#">공지사항</a>
                  <ul>
                    <li><a href="#">QNA</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">건의 게시판</a></li>
                    <li><a href="#">찾아오시는 곳</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            </section>
     </div> <!--  gap -->

  


 
     <section>
        <div class="Board-notice ">
          <h1>자유 게시판</h1>
        </div>
        <div class="First-SecondBoard">
          
          
        </div>
     </section>
     
     <div class="footer bg-navy">
        <p>Copyright ⓒ 2022.05.25 B.A.B.O All rights reserved.</p>
      </div>
  
    
        </div> <!-- main -->
        
    <script type="text/javascript">
        $(".dropmenu ul li").hover(function(){
          $(this).find("ul").stop().fadeToggle(300);
        });
      </script> 
</body>
</html>