package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	private DBConMgr pool;

	public UserDAO() {
		try {
			pool = DBConMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입
	// 가입 성공여부에 따라 flag를 반환 (성공시 true 실패시 false  / default는 false)
	// 멤버번호를 max를 사용해서 추가한다?
	// 비밀번호 암호화?
	public boolean insertUser(UserVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into users(mNum, id, pw, name, email, pNum, isBiz, birth)values((SELECT IFNULL(MAX(mNum), 0)+1 FROM users U), ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getpNum());
			pstmt.setString(6, vo.getIsBiz());
			pstmt.setString(7, vo.getBirth());
	
			// executeUpdate 의 반환값은 insert,update,delete인 경우, 관련된 레코드의 수를 반환
			// create, drop, alter인 경우에는 0을 반환
			// 회원가입에는 1명의 정보를 저장하기 때문에 성공적으로 가입이 되었다면 1을 반환할 것이다.
			if (pstmt.executeUpdate() == 1) {
				flag = true;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	// 회원계정 삭제
	// 삭제 유예 테이블로 옮기기? 옮겨진 후 30일 지나면 DB에서 완전 삭제
	// 테스트 환경에서는 1분 지나면 삭제하도록 지정함
	public boolean deleteUser(String id) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			// users 테이블에서 모든 정보를 복사하여 delete테이블로 옮긴다.
			// 옮겨지고 30일이 지나면 자동으로 테이블에서 삭제 (트리거와 프로시져, 이벤트 활용)
			sql = "delete from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 관련된 레코드의 숫자가 반환되는데, delete로 1줄이 영향을 받는건 알겠지만, 트리거도 카운트가 되는지는 모르겠음
			// 만약 트리거가 영향을 준다면 2일때 flag를 true로 바꿔줘야 함
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	// 회원정보 수정전 비밀번호 확인
	// 세션에 저장된 ID와 입력받은 비밀번호를 매개변수로 DB데이터와 대조
	public boolean ChkPW(String lgnId, String pw) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "select pw from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lgnId);
			rs = pstmt.executeQuery();
			
			// 나온 결과가 있는가?
			if(rs.next()) {
				// 결과가 입력받은 비밀번호와 같은가?
				if(rs.getString("pw").equals(pw)) {
					flag = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}
	
	
	// 회원정보 수정
	// 수정할 데이터가 담긴 클래스를 같이 던져준다? 함수 호출전에 수정될 부분을 다 정리해서 변수로만 던져준다?
	// 보통은 수정할 만한 정보를 입력하는 폼을 작성해서 던져주면 그 데이터로 정보를 업데이트하는 방식
	// 폼에는 비밀번호를 제외한 정보들이 기존에 저장된 데이터로 채워져있으며, 유저가 수정하기를 원하는 정보만 고치면 됨
	public boolean updateUser(UserVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return flag;
	}
	
	
	// 로그인
	// 다른 방법으로는 비밀번호를 입력하고 로그인에 시도할 때 입력받은 비밀번호를 암호화시키고 암호화된 비밀번호와 DB에 있는 암호화된 비밀번호를 대조하는 방식
	public int login(String id, String pw) {
		Connection con = null;				// 데이터베이스와의 연결
		PreparedStatement pstmt = null;		// 사전에 컴파일 된 SQL문을 실행
		String sql = null;
		ResultSet rs = null;
		
		// 1 : 아이디가 존재하지 않음
		// 2 : 비밀번호가 일치하지 않음
		// 3 : 로그인 성공
		int flag = 0;
		
		try {
			con = pool.getConnection();
			// 입력받은 id가 데이터베이스에 존재하는지 확인
			sql = "select id, pw from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// id가 없으니 1을 반환
			if(!rs.next()) {
				flag = 1;
				return flag;
			}
			// sql문을 돌려 나온 비밀번호가 입력받은 비밀번호와 일치하는지 확인
			// 일치하지 않으면 2를 반환
			if(!(rs.getString(2).equals(pw))) {
				flag = 2;
				return flag;
			}
			// 아무것도 걸리지 않으면 3을 반환
			flag = 3;
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}
	
	
	// 로그인 실패시 로그인을 시도했던 아이디의 로그인실패 카운트를 증가시키는 함수
	public void addFailCnt(String id) {
		
		
		
		
		
		
	}
	
	// 카운트가 5까지 쌓이면 로그인에 성공해도 추가적인 인증이 필요하도록 만듬
	public boolean  addAuth() {
		boolean flag = false;
		
		
		
		
		
		return flag;
	}
	
	// 매개변수로 받은 ID의 모든 정보를 반환(VO)
	public UserVO getUser(String id) {
		UserVO vo = new UserVO();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setmNum(rs.getInt("mNum"));
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setpNum(rs.getString("pNum"));
				vo.setBirth(rs.getString("birth"));
				vo.setSignUpDate(rs.getString("signUpDate"));
				vo.setLgnFailCnt(rs.getInt("lgnFailCnt"));
				vo.setChangePwDate(rs.getString("changePwDate"));
				vo.setLastLoginDate(rs.getString("lastLoginDate"));
				vo.setIsBiz(rs.getString("isBiz"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	
	// 테스트용 회원 리스트(id) 출력
	// ArrayList<String> 형태로 반환
	public List<String> getUsers() {
		List<String> list = new ArrayList<String>();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "select id from users";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return list;
	}
	
}
