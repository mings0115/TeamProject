package group1.dto;

import java.sql.Timestamp;

public class CommentVO {
	private int no;

	private int boardno;
	private int comentno;
	private Timestamp indate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public int getComentno() {
		return comentno;
	}

	public void setComentno(int comentno) {
		this.comentno = comentno;
	}

	public Timestamp getIndate() {
		return indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

}
