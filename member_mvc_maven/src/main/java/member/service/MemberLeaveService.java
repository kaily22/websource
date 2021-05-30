package member.service;

import java.sql.Connection;

import member.persistence.MemberDAO;

import static member.persistence.JDBCUtil.*;

public class MemberLeaveService {
	
	
	public boolean leave(String userid, String currentPassword) {
		
		boolean deleteFlag=false;
		Connection con = getConnection();
		MemberDAO dao = new MemberDAO(con);
		
		int result = dao.remove(userid, currentPassword);
		
		if(result>0) {
			commit(con);
			deleteFlag = true;
		}else {
			rollback(con);
		}
		close(con);
		return deleteFlag;
		
	}

}
