<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="common.PostDAO" />
<jsp:useBean id="cvo" class="common.CommentVO" />

<%
	request.setCharacterEncoding("UTF-8");
	Integer pNum = Integer.parseInt(request.getParameter("postNum"));
	String writter = request.getParameter("commentWritter");
	String contents = request.getParameter("contents");
	
	// 태그 잘라내기
	String tag = "";
	
	// 만약 댓글 내용중 @가 붙어있다면?
	if(contents.contains("@")) {
		// 태그에 @부터 @이후에 처음 오는 공백까지 잘라낸 것을 저장한다
		tag = contents.substring(contents.indexOf("@"), contents.substring(contents.indexOf("@")).indexOf(" ") + 1 ) ;
	}
	String nickname = request.getParameter("nickname");
	
	// 코멘트 VO에 위에서 가공한 댓글 데이터들을 저장
	cvo.setPostNum(pNum);
	cvo.setWritter(writter);
	cvo.setContents(contents);
	if(tag != "") cvo.setTag(tag);
	cvo.setNickname(nickname);
	
	// 댓글 작성 메소드 호출
	dao.writeComment(cvo);
	
%>
<script>
	location.href="read.jsp?pNum=<%=pNum%>";
</script>

