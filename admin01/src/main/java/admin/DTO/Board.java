package admin.DTO;

import java.util.Date;

public class Board {
	
	private int no;
	private String title;
	private String userId;
	private String content;
	private Date regDate;
	private Date updDate;

	public Board() {
		
	}
	
	public Board(String title, String userId, String content) {
		this.title = title;
		this.userId = userId;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdDate() {
		return updDate;
	}

	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", userId=" + userId + ", content=" + content + ", regDate="
				+ regDate + ", updDate=" + updDate + "]";
	}
	
	
}
