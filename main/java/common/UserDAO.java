package common;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
	
	private DBConnectionMgr pool;

	public UserDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입
	// 가입 성공했으면 true반환 실패했으면 false반환 / default는 false
	// 멤버번호를 max를 사용해서 추가한다?
	public boolean insertUser(UserVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into users(id, pw, name, email, pNum, isBiz)values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getpNum());
			pstmt.setString(6, vo.getIsBiz());
	
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
	public boolean deleteUser(UserVO vo) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			
		}
		
		
		
		return flag;
	}
	
	// 회원정보 수정
	// 수정할 데이터가 담긴 클래스를 같이 던져준다? 함수 호출전에 수정될 부분을 다 정리해서 변수로만 던져준다?
	public boolean updateUser(UserVO vo) {
		boolean flag = false;
		
		
		
		return flag;
	}
	
	// 
	
}
