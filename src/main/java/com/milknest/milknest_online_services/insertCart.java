/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.milknest.milknest_online_services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author VICTUS
 */
public class insertCart {

    public int icartID;
    public String sproductName;

    public String getSproductName() {
        return sproductName;
    }

    public void setSproductName(String sproductName) {
        this.sproductName = sproductName;
    }
    public int iuserId;
    public int iquantity;
    public int iprice;

    public int getIcartID() {
        return icartID;
    }

    public void setIcartID(int icartID) {
        this.icartID = icartID;
    }

    public int getIuserId() {
        return iuserId;
    }

    public void setIuserId(int iuserId) {
        this.iuserId = iuserId;
    }

    public int getIquantity() {
        return iquantity;
    }

    public void setIquantity(int iquantity) {
        this.iquantity = iquantity;
    }

    public int getIprice() {
        return iprice;
    }

    public void setIprice(int iprice) {
        this.iprice = iprice;
    }

    //insert (save)
    public boolean insertCart(insertCart ic) throws Exception {

        Connection con = DataAccess.getConnection();
        PreparedStatement ps = con.prepareStatement("INSERT INTO tbl_cartmaster(productId, userId, quantity, price) VALUES(?,?,?,?)");

        ps.setString(1, ic.getSproductName());
        ps.setInt(2, ic.getIuserId());
        ps.setInt(3, ic.getIquantity());
        ps.setInt(3, ic.getIprice());
        int i = ps.executeUpdate();
        if (i == 1) {
            return true;
        }

        return false;
    }
    
   public int getTotalCartProducts(int userId) throws SQLException {
    int totalProducts = 0;
    Connection con = DataAccess.getConnection();

    try {
        String query = "SELECT SUM(quantity) AS totalProducts FROM tbl_cartmaster WHERE userId = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, userId);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            totalProducts = rs.getInt("totalProducts");
        }

        // Close resources
        rs.close();
        stmt.close();
    } catch (SQLException ex) {
        System.out.print(ex.toString());
    } finally {
        if (con != null) {
            con.close();
        }
    }

    return totalProducts;
}
//delete
    public boolean deleteCartProducts(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from tbl_cartmaster where cartID=" + id);

            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }

}
