package book.service;

import java.sql.Connection;
import java.util.List;

import book.domain.BookVO;
import book.persistence.BookDAO;

import static book.persistence.JDBCUtil.*;

public class BookListService {
	
	
	public List<BookVO> list() {
	
		//db작업
		Connection con = getConnection();
	
		BookDAO dao = new BookDAO(con);
		//전체리스트를 db에서 받아옴
		List<BookVO> list = dao.getList();
		
		close(con);
		
		//리턴
	    return list;
	}
   }

