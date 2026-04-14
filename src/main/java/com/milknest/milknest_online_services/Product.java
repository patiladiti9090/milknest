
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package com.milknest.milknest_online_services;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Santosh
 */
public class Product {

    public int productID;
    public String productname;
    public String productImage;
    public String productDescription;
    public double productSaleprise;
    public double productpurchaseprice;
    public int productCatID;

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getProductSaleprise() {
        return productSaleprise;
    }

    public void setProductSaleprise(double productSaleprise) {
        this.productSaleprise = productSaleprise;
    }

    public double getProductpurchaseprice() {
        return productpurchaseprice;
    }

    public void setProductpurchaseprice(double productpurchaseprice) {
        this.productpurchaseprice = productpurchaseprice;
    }

    public int getProductCatID() {
        return productCatID;
    }

    public void setProductCatID(int productCatID) {
        this.productCatID = productCatID;
    }

 
   
//dislplay table 
    
    public ResultSet getallproduct() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM tb_productsmaster");
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            //   System.out.print(ex.toString());
        }
        return null;

    }

    
    // get id when editing 
    
    public ResultSet getProductID(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM  tb_productsmaster WHERE ProductID=" + id);
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;

    }
    
    //inseert the products
    
     public boolean insertProduct(Product P) throws SQLException {
        

       Connection cn = DataAccess.getConnection();
            PreparedStatement ps = cn.prepareStatement("INSERT INTO tb_productsmaster(productname, productImage, productDescription, productSaleprise, productpurchaseprice) VALUES(?,?,?,?,?)");

            ps.setString(1, P.getProductname());
            ps.setString(2, P.getProductImage());
            ps.setString(3, P.getProductDescription());
            ps.setDouble(4, P.getProductSaleprise());
            ps.setDouble(5,P.getProductpurchaseprice());
//            ps.setInt(7,P.getProductCatID());
            

            int i = ps.executeUpdate();

            if (i == 1) {

                return true;

            }

            return false;

        }

//UpdATE CODEEE
     
    public boolean UpdateDispProducts(Product P) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update tb_productsmaster SET Productname=?,ProductImage=?,ProductDescription=?,ProductSaleprise=?,Productpurchaseprice=? where productID=?");
            ps.setString(1, P.getProductname());
            ps.setString(2, P.getProductImage());
            ps.setString(3, P.getProductDescription());
            ps.setDouble(4, P.getProductSaleprise());
            ps.setDouble(5, P.getProductpurchaseprice());
//            ps.setInt(6, P.getProductID());
       
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }

    
    //delete the code
    
    public boolean deleteDispProducts(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from tb_productsmaster where productID=" + id);

            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
public ResultSet getPaginatedProducts(int limit, int offset) throws SQLException {
    Connection conn = DataAccess.getConnection();
    String query = "SELECT * FROM Products ORDER BY productID DESC LIMIT ? OFFSET ?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setInt(1, limit);
    stmt.setInt(2, offset);
    return stmt.executeQuery();
}

public int getProductCount() throws SQLException {
    Connection conn = DataAccess.getConnection();
    String query = "SELECT COUNT(*) FROM Products";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
    return rs.getInt(1);
}

}    