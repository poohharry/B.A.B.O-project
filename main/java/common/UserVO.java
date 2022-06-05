package common;

public class UserVO {
	private int mNum;	 			 // 회원 고유 번호
	private String id;				 // 아이디
	private String pw;				 // 패스워드
	private String name;			 // 회원이름
	private String email;			 // 이메일
	private String pNum;			 // 휴대폰 번호
	private String signUpDate;		 // 회원가입 날짜
	private int lgnFailCnt;			 // 로그인실패 횟수
	private String changePwDate;	 // 마지막 비밀번호 변경 날짜
	private String lastLoginDate;	 // 마지막 로그인 날짜
	private String isBiz;			 // 사업자 여부
	
	
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public String getSignUpDate() {
		return signUpDate;
	}
	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}
	public int getLgnFailCnt() {
		return lgnFailCnt;
	}
	public void setLgnFailCnt(int lgnFailCnt) {
		this.lgnFailCnt = lgnFailCnt;
	}
	public String getChangePwDate() {
		return changePwDate;
	}
	public void setChangePwDate(String changePwDate) {
		this.changePwDate = changePwDate;
	}
	public String getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getIsBiz() {
		return isBiz;
	}
	public void setIsBiz(String isBiz) {
		this.isBiz = isBiz;
	}

	
	
}
