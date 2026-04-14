/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.milknest.milknest_online_services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Santosh
 */
public class Admin {

    public int Admin_ID;
    public String Admin_Name;
    public String Admin_Contact;
    public String Admin_Email;
    public String Admin_Username;
    public String Admin_Password;

    public int getAdmin_ID() {
        return Admin_ID;
    }

    public void setAdmin_ID(int Admin_ID) {
        this.Admin_ID = Admin_ID;
    }

    public String getAdmin_Name() {
        return Admin_Name;
    }

    public void setAdmin_Name(String Admin_Name) {
        this.Admin_Name = Admin_Name;
    }

    public String getAdmin_Contact() {
        return Admin_Contact;
    }

    public void setAdmin_Contact(String Admin_Contact) {
        this.Admin_Contact = Admin_Contact;
    }

    public String getAdmin_Email() {
        return Admin_Email;
    }

    public void setAdmin_Email(String Admin_Email) {
        this.Admin_Email = Admin_Email;
    }

    public String getAdmin_Username() {
        return Admin_Username;
    }

    public void setAdmin_Username(String Admin_Username) {
        this.Admin_Username = Admin_Username;
    }

    public String getAdmin_Password() {
        return Admin_Password;
    }

    public void setAdmin_Password(String Admin_Password) {
        this.Admin_Password = Admin_Password;
    }
     public boolean insertAdmin(Admin A) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO admin_master(Admin_Name,Admin_Contact,Admin_Email,Admin_Username,Admin_Password) VALUES (?,?,?,?,?)");

        ps.setString(1, A.getAdmin_Name());
        ps.setString(2, A.getAdmin_Contact());
        ps.setString(3, A.getAdmin_Email());
        ps.setString(4, A.getAdmin_Username());
        ps.setString(5, A.getAdmin_Password());
//        ps.setString(1, A.getAdmin_Name());
        

        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }

        return false;

    }
}
