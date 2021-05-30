package book.service;

import java.sql.Connection;

import book.domain.BookVO;
import book.persistence.BookDAO;

import static book.persistence.JDBCUtil.*;

public class BookInsertService {
   
   
   public boolean bookInsert(BookVO vo) {
   //db작업
      Connection con = getConnection();
      BookDAO dao = new BookDAO(con);

      int result = dao.insert(vo);
      
      boolean insertFlag = false;
      
      if(result>0) {
         insertFlag = true;
         commit(con);
      }else {
         rollback(con);
      }
      close(con);
      return insertFlag;
   }
}