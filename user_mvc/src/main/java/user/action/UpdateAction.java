package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.AllArgsConstructor;
import user.service.UserUpdateService;

@AllArgsConstructor
public class UpdateAction implements Action {

	private String path; //수정 잘 되면 -> view.do
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//사용자 입력 값 받기
		int no = Integer.parseInt(request.getParameter("no"));
		String addr = request.getParameter("addr");
		String mobile = request.getParameter("mobile");
		
		//서비스
		UserUpdateService service = new UserUpdateService();
		boolean updateFlag = service.update(no, addr, mobile);
		
		if(!updateFlag) { //modify.do?no=7
			path="modify.do?no="+no;
		}else {
			path +="?no="+no;
		}
		
		//이동방식 결정 후 ActionForward 객체 생성
		return new ActionForward(path, true);
	}

}
