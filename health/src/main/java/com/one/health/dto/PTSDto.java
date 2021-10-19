package com.one.health.dto;

public class PTSDto {
	private int snum;
	private String tid;
	private String mid;
	private String ptdate;
	private int times;
	
	public PTSDto() {
		
	}
	
	public PTSDto(int snum, String tid, String mid, String ptdate, int times) {
		this.snum = snum;
		this.tid = tid;
		this.mid = mid;
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
		return "PTSDto [snum=" + snum + ", tid=" + tid + ", mid=" + mid + ", ptdate=" + ptdate + ", times=" + times + "]";
	}
	
}
