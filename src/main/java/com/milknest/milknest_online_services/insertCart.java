package com.milknest.milknest_online_services;

import java.sql.*;

public class insertCart {

    private int productId;
    private int userId;
    private int quantity;
    private double price;

    // GETTERS & SETTERS
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    // INSERT CART
    public boolean insertCart(insertCart ic) throws Exception {

        Connection con = DataAccess.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO tbl_cartmaster(productId, userId, quantity, price) VALUES(?,?,?,?)"
        );

        ps.setInt(1, ic.getProductId());   // ✅ FIX
        ps.setInt(2, ic.getUserId());
        ps.setInt(3, ic.getQuantity());
        ps.setDouble(4, ic.getPrice());   // ✅ FIX

        int i = ps.executeUpdate();

        con.close();

        return i > 0;
    }

    // TOTAL CART COUNT
    public int getTotalCartProducts(int userId) throws SQLException {

        int totalProducts = 0;
        Connection con = DataAccess.getConnection();

        String query = "SELECT SUM(quantity) AS totalProducts FROM tbl_cartmaster WHERE userId = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, userId);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            totalProducts = rs.getInt("totalProducts");
        }

        rs.close();
        stmt.close();
        con.close();

        return totalProducts;
    }

    // DELETE ITEM
    public boolean deleteCartProducts(int id) throws SQLException {

        Connection con = DataAccess.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM tbl_cartmaster WHERE cartID=?"
        );

        ps.setInt(1, id);

        int i = ps.executeUpdate();

        con.close();

        return i > 0;
    }
}