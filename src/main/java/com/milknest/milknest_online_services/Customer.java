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
 * @author Santosh
 */
public class Customer {

    public int CustomerID;
    public String CustomerName;
    public String CustomerAdress;
    public String CustomerContact;
    public String CustomerEmail;
    public String CustomerUsername;
    public String CustomerPassword;

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getCustomerAdress() {
        return CustomerAdress;
    }

    public void setCustomerAdress(String CustomerAdress) {
        this.CustomerAdress = CustomerAdress;
    }

    public String getCustomerContact() {
        return CustomerContact;
    }

    public void setCustomerContact(String CustomerContact) {
        this.CustomerContact = CustomerContact;
    }

    public String getCustomerEmail() {
        return CustomerEmail;
    }

    public void setCustomerEmail(String CustomerEmail) {
        this.CustomerEmail = CustomerEmail;
    }

    public String getCustomerUsername() {
        return CustomerUsername;
    }

    public void setCustomerUsername(String CustomerUsername) {
        this.CustomerUsername = CustomerUsername;
    }

    public String getCustomerPassword() {
        return CustomerPassword;
    }

    public void setCustomerPassword(String CustomerPassword) {
        this.CustomerPassword = CustomerPassword;
    }

    //This method is used to acess data from database
    
    public ResultSet getCustomer() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM tb_customermaster");
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }

    public ResultSet getCustomerbyCustomerID(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM tb_customermaster WHERE CustomerID=" + id);
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;

    }

    public boolean insertCustomer(Customer C) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO tb_customermaster(CustomerName,CustomerAdress,CustomerContact,CustomerEmail,CustomerUsername,CustomerPassword) VALUES (?,?,?,?,?,?)");

        ps.setString(1, C.getCustomerName());
        ps.setString(2, C.getCustomerAdress());
        ps.setString(3, C.getCustomerContact());
        ps.setString(4, C.getCustomerEmail());
        ps.setString(5, C.getCustomerUsername());
        ps.setString(6, C.getCustomerPassword());

        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }

        return false;

    }
    
    
}
