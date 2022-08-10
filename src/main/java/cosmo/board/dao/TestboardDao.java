package cosmo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cosmo.board.bean.Testboard;
import cosmo.common.dao.SuperDao;

public class TestboardDao extends SuperDao{
	
	public TestboardDao() {
	}
	
	public int InsertData(Testboard bean) {
		System.out.println(bean) ;		
		
		Connection conn = null ;
		PreparedStatement pstmt = null ; 
		int cnt = -999 ; 

		String sql = " insert into board(b_no, writer, title , b_content,  b_date, lecture_room) " ;
		sql += " values(boardseq.nextval,?, ?, ? , default , ?)" ; 
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);  
			
			pstmt = conn.prepareStatement(sql) ; 
			
			pstmt.setString(1, bean.getWriter());	//writer
			pstmt.setString(2, bean.getTitle());	// title
			pstmt.setString(3, bean.getB_content());//content
			pstmt.setString(4, bean.getLecture_room());	//lecture_room
			
			cnt = pstmt.executeUpdate() ;
			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
						
		} finally {
			try {
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return cnt  ;
	}

	public List<Testboard> SelectAll() {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from board " ;
		sql += " order by b_no desc " ; // 최근 게시물이 위로 오도록 ...
		
		List<Testboard> lists = new ArrayList<Testboard>() ;
		
		try {			
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
					
			rs = pstmt.executeQuery();				
			
			// while 구문을 사용하여 데이터 넣어 주기
			while(rs.next()) {
				Testboard bean = new Testboard(); 
				
				bean.setB_no(rs.getInt("b_no"));
				bean.setB_content(rs.getString("b_content"));
				bean.setB_date(rs.getString("b_date"));
				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				
				lists.add(bean) ;
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lists;		
	
	}

	public Testboard SelectOne(int b_no) {
		// 1건의 데이터를 조회합니다.
				Connection conn = null ;
				PreparedStatement pstmt = null ;
				ResultSet rs = null ;
				String sql = " select * from board where b_no = ? " ; 
				
				Testboard bean = null ; 
				
				try {
					conn = this.getConnection() ;
					pstmt = conn.prepareStatement(sql) ;
					
					pstmt.setInt(1, b_no); 
					
					rs = pstmt.executeQuery() ;
					
					if (rs.next()) {
						bean = new Testboard();
						
						bean.setB_no(rs.getInt("b_no"));
						bean.setWriter(rs.getString("writer"));
						bean.setB_content(rs.getString("b_content"));
						bean.setB_date(String.valueOf(rs.getDate("b_date")));
						bean.setLecture_room(rs.getString("lecture_room"));
						bean.setTitle(rs.getString("title"));
						
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(rs != null) {rs.close();}
						if(pstmt != null) {pstmt.close();}
						if(conn != null) {conn.close();}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				
				return bean;
	}

	public int UpdateData(Testboard bean) {
		// 특정 회원에 대한 정보를 수정합니다.
				Connection conn = null ;
				PreparedStatement pstmt = null ;
				
				String sql = " update board set " ;
				sql += " title=?, writer=?, b_date=default, b_content=?, lecture_room=?" ;
				sql += " where b_no = ? " ;
				
				int cnt = -999 ; 
				
				try {
					conn = super.getConnection() ;
					conn.setAutoCommit(false);
					
					pstmt = conn.prepareStatement(sql) ;
					
					pstmt.setString(1, bean.getTitle());
					pstmt.setString(2, bean.getWriter());
					pstmt.setString(3, bean.getB_content());
					pstmt.setString(4, bean.getLecture_room());
					pstmt.setInt(5, bean.getB_no()) ;
							
					cnt = pstmt.executeUpdate() ; 
					
					conn.commit();
				} catch (Exception e) {
					e.printStackTrace();
					try {
						conn.rollback();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				} finally {
					try {
						if(pstmt != null) {pstmt.close();}
						if(conn != null) {conn.close();}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				return cnt ;
		
	}

	public int DeleteData(int b_no) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		String sql = " delete from board where b_no = ?" ;

		int cnt = -999 ; 
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, b_no);
			
			cnt = pstmt.executeUpdate() ;
			
			
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt ;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
