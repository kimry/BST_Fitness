package com.one.health.dto;

public class rDto {
	private int rnum;
	private String tid;
	private String mid;
	private String name;
	private String title;
	private String wdate;
	private int grade;
	private String content;
	private int rcm;
	private int ops;
	
	public rDto() {
		
	}
	public rDto(int rnum, String tid, String mid, String name, String title, String wdate, int grade, String content,
			int rcm, int ops) {
		super();
		this.rnum = rnum;
		this.tid = tid;
		this.mid = mid;
		this.name = name;
		this.title = title;
		this.wdate = wdate;
		this.grade = grade;
		this.content = content;
		this.rcm = rcm;
		this.ops = ops;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRcm() {
		return rcm;
	}
	public void setRcm(int rcm) {
		this.rcm = rcm;
	}
	public int getOps() {
		return ops;
	}
	public void setOps(int ops) {
		this.ops = ops;
	}
	@Override
	public String toString() {
		return "rDto [rnum=" + rnum + ", tid=" + tid + ", mid=" + mid + ", name=" + name + ", title=" + title
				+ ", wdate=" + wdate + ", grade=" + grade + ", content=" + content + ", rcm=" + rcm + ", ops=" + ops
				+ "]";
	}
	
	
}
