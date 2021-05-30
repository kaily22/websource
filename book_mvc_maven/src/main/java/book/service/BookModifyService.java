package book.service;

import java.sql.Connection;

import book.persistence.BookDAO;

import static book.persistence.JDBCUtil.*;

public class BookModifyService {
	
	public boolean modify(int code, int price){
	
	boolean modifyFlag = false;
	
	Connection con = getConnection();
	BookDAO dao = new BookDAO(con);
	int result = dao.update(code, price);
	
	if(result > 0) {
		commit(con);
		modifyFlag = true;
	}else {
		rollback(con);
	}
	return modifyFlag;

   }
}
