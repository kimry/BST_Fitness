package com.one.health.dto;

public class MembersDto {
	private String mid;
	private String name;
	private int ptpoint;
	private int flpoint;
	private int rent;
	private int price;
	
	public MembersDto() {
	}

	public MembersDto(String mid, String name, int ptpoint, int flpoint, int rent, int price) {
		this.mid = mid;
		this.name = name;
		this.ptpoint = ptpoint;
		this.flpoint = flpoint;
		this.rent = rent;
		this.price = price;
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

	public int getPtpoint() {
		return ptpoint;
	}

	public void setPtpoint(int ptpoint) {
		this.ptpoint = ptpoint;
	}

	public int getFlpoint() {
		return flpoint;
	}

	public void setFlpoint(int flpoint) {
		this.flpoint = flpoint;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
