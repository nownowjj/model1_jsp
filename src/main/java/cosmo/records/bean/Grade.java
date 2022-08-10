package cosmo.records.bean;

public class Grade {
	private String student_id ;		// 학생이름
	private String teacher_id ;		//
	private String s_code ;
	private int lecture_score ;
	private String remark ;
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public int getLecture_score() {
		return lecture_score;
	}
	public void setLecture_score(int lecture_score) {
		this.lecture_score = lecture_score;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Grade [student_id=" + student_id + ", teacher_id=" + teacher_id + ", s_code=" + s_code
				+ ", lecture_score=" + lecture_score + ", remark=" + remark + "]";
	}
	
	
	

}
