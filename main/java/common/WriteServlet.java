package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/common/write")
public class writeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PostDAO dao = new PostDAO();
		dao.writePost(request);
		// request.getParameter(form의 input필드의 name태그)
		// request안에 숨어있는 무언가를 찾아서 Redirect를 잡아줘야함
		response.sendRedirect("Free_board.jsp");
	}

}
