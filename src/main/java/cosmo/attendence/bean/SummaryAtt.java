package cosmo.attendence.bean;

public class SummaryAtt {
	//출결 요약을 위한 빈 객체
	private String attType;
	private int attCount;
	
	@Override
	public String toString() {
		return "SummaryAtt [attType=" + attType + ", attCount=" + attCount + "]";
	}
	public String getAttType() {
		return attType;
	}
	public void setAttType(String attType) {
		this.attType = attType;
	}
	public int getAttCount() {
		return attCount;
	}
	public void setAttCount(int attCount) {
		this.attCount = attCount;
	}
	
	
	
}
