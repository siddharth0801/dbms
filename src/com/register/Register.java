package com.register;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.Crud;
import com.login.dao.Dao;
import com.user.Customer;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("Name");
		String phone=request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		if(name.isEmpty()||gender.isEmpty()) {
			response.sendRedirect("error.jsp");
		}
		else if(phone.length()>10){
			response.sendRedirect("allerror.jsp");
		}
		else {
	    	String email=request.getParameter("email");
			String passw=request.getParameter("passw");
			Customer c1 = new Customer(name,phone, gender, passw, email);
			
			
			System.out.println(c1.toString());
			
//			boolean ans = Crud.insert(c1);
//				String uname=request.getParameter("uname");
//				String passw=request.getParameter("passw");
//				c1.setEmail(uname);
//				c1.setPaasw(passw);
				Crud.insert(c1);
				response.sendRedirect("login.jsp");
			
				System.out.println("Something went wrong..");
			
		}
		
		
		
	}

}
