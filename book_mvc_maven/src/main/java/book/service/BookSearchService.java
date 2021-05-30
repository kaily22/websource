package book.service;

import java.sql.Connection;
import java.util.List;

import book.domain.BookVO;
import book.persistence.BookDAO;

import static book.persistence.JDBCUtil.*;

public class BookSearchService {

	public List<BookVO> search(String criteria, String keyword){
				
		Connection con = getConnection();
		BookDAO dao = new BookDAO(con);
		
		List<BookVO> searchList = dao.searchList(criteria, keyword);
		
		close(con);

		return searchList;
	}
	

}
