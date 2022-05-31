package com.operation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.Dao;
import com.user.Cart;

@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userName") == null) {
			System.out.println("Send to login page");
			response.sendRedirect("login.jsp");
			System.out.println("Did not work???");
		} else {

			response.setContentType("text/html;charset=UTF-8");

			try (PrintWriter out = response.getWriter()) {
//        	out.print("add to cart servlet");

				ArrayList<Cart> cartList = new ArrayList<>();
				int id = Integer.parseInt(request.getParameter("id"));
				Cart cm = new Cart();
				cm.setId(id);
				cm.setQuantity(1);
				session = request.getSession();
				ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
				if (cart_list == null) {
					cartList.add(cm);
					session.setAttribute("cart-list", cartList);
					response.sendRedirect("cart.jsp");
				} else {
					cartList = cart_list;

					boolean exist = false;
					for (Cart c : cart_list) {
						if (c.getId() == id) {
							exist = true;
							out.println(
									"<h1 style='color:crimson; text-align:center;'>Item Already in Cart, <a href='cart.jsp'>Go to Cart</a></h1>");
						}
					}

					if (!exist) {
						cartList.add(cm);
						response.sendRedirect("cart.jsp");
					}
				}
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}
}
