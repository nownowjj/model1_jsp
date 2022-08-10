package cosmo.board.bean;

public class Testboard {
	private int b_no;
	private String title;
	private String writer;
	private String b_date;
	private String b_content;
//	private int readhit;
	private String lecture_room;
	
	
	
	@Override
	public String toString() {
		return "Testboard [b_no=" + b_no + ", title=" + title + ", writer=" + writer + ", b_date=" + b_date
				+ ", b_content=" + b_content + ", lecture_room=" + lecture_room + "]";
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getLecture_room() {
		return lecture_room;
	}
	public void setLecture_room(String lecture_room) {
		this.lecture_room = lecture_room;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
//	public int getReadhit() {
//		return readhit;
//	}
//	public void setReadhit(int readhit) {
//		this.readhit = readhit;
//	}
	
	
}
