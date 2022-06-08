package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
	private DBConMgr pool;

	public PostDAO() {
		try {
			pool = DBConMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 글 목록 불러오기
	// 카테고리(문자열)를 집어넣으면 그 카테고리에 해당하는 전체 게시글 리스트를 ArrayList<PostVO> 형으로 반환
	public List<PostVO> getPostList(String cate) {
		List<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select pNum, title, writter, wrDate, viewCnt from posts where category = ? group By pNum";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostVO vo = new PostVO();
				vo.setPNum(rs.getInt("pNum"));
				vo.setTitle(rs.getString("title"));
				vo.setWritter(rs.getString("writter"));
				vo.setWrDate(rs.getString("wrDate").substring(0, 10));
				vo.setViewCnt(rs.getInt("viewCnt"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	// 글 읽기
	// 게시글 번호를 매개변수로 그 게시글이 갖고있느 모든 정보를 vo에 담아서 반환
	public PostVO readPost(int pNum) {
		PostVO vo = new PostVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from posts where pNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setPNum(rs.getInt("pNUm"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setWritter(rs.getString("writter"));
				vo.setContents(rs.getString("contents"));
				vo.setTag(rs.getString("tag"));
				vo.setWrDate(rs.getString("wrDate"));
				if(rs.getString("corDate") != null) {
					vo.setCorDate(rs.getString("corDate"));
				}
				vo.setPostPw(rs.getString("postPw"));
				vo.setViewCnt(rs.getInt("viewCnt"));
			}
			
			// 글이 무사히 불러와졌으니 조회수 증가
			sql = "update posts set viewCnt = viewCnt + 1 where pNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	// 게시글 작성
	// PostVO를 받는데 PostVO에는 제목, 작성자, 내용, 태그(있어도 되고 없어도 됨), 게시글 비번이 있어야함
	public boolean writePost(PostVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			
			// 태그가 작성되었는지 여부에 따라 sql문을 다르게 돌림
			if(vo.getTag() == null) {
				sql = "insert into posts(title, writter, contents, postPw) values(?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getWritter());
				pstmt.setString(3, vo.getContents());
				pstmt.setString(4, vo.getPostPw());
			} else {
				sql = "insert into posts(title, writter, contents, tag, postPw) values(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getWritter());
				pstmt.setString(3, vo.getContents());
				pstmt.setString(4, vo.getTag());
				pstmt.setString(5, vo.getPostPw());
			}
			
			// executeUpdate 의 반환값은 insert,update,delete인 경우, 관련된 레코드의 수를 반환
			// create, drop, alter인 경우에는 0을 반환
			// 게시글 작성은 1개의 게시글 정보를 저장하기 때문에 성공적으로 작성이 되었다면 1을 반환할 것이다.
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
	
	// 게시글 수정
	public boolean updatePost(PostVO vo) {
		boolean flag = false;
		
		
		return flag;
	}
	
	
	
	// 게시글 삭제
	public boolean deletePost(int pNum) {
		boolean flag = false;
		
		
		return flag; 
	}
	
}
