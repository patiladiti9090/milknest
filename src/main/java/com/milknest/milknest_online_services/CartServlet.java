package com.milknest.milknest_online_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ✅ GET DATA FROM FORM
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));

            int userId = 1; // 🔥 TEMP USER

            System.out.println("Product ID: " + productId);
            System.out.println("Price: " + price);

            // ✅ DB CONNECTION
            Connection con = DataAccess.getConnection();

            // ✅ INSERT QUERY
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO tbl_cartmaster(productId, userId, quantity, price) VALUES(?,?,?,?)"
            );

            ps.setInt(1, productId);
            ps.setInt(2, userId);
            ps.setInt(3, 1);
            ps.setDouble(4, price);

            int i = ps.executeUpdate();

            if (i > 0) {
                System.out.println("INSERT SUCCESS ✅");
            } else {
                System.out.println("INSERT FAILED ❌");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ REDIRECT TO CART PAGE
        response.sendRedirect("frmCart.jsp");
    }
}