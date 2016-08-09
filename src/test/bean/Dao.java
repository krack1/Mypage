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
	
	
	private static Dao dao = new Dao(); //�̱� �ν��Ͻ� ���� �ܺο��� ��ü�� �������� ���ϵ����Ѵ�.
	private Dao() {};
	public static Dao getInstance() {
		return dao;
	}
	
	//������ �����Ѵ�.
	private Connection getConnection() throws Exception {
		/*Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@masterkh.iptime.org:7000:orcl";
		conn = DriverManager.getConnection(url, "java02", "java02");*/
		Context ctx = new InitialContext();  //context�� ��� ������ �д´�.
		Context env = (Context)ctx.lookup("java:comp/env"); // ���߿��� �ڹ� ���� �ڵ带 ����.
		DataSource ds = (DataSource)env.lookup("jdbc/jsptest"); // ���߿��� ������ jdbc��/jsptest�� �ִ� �ڵ带 �ҷ��´�.
		conn = ds.getConnection();
		return conn;
	}
	
	//select query ����
	public ArrayList<Dto> select() { //����Ÿ���� arrayList�� �Ѵ�. 
		ArrayList<Dto> list = new ArrayList<Dto>();
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member_info");
			rs = pstmt.executeQuery();
			//rs�� ���� �о���� �����͵��� Dto�� �����Ͽ� Dto�� ArrayList�� �����Ѵ�.
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
				dto.setname(rs.getString("name"));
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
	
	public void insert(Dto dto) { //�Ű������� Dto�� �޾� �����Ͱ� ����Ǿ��ִ� dto�� �����´�.
		try {
			conn = getConnection();
			//�Է¹��� data�� ���� insert query ����
			pstmt = conn.prepareStatement("insert into member_info values(?,?,?,?,?,?,?,?,?,?,?,sysdate,?)");
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
			pstmt.setString(12, dto.getname());
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
			//�Է¹��� data�� ���� insert query ����
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
			//�Է¹��� data�� ���� insert query ����
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
				dto.setname(rs.getString("name"));
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
			//�Է¹��� data�� ���� insert query ����
			pstmt = conn.prepareStatement("update member_info set pw = ?, address = ?, first_number = ?, second_number = ?, third_number = ?, email_id = ?, email_site = ?, email_receive = ?, name = ? where  id = ?  ");
			
			pstmt.setString(1, dto.getPass1());
			pstmt.setString(2, dto.getAddress());
			pstmt.setString(3, dto.getFirst_number());
			pstmt.setString(4, dto.getSecond_number());
			pstmt.setString(5, dto.getThird_number());
			pstmt.setString(6, dto.getEmail_id());
			pstmt.setString(7, dto.getEmail_site_text());
			pstmt.setString(8, dto.getReceive());
			pstmt.setString(9, dto.getname());
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
	
	public ArrayList<String> checkId(String first_number, String second_number, String third_number){
		
		ArrayList<String> list = new ArrayList<String>();
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from member_info where first_number = ? and second_number = ? and third_number = ? ");
			pstmt.setString(1, first_number);
			pstmt.setString(2, second_number);
			pstmt.setString(3, third_number);
			rs = pstmt.executeQuery();
			while(rs.next()) {				
				list.add(rs.getString("id"));
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
	
	public boolean findPw_Check(String id, String email_id, String email_site_text) {
		boolean result = false;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select id from member_info where id=? and email_id = ? and email_site = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, email_id);
			pstmt.setString(3, email_site_text);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {if(rs != null)rs.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		
		
		
		return result;
		
	}
	
	public String findPw(String id) {
		String pw = "";
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select pw from member_info where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pw = rs.getString("pw");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {if(rs != null)rs.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(pstmt != null)pstmt.close();}catch(SQLException s) {s.printStackTrace();}
			try {if(conn != null)conn.close();}catch(SQLException s) {s.printStackTrace();}
		}
		
		return pw;
	}

}
