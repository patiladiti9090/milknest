package com.milknest.milknest_online_services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        if (paymentMethod == null || paymentMethod.isEmpty()) {
            response.getWriter().println("Error: Payment method not selected.");
            return;
        }

        Connection con = null;
        PreparedStatement cartStmt = null;
        PreparedStatement orderStmt = null;
        ResultSet rs = null;

        try {
            // Step 1: Connect to the database
            con = DataAccess.getConnection();

            // Step 2: Fetch cart items for the user
            String fetchCartQuery = "SELECT productId, quantity, price FROM tbl_cartmaster WHERE userId = ?";
            cartStmt = con.prepareStatement(fetchCartQuery);
            cartStmt.setInt(1, userId);
            rs = cartStmt.executeQuery();

            // Step 3: Insert each cart item into tbl_orders
            String insertOrderQuery = "INSERT INTO tbl_orders (userId, productId, quantity, totalAmount, paymentMethod, paymentDetails, orderDate) VALUES (?, ?, ?, ?, ?, ?, ?)";
            orderStmt = con.prepareStatement(insertOrderQuery);

            double grandTotal = 0.0;
            while (rs.next()) {
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double totalAmount = quantity * price;
                grandTotal += totalAmount;

                // Add order data
                orderStmt.setInt(1, userId);
                orderStmt.setInt(2, productId);
                orderStmt.setInt(3, quantity);
                orderStmt.setDouble(4, totalAmount);
                orderStmt.setString(5, paymentMethod);
                orderStmt.setString(6, "Pending");
                orderStmt.setTimestamp(7, java.sql.Timestamp.valueOf(LocalDateTime.now()));
                orderStmt.addBatch();
            }

            // Execute batch insertion for orders
            orderStmt.executeBatch();

            // Step 4: Clear the cart for the user
            String clearCartQuery = "DELETE FROM tbl_cartmaster WHERE userId = ?";
            PreparedStatement clearCartStmt = con.prepareStatement(clearCartQuery);
            clearCartStmt.setInt(1, userId);
            clearCartStmt.executeUpdate();

            // Redirect to confirmation page
            session.setAttribute("grandTotal", grandTotal);
            session.setAttribute("paymentMethod", paymentMethod);
            response.sendRedirect("frmOrderConfirmation.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (cartStmt != null) cartStmt.close();
                if (orderStmt != null) orderStmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles order placement and cart clearance";
    }
}
