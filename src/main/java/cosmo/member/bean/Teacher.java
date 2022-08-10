package cosmo.member.bean;

public class Teacher {
	private String teacher_id;
	private String teacher_name;
	private String teacher_password;
	private String teacher_gender;
	private String teacher_birth;
	private String teacher_address;
	private String lecture_room;
	private int status = 3;
	
	
	@Override
	public String toString() {
		return "Teacher [teacher_id=" + teacher_id + ", teacher_name=" + teacher_name + ", teacher_password="
				+ teacher_password + ", teacher_gender=" + teacher_gender + ", teacher_birth=" + teacher_birth
				+ ", teacher_address=" + teacher_address + ", lecture_room=" + lecture_room + ", status=" + status
				+ "]";
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_password() {
		return teacher_password;
	}
	public void setTeacher_password(String teacher_password) {
		this.teacher_password = teacher_password;
	}
	public String getTeacher_gender() {
		return teacher_gender;
	}
	public void setTeacher_gender(String teacher_gender) {
		this.teacher_gender = teacher_gender;
	}
	public String getTeacher_birth() {
		return teacher_birth;
	}
	public void setTeacher_birth(String teacher_birth) {
		this.teacher_birth = teacher_birth;
	}
	public String getTeacher_address() {
		return teacher_address;
	}
	public void setTeacher_address(String teacher_address) {
		this.teacher_address = teacher_address;
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
