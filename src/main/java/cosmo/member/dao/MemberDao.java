package cosmo.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cosmo.member.bean.Member;
import cosmo.member.bean.Student;
import cosmo.member.bean.Teacher;

/*
DAO(Data Access Object)
데이터 베이스와 연동하여 sql 작업을 수행해주는 대행자 클래스
통상적으로 단위 업무는 메소드 단위로 처리합니다.
*/
// 아이디와 비밀 번호를 이용하여 로그인 테스트를 수행합니다.
public class MemberDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	// 만약 데이터베이스 작동이 안될 경우에 아래  id와 password를 오라클 접속 아이디로 바꿔주세요
	String id = "prac";
	String password = "prac";

	public MemberDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, id, password);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// 관리자로 로그인이 되었을경우 실행되는 메소드
	public Member MemberCheck(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from members ";
		sql += " where member_id = ? and member_password = ? ";

		Member bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new Member();

				bean.setId(rs.getString("member_id"));
				bean.setName(rs.getString("member_name"));
				bean.setPassword(rs.getString("member_password"));
				bean.setStatus(rs.getInt("status"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bean;
	}
	// 학생 아이디로 접근시 오게되는 메소드
	public Student StudentCheck(String id2, String password2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from student ";
		sql += " where student_id = ? and student_password = ? ";

		Student bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id2);
			pstmt.setString(2, password2);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new Student();

				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setStudent_address(rs.getString("student_address"));
				bean.setStudent_birth(rs.getString("student_birth"));
				bean.setStudent_gender(rs.getString("student_gender"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setStudent_password(rs.getString("student_password"));
				bean.setStatus(rs.getInt("status"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}
	// 강사 아이디로 접근시 오게되는 메소드
	public Teacher TeacherCheck(String id2, String password2) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from teacher ";
		sql += " where teacher_id = ? and teacher_password = ? ";

		Teacher bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id2);
			pstmt.setString(2, password2);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new Teacher();

				bean.setTeacher_address(rs.getString("teacher_address"));
				bean.setTeacher_birth(rs.getString("teacher_birth"));
				bean.setTeacher_gender(rs.getString("teacher_gender"));
				bean.setTeacher_id(rs.getString("teacher_id"));
				bean.setTeacher_name(rs.getString("teacher_name"));
				bean.setTeacher_password(rs.getString("teacher_password"));
				bean.setStatus(rs.getInt("status"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bean;
	}
	public int InsertTeacherData(Teacher teabean) {
		// 회원 1명을 추가합니다.
		System.out.println(teabean) ;		
		
		Connection conn = null ;
		PreparedStatement pstmt = null ; 
		int cnt = -999 ; 

		// Statememt
		String sql = " insert into teacher(teacher_id, teacher_name, teacher_password, teacher_gender, teacher_birth, teacher_address, lecture_room,status ) " ;
		sql += " values(?,?,?,?,?,?,?,?) " ; 
		
		try {
			Class.forName(driver) ;

			conn = DriverManager.getConnection(url, id, password) ;
			conn.setAutoCommit(false); // 트랜잭션 기능 잠시 off
			
//			if (conn != null) {
//				System.out.println("접속 성공") ;
//			} else {
//				System.out.println("접속 실패") ;
//			}
			
			pstmt = conn.prepareStatement(sql) ; 
			
			pstmt.setString(1, teabean.getTeacher_id());
			pstmt.setString(2, teabean.getTeacher_name());
			pstmt.setString(3, teabean.getTeacher_password());
			pstmt.setString(4, teabean.getTeacher_gender());
			pstmt.setString(5, teabean.getTeacher_birth());
			pstmt.setString(6, teabean.getTeacher_address());
			pstmt.setString(7, teabean.getLecture_room());
			pstmt.setInt(8, teabean.getStatus());			
			
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
		

	public int InsertStudentData(Student stubean) {	// 학생으로 가입시 메소드
		// 회원 1명을 추가합니다.
				System.out.println(stubean) ;		
				
				Connection conn = null ;
				PreparedStatement pstmt = null ; 
				int cnt = -999 ; 

				// Statememt
				String sql = " insert into student(student_id, student_name, student_password, student_gender, student_birth, student_address, lecture_room,status ) " ;
				sql += " values(?,?,?,?,?,?,?,?) " ; 
				
				try {
					Class.forName(driver) ;

					conn = DriverManager.getConnection(url, id, password) ;
					conn.setAutoCommit(false); // 트랜잭션 기능 잠시 off
					
//					if (conn != null) {
//						System.out.println("접속 성공") ;
//					} else {
//						System.out.println("접속 실패") ;
//					}
					
					pstmt = conn.prepareStatement(sql) ; 
					
					pstmt.setString(1, stubean.getStudent_id());
					pstmt.setString(2, stubean.getStudent_name());
					pstmt.setString(3, stubean.getStudent_password());
					pstmt.setString(4, stubean.getStudent_gender());
					pstmt.setString(5, stubean.getStudent_birth());
					pstmt.setString(6, stubean.getStudent_address());
					pstmt.setString(7, stubean.getLecture_room());
					pstmt.setInt(8, stubean.getStatus());			
					
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

	public List<Student> showMyStudent(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
			String sql = " select * from student ";
			sql += " where lecture_room in( ";
			sql += " select lecture_room ";
			sql += " from teacher ";
			sql += " where teacher_id = ?) ";
		
		List<Student> lists = new ArrayList<Student>();
		Student bean = null;
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new Student();

				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setStudent_address(rs.getString("student_address"));
				bean.setStudent_birth(rs.getString("student_birth"));
				bean.setStudent_gender(rs.getString("student_gender"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				lists.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}
	public int GetTotalCount(String mode, String keyword) {
		// 전체 튜플 수를 찾는 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from( select * from student ";
		
		if((mode.equals("all")==false)) {
			sql+= " where "+ mode+" like '%"+keyword+"%' " ;
		}
		sql+=" ) ";
		int cnt=-999; // 조회된 데이터 건 수
		try {
			conn= this.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int GetTotalCount2(String mode, String keyword) {
		// 전체 튜플 수를 찾는 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from( select * from teacher ";
		
		if((mode.equals("all")==false)) {
			sql+= " where "+ mode+" like '%"+keyword+"%'" ;
		}
		sql+=" ) ";
		
		int cnt=-999; // 조회된 데이터 건 수
		try {
			conn= this.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
/*
	public int GetTotalCount(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from student where lecture_room in ( select lecture_room from teacher where teacher_id = ?) ";
		int cnt=-999; // 조회된 데이터 건 수
		try {
			conn= this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	*/
	public List<Student> showAllStudent(String mode, String keyword, int beginRow, int endRow){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql=" select * from ";
		sql +=" (select row_number() over(order by lecture_room, student_name asc) as ranking , ";
		sql +=" student_id, student_name, student_address, student_gender, ";
		sql +=" student_birth, lecture_room from student) where ";
		if((mode.equals("all")==false)) {
			sql+= mode+" like '%"+keyword+"%' and " ;
		}
		sql +=" ranking between ? and ? ";
		
		List<Student> lists = new ArrayList<Student>();
		Student bean = null;
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new Student();
				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setStudent_address(rs.getString("student_address"));
				bean.setStudent_birth(rs.getString("student_birth"));
				bean.setStudent_gender(rs.getString("student_gender"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				lists.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}

	public List<Teacher> showAllTeacher(String mode, String keyword,int beginRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*
			String sql = " select * from student ";
			sql += " where lecture_room in( ";
			sql += " select lecture_room ";
			sql += " from teacher ";
			sql += " where teacher_id = ?) ";
		*/
		String sql=" select * from ";
		sql +=" (select row_number() over(order by lecture_room, teacher_name asc) as ranking , ";
		sql +=" teacher_id, teacher_name, teacher_address, teacher_gender, ";
		sql +=" teacher_birth, lecture_room from teacher) where ";
		if((mode.equals("all")==false)) {
			sql+= mode+" like '%"+keyword+"%' and " ;
		}
		sql +=" ranking between ? and ? ";
		
		List<Teacher> lists = new ArrayList<Teacher>();
		Teacher bean = null;
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new Teacher();
				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setTeacher_address(rs.getString("teacher_address"));
				bean.setTeacher_birth(rs.getString("teacher_birth"));
				bean.setTeacher_gender(rs.getString("teacher_gender"));
				bean.setTeacher_id(rs.getString("teacher_id"));
				bean.setTeacher_name(rs.getString("teacher_name"));
				lists.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}

	public Student selectOneStudent(String id2) {
		// 회원 정보 수정을 위해서 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from student ";
		sql += " where student_id = ? ";

		Student bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id2);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new Student();

				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setStudent_address(rs.getString("student_address"));
				bean.setStudent_birth(rs.getString("student_birth"));
				bean.setStudent_gender(rs.getString("student_gender"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setStudent_password(rs.getString("student_password"));
				bean.setStatus(rs.getInt("status"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	public Teacher selectOneTeacher(String id2) {
		// 강사 회원 정보를 수정하기 위한 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from teacher ";
		sql += " where teacher_id = ? ";

		Teacher bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id2);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new Teacher();
				bean.setLecture_room(rs.getString("lecture_room"));
				bean.setTeacher_address(rs.getString("teacher_address"));
				bean.setTeacher_birth(rs.getString("teacher_birth")); 
				bean.setTeacher_gender(rs.getString("teacher_gender"));
				bean.setTeacher_id(rs.getString("teacher_id"));
				bean.setTeacher_name(rs.getString("teacher_name"));
				bean.setTeacher_password(rs.getString("teacher_password"));
				bean.setStatus(rs.getInt("status"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bean;
	}

	public void UpdateStudent(Student bean) {
		Connection conn = null ;
		PreparedStatement pstmt = null ; 

		String sql =" update student set ";
		sql+=" student_name=?, student_password=?, student_gender=?, student_birth=?, student_address=?, lecture_room=?, status=? ";
		sql+=" where student_id = ? ";
		
		try {
			Class.forName(driver) ;

			conn = this.getConnection();
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ; 
			
			pstmt.setString(1, bean.getStudent_name());
			pstmt.setString(2, bean.getStudent_password());
			pstmt.setString(3, bean.getStudent_gender());
			pstmt.setString(4, bean.getStudent_birth());
			pstmt.setString(5, bean.getStudent_address());
			pstmt.setString(6, bean.getLecture_room());
			pstmt.setInt(7, bean.getStatus());			
			pstmt.setString(8, bean.getStudent_id());
			pstmt.executeUpdate() ;
			
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
	}
	public void UpdateTeacher(Teacher bean) {
		Connection conn = null ;
		PreparedStatement pstmt = null ; 

		String sql =" update teacher set ";
		sql+=" teacher_name=?, teacher_password=?, teacher_gender=?, teacher_birth=?, teacher_address=?, lecture_room=? ";
		sql+=" where teacher_id = ? ";
		
		try {
			Class.forName(driver) ;

			conn = this.getConnection();
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ; 
			
			pstmt.setString(1, bean.getTeacher_name());
			pstmt.setString(2, bean.getTeacher_password());
			pstmt.setString(3, bean.getTeacher_gender());
			pstmt.setString(4, bean.getTeacher_birth());
			pstmt.setString(5, bean.getTeacher_address());
			pstmt.setString(6, bean.getLecture_room());		
			pstmt.setString(7, bean.getTeacher_id());
			pstmt.executeUpdate() ;
			
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
	}
}
