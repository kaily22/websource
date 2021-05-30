
package book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.service.BookDeleteService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class BookDeleteAction implements Action {
	private String path;
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//가져오기
		int code = Integer.parseInt(request.getParameter("code"));
		
		BookDeleteService service = new BookDeleteService();
		boolean isDeleteFlag = service.remove(code);
		
		if(!isDeleteFlag) {
			path= "index.jsp";
		}
		
		return new ActionForward(path, true);
	}

}
