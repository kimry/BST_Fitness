package com.one.health.dto;

public class sDto {
	private int snum;
	private String tid;
	private String mid;
	private String name;
	private String ptdate;
	private int times;
	
	sDto(){
	}

	public sDto(int snum, String tid, String mid, String name, String ptdate, int times) {
		super();
		this.snum = snum;
		this.tid = tid;
		this.mid = mid;
		this.name = name;
		this.ptdate = ptdate;
		this.times = times;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
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

	public String getPtdate() {
		return ptdate;
	}

	public void setPtdate(String ptdate) {
		this.ptdate = ptdate;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	@Override
	public String toString() {
		return "sDto [snum=" + snum + ", tid=" + tid + ", mid=" + mid + ", name=" + name + ", ptdate=" + ptdate
				+ ", times=" + times + "]";
	}
}
