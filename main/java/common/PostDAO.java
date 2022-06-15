package common;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostDAO {
	private DBConMgr pool;
	
	// 사용자마다 현재 프로젝트의 경로가 다르기 때문에 그걸 미리 구해놓고 파일 업로드 경로를 상대적으로 바꿔준다
	private static String path = (System.getProperty("user.dir")).replace("\\", "/");
	private static final String SAVEFOLDER = path + "/Project1/FirstProject/src/main/webapp/uploadFiles/";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 10*1024*1024;
	
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
			sql = "select pNum, title, writter, wrDate, viewCnt from posts where category = ? order By pNum desc";
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
	// 게시글 번호를 매개변수로 그 게시글이 갖고있는 모든 정보를 vo에 담아서 반환
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
				vo.setPNum(rs.getInt("pNum"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setWritter(rs.getString("writter"));
				vo.setContents(rs.getString("contents"));
				vo.setTag(rs.getString("tag"));
				vo.setWrDate(rs.getString("wrDate"));
				vo.setNickname(rs.getString("nickname"));
				if(rs.getString("corDate") != null) {
					vo.setCorDate(rs.getString("corDate"));
				}
				vo.setPostPw(rs.getString("postPw"));
				vo.setViewCnt(rs.getInt("viewCnt"));
			}
			pstmt.close();
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
	public boolean writePost(HttpServletRequest req, HttpServletResponse rep) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String fileName = null;
		
		try {
			con = pool.getConnection();
			File file = new File(SAVEFOLDER);
			if(!file.exists()) file.mkdirs();
			
			multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("fileName") != null) {
				fileName = multi.getFilesystemName("fileName");
				fileSize = (int)multi.getFile("fileName").length();
			}
			String content = multi.getParameter("ir1");
//			if(multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
//				content = UtilMgr.replace(content, "<", "&lt");
//				content = UtilMgr.replace(content, ">", "&gt");
//			}
			
			
			// 태그가 작성되었는지 여부에 따라 sql문을 다르게 돌림
			if(multi.getParameter("tag") == null) {
				sql = "insert into posts(title, writter, contents, postPw, category, nickname, fileName, fileSize) values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("board-title"));
				pstmt.setString(2, multi.getParameter("writter"));
				pstmt.setString(3, multi.getParameter("ir1"));
				pstmt.setString(4, multi.getParameter("postPw"));
				pstmt.setString(5, multi.getParameter("boardType"));
				pstmt.setString(6, multi.getParameter("nickname"));
				pstmt.setString(7, fileName);
				pstmt.setInt(8, fileSize);
			} 
			String url = multi.getParameter("boardType");
			
			// 태그가 작성되었는지 여부에 따라 sql문을 다르게 돌림
//			if(multi.getParameter("tag") == null) {
//				sql = "insert into posts(title, writter, contents, postPw, category, nickname) values(?, ?, ?, ?, ?, ?)";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, vo.getTitle());		// board-title
//				pstmt.setString(2, vo.getWritter());	// writter
//				pstmt.setString(3, vo.getContents());	// ir1
//				pstmt.setString(4, vo.getPostPw());		// 
//				pstmt.setString(5, vo.getCategory());	// board-type
//				pstmt.setString(6, vo.getNickname());	// nickname
//			} 
			
//			else {
//				sql = "insert into posts(title, writter, contents, tag, postPw, category, nickname) values(?, ?, ?, ?, ?, ?, ?)";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, vo.getTitle());
//				pstmt.setString(2, vo.getWritter());
//				pstmt.setString(3, vo.getContents());
//				pstmt.setString(4, vo.getTag());
//				pstmt.setString(5, vo.getPostPw());
//				pstmt.setString(6, vo.getCategory());
//				pstmt.setString(7, vo.getNickname());
//			}
			
			// executeUpdate 의 반환값은 insert,update,delete인 경우, 관련된 레코드의 수를 반환
			// create, drop, alter인 경우에는 0을 반환
			// 게시글 작성은 1개의 게시글 정보를 저장하기 때문에 성공적으로 작성이 되었다면 1을 반환할 것이다.
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
			rep.sendRedirect( url + ".jsp");
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
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update posts set title = ?, contents = ?, postPw = ?, tag = ?, nickname = ?, category = ? where pNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContents());
			pstmt.setString(3, vo.getPostPw());
			pstmt.setString(4, vo.getTag());
			pstmt.setString(5, vo.getNickname());
			pstmt.setString(6, vo.getCategory());
			pstmt.setInt(7, vo.getPNum());
			
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
	
	
	// 게시글 삭제
	public boolean deletePost(int pNum) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from posts where pNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pNum);
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
	
	
	// 댓글 작성
	public boolean writeComment(CommentVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			if(vo.getTag() == null) {
				sql = "insert into comments(postNum, writter, contents, nickname) values(?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getPostNum());
				pstmt.setString(2, vo.getWritter());
				pstmt.setString(3, vo.getContents());
				pstmt.setString(4, vo.getNickname());
				if(pstmt.executeUpdate() == 1) flag = true;
			} else {
				sql = "insert into comments(postNum, writter, contents, tag, nickname) values(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getPostNum());
				pstmt.setString(2, vo.getWritter());
				pstmt.setString(3, vo.getContents());
				pstmt.setString(4, vo.getTag());
				pstmt.setString(5, vo.getNickname());
				if(pstmt.executeUpdate() == 1) flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	// 댓글 불러오기
	public List<CommentVO> getComments(int pNum) {
		List<CommentVO> list = new ArrayList<CommentVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from comments where postNum = ? order By comNum";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setPostNum(rs.getInt("postNum"));
				vo.setWritter(rs.getString("writter"));
				vo.setContents(rs.getString("contents"));
				vo.setComNum(rs.getInt("comNum"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setTag(rs.getString("tag"));
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
	
	
	// id = writter를 매개변수로 받아서 해당 id가 작성한 글의 pNum(번호)과 
	// title(글 제목)과 category(작성한 글의 게시판 종류)를 가져옴
	public List<PostVO> getUserPostList(String wrt) {
		List<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select pNum, title, category from posts where writter = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wrt);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostVO vo = new PostVO();
				vo.setPNum(rs.getInt("pNum"));
				vo.setTitle(rs.getString("title"));
				vo.setCategory(rs.getString("category"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	// 실험, id = writter 를 매개변수로 받아서 postNum(댓글 번호)과 
	// contents(작성한 댓글의 제목)와 작성한 댓글의 게시판 종류를 가져옴
	public List<PostVO> getUserCommentList(String wrt) {
		List<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select pNum, title, category from posts where writter = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wrt);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostVO vo = new PostVO();
				vo.setPNum(rs.getInt("pNum"));
				vo.setTitle(rs.getString("title"));
				vo.setCategory(rs.getString("category"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	
}
