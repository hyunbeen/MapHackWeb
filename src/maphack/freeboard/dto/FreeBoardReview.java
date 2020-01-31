package maphack.freeboard.dto;

public class FreeBoardReview {
	private String brNum;
	private String brBnum;
	private String brContent;
	private String brDate;
	public String getBrNum() {
		return brNum;
	}
	public void setBrNum(String brNum) {
		this.brNum = brNum;
	}
	public String getBrBnum() {
		return brBnum;
	}
	public void setBrBnum(String brBnum) {
		this.brBnum = brBnum;
	}
	public String getBrContent() {
		return brContent;
	}
	public void setBrContent(String brContent) {
		this.brContent = brContent;
	}
	public String getBrDate() {
		return brDate;
	}
	public void setBrDate(String brDate) {
		this.brDate = brDate;
	}
	public String getBrMid() {
		return brMid;
	}
	public void setBrMid(String brMid) {
		this.brMid = brMid;
	}
	private String brMid;
}
