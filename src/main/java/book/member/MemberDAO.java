package book.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import book.member.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	private MemberDAO() {
	}

	// db연결
	private Connection getConnection() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@192.168.219.198:1521:orcl";
				conn = DriverManager.getConnection(url,"team02","1234");
			}catch(Exception e) { 
				e.printStackTrace();
			}
			return conn;
		}
	
	//연결 해제
	private void endConnection() {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//회원가입 시 DB에 회원정보 저장
	public void inputMember(MemberDTO mdto) {
		try {
			conn = getConnection();
			String sql = "insert into member3(mnum, mid, mpw, mname, mphone, memail, mlevel, amlevel) "
					+ "values(member3_seq.nextval,? ,? ,? ,? ,? ,? ,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdto.getMid());
			pstmt.setString(2, mdto.getMpw());
			pstmt.setString(3, mdto.getMname());
			pstmt.setString(4, mdto.getMphone());
			pstmt.setString(5, mdto.getMemail());
			pstmt.setInt(6, mdto.getMlevel());
			pstmt.setInt(7, mdto.getAmlevel());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
	}
	//아이디로 mnum 불러오기
	public int getMnumByMid(String mid) {
		int mnum = 0;
		try {
			conn = getConnection();
			String sql = "select mnum from member3 where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				mnum = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return mnum;
	}
	//회원 탈퇴
	public int deleteMember(int mnum) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "delete from member3 where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return result;
	}
	//아이디 중복확인 mid가 있으면 1 없으면 0
	public int selectMid(String mid) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "select mid from member3 where mid=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return result;
	}
	
	//회원정보 불러오기
	public MemberDTO getInfo(String mid) {
		MemberDTO mdto = null;
		try {
			conn = getConnection();
			String sql = "select * from member3 where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeQuery();
			if(rs.next()) {
				mdto = new MemberDTO();
				mdto.setMnum(rs.getInt("mnum"));
				mdto.setMid(rs.getString("mid"));
				mdto.setMpw(rs.getString("mpw"));
				mdto.setMname(rs.getString("mname"));
				mdto.setMphone(rs.getString("mphone"));
				mdto.setMemail(rs.getString("memail"));
				mdto.setMlevel(rs.getInt("mlevel"));
				mdto.setAmlevel(rs.getInt("amlevel"));
				mdto.setBirth(rs.getTimestamp("birth"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return mdto;
	}
	//회원정보 변경
	public void updateMember(int mnum) {
		MemberDTO mdto = null;
		try {
			conn = getConnection();
			String sql = "update member3 set mname=?, mphone=?, memail=? where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdto.getMname());
			pstmt.setString(2, mdto.getMphone());
			pstmt.setString(3, mdto.getMemail());
			pstmt.setInt(4, mnum);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
	}
	//비밀번호 변경
	public void changePw(String pw, int mnum) {
		try {
			conn = getConnection();
			String sql = "update member3 set mpw=? where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, mnum);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
	}
}