package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/common/write")
public class WriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PostDAO dao = new PostDAO();
		dao.writePost(request);
		// 카테고리를 request로 부터 받아와서 다음으로 이동할 목적지를 나눠준다
		String category = request.getParameter("board-type");
		if(category.equals("freeBoard")) {
			response.sendRedirect("Free_board.jsp");			
		} else if(category.equals("Q&A")) {
			response.sendRedirect("Q&A_Board.jsp");						
		}
	}
}
