package cosmo.attendence.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oreilly.servlet.Base64Encoder;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.bean.SummaryAtt;

public class AttendenceDao extends cosmo.common.dao.SuperDao {
	public AttendenceDao() {

	}

	public List<Attendence> SelectAll(String mode, String keyword, int beginrow, int endrow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select * from( ";
		sql+=" select row_number() over(order by att_date desc , student_name asc ) as ranking , a_no, student_id , student_name, att , att_date , reason, remark ";
		sql+=" from attendence ";
		
		
		if((mode.equals("all")==false)) {
			sql+= " where "+mode+" like '%"+keyword+"%'" ;
		}
		sql+=" ) where ranking between ? and ?  ";

		List<Attendence> lists = new ArrayList<Attendence>();

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, beginrow);
			pstmt.setInt(2, endrow);
			
			rs = pstmt.executeQuery();

			// while 구문을 사용하여 데이터 넣어 주기
			while (rs.next()) {
				Attendence bean = new Attendence();
				bean.setA_no(rs.getInt("a_no"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setAtt_date(rs.getString("att_date"));
				bean.setAtt(rs.getString("att"));
				bean.setReason(rs.getString("reason"));
				bean.setRemark(rs.getString("remark"));
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
	
	public int UpdateData(Attendence bean) {
		// 특정 회원에 대한 정보를 수정합니다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = " update attendence set ";
		sql += " att=?, reason=? ";
		sql += " where a_no=? ";

		int cnt = -999;

		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getAtt());
			pstmt.setString(2, bean.getReason());
			pstmt.setInt(3,bean.getA_no());
			cnt = pstmt.executeUpdate();

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
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	public int UpdateData_1(Attendence bean) {
		// 특정 회원에 대한 정보를 수정합니다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = " update attendence set ";
		sql += " att=?, reason=?";
		sql += " where a_no=? ";

		int cnt = -999;

		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, bean.getAtt());
			pstmt.setString(2, bean.getReason());
			pstmt.setInt(3, bean.getA_no());
			cnt = pstmt.executeUpdate();

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
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	// 아직 고민중
	public void InsertGroup(List<Attendence> lists) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql="";
			sql = " insert into attendence(a_no, student_id, student_name, att_date, att, reason) ";
			sql += " values(attseq.nextval, ?, ?, sysdate, ?, ?)";
			
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			for(Attendence vo : lists) {
				pstmt.setString(1, vo.getStudent_id());
				System.out.println(vo.getStudent_id());
				pstmt.setString(2, vo.getStudent_name());
				System.out.println(vo.getStudent_name());
				pstmt.setString(3, vo.getAtt());
				System.out.println(vo.getAtt());
				pstmt.setString(4, vo.getReason());
				System.out.println("한바퀴");
				pstmt.addBatch();
			    pstmt.clearParameters(); //파라미터 초기화
			}
			
			pstmt.executeBatch();
			pstmt.clearParameters();
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
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public List<SummaryAtt> SelectOneCount(String studnet_id) {
		// 학생 본인의 출석 통계를 낸다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select distinct att, count(att) as cnt";
		sql += " from attendence ";
		sql += " where student_id = ? ";
		sql += " group by att ";

		List<SummaryAtt> lists = new ArrayList<SummaryAtt>();

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, studnet_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SummaryAtt bean = new SummaryAtt();
				bean.setAttType(rs.getString("att"));
				bean.setAttCount(Integer.parseInt(rs.getString("cnt")));
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
	
	public Attendence SelectOneUpdate(int a_no) {
		// 새롭게 만든 selectOne 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * ";
		sql += " from attendence ";
		sql += " where a_no = ? ";

		Attendence bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, a_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new Attendence();
				bean.setA_no(rs.getInt("a_no"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setAtt_date(rs.getString("att_date"));
				bean.setAtt(rs.getString("att"));
				bean.setReason(rs.getString("reason"));
				
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

	public List<Attendence> SelectOne(String student_id, int beginRow, int endRow) {
		// 1명의 출석 통계를 보낸다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*
		String sql = " select * ";
		sql += " from attendence ";
		sql += " where student_id = ? ";
		*/
		String sql=" select * from ( ";
		sql+=" select row_number() over (order by att_date) as ranking, student_id, student_name,att_date, reason, att ";
		sql+=" from( select * from attendence ";
		sql+=" where student_id =?)) where ranking between ? and ? ";
		
		
		List<Attendence> lists = new ArrayList<Attendence>();

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, student_id);
			pstmt.setInt(2, beginRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Attendence bean = new Attendence();
				
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setAtt_date(rs.getString("att_date"));
				bean.setAtt(rs.getString("att"));
				bean.setReason(rs.getString("reason"));
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
	public int GetTotalCount() {
		// 전체 튜플 수를 찾는 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from student ";
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
	
	public int GetTotalCount(String id, String mode, String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from attendence ";
				sql+= " where student_id in(select student_id from student ";
				sql+= " where lecture_room in (  select lecture_room  from teacher  where teacher_id = ?)) ";
				System.out.println("kmkm"+mode +"key"+ keyword);
				if((mode.equals("all")==false)) {
					sql+=" and " + mode+" like '%"+keyword+"%' " ;
				}
				System.out.println(this.getClass()+ " : "+sql);
				
		int cnt=-999; // 조회된 데이터 건 수
		try {
			conn= this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				System.out.println("카운트 수:"+cnt);
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

	public int GetTotalCount(String mode, String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from attendence ";
				System.out.println("kmkm"+mode +"key"+ keyword);
				if((mode.equals("all")==false)) {
					sql+=" where " + mode+" like '%"+keyword+"%' " ;
				}
				System.out.println(this.getClass()+ " : "+sql);
				
		int cnt=-999; // 조회된 데이터 건 수
		try {
			conn= this.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				System.out.println("카운트 수:"+cnt);
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
	
	
	public List<Attendence> SelectGroup(String teacher_id, String mode, String keyword, int beginrow, int endrow) {
		// 1명의 출석 통계를 보낸다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from ";
		sql += " (select row_number() over(order by att_date desc) as ranking , a_no, student_id , student_name, att , att_date , reason, remark ";
		sql += " from( select * from(select * from attendence where student_id in ( ";
		sql += " select distinct student_id from lecture ";
		sql += " where teacher_id = ?))) ";
		
		
		if((mode.equals("all")==false)) {
			sql+= " where "+mode+" like '%"+keyword+"%'" ;
		}
		sql += " ) where ranking between ? and ? ";
		
		
		List<Attendence> lists = new ArrayList<Attendence>();

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, teacher_id);
			pstmt.setInt(2, beginrow);
			pstmt.setInt(3, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Attendence bean = new Attendence();
				bean.setA_no(rs.getInt("a_no"));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setAtt_date(rs.getString("att_date"));
				bean.setAtt(rs.getString("att"));
				bean.setReason(rs.getString("reason"));
				bean.setRemark(rs.getString("remark"));
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

	public Attendence selectMyStudent(String id, String wtime) {
		//학생 한명 수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * ";
		sql += " from attendence ";
		sql += " where student_id = ? and a_no=? ";
		Attendence bean = null;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, wtime);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new Attendence();
				bean.setA_no(Integer.parseInt(rs.getString("a_no")));
				bean.setStudent_id(rs.getString("student_id"));
				bean.setStudent_name(rs.getString("student_name"));
				bean.setAtt_date(rs.getString("att_date"));
				bean.setAtt(rs.getString("att"));
				bean.setReason(rs.getString("reason"));
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

	public int GetTotalCount2(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =" select count(*) as cnt from attendence where student_id = ? ";
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
	

}