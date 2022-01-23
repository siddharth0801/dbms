package com.user;

public class Customer {
	
	private int customerId;
	private String Name;
	private String phoneNumber;
	private String gender;
	private String email;
	private String paasw;
	
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(int customerId, String name, String phoneNumber, String gender, String email, String paasw) {
		super();
		this.customerId = customerId;
		Name = name;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.email = email;
		this.paasw = paasw;
	}
	public Customer(String name, String phoneNumber, String gender, String email, String paasw) {
		super();
		Name = name;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.email = email;
		this.paasw = paasw;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPaasw() {
		return paasw;
	}
	public void setPaasw(String paasw) {
		this.paasw = paasw;
	}
	
	
	
		
}
