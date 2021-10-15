package com.one.health.dto;

import java.io.Serializable;

public class QnaDto implements Serializable{

	private int qnum;
	private String id;		// 작성자
	
	private int ref;		// 그룹번호
	private int depth;		// 깊이
	
	private String title;	// 제목
	private String content;	// 내용
	private String wdate;	// 작성일	
	
	private int del;		// 삭제여부
	private int readcount;	// 조회수
	
	public QnaDto() {
	}

	public QnaDto(int qnum, String id, int ref, int depth, String title, String content, String wdate, int del,
			int readcount) {
		super();
		this.qnum = qnum;
		this.id = id;
		this.ref = ref;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}

	public QnaDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "QnaDto [qnum=" + qnum + ", id=" + id + ", ref=" + ref + ", depth=" + depth + ", title=" + title
				+ ", content=" + content + ", wdate=" + wdate + ", del=" + del + ", readcount=" + readcount + "]";
	}
	
	
}
