package com.one.health.dto;

public class ReviewsDto {
	private int rnum;
	private String tid;
	private String mid;
	private String title;
	private String wdate;
	private int grade;
	private String content;
	private int rcm;
	private int ops;
	
	public ReviewsDto() {
		
	}
	
	public ReviewsDto(int rnum, String tid, String mid, String title, String wdate, int grade, String content, int rcm, int ops) {
		this.rnum = rnum;
		this.tid = tid;
		this.mid = mid;
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
}
