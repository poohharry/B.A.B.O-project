package common;

public class CommentVO {
	private int postNum;			// 댓글이 소속된 본 게시글
	private String writter;			// 댓글 작성자
	private String contents;		// 댓글 내용
	private String comNum;			// 몇번째 댓글인지를 알기 위한 댓글 고유번호
	private String writeDate;		// 댓글 작성 날짜
	
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getWritter() {
		return writter;
	}
	public void setWritter(String writter) {
		this.writter = writter;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
