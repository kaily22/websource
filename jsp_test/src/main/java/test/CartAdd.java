package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartAdd
 */
@WebServlet("/cartAdd")
public class CartAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//product.jsp 넘긴 값 가져오기(한개만 들어옴)
		String product = request.getParameter("product");
	
		//세션에 담기(서블릿에서 세션은 바로 사용 x)
		HttpSession session = request.getSession();
		session.setAttribute("product", product);
		
		List<String> product_list = (ArrayList<String>) session.getAttribute("product_list");
		
		
		//세션에 담기
		if(product_list==null) {
			product_list = new ArrayList<String>();
			product_list.add(product);
			session.setAttribute("product_list", product_list);
		}else {
			product_list.add(product);
		}
		
		
		//링크 페이지 제공(페이지 이동) => 장바구니 보기
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>장바구니추가</title></head>");
		out.print("<body><h3>장바구니 추가</h3>");
		out.print("<a href='session/cartList.jsp'>장바구니 보기</a>");
		out.print("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
