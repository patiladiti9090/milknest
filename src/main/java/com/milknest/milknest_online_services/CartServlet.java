package com.milknest.milknest_online_services;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));

        HttpSession session = request.getSession();

        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart");

        if (cartList == null) {
            cartList = new ArrayList<Cart>();
        }

        // Create Cart Object
        Cart c = new Cart();
        c.setProductId(productId);
        c.setProductName(productName);
        c.setPrice(price);

        cartList.add(c);

        session.setAttribute("cart", cartList);

        // Redirect to cart page
        response.sendRedirect("frmCart.jsp");
    }
}