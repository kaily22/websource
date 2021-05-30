package member.service;

import java.sql.Connection;

import member.domain.MemberVO;
import member.persistence.MemberDAO;

import static member.persistence.JDBCUtil.*;

public class MemberJoinService {
	
	public boolean join(MemberVO vo) {
		
		boolean insertFlag = false;
		
		Connection con = getConnection();
		MemberDAO dao = new MemberDAO(con);
		
		int result = dao.insert(vo);
		
		if(result>0) {
			commit(con);
			insertFlag=true;
		}else {
			rollback(con);
		}
		close(con);
		return insertFlag;
		
	}

}
