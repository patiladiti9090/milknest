package com.milknest.milknest_online_services;

import java.sql.*;
import com.milknest.milknest_online_services.DataAccess;

public class Payment {

    public int paymentID;
    public String paymentname;
    public String paymentdate;
    public String paymentmode;
    public int paymenttotalamount;
    public int qty;
    public double discount;
    public int netamount;
    public int customerID;

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentname() {
        return paymentname;
    }

    public void setPaymentname(String paymentname) {
        this.paymentname = paymentname;
    }

    public String getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(String paymentdate) {
        this.paymentdate = paymentdate;
    }

    public String getPaymentmode() {
        return paymentmode;
    }

    public void setPaymentmode(String paymentmode) {
        this.paymentmode = paymentmode;
    }

    public int getPaymenttotalamount() {
        return paymenttotalamount;
    }

    public void setPaymenttotalamount(int paymenttotalamount) {
        this.paymenttotalamount = paymenttotalamount;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getNetamount() {
        return netamount;
    }

    public void setNetamount(int netamount) {
        this.netamount = netamount;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    // ==============================
    // 🔥 INSERT PAYMENT (FIXED)
    // ==============================
    public boolean insertPayment(Payment P) throws SQLException {

        Connection cn = DataAccess.getConnection();

        // 🔥 DEBUG
        System.out.println("CustomerID = " + P.getCustomerID());

        // ❌ जर customerID 0 असेल तर insert करू नको
        if (P.getCustomerID() == 0) {
            System.out.println("CustomerID missing!");
            return false;
        }

        PreparedStatement ps = cn.prepareStatement(
            "INSERT INTO tb_paymentmaster(paymentname, paymentdate, paymentmode, paymenttotalamount, qty, discount, netamount, customerID) VALUES(?,?,?,?,?,?,?,?)"
        );

        ps.setString(1, P.getPaymentname());
        ps.setString(2, P.getPaymentdate());
        ps.setString(3, P.getPaymentmode());
        ps.setInt(4, P.getPaymenttotalamount());
        ps.setInt(5, P.getQty());
        ps.setDouble(6, P.getDiscount());
        ps.setInt(7, P.getNetamount());

        // 🔥 MAIN FIX
        ps.setInt(8, P.getCustomerID());

        int i = ps.executeUpdate();

        return i == 1;
    }
}