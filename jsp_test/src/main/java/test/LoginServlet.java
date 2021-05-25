package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import domain.LoginVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginProc")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//loginForm.jsp 사용자 입력값 가져오기
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		//세션에 아이디와 비밀번호 담기
		HttpSession session = request.getSession();
		session.setAttribute("login", new LoginVO(userid, password));
//		session.setAttribute("userid", userid);
//		session.setAttribute("password", password);
		
		//페이지 이동 => loginForm.jsp
		response.sendRedirect("session/loginForm.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
