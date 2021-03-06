package member.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static member.persistence.JDBCUtil.*;

import member.domain.MemberVO;

public class MemberDAO {
	// 회원가입(C), 로그인(R), 회원정보수정(U), 회원탈퇴(D) =>
	// DML(update, delete, insert)/select(서브쿼리, 조인)

	private Connection con;

	public MemberDAO(Connection con) {
		this.con = con;
	}

	// 로그인이 성공하면, 사용자의 아이디와 이름을 MemberVO에 담기
	public MemberVO isLogin(String userid, String currentPassword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			String sql = "select userid,name from memberTBL where userid=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, currentPassword);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setUserid(rs.getString("userid"));
				vo.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);{}
			close(pstmt);

		}
		return vo;

	}

	public int remove(String userid, String currentPassword) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from memberTBL where userid=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, currentPassword);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int update(String userid, String currentPassword, String changePassword) {
		int result=0;
		PreparedStatement pstmt = null;
		try {
			String sql="update memberTBL set password=? where userid=? and password=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, changePassword);
			pstmt.setString(2, userid);
			pstmt.setString(3, currentPassword);
			result = pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insert(MemberVO vo) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into memberTBL(userid,password,name,gender,email)";
			sql+=" values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		   close(pstmt);
		  }
	return result;
	}
}
