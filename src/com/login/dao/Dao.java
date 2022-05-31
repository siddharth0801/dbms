package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.db.Connectdb;
import com.user.Cart;
import com.user.Customer;

import com.user.Product;

public class Dao {

	public boolean orderNow(int cusId, String address, int amount, ArrayList<Cart> cart_list) {

		Connection con = Connectdb.connect();
		String sql = "INSERT INTO public.\"order\"(customerid, amount, shipping_address) VALUES (?, ?, ?)";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, cusId);
			pstmt.setInt(2, amount);
			pstmt.setString(3, address.trim());
			
			pstmt.execute(); 
			ResultSet rs = pstmt.getGeneratedKeys();
			int generatedKey = 0;
			if (rs.next()) {
			    generatedKey = rs.getInt(1);
			}
			System.out.println("Inserted record's ID: " + generatedKey);
			
			for (Cart c : cart_list) {
				Product pt = getP(c.getId());
				orderProduct(generatedKey,pt.getPid(),c.getQuantity(),pt.getPrice());
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private void orderProduct(int oid, int pid, int q, int p) {
		
		Connection con = Connectdb.connect();
		String sql = "INSERT INTO public.order_product(orderid, product_id, quantity, price)VALUES (?, ?, ?, ?)";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, oid);
			pstmt.setInt(2, pid);
			pstmt.setInt(3, q);
			pstmt.setInt(4, p);
			pstmt.execute(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public boolean check(String uname, String passw) {
		System.out.println("In LoginDao");
		Connection con = Connectdb.connect();
		String sql = "Select * from Customer where email=? and password=?";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, passw);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

	public int getCustId(Customer pt) {

		System.out.println("In LoginDao  getpartyid");
		Connection con = Connectdb.connect();
		String sql = "Select * from Customer where Phone=?";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pt.getPhoneNumber());

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return -1;
	}

//	public ArrayList<Party> getList(String fname, String lname) {
//		ArrayList<Party> al = new ArrayList<Party>();
//
//		Connection con = Connectdb.connect();
//		String sql = "select * from Products where Upper(firstName)=Upper(?) or Upper(lastName)=Upper(?)";
//		PreparedStatement pstmt;
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, fname);
//			pstmt.setString(2, lname);
//
//			ResultSet rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//
//				Party pt = new Party();
//				pt.setFirstName(rs.getString(2));
//				pt.setLastname(rs.getString(3));
//				pt.setAddress(rs.getString(4));
//				pt.setCity(rs.getString(5));
//				pt.setZip(rs.getString(6));
//				pt.setState(rs.getString(7));
//				pt.setCountry(rs.getString(8));
//				pt.setPhone(rs.getString(9));
//				pt.setPartyId(rs.getInt(1));
//				al.add(pt);
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return al;
//
//	}

	public Product getP(int id) {

		Connection con = Connectdb.connect();
		String sql = "select * from Product where product_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("rs: " + rs);
			Product pt = new Product();
			rs.next();
			pt.setImageUrl(rs.getString("imageUrl"));
			pt.setPrice(rs.getInt("price"));
			pt.setPid(rs.getInt("product_id"));
			pt.setDes(rs.getString("description"));
			pt.setPname(rs.getString("product_name"));
			return pt;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public Customer getInfo(String email) {

		Connection con = Connectdb.connect();
		String sql = "select * from Customer where email=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("rs: " + rs);
			Customer cus = new Customer();
			rs.next();
			cus.setGender(rs.getString("gender"));
			cus.setName(rs.getString("name"));
			cus.setPhoneNumber(rs.getString("phone_number"));
			cus.setEmail(rs.getString("email"));
			return cus;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public int getInfoInt(String email) {

		Connection con = Connectdb.connect();
		String sql = "select * from Customer where email=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			return rs.getInt("customer_id");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Product> getP(String pname) {
		ArrayList<Product> al = new ArrayList<Product>();

		Connection con = Connectdb.connect();
		String sql = "select * from Product where product_name LIKE ?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + pname + "%");
			ResultSet rs = pstmt.executeQuery();
			System.out.println("rs: " + rs);
			while (rs.next()) {

				Product pt = new Product();
				pt.setImageUrl(rs.getString("imageUrl"));
				pt.setPid(rs.getInt("product_id"));
				pt.setPname(rs.getString("product_name"));
				pt.setPrice(rs.getInt("Price"));
				pt.setDes(rs.getString("description"));

				al.add(pt);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(al.size());
		return al;
	}

	public ArrayList<Product> getList() {
		System.out.println("In Product getList");
		ArrayList<Product> al = new ArrayList<Product>();

		Connection con = Connectdb.connect();
		String sql = "select * from Product";
		Statement stmt;
		try {
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {

				Product pt = new Product();
				pt.setImageUrl(rs.getString("imageUrl"));
				pt.setPid(rs.getInt("product_id"));
				pt.setPname(rs.getString("product_name"));
				pt.setPrice(rs.getInt("Price"));
				pt.setDes(rs.getString("description"));

				al.add(pt);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(al.size());
		return al;

	}

	public ArrayList<Product> getList(String val, String id) {
		System.out.println("In Product getList");
		ArrayList<Product> al = new ArrayList<Product>();

		Connection con = Connectdb.connect();
		String sql;
		if (val.equals("Category")) {
			sql = "select * from Product Natural Join Category where category_id=?";
		} else {
			sql = "select * from Product Natural Join brands where brand_id=?";
		}
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println("In Dao");
			if (id.equals("C")) {
				pstmt.setInt(1, 1);
			} else if (id.equals("F")) {
				pstmt.setInt(1, 2);
			} else if (id.equals("E")) {
				pstmt.setInt(1, 3);
			} else if (id.equals("hrx")) {
				pstmt.setInt(1, 100);
			} else if (id.equals("mi")) {
				pstmt.setInt(1, 101);
			} else if (id.equals("nestle")) {
				pstmt.setInt(1, 102);
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Product pt = new Product();
				pt.setImageUrl(rs.getString("imageUrl"));
				pt.setPid(rs.getInt("product_id"));
				pt.setPname(rs.getString("product_name"));
				pt.setPrice(rs.getInt("Price"));
				pt.setDes(rs.getString("description"));

				al.add(pt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(al.size());
		return al;

	}
}

//	public static Party selectUser(int id) {
//		Party pt = null;
//		Connection con = Connectdb.connect();
//		String sql = "Select * from Party where Partyid=?";
//		PreparedStatement pstmt;
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, id);
//			ResultSet rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				String fname = rs.getString(2);
//				String lname = rs.getString(3);
//				String add = rs.getString(4);
//				String city = rs.getString(5);
//				String zip = rs.getString(6);
//				String state = rs.getString(7);
//				String country = rs.getString(8);
//				String phone = rs.getString(9);
//
//				pt = new Party(fname, lname, add, city, zip, state, country, phone);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return pt;
//	}
//
//}
