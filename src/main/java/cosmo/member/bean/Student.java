package cosmo.member.bean;

public class Student {
	private String student_id;
	private String student_name;
	private String student_password;
	private String student_gender;
	private String student_birth;
	private String student_address;
	private String lecture_room;
	private int status = 1;
	
	
	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", student_name=" + student_name + ", student_password="
				+ student_password + ", student_gender=" + student_gender + ", student_birth=" + student_birth
				+ ", student_address=" + student_address + ", lecture_room=" + lecture_room + ", status=" + status
				+ "]";
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
	public String getStudent_password() {
		return student_password;
	}
	public void setStudent_password(String student_password) {
		this.student_password = student_password;
	}
	public String getStudent_gender() {
		return student_gender;
	}
	public void setStudent_gender(String student_gender) {
		this.student_gender = student_gender;
	}
	public String getStudent_birth() {
		return student_birth;
	}
	public void setStudent_birth(String student_birth) {
		this.student_birth = student_birth;
	}
	public String getStudent_address() {
		return student_address;
	}
	public void setStudent_address(String student_address) {
		this.student_address = student_address;
	}
	public String getLecture_room() {
		return lecture_room;
	}
	public void setLecture_room(String lecture_room) {
		this.lecture_room = lecture_room;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	
	
	
	
}
