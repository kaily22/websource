package book.service;

import java.sql.Connection;

import book.persistence.BookDAO;

import static book.persistence.JDBCUtil.*;

public class BookDeleteService {
	
	
	public boolean remove(int code) {
		
		boolean isDeleteFlag = false;
		
		Connection con = getConnection();
		BookDAO dao = new BookDAO(con);
		
		
		int result = dao.delete(code);
		
		if(result>0) {
			commit(con);
			isDeleteFlag = true;
		}else {
			rollback(con);
		}
		close(con);
		
	return isDeleteFlag;
	
	}

}
