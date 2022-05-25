package common;

public class UserDAO {
	
	private DBConnectionMgr pool;

	public UserDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
