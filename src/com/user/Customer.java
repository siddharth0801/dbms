package com.user;

public class Customer {
	
	private int customerId;
	private String Name;
	private String email;
	private String password;
	private String registration_date;
	private String phoneNumber;
	private String gender;
	
	public Customer(int customerId, String name, String email, String password, String registration_date,
			String phoneNumber, String gender) {
		super();
		this.customerId = customerId;
		Name = name;
		this.email = email;
		this.password = password;
		this.registration_date = registration_date;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
	}
	
	public Customer() {
		super();
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
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
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
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
