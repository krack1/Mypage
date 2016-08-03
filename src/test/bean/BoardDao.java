package test.bean;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class BoardDao {
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	private static BoardDao boarddao = new BoardDao();
	public static BoardDao getInstance() {
		return boarddao;
	}
	private BoardDao() {}
	
	private Connection getConnection() throws Exception {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptest");
		
		return ds.getConnection();		
	}
	
	public int getArticleCount() throws Exception {
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return count;
	}
	
	public int getSearchArticleCount(String id) throws Exception {
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board where writer = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return count;
	}
	
	public List getArticles(int start, int end) throws Exception {
		List articleList = null;
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
					"from board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				articleList = new ArrayList(end);
			do{				
				BoardDto boarddto = new BoardDto();
				boarddto.setNum(rs.getInt("num"));
				boarddto.setWriter(rs.getString("writer"));
				boarddto.setEmail(rs.getString("email"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setPasswd(rs.getString("passwd"));
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				boarddto.setReadcount(rs.getInt("readcount"));
				boarddto.setRef(rs.getInt("ref"));
				boarddto.setRe_step(rs.getInt("re_step"));
				boarddto.setRe_level(rs.getInt("re_level"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setIp(rs.getString("ip"));
				articleList.add(boarddto);
			}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return articleList;
	}
	
	public List getSearchArticles(int start, int end, String id) throws Exception {
		List articleList = null;
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "
					+ "from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r "
					+ "from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount "
					+ "from board where writer=? order by reg_date desc)) where r >=? and r<=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				articleList = new ArrayList(end);
			do{				
				BoardDto boarddto = new BoardDto();
				boarddto.setNum(rs.getInt("num"));
				boarddto.setWriter(rs.getString("writer"));
				boarddto.setEmail(rs.getString("email"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setPasswd(rs.getString("passwd"));
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				boarddto.setReadcount(rs.getInt("readcount"));
				boarddto.setRef(rs.getInt("ref"));
				boarddto.setRe_step(rs.getInt("re_step"));
				boarddto.setRe_level(rs.getInt("re_level"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setIp(rs.getString("ip"));
				articleList.add(boarddto);
			}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return articleList;
	}
	
	public BoardDto getArticle(int num) throws Exception {
		BoardDto boarddto = null;
		
	try {			
			conn = getConnection();
			
			pstmt = conn.prepareStatement("update board set readcount = readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boarddto = new BoardDto();
				boarddto.setNum(rs.getInt("num"));
				boarddto.setWriter(rs.getString("writer"));
				boarddto.setEmail(rs.getString("email"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setPasswd(rs.getString("passwd"));
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				boarddto.setReadcount(rs.getInt("readcount"));
				boarddto.setRef(rs.getInt("ref"));
				boarddto.setRe_step(rs.getInt("re_step"));
				boarddto.setRe_level(rs.getInt("re_level"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setIp(rs.getString("ip"));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return boarddto;
	}
	
	public void insertArticle(BoardDto boarddto) throws Exception {
		int num = boarddto.getNum();
		int ref = boarddto.getRef();
		int re_step = boarddto.getRe_step();
		int re_level = boarddto.getRe_level();
		int number = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}
			else {
				number = 1;
			}
			if(num != 0) {
				pstmt = conn.prepareStatement("update board set re_step = re_step+1 where ref = ? and re_step > ?");
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step +1;
				re_level = re_level+1;				
			}else{
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			pstmt = conn.prepareStatement("insert into board(num,writer,subject,email,content,passwd,reg_date,ip,ref,re_step,re_level) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1,boarddto.getWriter());
			pstmt.setString(2,boarddto.getSubject());
			pstmt.setString(3,boarddto.getEmail());
			pstmt.setString(4,boarddto.getContent());
			pstmt.setString(5,boarddto.getPasswd());
			pstmt.setTimestamp(6,boarddto.getReg_date());
			pstmt.setString(7,boarddto.getIp());
			pstmt.setInt(8,ref);
			pstmt.setInt(9,re_step);
			pstmt.setInt(10,re_level);
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public boolean deleteArticle(int num, String passwd) {
		boolean delete = false;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				if(rs.getString("passwd").equals(passwd)) {
					pstmt = conn.prepareStatement("delete from board where num = ?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					delete = true;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return delete;
	}
	
	public boolean deleteArticleAdmin(int num) {
		boolean delete = true;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from board where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return delete;
	}
	public BoardDto updateGetArticle(int num) throws Exception {
		BoardDto boarddto = null;
		
	try {			
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boarddto = new BoardDto();
				boarddto.setNum(rs.getInt("num"));
				boarddto.setWriter(rs.getString("writer"));
				boarddto.setEmail(rs.getString("email"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setPasswd(rs.getString("passwd"));
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				boarddto.setReadcount(rs.getInt("readcount"));
				boarddto.setRef(rs.getInt("ref"));
				boarddto.setRe_step(rs.getInt("re_step"));
				boarddto.setRe_level(rs.getInt("re_level"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setIp(rs.getString("ip"));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return boarddto;
	}
	
	public int updateArticle(BoardDto boarddto) {
		int result = 0;
		try{
				conn = getConnection();
				pstmt = conn.prepareStatement("select passwd from board where num = ?"); {
				pstmt.setInt(1, boarddto.getNum());
				rs = pstmt.executeQuery();		
				if(rs.next()) {
					
					if(rs.getString("passwd").equals(boarddto.getPasswd())) {
						
						pstmt = conn.prepareStatement(
								"update board set "
								+ "writer = ?, "
								+ "subject = ?, "
								+ "email = ?, "
								+ "content = ? "
								+ "where num = ?");
						
						pstmt.setString(1, boarddto.getWriter());
						pstmt.setString(2, boarddto.getSubject());
						pstmt.setString(3, boarddto.getEmail());
						pstmt.setString(4, boarddto.getContent());
						pstmt.setInt(5, boarddto.getNum());
						pstmt.executeUpdate();
						result = 1;
					}
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		
		return result;
	}

}
