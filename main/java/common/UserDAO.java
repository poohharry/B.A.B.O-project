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
			sql = "insert into users(mNum, id, pw, name, email, pNum, isBiz, birth, nickname)values((SELECT IFNULL(MAX(mNum), 0)+1 FROM users U), ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getpNum());
			pstmt.setString(6, vo.getIsBiz());
			pstmt.setString(7, vo.getBirth());
			pstmt.setString(8, vo.getNickname());
	
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
	
	// 회원가입시 ID 중복체크
	public boolean isIdExist(String id) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select pNum from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// 결과물이 있다는 것은 입력받은 아이디가 이미 존재한다는 뜻
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 회원가입시 이메일 중복체크
	public boolean isEmailExist(String email) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select pNum from users where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			// 결과물이 있다는 것은 입력받은 아이디가 이미 존재한다는 뜻
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
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
	// 유저가 수정페이지의 폼에 입력한 값을 vo에 담아서 같이 함수를 호출 및 DB 업데이트
	// pw의 여부에 따라 sql문 다르게 돌림
	public boolean updateUser(UserVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			// 유저가 수정페이지에서 비밀번호를 입력하면 그걸로 교체, 입력하지 않으면 유지
			if(vo.getPw() == null) {
				sql = "update users set name = ?, email = ?, pNum = ?, birth = ? where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getEmail());
				pstmt.setString(3, vo.getpNum());
				pstmt.setString(4, vo.getBirth());
				pstmt.setString(5, vo.getId());
			} else {
				sql = "update users set pw = ?, name = ?, email = ?, pNum = ?, birth = ? where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getPw());
				pstmt.setString(2, vo.getName());
				pstmt.setString(3, vo.getEmail());
				pstmt.setString(4, vo.getpNum());
				pstmt.setString(5, vo.getBirth());
				pstmt.setString(6, vo.getId());
			}
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
	
	// 비밀번호 재설정
	// 비밀번호 찾기이후 인증절차를 밟고나서 id를 매개변수로 비밀번호만 재설정하도록 한다
	public void resetPW(String id, String newPW) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update users set pw = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newPW);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
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
		// 4 : 로그인은 성공했지만 로그인실패 카운트 초과로 추가인증
		// 5 : 로그인은 성공했지만 블랙리스트에 지정되어 일정 기간동안 로그인 불가
		int flag = 0;
		
		try {
			con = pool.getConnection();
			// 입력받은 id가 데이터베이스에 존재하는지 확인
			sql = "select id, pw, lgnFailCnt from users where id = ?";
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
			else if(!(rs.getString("pw").equals(pw))) {
				addFailCnt(id);
				flag = 2;
				return flag;
			} else if(rs.getInt("lgnFailCnt") < 5){
				// 아무것도 걸리지 않으면 3을 반환하면서 로그인 실패 카운트를 0으로 초기화
				pstmt.close();
				sql = "update users set lgnFailCnt = 0 where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				// id를 넣어서 블랙리스트에 등록됐는지 여부 파악
				if(isBlack(id)) {
					// true이면 5를 반환함으로 로그인 차단
					flag = 5;
				} else {
					flag = 3;
				}
			} else {
				// 로그인 실패 카운트가 5를 넘어섰기에 로그인에 성공해도 추가 인증이 필요로 함
				// 이메일 확인 페이지로 이동시키기 위해 플래그 4를 반환
				pstmt.close();
				sql = "update users set lgnFailCnt = 0 where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				if(isBlack(id)) {
					flag = 5;
				} else {
					flag = 4;					
				}
				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
	// 로그인 실패시 로그인을 시도했던 아이디의 로그인실패 카운트를 증가시키는 함수
	// 지금까지 쌓인 실패카운트를 반환
	private int addFailCnt(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		// 반환할 실패 카운트
		int cnt = 0;
		try {
			con = pool.getConnection();
			sql = "update users set lgnFailCnt = lgnFailCnt + 1 where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			// cnt에 실패카운트 저장
			cnt = returnFailCnt(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return cnt;
	}
	
	// 실패카운트 반환
	public int returnFailCnt(String id) {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select lgnFailCnt from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return cnt;
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
				vo.setNickname(rs.getString("nickname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	
	// 모든 회원의 모든 정보를 담은 list반환
	// ArrayList<String> 형태로 반환
	public List<UserVO> getUsers() {
		List<UserVO> list = new ArrayList<UserVO>();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from users order by mNum";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserVO vo = new UserVO();
				vo.setmNum(rs.getInt("mNum"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setpNum(rs.getString("pNum"));
				vo.setBirth(rs.getString("birth"));
				vo.setSignUpDate(rs.getString("signUpDate"));
				vo.setLgnFailCnt(rs.getInt("lgnFailCnt"));
				vo.setChangePwDate(rs.getString("changePwDate"));
				vo.setLastLoginDate(rs.getString("lastLoginDate"));
				vo.setIsBiz(rs.getString("isBiz"));
				vo.setNickname(rs.getString("nickname"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	// 블랙리스트 등록
	// BlackVO와 day를 매개변수로 계정을 블랙리스트로 등록
	// vo에 담긴 id에게 day만큼 로그인을 차단시킨다
	public void appointBlack(BlackVO vo, int day) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into blackmember(mNum, id, freeDate, reason) values(?, ?, (select date_add(now(), INTERVAL ? DAY)), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getmNum());
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, day);
			pstmt.setString(4, vo.getReason());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//블랙리스트 정보
	// id를 입력받아서 그 아이디가 블랙리스트로 지정된 상태라면 블랙리스트 관련 정보를 전부 반환해준다
	public BlackVO getBlack(String id) {
		BlackVO vo = new BlackVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from blackmember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setmNum(rs.getInt("mNum"));
				vo.setId(rs.getString("id"));
				vo.setAppointDate(rs.getString("appointDate"));
				vo.setFreeDate(rs.getString("freeDate"));
				vo.setReason(rs.getString("reason"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	// 블랙리스트 멤버 전체 조회
	public List<BlackVO> getBlackList() {
		List<BlackVO> list  = new ArrayList<BlackVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from blackmember order By mNum";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlackVO vo = new BlackVO();
				vo.setmNum(rs.getInt("mNum"));
				vo.setId(rs.getString("id"));
				vo.setAppointDate(rs.getString("appointDate"));
				vo.setFreeDate(rs.getString("freeDate"));
				vo.setReason(rs.getString("reason"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	// 매개변수로 받은 id가 블랙리스트 지정 여부를 반환(true = 블랙)
	// 이 DAO안에서만 쓰이는 메소드이기에 private으로 선언
	private boolean isBlack(String id) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from blackmember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 아이디 찾기
	// 이메일을 입력받아 해당하는 아이디 반환
	public String findID(String email) {
		String id = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select id from users where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 pool.freeConnection(con, pstmt, rs);
		}
		return id;
	}
	// 비밀번호 찾기
	// id를 집어넣어 이메일과 비밀번호를 조회한 후
	// 입력받은 이베일과 조회결과의 이메일이 일치하면 비밀번호를 반환
	public String findPW(String id, String email) {
		String pw = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select email, pw from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("email").equals(email)) {
					pw = rs.getString("pw");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 pool.freeConnection(con, pstmt, rs);
		}
		return pw;
	}
	
}
