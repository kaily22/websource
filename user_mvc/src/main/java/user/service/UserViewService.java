package user.service;

import java.sql.Connection;

import user.domain.UserVO;
import user.persistence.UserDAO;

import static user.persistence.JDBCUtil.*;
public class UserViewService {
	
	
	public UserVO select(int no) {
		
		//db작업
		Connection con = getConnection();
		UserDAO dao = new UserDAO(con);
		
		UserVO vo = dao.getRow(no);
		close(con);
		//return - void값 맞추기
		return vo;
	}

}
