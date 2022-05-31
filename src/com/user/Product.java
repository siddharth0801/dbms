package com.user;

public class Product {
	
	private int pid;
	private String pname;
	private int price;
	private String des;
	private String imageUrl;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid=pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Product(int pid,String pname, int price, String des) {
		super();
		this.pid=pid;
		this.pname = pname;
		this.price = price;
		this.des = des;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	

}
