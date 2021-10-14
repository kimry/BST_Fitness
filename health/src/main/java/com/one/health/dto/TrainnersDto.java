package com.one.health.dto;

public class TrainnersDto {
	private String tid;
	private String name;
	private int field;
	private String career;
	private String content;
	
	public TrainnersDto()
	{
	}
	public TrainnersDto(String tid, String name, int field, String career, String content) {
		this.tid = tid;
		this.name = name;
		this.field = field;
		this.career = career;
		this.content = content;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getField() {
		return field;
	}
	public void setField(int field) {
		this.field = field;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
