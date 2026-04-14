package com.milknest.milknest_online_services;

import java.sql.*;

public class category {

    private int category_id;
    private String category_name;
    private String category_img;

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getCategory_img() {
        return category_img;
    }

    public void setCategory_img(String category_img) {
        this.category_img = category_img;
    }

    // 🔥 DB CONNECTION
    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/milknestdb",
            "root",
            "root"
        );
    }

    // 🔥 GET ALL CATEGORIES
    public ResultSet getAllCategories() throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM tb_categorymaster");
        return ps.executeQuery();
    }

    // 🔥 GET MAX CATEGORY ID
    public ResultSet getCategory_Id() throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT MAX(category_id) as maxid FROM tb_categorymaster"
        );
        return ps.executeQuery();
    }

    // 🔥 INSERT CATEGORY
    public void insertCategories(category c) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO tb_categorymaster(category_name, category_img) VALUES (?, ?)"
        );

        ps.setString(1, c.getCategory_name());
        ps.setString(2, c.getCategory_img());

        ps.executeUpdate();
    }

    // 🔥 UPDATE CATEGORY
    public void updateCategoriess(category c) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE tb_categorymaster SET category_name=?, category_img=? WHERE category_id=?"
        );

        ps.setString(1, c.getCategory_name());
        ps.setString(2, c.getCategory_img());
        ps.setInt(3, c.getCategory_id());

        ps.executeUpdate();
    }

    // 🔥 DELETE CATEGORY
    public void deleteCategories(int id) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM tb_categorymaster WHERE category_id=?"
        );

        ps.setInt(1, id);
        ps.executeUpdate();
    }

    // 🔥🔥 IMPORTANT FIX (CATEGORY CLICK → PRODUCTS SHOW)
    public ResultSet getCatsByid(int id) throws Exception {
        Connection con = getConnection();

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM tb_productsmaster WHERE productCatID=?"
        );

        ps.setInt(1, id);

        return ps.executeQuery();
    }
}