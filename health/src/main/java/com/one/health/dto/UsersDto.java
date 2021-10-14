package com.one.health.dto;

public class UsersDto {
	private String id;
	private String pw;
	private String name;
	private int age;
	private String email;
	private String phone;
	private int auth;
	
	
	public UsersDto() {
	}

	public UsersDto(String id, String pw, String name, int age, String email, String phone, int auth) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "UsersDto [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", email="
				+ email + ", phone=" + phone + ", auth=" + auth + "]";
	}
	
}
