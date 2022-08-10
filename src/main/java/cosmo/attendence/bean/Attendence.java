package cosmo.attendence.bean;

public class Attendence {
	private int a_no;
	private String student_id ;//아이디
	private String student_name ;//이름
	private String att_date ;//출결일
	private String att ;//출결여부
	private String reason;//사유
	private String remark;//비고

	
	
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	@Override
	public String toString() {
		return "Attendence [a_no=" + a_no + ", student_id=" + student_id + ", student_name=" + student_name
				+ ", att_date=" + att_date + ", att=" + att + ", reason=" + reason + ", remark=" + remark + "]";
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getAtt_date() {
		return att_date;
	}
	public void setAtt_date(String att_date) {
		this.att_date = att_date;
	}
	public String getAtt() {
		return att;
	}
	public void setAtt(String att) {
		this.att = att;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
