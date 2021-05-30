package book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.service.BookModifyService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class BookModifyAction implements Action {
	
	private String path; //list.do
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int code = Integer.parseInt(request.getParameter("code"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		
		BookModifyService service = new BookModifyService();
		boolean modifyFlag = service.modify(code, price);
		
		if(!modifyFlag) {
			path = "index.jsp";
		}
		
		return new ActionForward(path, true);
	}

}
