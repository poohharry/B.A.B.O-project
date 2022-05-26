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
	
	public boolean insertUser(UserVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			// sql문 들어갈 자리
//			sql = insert into 
			// main 체크 4
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
}
