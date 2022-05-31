package com.user;

public class Customer {

	private String Name;
	private String email;
	private String password;
	private String phoneNumber;
	private String gender;

	public Customer(String name, String phone, String gender, String passw, String email) {
		super();
		this.email = email;
		Name = name;
		this.password = passw;
		this.phoneNumber = phone;
		this.gender = gender;
	}

	public Customer() {
		super();
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
