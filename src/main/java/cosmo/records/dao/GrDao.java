package cosmo.records.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cosmo.common.dao.SuperDao;
import cosmo.records.bean.Grade;




public class GrDao extends SuperDao{
	
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
		String id = "prac" ;
		String password = "prac" ;
		
		public GrDao() {
		}
		
		public int InsertData(Grade bean) {
			// 회원 1명을 추가합니다.
			System.out.println(bean) ;		
			
			Connection conn = null ;
			PreparedStatement pstmt = null ; 
			int cnt = -999 ; 

			// Statememt
			String sql = " insert into lecture(student_id, teacher_id, s_code, lecture_score) " ;
			sql += " values(?, ?, ?, ?)  " ; 
			
			try {
				Class.forName(driver) ;

				conn = DriverManager.getConnection(url, id, password) ;
				conn.setAutoCommit(false);
				
//				
				
				pstmt = conn.prepareStatement(sql) ; 
				
				// 
				pstmt.setString(1, bean.getStudent_id());
				pstmt.setString(2, bean.getTeacher_id());
				pstmt.setString(3, bean.getS_code());
				pstmt.setInt(4, bean.getLecture_score());
				
				
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
		public Grade SelectOne(String id, String s_code) {
			// 1건의 데이터를 조회합니다.
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			String sql = " select * from lecture where student_id = ? and s_code = ? " ; 
			
			Grade bean = null ; 
			
			try {
				conn = this.getConnection() ;
				pstmt = conn.prepareStatement(sql) ;
				
				pstmt.setString(1, id); 
				pstmt.setString(2, s_code); 
				
				rs = pstmt.executeQuery() ;
				if(rs.next()) {
					bean = new Grade();
					
					bean.setStudent_id(rs.getString("student_id"));				
					bean.setTeacher_id(rs.getString("teacher_id"));		
					bean.setS_code(rs.getString("s_code"));
					bean.setLecture_score(rs.getInt("lecture_score"));
//					bean.setRemark(rs.getString("remark"));
					
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
		
		public List<Grade> SelectOneList(String id) {
			// 1건의 데이터를 조회합니다.
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			String sql = " select * from lecture where student_id = ? " ; 
			List<Grade> lists = new ArrayList<Grade>();
			Grade bean = null ; 
			
			try {
				conn = this.getConnection() ;
				pstmt = conn.prepareStatement(sql) ;
				
				pstmt.setString(1, id); 
				
				rs = pstmt.executeQuery() ;
				while(rs.next()) {
					bean = new Grade();
					
					bean.setStudent_id(rs.getString("student_id"));				
					bean.setTeacher_id(rs.getString("teacher_id"));		
					bean.setS_code(rs.getString("s_code"));
					bean.setLecture_score(rs.getInt("lecture_score"));
					bean.setRemark(rs.getString("remark"));
					lists.add(bean);
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
		
		public int UpdateData(Grade bean) {
			// 특정 회원에 대한 정보를 수정합니다.
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			
			String sql = " update lecture set " ;
			sql += " teacher_id=?, lecture_score=?, remark=?" ;
			sql += " where student_id= ? and s_code=?" ;
			
			int cnt = -999 ; 
			
			try {
				Class.forName(driver) ;
				conn = DriverManager.getConnection(url, this.id, password) ;
				conn.setAutoCommit(false);
				
				pstmt = conn.prepareStatement(sql) ;
				
				pstmt.setString(1, bean.getTeacher_id()) ;		
				pstmt.setInt(2, bean.getLecture_score()) ;
				pstmt.setString(3, bean.getRemark()) ;
				pstmt.setString(4, bean.getStudent_id()) ;
				pstmt.setString(5, bean.getS_code()) ;
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
		
		public List<Grade> SelectAll() {
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select * from Lecture " ;
			sql += " order by student_id asc " ; 
			
			List<Grade> lists = new ArrayList<Grade>() ;
			
			try {			
				conn = super.getConnection() ;
				pstmt = conn.prepareStatement(sql) ;
						
				rs = pstmt.executeQuery();				
				
				// while 구문을 사용하여 데이터 넣어 주기
				while(rs.next()) {
					Grade bean = new Grade(); 
					bean.setLecture_score(rs.getInt("lecture_score"));
					bean.setRemark(rs.getString("remark"));
					bean.setS_code(rs.getString("s_code"));
					bean.setStudent_id(rs.getString("student_id"));	
					bean.setTeacher_id(rs.getString("teacher_id"));	
					
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

		public List<Grade> selectMyList(String id) {
			// 1건의 데이터를 조회합니다.
						Connection conn = null ;
						PreparedStatement pstmt = null ;
						ResultSet rs = null ;
						String sql = " select student_id from student where lecture_room in(select lecture_room from teacher where teacher_id = ? ) " ; 
						List<Grade> lists = new ArrayList<Grade>(); 
						
						try {
							conn = this.getConnection() ;
							pstmt = conn.prepareStatement(sql) ;
							
							pstmt.setString(1, id); 
							
							rs = pstmt.executeQuery() ;
							while(rs.next()) {
								Grade bean = new Grade();
								bean.setStudent_id(rs.getString("student_id"));
								lists.add(bean);
								
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
		
//		public int DeleteData(String id) {
//			
//			Connection conn = null ;		
//			PreparedStatement pstmt = null ;
//			
//			int cnt = -999 ; 
//			
//			try {
//				Class.forName(driver) ;
//				conn = DriverManager.getConnection(url, this.id, password) ;
//				conn.setAutoCommit(false);
//				
//				String sql = "" ;
//				
//				Grade bean = this.SelectOne(id) ;
//				
//				
//				sql = " delete from lecture where student_id = ? and teacher_id = ? " ;
//				sql += " and s_code = ? " ;
//				
//				pstmt = conn.prepareStatement(sql) ;
//				
//				pstmt.setString(1, bean.getStudent_id());
//				pstmt.setString(2, bean.getTeacher_id());
//				pstmt.setString(3, bean.getS_code());
//				
//				cnt = pstmt.executeUpdate() ;
//				
//				
//				conn.commit();
//			} catch (Exception e) {
//				e.printStackTrace();
//				try {
//					conn.rollback();
//				} catch (SQLException e1) {
//					e1.printStackTrace();
//				}
//			} finally {
//				try {
//					if(pstmt != null) {pstmt.close();}
//					if(conn != null) {conn.close();}
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			return cnt ;
//		}

		
}
