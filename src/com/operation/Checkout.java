package com.operation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.Dao;
import com.user.Cart;
import com.user.Customer;
import com.user.Product;


@WebServlet("/Checkout")
public class Checkout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String val = request.getParameter("sameadr");
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			String email = (String) session.getAttribute("userName");
			Dao d = new Dao();
			int cusId = d.getInfoInt(email);
			if (cart_list == null) {
				response.sendRedirect("cart.jsp");
			} else {

				int amount = 0;
				for (Cart c : cart_list) {
					Product pt = d.getP(c.getId());
					amount += pt.getPrice() * c.getQuantity();
				}
				if (!(val == null)) {
					String address = "Store Delivery";
					d.orderNow(cusId, address, amount, cart_list);
				} else {
					String address = request.getParameter("address") + ", " + request.getParameter("city") + ", "
							+ request.getParameter("zip") + ", " + request.getParameter("state");
					d.orderNow(cusId, address, amount, cart_list);

				}
				cart_list.removeAll(cart_list);
				response.sendRedirect("order.jsp");
			}
		}
	}

}
