package common;

public class PostVO {
	private int PNum;			// 게시물 번호
	private String category;	// 카테고리
	private String title;		// 제목
	private String writter;		// 작성자 아이디
	private String contents;	// 글 내용
	private String tag;			// 태그
	private String wrDate;		// 작성 일자
	private String corDate;		// 수정 일자
//	private String file;		// 파일?(사진)
//	private int fileSize		// 파일 사이즈 
	private String postPw;		// 게시물 비밀번호
	private int viewCnt;		// 조회수
	private String nickname;	// 작성자 닉네임 
	
	public int getPNum() {
		return PNum;
	}
	public void setPNum(int pNum) {
		PNum = pNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getWrDate() {
		return wrDate;
	}
	public void setWrDate(String wrDate) {
		this.wrDate = wrDate;
	}
	public String getCorDate() {
		return corDate;
	}
	public void setCorDate(String corDate) {
		this.corDate = corDate;
	}
	public String getPostPw() {
		return postPw;
	}
	public void setPostPw(String postPw) {
		this.postPw = postPw;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
}
