package test.bean;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Dao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	private static Dao dao = new Dao(); //싱글 인스턴스 선언 외부에서 객체를 생성하지 못하도록한다.
	private Dao() {};
	public static Dao getInstance() {
		return dao;
	}
	
	//서버에 접속한다.
	private Connection getConnection() throws Exception {
		/*Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@masterkh.iptime.org:7000:orcl";
		conn = DriverManager.getConnection(url, "java02", "java02");*/
		Context ctx = new InitialContext();  //context의 모든 저보를 읽는다.
		Context env = (Context)ctx.lookup("java:comp/env"); // 그중에서 자바 관련 코드를 본다.
		DataSource ds = (DataSource)env.lookup("jdbc/jsptest"); // 그중에서 지정한 jdbc로/jsptest가 있는 코드를 불러온다.
		conn = ds.getConnection();
		return conn;
	}
	
	//select query 실행
	public ArrayList<Dto> select() { //리턴타입을 arrayList로 한다. 
		ArrayList<Dto> list = new ArrayList<Dto>();
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member_info");
			rs = pstmt.executeQuery();
			//rs를 통해 읽어들인 데이터들을 Dto에 저장하여 Dto를 ArrayList에 저장한다.
			while(rs.next()) {
				Dto dto = new Dto();
				dto.setId(rs.getString("id"));
				dto.setPass1(rs.getString("pw"));
				dto.setBirth(rs.getString("birth"));
				dto.setSex(rs.getString("sex"));
				dto.setAddress(rs.getString("address"));
				dto.setFirst_number(rs.getString("first_number"));
				dto.setSecond_number(rs.getString("second_number"));
				dto.setThird_number(rs.getString("third_number"));
				dto.setEmail_id(rs.getString("email_id"));
				dto.setEmail_site_text(rs.getString("email_site"));
				dto.setReceive(rs.getString("email_receive"));
				dto.setInterest(rs.getString("interest"));
				dto.setReg_date(rs.getTimestamp("reg"));
				list.add(dto);				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {if(rs != null)rs.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		
		return list;
	}
	
	public void insert(Dto dto) { //매개변수로 Dto를 받아 데이터가 저장되어있는 dto를 가져온다.
		try {
			conn = getConnection();
			//입력받은 data를 통해 insert query 시행
			pstmt = conn.prepareStatement("insert into member_info values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass1());
			pstmt.setString(3, dto.getBirth());
			pstmt.setString(4, dto.getSex());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getFirst_number());
			pstmt.setString(7, dto.getSecond_number());
			pstmt.setString(8, dto.getThird_number());
			pstmt.setString(9, dto.getEmail_id());
			pstmt.setString(10, dto.getEmail_site_text());
			pstmt.setString(11, dto.getReceive());
			pstmt.setString(12, dto.getInterest());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		
	}
	
	public int loginCheck(Dto dto){
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id, pw from member_info where id=?");
			pstmt.setString(1, dto.getLogin_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(!rs.getString("pw").equals(dto.getLogin_pw())) {
					result = 2;
				}else{
					result = 3;
				}				
			}else {
				result = 1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			
			try {if(rs != null)rs.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		return result;
	}
	
	public int select_id(String id){
		int result = 0;		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id, pw from member_info where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else{
				result = 2;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			
			try {if(rs != null)rs.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		return result;
	}
	
	public boolean delete(String login_id, String login_pw) {
		boolean result = false;
		try {
			conn = getConnection();
			//입력받은 data를 통해 insert query 시행
			pstmt = conn.prepareStatement("delete from member_info where id = ? and pw = ?");
			pstmt.setString(1, login_id);
			pstmt.setString(2, login_pw);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select id from member_info where id = ?");
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = false;
			}else{
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		return result;
	}
	
	public Dto modifiyInfo(String id) {
		Dto dto = new Dto();
		try {
			conn = getConnection();
			//입력받은 data를 통해 insert query 시행
			pstmt = conn.prepareStatement("select * from member_info where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass1(rs.getString("pw"));
				dto.setBirth(rs.getString("birth"));
				dto.setSex(rs.getString("sex"));
				dto.setAddress(rs.getString("address"));
				dto.setFirst_number(rs.getString("first_number"));
				dto.setSecond_number(rs.getString("second_number"));
				dto.setThird_number(rs.getString("third_number"));
				dto.setEmail_id(rs.getString("email_id"));
				dto.setEmail_site_text(rs.getString("email_site"));
				dto.setReceive(rs.getString("email_receive"));
				dto.setInterest(rs.getString("interest"));
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
	
		
		return dto;
	}
	
	public void updateInfo(Dto dto) {
		try {
			conn = getConnection();
			//입력받은 data를 통해 insert query 시행
			pstmt = conn.prepareStatement("update member_info set pw = ?, address = ?, first_number = ?, second_number = ?, third_number = ?, email_id = ?, email_site = ?, email_receive = ?, interest = ? where  id = ?  ");
			
			pstmt.setString(1, dto.getPass1());
			pstmt.setString(2, dto.getAddress());
			pstmt.setString(3, dto.getFirst_number());
			pstmt.setString(4, dto.getSecond_number());
			pstmt.setString(5, dto.getThird_number());
			pstmt.setString(6, dto.getEmail_id());
			pstmt.setString(7, dto.getEmail_site_text());
			pstmt.setString(8, dto.getReceive());
			pstmt.setString(9, dto.getInterest());
			pstmt.setString(10, dto.getId());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
	}
	
	public boolean findId(String id) throws Exception {
		boolean result = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member_info where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result= true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(rs != null)rs.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		
		return result;
	}

}
